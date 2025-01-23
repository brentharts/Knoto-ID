#!/usr/bin/env python3
import os, sys, subprocess
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
	subprocess.check_call(cmd)
	out = open(output).read()
	return out


def test():
	points = []
	for i in range(8):
		points.append([uniform(1,1),uniform(1,1),uniform(1,1)])
	print('random test:', points)
	print(calc_knotoid(points))


if '--test' in sys.argv:
	test()
