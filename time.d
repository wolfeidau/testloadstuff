#!/usr/sbin/dtrace -s
syscall:::entry
/pid == $target/
{
          self->start = vtimestamp;
}
syscall:::return
/self->start/
{
this->time = vtimestamp - self->start;
@Time[probefunc] = sum(this->time);
@Time["TOTAL:"] = sum(this->time);
self->start = 0;
}
