Received: from mail.gmx.de ([213.165.64.20] helo=mail.gmx.net)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D3Y4u-0004pX-4A
	for linux-mtd@lists.infradead.org; Tue, 22 Feb 2005 06:19:45 -0500
From: Thomas Brinker <thomas.brinker@gmx.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 22 Feb 2005 12:19:41 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200502221219.41518.thomas.brinker@gmx.de>
Subject: mounting jffs2 rw
Reply-To: thomas.brinker@gmx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I have problems in remounting a jffs2 as read/writeable.

Currently it mounts successfully as root-fs but in ro, which is no wonder.
But how can I change it to rw?


Here is what I have tried so far:
=2D--=3D=3D=3D---
# cat /proc/version
Linux version 2.6.9-uc0 (thomas@mobile) (gcc version 3.4.3) #141 Mon Feb 21=
 16:01:36 CET 2005
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00010000 "phys_mapped_flash"
# ls -l /dev/mtd*
crw-r--r--    1 root     root      90,   0 Feb  7  2005 /dev/mtd0
brw-r--r--    1 root     root      31,   0 Feb  7  2005 /dev/mtdblock0
crw-r--r--    1 root     root      90,   1 Feb  7  2005 /dev/mtdr0
# mount
/dev/rom0 on / type jffs2 (ro,noatime)                [<--- rom0 is strange]
/proc on /proc type proc (rw,nodiratime)
none on /dev/pts type devpts (rw)
none on /sys type sysfs (rw)
ram on /var type ramfs (rw)
# mount -o remount,rw /dev/mtdblock0 /
mount: Mounting /dev/mtdblock0 on / failed: No such file or directory
# mount -o remount,rw /dev/rom0 /
mount: Mounting /dev/rom0 on / failed: No such file or directory
# mount -o remount,rw /
mount:
Cannot read /etc/fstab: No such file or directory
=2D--=3D=3D=3D---

Boot logs:
=2D--=3D=3D=3D---
Linux version 2.6.9-uc0 (thomas@mobile) (gcc version 3.4.3) #141 Mon Feb 21=
 16:01:36 CET 2005
CPU: P2001 [41029000] revision 0 (ARMv4T)
Machine: P2001
Built 1 zonelists
Kernel command line: ip=3Ddhcp root=3D/dev/mtdblock0 rootfstype=3Djffs2 con=
sole=3DttyS0,57600n8
PID hash table entries: 128 (order: 7, 2048 bytes)
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Memory: 16MB =3D 16MB total
Memory: 14508KB available (1440K code, 184K data, 64K init)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
NET: Registered protocol family 16
NetWinder Floating Point Emulator V0.97 (extended precision)
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
p2001_uart.c:v1.3 12/01/2004 Tobias Lorenz (tobias.lorenz@gmx.net)
ttyS0 at MMIO 0x140000 (irq =3D 1) is a P2001
p2001_eth.c:v1.19 12/17/2004 Tobias Lorenz (tobias.lorenz@gmx.net)
eth0: ADDR 0x180000, IRQ 17/18, MAC 00:09:4f:00:00:02.
eth0: PHY 0, ID 0x78e20013 (Intel LXT971A).
Setting PHY LEDs to:
  Red    =3D Link Status
  Yellow =3D Transmit Status
  Green  =3D Receive Status
eth1: ADDR 0x181000, IRQ 19/20, MAC 00:09:4f:00:00:03.
eth1: PHY 1, ID 0x78e20013 (Intel LXT971A).
Setting PHY LEDs to:
  Red    =3D Link Status
  Yellow =3D Transmit Status
  Green  =3D Receive Status
eth2: no more MII PHYs found
p2001_eth: 2 interfaces found.
Using anticipatory io scheduler
physmap flash device: 400000 at 2000000
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 2048)
NET: Registered protocol family 1
NET: Registered protocol family 17
eth0: Receiving filtered multicast (0 entries).
eth0: Receiving filtered multicast (0 entries).
eth0: Receiving filtered multicast (0 entries).
eth1: Receiving filtered multicast (0 entries).
eth1: Receiving filtered multicast (0 entries).
eth1: Receiving filtered multicast (0 entries).
Sending DHCP requests ., OK
IP-Config: Got DHCP answer from 10.0.0.1, my address is 10.0.0.205
eth1: Receiving filtered multicast (0 entries).
eth0: Receiving filtered multicast (1 entries).
IP-Config: Complete:
      device=3Deth0, addr=3D10.0.0.205, mask=3D255.255.255.0, gw=3D255.255.=
255.255,
     host=3Dp2001, domain=3D, nis-domain=3D(none),
     bootserver=3D10.0.0.1, rootserver=3D10.0.0.1, rootpath=3D/root/linux/a=
rmroot
VFS: Mounted root (jffs2 filesystem) readonly.
=46reeing init memory: 64K
init: Mounting Filesystems:  proc devpts sys ram done.
init: Setting up Interfaces: lo done.
init: Starting Services: inetd done.                                       =
                                                                           =
              =20
=2D--=3D=3D=3D---

Regards
Thomas

=2D-=20
Wo k=E4men wir hin, wenn alle sagten, wo k=E4men wir hin,
und niemand ginge, um einmal zu schauen, wohin man k=E4me,
wenn man ginge.
=ABKurt Marti=BB
