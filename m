From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 03 Mar 2003 14:41:28 -0700
Subject: [PATCH] C99 initializers for drivers/mtd files
In-Reply-To: <20030303213317.GB6239@debian>
References: <20030226205334.GB8966@debian>
 <20030227194424.GC29233@wohnheim.fh-wedel.de>
 <20030227214646.GD8116@debian>
 <20030302185616.GC10681@wohnheim.fh-wedel.de>
 <1046724566.2672.634.camel@tubarao>
 <20030303210613.GA7875@wohnheim.fh-wedel.de>
 <1046726489.2672.641.camel@tubarao>  <20030303213317.GB6239@debian>
Message-ID: <1046727688.2672.647.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-cJT9OdOoENZRrdNpTALp
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

My bad - the [INDEX].DATA_MEMBER works in GCC 3.2.  Thanks for setting
me straight (I'll go back to sleep now).

On Mon, 2003-03-03 at 14:33, Art Haas wrote:
> On Mon, Mar 03, 2003 at 02:21:29PM -0700, Thayne Harbaugh wrote:

<embarrassing evidence removed for brevity and to protect the guilty>

>=20
> Art Haas
--=20
Thayne Harbaugh
Linux Networx

--=-cJT9OdOoENZRrdNpTALp
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+Y8wIfsBPTKE6HMkRArZ2AJ9ySsD3J5/PMvY5tpoKb2my5LLjrgCfeMjJ
yXKx2GjUrD1rpx4k989vgyk=
=VNaK
-----END PGP SIGNATURE-----

--=-cJT9OdOoENZRrdNpTALp--




>From Brian  Mon Mar  3 20:21:39 2003
From: Brian (Brian)
Date: Mon, 3 Mar 2003 19:21:39 -0600
Subject: linux not mounting jffs2 partition properly?
Message-ID: <001f01c2e1ec$68189c50$0200a8c0@athlon1200>

Hello,

I have an embedded build I am migrating from kernel 2.2.18 using JFFS2/v1.18
to kernel 2.4.20/JFFS2 v1.35.  I have patched the kernel with the current
CVS, and my utilities directory.  Everything compiles.  On bootup, however,
it almost looks like that the kernel is not mounting the JFFS2 partition
properly, and cannot run any commands (kmod, modprobe, open /dev/console,
etc...).  Below is a snip of my bootup sequence.  The flash is an Intel 16mb
ROM, 128k sectors.  Erase size when creating the image was also 128k.

/tmp/current_build/user/mtd-utils/build/mkfs.jffs2 -v -o
/tmp/current_build/images/jffs2.img -q -e 131072 -d /tmp/current_build/romfs

My older build with 2.2.18/v1.18 works fine.

Any help is appreciated.

Thanks!

-Brian

--snip--
Loading..............................................
Linux version 2.4.20 (root at Smog) (gcc version 2.96 20000731 (Red Hat Linux
7.2 2.96-112.7.2)) #96 Fri Feb 28 17:49:33 CST 2003
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
Calibrating delay loop... 49.56 BogoMIPS
Memory: 30580k/32768k available (952k kernel code, 1800k reserved, 227k
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
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
ttyS00 at 0x03f8 (irq = 4) is a 16550A
ttyS03 at 0x02e8 (irq = 3) is a 16550A
SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=256).
CSLIP: code copyright 1989 Regents of the University of California.
RAMDISK driver initialized: 16 RAM disks of 16384K size 1024 blocksize
PPP generic driver version 2.4.2
kmod: failed to exec /sbin/modprobe -s -k jedec_probe, errno = 2
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
SNAPGEAR: Intel flash device size = 16384K
Creating 6 MTD partitions on "SnapGear Intel":
0x00000000-0x00080000 : "JBM kernel"
0x000a0000-0x00fe0000 : "JBM filesystem"
0x00080000-0x000a0000 : "JBM config"
0x00000000-0x01000000 : "JBM Intel"
0x00fe0000-0x01000000 : "JBM BIOS Config"
0x00fe0000-0x01000000 : "JBM BIOS"
JBMgw137 Battery Backed RAM device: 1f000 at 18021000
kmod: failed to exec /sbin/modprobe -s -k ram, errno = 2
kmod: failed to exec /sbin/modprobe -s -k rom, errno = 2
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 4096)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00477238:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0047723c:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00477240:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00477244:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00477248:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0047724c:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00477250:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00477254:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00477258:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0047725c:
0x1a1a instead
Further such events for this erase block will not be printed
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 64k freed
Warning: unable to open an initial console.

--snip--
