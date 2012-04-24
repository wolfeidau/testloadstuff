syscall::fork*:entry
/pid == $target/
{printf("%s %s",execname,copyinstr(arg0));}
