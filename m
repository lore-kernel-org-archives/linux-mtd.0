Received: from wproxy.gmail.com ([64.233.184.202])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DnS7h-00026R-RO
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2005 22:16:23 -0400
Received: by wproxy.gmail.com with SMTP id i20so692386wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2005 19:15:47 -0700 (PDT)
Message-ID: <6394389005062819152a4be743@mail.gmail.com>
Date: Wed, 29 Jun 2005 10:15:47 +0800
From: red dot <vvlook@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: mtd partitions can't be writed
Reply-To: red dot <vvlook@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,
I have built the jffs2 image as
mkfs.jffs2 -e 0x20000 --pad=3D0x1e0000 -l -d b -o jffs2.bin,
and i wirte the image into the flash . When the system was started, i
can't write anything.
Following the information:


*****************************************************=20
* ARM Monitor v1.2 by Hynix=20
* CPU =3D HMS30C7202=20
* Programmed by Jungjun Kim=20
* Modify by Byunghwan Jun=20
* email: byunghwan.jun@hynix.com=20
*****************************************************=20
DMA Memory base=3D0x40700000, end=3D0x40780000=20
BUFFER Memory base=3D0x40780000, end=3D0x40800000=20
Linux version 2.6.9-linux-2.6.9-hnx3 (root@yy.yy.com) (gcc version=20
3.4.2) #39 Thu Jun 23 17:30:56 CST 2005=20
CPU: ARM720T [41807202] revision 2 (ARMv4T)=20
Machine: Hynix HMS30C7202=20
Warning: bad configuration page, trying to continue=20
Memory policy: ECC disabled, Data cache writeback=20
Built 1 zonelists=20
Kernel command line: console=3DttyS2,57600 mem=3D8M rootfstype=3Djffs2=20
root=3D/dev/mtdblock2 rw=20
Trying to install chained handler for IRQ16=20
PID hash table entries: 64 (order: 6, 1024 bytes)=20
Console: colour dummy device 80x30=20
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)=20
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)=20
Memory: 8MB =3D 8MB total=20
Memory: 6784KB available (971K code, 240K data, 52K init)=20
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)=20
CPU: Testing write buffer coherency: ok=20
Linux NoNET1.0 for Linux 2.6=20
NetWinder Floating Point Emulator V0.97 (double precision)=20
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.=20
Initializing Cryptographic API=20
h720x Framebuffer driver=20
h720xfb_init_fbinfo=20
h720xfb_set_par=20
RGBT length =3D 8:8:8:0=20
RGBT offset =3D 0:0:0:0=20
h7202 PS/2 port driver=20
Serial: 8250/16550 driver $Revision: 1.90 $ 8 ports, IRQ sharing disabled=
=20
ttyS0 at MMIO 0x0 (irq =3D  is a 16550A=20
ttyS1 at MMIO 0x0 (irq =3D 9) is a 16550A=20
ttyS2 at MMIO 0x0 (irq =3D 10) is a 16550A=20
ttyS3 at MMIO 0x0 (irq =3D 11) is a 16550A=20
Using anticipatory io scheduler=20
H720x remap virt=3Dc1080000=20
H720x-MTD probing 16bit FLASH=20
cmdlinepart partition parsing not available=20
Using builtin partition table=20
Creating 3 MTD partitions on "H720X":=20
0x00000000-0x00040000 : "ARMo"=20
0x00040000-0x00220000 : "Kernel"=20
0x00220000-0x00400000 : "Jffs2"=20
h7202_udc: Hynix HMS30C7202 USB Device Controller (2004-05-21)=20
mice: PS/2 mouse device common for all mice=20
atkbd.c: keyboard reset failed on h7202ps2=20
VFS: Mounted root (jffs2 filesystem).=20
Freeing init memory: 52K=20
Write of 70 bytes at 0x000dd040 failed. returned -30, retlen 3223895968=20
Write of 70 bytes at 0x000dd088 failed. returned -30, retlen 3221828160=20
Write of 70 bytes at 0x000dd0d0 failed. returned -30, retlen 4294967266=20
Write of 70 bytes at 0x000dd118 failed. returned -30, retlen 3221828160=20

Welcome to the Erik's uClibc development environment.=20

(none) login: root=20
Write of 70 bytes at 0x000dd160 failed. returned -30, retlen 70=20
Write of 70 bytes at 0x000dd1a8 failed. returned -30, retlen 3221828160=20
Write of 70 bytes at 0x000dd1f0 failed. returned -30, retlen 4294967266=20
Write of 70 bytes at 0x000dd238 failed. returned -30, retlen 3221828160=20
Dec 31 17:00:10 login[19]: root login on `ttyS2'=20

BusyBox v1.00 (2005.06.15-02:17+0000) Built-in shell (ash)=20
Enter 'help' for a list of built-in commands.=20

# ls=20
# cat /proc/mtd=20
dev: size erasesize name=20
mtd0: 00040000 00020000 "ARMo"=20
mtd1: 001e0000 00020000 "Kernel"=20
mtd2: 001e0000 00020000 "Jffs2"=20
# ls=20
# mkdir a=20
Write of 68 bytes at 0x000dd280 failed. returned -30, retlen 3222743552=20
Write of 68 bytes at 0x000dd2c4 failed. returned -30, retlen 3221828160=20
mkdir: Cannot create directory `a': Read-only file system=20
#=20
# cat /proc/mounts=20
rootfs / rootfs rw 0 0=20
/dev/root / jffs2 rw,noatime 0 0=20
proc /proc proc rw,nodiratime 0 0=20
devpts /dev/pts devpts rw 0 0=20
tmpfs /tmp tmpfs rw 0 0=20
#=20
# cat /etc/fstab=20
# <file system> <mount pt> <type> <options> <dump> <pass>=20
/dev/root / ext2 rw,noauto 0 1=20
proc /proc proc defaults 0 0=20
devpts /dev/pts devpts defaults,gid=3D5,mode=3D620 0 0=20
tmpfs /tmp tmpfs defaults 0 0=20

Can you anybody give me a suggest?
thanks.
