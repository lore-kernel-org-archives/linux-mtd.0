Received: from mailrelay1.inwind.it ([212.141.54.101])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IS1m-00029e-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 11:40:30 +0100
Received: from ester (62.98.48.199) by mailrelay1.inwind.it (6.5.015)
        id 3CAA37A303204244 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2002 12:40:01 +0200
Message-ID: <001101c212c6$de2f94c0$0100a8c0@ester>
Reply-To: "Krypton" <krypton8@inwind.it>
From: "Krypton" <krypton8@inwind.it>
To: <linux-mtd@lists.infradead.org>
References: <003101c212b5$95362790$0100a8c0@ester>  <16692.1023958536@redhat.com>
Subject: Re: first jffs2 boot problem 
Date: Thu, 13 Jun 2002 12:41:08 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> > Someone could help me to understand what is happening ?
>
> Probably not mounting the complete partition. But you removed all the
> messages about that so I couldn't be bothered to respond on the ARM list.


Proper ARM zImage ID found. Booting...
Uncompressing Linux.......................................................
done, booting the kernel.
Linux version 2.4.9-ac10-rmk2-np1-cerf1 (krypton@klinux) (gcc version 2.95.2
19991024 (release)) #6 mar giu 11 23:19:41 CEST 2002
Processor: Intel StrongARM-1110 revision 8
Architecture: arm-linux-kernel
On node 0 totalpages: 4096
zone(0): 4096 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: console=ttySA0 root=1f03 rw
Calibrating delay loop... 88.26 BogoMIPS
Memory: 16MB = 16MB total
Memory: 14216KB available (1515K code, 288K data, 52K init)
Dentry-cache hash table entries: 2048 (order: 2, 16384 bytes)
Inode-cache hash table entries: 1024 (order: 1, 8192 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 4096 (order: 2, 16384 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
CPU clock: 132.700 MHz (max 132.700 MHz)
SA1100 USB Controller Core Initialized
get_random_bytes called before random driver initialization
usbctl: Opened for usb-eth
usbctl: Started for usb-eth
USB Function Character Driver Interface - 0.4, (C) 2001, Extenex Corp.
Starting kswapd v1.8
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications
AB.
pty: 256 Unix98 ptys configured
SA1100 Real Time Clock driver v1.00
block: queued sectors max/low 9336kB/3112kB, 64 slots per queue
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
loop: loaded (max 8 devices)
SA1100 flash: probing 16-bit flash bus
Using static partition definition
Creating 4 MTD partitions on "SA1100 flash":
0x00000000-0x00020000 : "firmware"
0x00020000-0x00040000 : "params"
0x00040000-0x00140000 : "kernel"
0x00140000-0x01000000 : "rootdisk"
Linux Kernel Card Services 3.1.22
  options:  none
SA-1100 PCMCIA (CS release 3.1.22)
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 1024)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
FAT: bogus logical sector size 381
UMSDOS: msdos_read_super failed, mount aborted.
FAT: bogus logical sector size 381
FAT: bogus logical sector size 381
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 52K
INIT: version 2.78 booting
Koan: Configuring dynamic linker.../sbin/ldconfig: warning: can't open /lib
(No such file or directory), skipping
/sbin/ldconfig: warning: can't open /lib (No such file or directory),
skipping
Done.
Koan: Configuring kernel modules.../etc/rc.d/rc.sysinit: /usr/sbin/depmod:
No such file or directory
Done.
/etc/rc.d/rc.sysinit: /bin/hostname: No such file or directory
/etc/rc.d/rc.sysinit: /bin/mount: No such file or directory
/etc/rc.d/rc.sysinit: /bin/mount: No such file or directory
/etc/rc.d/rc.sysinit: /bin/mount: No such file or directory
/etc/rc.d/rc.sysinit: /bin/cp: No such file or directory
/etc/rc.d/rc.sysinit: /bin/mount: No such file or directory
/etc/rc.d/rc.sysinit: /bin/cp: No such file or directory
/etc/rc.d/rc.sysinit: /bin/rm: No such file or directory
/etc/rc.d/rc.sysinit: /bin/rm: No such file or directory
/etc/rc.d/rc.sysinit: /bin/mkdir: No such file or directory
/etc/rc.d/rc.sysinit: /bin/mkdir: No such file or directory
/etc/rc.d/rc.sysinit: /bin/mkdir: No such file or directory
/etc/rc.d/rc.sysinit: /bin/touch: No such file or directory
/etc/rc.d/rc.sysinit: /bin/chgrp: No such file or directory
/etc/rc.d/rc.sysinit: /bin/chmod: No such file or directory
/etc/rc.d/rc.sysinit: /bin/rm: No such file or directory
/etc/rc.d/rc.sysinit: /bin/rm: No such file or directory
/etc/rc.d/rc.sysinit: /bin/rm: No such file or directory
/etc/rc.d/rc.sysinit: /sbin/ifconfig: No such file or directory
/etc/rc.d/rc.sysinit: /usr/sbin/inetd: Permission denied
/etc/rc.d/rc.sysinit: /sbin/syslogd: No such file or directory
/etc/rc.d/rc.sysinit: /var/log/dmesg: No such file or directoryINIT:
Entering runlevel: 3
/etc/rc.d/rc: /sbin/runlevel: No such file or directory
BASH=/bin/bash
BASH_VERSINFO=([0]="2" [1]="04" [2]="0" [3]="1" [4]="release"
[5]="arm-unknown-linux-gnu")
BASH_VERSION='2.04.0(1)-release'
BOOTUP=verbose
COLUMNS=80
CONSOLE=/dev/console
DIRSTACK=()
EUID=0
GROUPS=()
HOME=/
HOSTNAME='(none)'
HOSTTYPE=arm
IFS='
'
INITLOG_ARGS=
INIT_VERSION=sysvinit-2.78
LOGLEVEL=1
MACHTYPE=arm-unknown-linux-gnu
MOVE_TO_COL='echo -en \033[300C\033[20D'
OPTERR=1
OPTIND=1
OSTYPE=linux-gnu
PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/X11R6/bin
PIPESTATUS=([0]="0")
PPID=1
PREVLEVEL=N
PS4='+ '
PWD=/
RES_COL=60
RUNLEVEL=3
SETCOLOR_FAILURE='echo -en \033[1;31m'
SETCOLOR_NORMAL='echo -en \033[0;39m'
SETCOLOR_SUCCESS='echo -en \033[1;32m'
SETCOLOR_WARNING='echo -en \033[1;33m'
SHELL=/bin/sh
SHELLOPTS=braceexpand:hashall:interactive-comments
SHLVL=1
TERM=linux
UID=0
_=
argv1=3
action=()
{
    STRING=$1;
    echo -n "$STRING ";
    shift;
    COMMAND=$1;
    shift;
    $COMMAND "$*" && success "$STRING" || failure "$STRING";
    rc=$?;
    echo;
    return $rc
}
confirm=()
{
    echo -n "Start service $1 (Y)es/(N)o/(C)ontinue? [Y] ";
    read answer;
    case $answer in
        y | Y | "")
            return 0
        ;;
        c | C)
            return 2
        ;;
        n | N)
            return 1
        ;;
        *)
            confirm $1;
            return $?
        ;;
    esac
}
daemon=()
{
    gotbase=;
    case $1 in
        '')
            echo '$0: Usage: daemon [+/-nicelevel] {program}';
            return 1
        ;;
        --check)
            shift;
            base=$1;
            gotbase="yes";
            shift;
            nicelevel=0
        ;;
        -* | +*)
            nicelevel=$1;
            shift
        ;;
        *)
            nicelevel=0
        ;;
    esac;
    [ -z $gotbase ] && base=`basename $1`;
    ulimit -c 0;
    [ "$BOOTUP" = "verbose" ] && echo -n " $base";
    nice -n $nicelevel initlog $INITLOG_ARGS -c "$*" && success "$base
startup" || failure "$base startup"
}
echo_failure=()
{
    [ "$BOOTUP" = "color" ] && $MOVE_TO_COL;
    echo -n "[";
    [ "$BOOTUP" = "color" ] && $SETCOLOR_FAILURE;
    echo -n "FAILED";
    [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL;
    echo -n "]";
    return 1
}
echo_passed=()
{
    [ "$BOOTUP" = "color" ] && $MOVE_TO_COL;
    echo -n "[";
    [ "$BOOTUP" = "color" ] && $SETCOLOR_WARNING;
    echo -n "PASSED";
    [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL;
    echo -n "]";
    return 1
}
echo_success=()
{
    [ "$BOOTUP" = "color" ] && $MOVE_TO_COL;
    echo -n "[  ";
    [ "$BOOTUP" = "color" ] && $SETCOLOR_SUCCESS;
    echo -n "OK";
    [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL;
    echo -n "  ]";
    return 0
}
failure=()
{
    rc=$?;
    if [ -z "$IN_INITLOG" ]; then
        initlog -n $0 -s "$1" -e 2;
    else
        echo "-n $0 -s \"$1\" -e 2" 1>&21;
    fi;
    [ "$BOOTUP" != "verbose" ] && echo_failure;
    return $rc
}
killproc=()
{
    if [ $# = 0 ]; then
        echo "Usage: killproc {program} [signal]";
        return 1;
    fi;
    notset=0;
    if [ "$2" != "" ]; then
        killlevel=$2;
    else
        notset=1;
        killlevel="-9";
    fi;
    base=`basename $1`;
    pid=`pidofproc $1`;
    if [ -z "$pid" ]; then
        pid=`pidofproc $base`;
    fi;
    if [ "$pid" != "" ]; then
        [ $BOOTUP = "verbose" ] && echo -n "$base ";
        if [ "$notset" = "1" ]; then
            if ps h $pid >/dev/null 2>&1; then
                kill -TERM $pid;
                usleep 100000;
                if ps h $pid >/dev/null 2>&1; then
                    sleep 1;
                    if ps h $pid >/dev/null 2>&1; then
                        sleep 3;
                        if ps h $pid >/dev/null 2>&1; then
                            kill -KILL $pid;
                        fi;
                    fi;
                fi;
            fi;
            ps h $pid >/dev/null 2>&1 && failure "$base shutdown" || success
"$base shutdown";
        else
            if ps h $pid >/dev/null 2>&1; then
                kill $killlevel $pid && success "$base $killlevel" ||
failure "$base $killlevel";
            fi;
        fi;
    else
        failure "$base shutdown";
    fi;
    if [ "$notset" = "1" ]; then
        rm -f /var/run/$base.pid;
    fi
}
passed=()
{
    rc=$?;
    if [ -z "$IN_INITLOG" ]; then
        initlog -n $0 -s "$1" -e 1;
    else
        echo "-n $0 -s \"$1\" -e 1" 1>&21;
    fi;
    [ "$BOOTUP" != "verbose" ] && echo_passed;
    return $rc
}
pidofproc=()
{
    if [ $# = 0 ]; then
        echo "Usage: pidofproc {program}";
        return 1;
    fi;
    if [ -f /var/run/$1.pid ]; then
        pid=`head -n 1 /var/run/$1.pid`;
        if [ "$pid" != "" ]; then
            echo $pid;
            return 0;
        fi;
    fi;
    pidof -o $$ -o $PPID -o %PPID -x $1 || pidof -o $$ -o $PPID -o %PPID -x
${base};
    pid=`pidof $1`;
    if [ "$pid" != "" ]; then
        echo $pid;
        return 0;
    fi
}
status=()
{
    if [ $# = 0 ]; then
        echo "Usage: status {program}";
        return 1;
    fi;
    return 0;
    pid=`pidof $1`;
    if [ "$pid" != "" ]; then
        echo "$1 (pid $pid) is running...";
        return 0;
    fi;
    if [ -f /var/run/$1.pid ]; then
        pid=`head -n 1 /var/run/$1.pid`;
        if [ "$pid" != "" ]; then
            echo "$1 dead but pid file exists";
            return 1;
        fi;
    fi;
    if [ -f /var/lock/subsys/$1 ]; then
        echo "$1 dead but subsys locked";
        return 2;
    fi;
    echo "$1 is stopped";
    return 3
}
success=()
{
    if [ -z "$IN_INITLOG" ]; then
        initlog -n $0 -s "$1" -e 1;
    else
        echo "-n $0 -s \"$1\" -e 1" 1>&21;
    fi;
    [ "$BOOTUP" != "verbose" ] && echo_success;
    return 0
}
/etc/rc.d/rc: /usr/bin/egrep: No such file or directory
Starting syslog Starting system logger: /etc/rc.d/rc3.d/S05syslog:
/usr/bin/basename: No such file or directory
 /etc/rc.d/rc3.d/S05syslog: /usr/bin/nice: No such file or directory
/etc/rc.d/rc3.d/S05syslog: initlog: command not found

/etc/rc.d/rc3.d/S05syslog: /bin/touch: No such file or directory
/etc/rc.d/rc: initlog: command not found

/etc/rc.d/rc: /usr/bin/egrep: No such file or directory
Starting network /etc/rc.d/rc: initlog: command not found

/etc/rc.d/rc: /usr/bin/egrep: No such file or directory
Starting portmap /etc/rc.d/rc: initlog: command not found

/etc/rc.d/rc: /usr/bin/egrep: No such file or directory
Starting inet Starting INET services: /etc/rc.d/rc3.d/S50inet:
/usr/bin/basename: No such file or directory
 /etc/rc.d/rc3.d/S50inet: /usr/bin/nice: No such file or directory
/etc/rc.d/rc3.d/S50inet: initlog: command not found

/etc/rc.d/rc3.d/S50inet: /bin/touch: No such file or directory
/etc/rc.d/rc: initlog: command not found

/etc/rc.d/rc: /usr/bin/egrep: No such file or directory
Starting pcmcia Starting PCMCIA services:/etc/rc.d/rc3.d/S66pcmcia: /bin/rm:
No such file or directory
/etc/rc.d/rc3.d/S66pcmcia: /bin/touch: No such file or directory
/etc/rc.d/rc3.d/S66pcmcia: /usr/bin/fgrep: No such file or directory
/etc/rc.d/rc3.d/S66pcmcia: /bin/uname: No such file or directory
 module directory /lib/modules//pcmcia not found.
/etc/rc.d/rc: initlog: command not found

/etc/rc.d/rc: /usr/bin/egrep: No such file or directory
Starting local /etc/rc.d/rc3.d/S99local: /bin/uname: No such file or
directory
/etc/rc.d/rc3.d/S99local: /bin/cp: No such file or directory
/etc/rc.d/rc3.d/S99local: /bin/grep: No such file or directory
/etc/rc.d/rc3.d/S99local: /sbin/ifconfig: No such file or directory
/etc/rc.d/rc3.d/S99local: /usr/bin/wc: No such file or directory
/etc/rc.d/rc3.d/S99local: [: ==: unary operator expected
eth0 is not up, bringing it up (IP=192.168.1.100)
/etc/rc.d/rc3.d/S99local: /sbin/ifconfig: No such file or directory
/etc/rc.d/rc3.d/S99local: /sbin/route: No such file or directory
/etc/rc.d/rc: initlog: command not found

INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: Id "T0" respawning too fast: disabled for 5 minutes
INIT: no more processes left in this runlevel
