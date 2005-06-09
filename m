Received: from wproxy.gmail.com ([64.233.184.198])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DgAeL-0001GX-6v
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2005 20:11:58 -0400
Received: by wproxy.gmail.com with SMTP id 57so664242wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2005 17:11:55 -0700 (PDT)
Message-ID: <9d003b9e050608171132b0374f@mail.gmail.com>
Date: Wed, 8 Jun 2005 17:11:54 -0700
From: My Linux <ebdlinux@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: JFFS2 as root FS on Embedded Planet board EP8245
Reply-To: My Linux <ebdlinux@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linux experts:

I am trying to configure JFFS2 as root FS on my EP8245 board (a PPC
board) using 2.4.27 kernel, but it seems the flash can not be
correctly detected. Here is the screen captured:

Linux/PPC load: console=3DttyS0,9600 console=3DttyS0 root=3D/dev/ram0
init=3D/linuxrc rwUncompressing Linux...done.
Now booting the kernel
Memory BAT mapping: BAT2=3D64Mb, BAT3=3D0Mb, residual: 0Mb
Linux version 2.4.27XX (root@my-desktop) (gcc version 3.4.1 20040714
(TimeSys 3.4.1-7)) #40 Wed Jun 8 17:03:20 PDT 2005
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: console=3DttyS0,9600 console=3DttyS0 root=3D/dev/ram0
init=3D/linuxrc rw
OpenPIC Version 1.2 (1 CPUs and 7 IRQ sources) at fdfd0000
Calibrating delay loop... 219.54 BogoMIPS
Memory: 63188k available (1108k kernel code, 384k data, 76k init, 0k highme=
m)
Dentry cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
PCI: Probing PCI hardware
PCI: Cannot allocate resource region 1 of device 00:00.0
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
ttyS00 at 0xfdfcf500 (irq =3D 5) is a 16550A
Intel(R) PRO/100 Network Driver - version 2.3.43-k1
Copyright (c) 2004 Intel Corporation
                                                                           =
    =20
e100: eth0: Intel(R) PRO/100 Network Connection
  Hardware receive checksums enabled
  cpu cycle saver enabled
                                                                           =
    =20
physmap flash device: 100000 at 200000
CFI: Found no Physically mapped flash device at location zero
mtd: Giving out device 0 to Physically mapped flash
Using physmap partition definition
Creating 2 MTD partitions on "Physically mapped flash":
0x00000000-0x00100000 : "PlanetCore"
mtd: Giving out device 1 to PlanetCore
0x00100000-0x00600000 : "rootfs"
mtd: partition "rootfs" is out of reach -- disabled
mtd: Giving out device 2 to rootfs
physmap: Using <NULL> partition definition
Creating 2 MTD partitions on "Physically mapped flash":
Oops: kernel access of bad area, sig: 11
NIP: C00AF278 XER: 00000000 LR: C00AF248 SP: C02FBF80 REGS: c02fbed0 TRAP: =
0300
   Not tainted
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
DAR: 0000000E, DSISR: 20000000
TASK =3D c02fa000[1] 'swapper' Last syscall: 120
last math 00000000 last altivec 00000000
GPR00: 00000002 C02FBF80 C02FA000 C02C8360 00000000 00000000 C02C8404 C02C8=
000
GPR08: 00000000 C0140000 C02C82FC 00000002 C0160000 00002000 430C5F8D 491BC=
402
GPR16: 5ADA4B95 42C25014 18188713 8E055684 C0130000 C0159870 C0130000 00000=
000
GPR24: C0110000 00000000 00000002 00000000 00000000 00000002 C02C8060 C02C8=
360
Call backtrace:
C00AF234 C0154BFC C0003968 C00068CC
Kernel panic: Attempted to kill init!
 <0>Rebooting in 180 seconds..


Is this because the physical mapping address is not correct?

Thx, V
