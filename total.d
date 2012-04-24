dtrace:::BEGIN {
  total = 0;
}
sched:::on-cpu
/pid == $target/
{
  self->start = vtimestamp;
}
sched:::off-cpu
/self->start/
{
  this->time = vtimestamp - self->start;
  total += this->time;
  @times = quantize(this->time);
  self->start = 0;
}
dtrace:::END {
  printf("Total Time on CPU: %d ns (%d ms)\n",total,total/1000000); 
  printa(@times);
}
