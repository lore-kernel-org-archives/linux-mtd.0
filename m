Received: from dsl093-192-209.stl1.dsl.speakeasy.net ([66.93.192.209]
	helo=newman.jbmsoft.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19I9Bw-0008HH-N6
	for <linux-mtd@lists.infradead.org>; Tue, 20 May 2003 16:38:17 +0100
Received: from brianpc (BriansPC.jbmsoft.com [192.10.10.21])
	by newman.jbmsoft.com (Postfix) with SMTP id 5EFFD90306
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 May 2003 09:57:29 -0500 (CDT)
Message-ID: <01a601c31ee5$d5d8b8c0$150a0ac0@jbmsoft.com>
From: "Brian T." <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 20 May 2003 10:38:17 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: jffs2_gcd_mtd1 errors after reboot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again,

Question about these errors I saw after a reboot on one of our development
embedded systems.  The Kernel Virtual Memory errors are at the bottom.
Normally these units boot with no problems.  The only thing I did different
prior to reboot was sync the system time, then write to the hwclock (which
has been done before without this problem).  The unit then completely locked
and I had to power cycle it to reboot.  On the next boot everything was
fine.  I didn't see any JFFS2 errors on next boot either.  I tried to
duplicate it with the same steps, and it boots normally.  Any ideas on what
may have caused this?

Thanks in advance,

-Brian

--snip--
[root@JBMgateway-v50 lib]# ntpdate 192.10.20.6
19 May 16:24:06 ntpdate[106]: step time server 192.10.20.6
offset -17863.460593 sec
[root@JBMgateway-v50 lib]# date
Mon May 19 16:24:08 CST 2003
[root@JBMgateway-v50 lib]#
[root@JBMgateway-v50 lib]# hwclock --systohc
[root@JBMgateway-v50 lib]# reboot

The system is going down NOW !!
Sending SIGTERM to all processes.
Terminated
Please stand by while rebooting the system.
Sending Reset to ELAN.

                    Autoboot in 5 seconds. <esc> or 'x' to abort...
Booting
go!

Loading..............................................
Linux version 2.4.20 (root@Smog) (gcc version egcs-2.91.66 19990314/Linux
(egcs-1.1.2 release)) #662 Mon May 19 15:20:46 CDT 2003
BIOS-provided physical RAM map:
 BIOS-e801: 0000000000000000 - 000000000009f000 (usable)
 BIOS-e801: 0000000000100000 - 0000000002000000 (usable)
32MB LOWMEM available.
On node 0 totalpages: 8192
zone(0): 4096 pages.
zone(1): 4096 pages.
zone(2): 0 pages.
Kernel command line:
Initializing CPU#0
Calibrating delay loop... 49.35 BogoMIPS
Memory: 30556k/32768k available (961k kernel code, 1824k reserved, 235k
data, 64k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Dentry cache hash table entries: 4096 (order: 3, 32768 bytes)
Inode cache hash table entries: 2048 (order: 2, 16384 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
CPU: AMD 486 DX/4-WB stepping 04
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
PCI: Using configuration type 1
PCI: Probing PCI hardware
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis
Communications AB.
Serial driver version 5.05c (2001-07-08) with MANY_PORTS MULTIPORT SHARE_IRQ
enabled
ttyS00 at 0x03f8 (irq = 4) is a 16550A
ttyS03 at 0x02e8 (irq = 3) is a 16550A
SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=256).
CSLIP: code copyright 1989 Regents of the University of California.
RAMDISK driver initialized: 16 RAM disks of 16384K size 1024 blocksize
PPP generic driver version 2.4.2
Search for id:(89 00) interleave(1) type(1)
Search for id:(89 00) interleave(1) type(1)
Search for id:(89 00) interleave(1) type(1)
Search for id:(89 18) interleave(1) type(2)
Search for id:(89 18) interleave(1) type(2)
Search for id:(89 18) interleave(1) type(2)
JEDEC: Found no SnapGear AMD device at location zero
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
SNAPGEAR: Intel flash device size = 16384K
Creating 6 MTD partitions on "SnapGear Intel":
0x00000000-0x000e0000 : "JBM kernel"
0x00100000-0x00fe0000 : "JBM filesystem"
0x000e0000-0x00100000 : "JBM config"
0x00000000-0x01000000 : "JBM Intel"
0x00fe0000-0x01000000 : "JBM BIOS Config"
0x00fe0000-0x01000000 : "JBM BIOS"
JBMgw137 Battery Backed RAM device: 1f000 at 18021000
Creating 1 MTD partitions on "JBMgw137 Battery Backed RAM":
0x00000000-0x0001f000 : "JBM-Battery-Backed RAM"
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 2048)
ip_conntrack version 2.1 (256 buckets, 2048 max) - 292 bytes per conntrack
ip_tables: (C) 2000-2002 Netfilter core team
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 64k freed
init started:  BusyBox v0.60.5 (2003.05.12-18:56+0000) multi-call binary
mke2fs 1.25 (20-Sep-2001)
fsck.minix, 1.2 - 11/11/96
Filesystem on /dev/mtdblock6 is dirty, needs checking.

    10 inodes used (15%)
    43 zones used (34%)

     9 regular files
     1 directories
     0 character device files
     0 block device files
     0 links
     0 symbolic links
------
    10 files
fsck.minix, 1.2 - 11/11/96
/dev/mtdblock6 is clean, no check.
Emptying and files in /mnt/ramfs/
Attempting to Make a RAM Filesystem on /mnt/ramfs/
mke2fs 1.25 (20-Sep-2001)
Using /lib/modules/2.4.20/kernel/drivers/net/mii.o
Using /lib/modules/2.4.20/kernel/drivers/net/8139too.o
8139too Fast Ethernet driver 0.9.26
eth0: RealTek RTL8139 Fast Ethernet at 0xc58c5000, 00:60:da:00:10:f9, IRQ 9
8139too ethernet module loaded.
Using /lib/modules/2.4.20/kernel/drivers/net/8390.o
Attempting to load Ethernet module 8390
insmod: ne.o: no module by that name found
Unable to load ne.o module.
NE1000/2000 compatible ethernet not found.
eth0: Setting half-duplex based on auto-negotiated partner ability 0000.
eth0: Too much work at interrupt, IntrStatus=0x0001.
Unable to handle kernel paging request at virtual address c5ccfc24
 printing eip:
c0127f36
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c0127f36>]    Not tainted
EFLAGS: 00010006
eax: 00ffff03   ebx: 0ffff030   ecx: c1cd0000   edx: 000005a8
esi: c105b7c0   edi: 00000246   ebp: 000001f0   esp: c1e97d98
ds: 0018   es: 0018   ss: 0018
Process jffs2_gcd_mtd1 (pid: 13, stackpage=c1e97000)
Stack: c11db420 c1cb3000 c1080ccc 00000000 c0169c78 c105b7c0 000001f0
c016955c
       c11978e0 c11978e0 00000000 00000000 00000561 c1e97e98 00000044
00100000
       00000000 ffffffff c021e58c c11ff794 c1e96000 000003b6 c11ff740
00000000
Call Trace:    [<c0169c78>] [<c016955c>] [<c016b4c1>] [<c016b470>]
[<c016991b>]
  [<c016ddc4>] [<c016ddad>] [<c011b0ea>] [<c01706ae>] [<c0108736>]
[<c017054c>]
  [<c0107092>] [<c010709b>]

Code: 8b 44 81 18 03 59 0c 89 41 14 83 f8 ff 75 23 8b 11 8b 41 04
 <1>Unable to handle kernel paging request at virtual address c5ccfc24
 printing eip:
c0127f36
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c0127f36>]    Not tainted
EFLAGS: 00010006
eax: 00ffff03   ebx: 0ffff030   ecx: c1cd0000   edx: c11ace60
esi: c105b7c0   edi: 00000246   ebp: 000001f0   esp: c1e49cc4
ds: 0018   es: 0018   ss: 0018
Process sh (pid: 46, stackpage=c1e49000)
Stack: c11db4d4 c118d400 0024ed4a 00000000 c0169c78 c105b7c0 000001f0
c016955c
       00000000 c1d00200 00000000 00000000 000002ba c1e49d04 000000e5
c11f6e60
       fffffff8 ffffffff c1080ccc c1cd06c0 c1e5d000 c016a312 c1e49ddc
c021e574
Call Trace:    [<c0169c78>] [<c016955c>] [<c016a312>] [<c016b4c1>]
[<c0129e0f>]
  [<c016b400>] [<c013602d>] [<c017080e>] [<c012a027>] [<c0136317>]
[<c01410bb>]
  [<c0141156>] [<c014138a>] [<c0166beb>] [<c01373db>] [<c0137b19>]
[<c0137db6>]
  [<c0137f23>] [<c0138142>] [<c0135175>] [<c0108783>]

Code: 8b 44 81 18 03 59 0c 89 41 14 83 f8 ff 75 23 8b 11 8b 41 04

<1>Unable to handle kernel paging request at virtual address c5ccfc24
 printing eip:
c0127f36
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c0127f36>]    Not tainted
EFLAGS: 00010006
eax: 00ffff03   ebx: 0ffff030   ecx: c1cd0000   edx: c11a55d0
esi: c105b7c0   edi: 00000246   ebp: 000001f0   esp: c1ce5c8c
ds: 0018   es: 0018   ss: 0018
Process getty (pid: 45, stackpage=c1ce5000)
Stack: c11db4e0 c11f6e60 00308cf6 00000000 c0169c78 c105b7c0 000001f0
c016955c
       00000000 c1d21520 00000000 00000000 000000c9 00000008 c2867740
00000004
       c118cd09 ffffffff 00000009 00000006 c2863a40 c2864c80 00000009
00000005
Call Trace:    [<c0169c78>] [<c016955c>] [<c016b4c1>] [<c016b400>]
[<c016a2df>]
  [<c016a312>] [<c017080e>] [<c01410bb>] [<c0141156>] [<c014138a>]
[<c0166beb>]
  [<c01373db>] [<c0137b19>] [<c0137db6>] [<c0137f23>] [<c0138269>]
[<c012e1c0>]
  [<c012e50a>] [<c0108783>]

Code: 8b 44 81 18 03 59 0c 89 41 14 83 f8 ff 75 23 8b 11 8b 41 04
--snip--
