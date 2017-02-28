[global]
device = gpu
floatX = float32
allow_gc = True
base_compiledir=/tmp/%(user)s/theano.NOBACKUP
on_unused_input = ignore
[nvcc]
fastmath = True
