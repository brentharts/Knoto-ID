#!/usr/bin/env python3
import os, sys, subprocess, time
from random import random, uniform
_thisdir = os.path.split(os.path.abspath(__file__))[0]
BUILD = os.path.join(_thisdir,'build')

def build():
	if not os.path.isdir(BUILD):
		os.mkdir(BUILD)
	cmd = ['cmake', _thisdir]
	print(cmd)
	subprocess.check_call(cmd, cwd=BUILD)
	subprocess.check_call(['make'], cwd=BUILD)
	subprocess.check_call(['make', 'doc'], cwd=BUILD)

BIN_DIR = os.path.join(os.path.join(_thisdir, BUILD), 'src')
KNOT_CORE = os.path.join(BIN_DIR, 'knotted_core')

if not os.path.isfile(KNOT_CORE):
	build()


def calc_knotoid( points, seed=1, cyclic=False, subchain=None, projections=None, moves=None, stop_moves=None, jones=True):
	cmd = [KNOT_CORE]
	if cyclic:
		cmd.append('--cyclic-input')
	if subchain:
		assert subchain in ('open', 'direct', 'rays')
		cmd.append('--closure-method=' + subchain)
	if projections:
		## default is 20
		cmd.append('--nb-projections=%s' % projections)
	if moves:
		## Reidemeister moves default is 1000
		cmd.append('--nb-moves-III=%s' % moves)
	if stop_moves:
		cmd.append('--nb-unsuccessfull-moves-III=%s' % stop_moves)
	if not jones:
		cmd.append('--arrow-polynomial')

	output = '/tmp/knotoid.out'
	cmd.append('--output='+output)

	tmp = '/tmp/knotoid.xyz'
	cmd.append(tmp)
	dump = []
	for pnt in points:
		x,y,z = pnt
		dump.append('%s %s %s' % (x,y,z))

	open(tmp,'w').write( '\n'.join(dump) )
	print(cmd)
	start = time.time()
	subprocess.check_call(cmd)
	delta = time.time()-start
	print('calc_knotoid seconds:', delta)
	out = open(output).read()
	return parse(out)

def parse(txt):
	out = []
	for ln in txt.splitlines():
		if ln.startswith('#'): continue
		if not ln.strip(): continue
		a,b,c,d,e = ln.split('\t')
		p = {
			'index_first': int(a),
			'index_last' : int(b),
			'length'     : int(c),
			'frequency'  : float(d),
			'polynomial' : e
		}
		if e=='failed_projection':
			p['valid'] = False
		else:
			p['valid'] = True
		out.append(p)
	return out

def test_parse():
	output = '/tmp/knotoid.out'
	out = open(output).read()
	info = parse(out)
	print(info)

def test(num=8):
	points = []
	for i in range(num):
		points.append([uniform(1,1),uniform(1,1),uniform(1,1)])
	print('random test:', points)
	print(calc_knotoid(points))

def bench():
	points = trefoil(100)
	print(calc_knotoid(points))

## from https://github.com/SPOCKnots/pyknotid/blob/master/pyknotid/make/named.py 
def unknot(num_points=100):
	'''Returns a simple circle.'''
	import numpy as n
	data = n.zeros((num_points, 3), dtype=n.float64)
	ts = n.linspace(0, 2*n.pi, num_points)
	data[:, 0] = 3*n.sin(ts)
	data[:, 1] = 3*n.cos(ts)
	data[:, 2] = n.sin(3*ts)
	return data
def trefoil(num_points=100):
	'''Returns a particular trefoil knot conformation.'''
	print('trefoil benchmark')
	import numpy as n
	data = n.zeros((num_points, 3), dtype=n.float64)
	ts = n.linspace(0, 2*n.pi, num_points)
	data[:, 0] = (2+n.cos(3*ts))*n.cos(2*ts)
	data[:, 1] = (2+n.cos(3*ts))*n.sin(2*ts)
	data[:, 2] = n.sin(3*ts)
	return data

if '--test' in sys.argv:
	test()
if '--test-parse' in sys.argv:
	test_parse()
if '--bench' in sys.argv:
	bench()
