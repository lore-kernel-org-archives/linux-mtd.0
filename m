Received: from mail.ch.keymile.com ([193.17.201.103])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NkaC2-00009c-Cx
	for linux-mtd@lists.infradead.org; Thu, 25 Feb 2010 09:39:44 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: MTD Flash-unlock with Nymonix Strata Flash (P30) doesn't work
Date: Thu, 25 Feb 2010 10:39:28 +0100
Message-ID: <D839955AA28B9A42A61B9181506E27C4020ACF1A@SRVCHBER1212.ch.keymile.net>
From: "Roggli, Lukas" <Lukas.Roggli@keymile.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

I'm a newbie to the embedded linux world and I've been trying for days
to access the flash chip (Nymonix 64MB Flash, Intel-Strata based) on my
hardware. I've been reading myself through the mailinglist and tried all
the advices - but still not successful.
I'm using Kernel 2.6.28.=20

flinfo print-out:
Bank #1: CFI conformant FLASH (16 x 16) Size: 64 MB in 512 Sectors
Intel Extended command set, Manufacturer ID: 0x89, Device ID: 0x99

What I am doing:

First, I'm creating a new ubi-Partition:

ubimkvol /dev/ubi0 -S 5 -N flash_test_area --> this generates a new
mtd-Device mtd5

Because the Nymonix-Flash powers up with locked sectors, I need to
unlock it first:

strace -o /tmp/flash.log flash_unlock /dev/mtd5 =20

flash.log print out:

execve("/usr/sbin/flash_unlock", ["flash_unlock", "/dev/mtd5"], [/* 17
vars */]) =3D 0
brk(0)                                  =3D 0x10041000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
=3D 0x4801d000
access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      =3D -1 ENOENT (No such file or
directory)
open("/lib/tls/ppc603/libc.so.6", O_RDONLY) =3D -1 ENOENT (No such file =
or
directory)
stat64("/lib/tls/ppc603", 0xbfb13f48)   =3D -1 ENOENT (No such file or
directory)
open("/lib/tls/libc.so.6", O_RDONLY)    =3D -1 ENOENT (No such file or
directory)
stat64("/lib/tls", 0xbfb13f48)          =3D -1 ENOENT (No such file or
directory)
open("/lib/ppc603/libc.so.6", O_RDONLY) =3D -1 ENOENT (No such file or
directory)
stat64("/lib/ppc603", 0xbfb13f48)       =3D -1 ENOENT (No such file or
directory)
open("/lib/libc.so.6", O_RDONLY)        =3D 3
read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\1\346"...,
512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0777, st_size=3D1381924, ...}) =3D 0
mmap(0xfe62000, 1626832, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,
3, 0) =3D 0xfe62000
mprotect(0xffa8000, 262144, PROT_NONE)  =3D 0
mmap(0xffe8000, 20480, PROT_READ|PROT_WRITE|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x146000) =3D 0xffe8000
mmap(0xffed000, 8912, PROT_READ|PROT_WRITE|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0xffed000
close(3)                                =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
=3D 0x4801e000
mprotect(0xffe8000, 8192, PROT_READ)    =3D 0
mprotect(0x4805c000, 4096, PROT_READ)   =3D 0
open("/dev/mtd5", O_RDWR)               =3D 3
ioctl(3, 0x40204d01, 0xbfb148c0)        =3D 0
ioctl(3, 0x80084d06, 0xbfb148b8)        =3D -1 EOPNOTSUPP (Operation not
supported)
write(2, "Could not unlock MTD device: /de"..., 39) =3D 39
close(3)                                =3D 0
exit_group(1)                           =3D ?

Why does the mtd-layer not support flash unlocking? Do I need to set a
specific flag in the kernel configuration (or even in my definitions in
the flattened device tree)?

Flash unlocking/programming/erasing works fine with u-boot - so there's
probably no hardware issue.

Thanks in advance for all advices.

Luke
