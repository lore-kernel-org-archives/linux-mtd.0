Received: from mail-server.ntb.ch ([146.136.1.32])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oR2U-00021q-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 16:00:55 +0100
Message-ID: <3BB9D8D1.6060708@gmx.ch>
Date: Tue, 02 Oct 2001 17:10:09 +0200
From: Stefan Wanner <stefan.wanner@gmx.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd on mpc8xx
Content-Type: text/plain; charset=us-ascii; format=flowed
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

hello

i'm new to mtd. i have a mpc823l board and want to use some space in the 
onboard flash with jffs and also (later) a pcmcia flash card using vfat.

i followed the instructions in the "mtd jffs howto" as good as possible. 
and i used the mtd files from a current snapshot.

when i try to erase a mtd partition, i get the error no such device.

any idea?

here are some outputs

bootmessages:

Linux version 2.4.4 (root@pcinf48) (gcc version 2.95.2 19991024 
(release)) #2 Tue Oct 2 16:57:58 CEST 2001
MPC823 LCD memory at C01A8000
On node 0 totalpages: 4096
zone(0): 4096 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: console=tty0 console=ttyS0,9600 root=/dev/nfs rw 
nfsroot=146.136.4.73:/tftpboot/146.136.4.200 
ip=146.136.4.200:146.136.4.73:146.136.12.1:255.255.255.0:pcdttemp3::off
Decrementer Frequency: 3125000
Console: colour dummy device 80x25
Calibrating delay loop... 49.86 BogoMIPS
Memory: 14104k available (1116k kernel code, 484k data, 68k init, 0k 
highmem)
Dentry-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 1024 (order: 1, 8192 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
Console: switching to colour frame buffer device 80x30
fb0:  MPC823 LCD frame buffer device
CPM UART driver version 0.03
ttyS0 on SMC1 at 0x0280, BRG1
ttyS1 on SMC2 at 0x0380, BRG2
pty: 256 Unix98 ptys configured
block: queued sectors max/low 9261kB/3087kB, 64 slots per queue
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
PCMCIA slot @: phys mem ffffffff...00000000 (size 00000001)
PCMCIA slot has not been defined! Using A as default
No card in slot A: PIPR=ff00ff00
eth0: CPM ENET Version 0.2 on SCC2, 00:d0:93:00:03:cf
JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
init_tqm_mtd: chip probing count 0
  Amd/Fujitsu Extended Query Table v1.0 at 0x0040
number of JEDEC chips: 1
0: offset=0x0,size=0x8000,blocks=1
1: offset=0x8000,size=0x4000,blocks=2
2: offset=0x10000,size=0x10000,blocks=1
3: offset=0x20000,size=0x20000,blocks=31
init_tqm_mtd: bank1, name:TQM8xxL0, size:4194304bytes
init_tqm_mtd: chip probing count 1
  Amd/Fujitsu Extended Query Table v1.0 at 0x0040
number of JEDEC chips: 1
0: offset=0x0,size=0x8000,blocks=1
1: offset=0x8000,size=0x4000,blocks=2
2: offset=0x10000,size=0x10000,blocks=1
3: offset=0x20000,size=0x20000,blocks=31
init_tqm_mtd: bank2, name:TQM8xxL1, size:4194304bytes
TQM flash0: Using Static image partition definition
Creating 4 MTD partitions on "TQM8xxL0":
0x00000000-0x00020000 : "ppcboot"
mtd: Giving out device 0 to ppcboot
0x00020000-0x00100000 : "kernel"
mtd: Giving out device 1 to kernel
0x00100000-0x00200000 : "user"
mtd: Giving out device 2 to user
0x00200000-0x00400000 : "initrd"
mtd: Giving out device 3 to initrd
TQM flash1: Using Static file system partition definition
Creating 2 MTD partitions on "TQM8xxL1":
0x00000000-0x00200000 : "cramfs"
mtd: Giving out device 4 to cramfs
0x00200000-0x00400000 : "jffs"
mtd: Giving out device 5 to jffs
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 1024)
IP-Config: Gateway not on directly connected network.
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Looking up port of RPC 100003/2 on 146.136.4.73
Looking up port of RPC 100005/2 on 146.136.4.73
VFS: Mounted root (nfs filesystem).
Freeing unused kernel memory: 68k init


/proc/devices:

Character devices:
   1 mem
   2 pty
   3 ttyp
   4 ttyS
   5 cua
   7 vcs
  10 misc
  29 fb
128 ptm
136 pts
162 raw

Block devices:
   1 ramdisk


/proc/mtd:

dev:    size   erasesize  name
mtd0: 00020000 00010000 "ppcboot"
mtd1: 000e0000 00020000 "kernel"
mtd2: 00100000 00020000 "user"
mtd3: 00200000 00020000 "initrd"
mtd4: 00200000 00020000 "cramfs"
mtd5: 00200000 00020000 "jffs"


are the mtd devices now registered? if yes, what majornumber do they have?

please help!


thanks!!!!

stefan
