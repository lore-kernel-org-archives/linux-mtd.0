Received: from fmmailgate05.web.de ([217.72.192.243])
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dy4aE-0004V4-Gs
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 10:21:50 +0100
Received: by fmmailgate05.web.de (8.12.10/8.12.10/webde Linux 0.7) with SMTP
	id j6S9KerQ030356
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2005 11:21:29 +0200
Date: Thu, 28 Jul 2005 11:21:28 +0200
Message-Id: <7686279@web.de>
MIME-Version: 1.0
From: Mirco Fuchs <mircofuchs@web.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Subject: Problem with AT91RM9200 and intel cfi flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,

i have a problem with unmounting a jffs2 partition which is located on the=

Intel StrataFlash 28F640J3. The System is an AT91RM9200 with kernel versio=
n 2.6.12
(and the appropriate patches from maxim.org.za/AT91RM9200/2.6).

I mount the rootfs via nfs and all works fine. I created flash patitions a=
nd i want to use one
with a jffs2 filesystem. Therefore i use the (latest) mtd tools (mkfs.jffs=
2 revision 1.45). I can
mount the partition with

#> mount -t jffs2 /dev/mtdblock3 /mnt/jffs2

and it is possible to read and write to the partition.

The problem occurs when i try to unmount the partition with

#> umount /mnt/jffs2

The instruction aborts with the following error:

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxx

Unable to handle kernel NULL pointer dereference at virtual address 000000=
00
pgd =3D c030c000
[00000000] *pgd=3D20019031, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at =5F=5Fdown=5Fwrite+0x9c/0xd4
LR is at jffs2=5Fflush=5Fwbuf=5Fpad+0x1c/0x3c
pc : [<c01b235c>]    lr : [<c00d8140>]    Not tainted
sp : c3dbbe98  ip : c3dbbebc  fp : c3dbbeb8
r10: 401772a0  r9 : c3dba000  r8 : c0020dc4
r7 : c01ed02c  r6 : c3c14330  r5 : c3c141f4  r4 : c03ed800
r3 : c3c141f8  r2 : c3dbbe98  r1 : 00000000  r0 : c3c141f4
Flags: nzcv  IRQs off  FIQs on  Mode SVC=5F32  Segment user
Control: C000717F  Table: 2030C000  DAC: 00000015
Process umount (pid: 167, stack limit =3D 0xc3dba194)
Stack: (0xc3dbbe98 to 0xc3dbc000)
be80:                                                       c3c141f8 c0092=
fc8
bea0: c03ed800 00000002 c3c140d8 c3dbbed0 c3dbbebc c00d8140 c01b22d0 c3c14=
108
bec0: c3c14330 c3dbbee4 c3dbbed4 c00d6bc8 c00d8134 c3c142e4 c3dbbefc c3dbb=
ee8
bee0: c0070254 c00d6b9c c3c142e4 c3e00d3c c3dbbf1c c3dbbf00 c0075ce8 c0070=
1c0
bf00: c3c140d8 c01ed07c c3dbbf4c 00000016 c3dbbf30 c3dbbf20 c00d7058 c0075=
cb0
bf20: c3c142e4 c3dbbf48 c3dbbf34 c0075c00 c00d7054 00000000 00000000 c3dbb=
fa4
bf40: c3dbbf4c c008c0a0 c0075bb8 c3e00d3c c02e7ac4 c3db41ed 00000003 00000=
000
bf60: 00000001 00000001 00000000 00000000 00000000 00000000 00000000 00000=
000
bf80: 00000000 00000000 00001000 00086268 00000000 bebf9e6c 00000000 c3dbb=
fa8
bfa0: c0020c40 c008c018 00086268 c0027b40 bebf9e6c bebf9e6e 0008626a 00000=
06d
bfc0: 00086268 00000000 bebf9e6c 00000000 00077140 0000cc70 401772a0 00000=
000
bfe0: 401269a0 bebf9e58 00050f68 401269a4 60000010 bebf9e6c e3530000 1afff=
ff5
Backtrace:
[<c01b22c0>] (=5F=5Fdown=5Fwrite+0x0/0xd4) from [<c00d8140>] (jffs2=5Fflush=5Fwbuf=5Fp=
ad+0x1c/0x3c)
 r4 =3D C3C140D8
[<c00d8124>] (jffs2=5Fflush=5Fwbuf=5Fpad+0x0/0x3c) from [<c00d6bc8>] (jffs2=5Fsync=
=5Ffs+0x3c/0x68)
 r5 =3D C3C14330  r4 =3D C3C14108
[<c00d6b8c>] (jffs2=5Fsync=5Ffs+0x0/0x68) from [<c0070254>] (fsync=5Fsuper+0xa4/=
0xc4)
 r4 =3D C3C142E4
[<c00701b0>] (fsync=5Fsuper+0x0/0xc4) from [<c0075ce8>] (generic=5Fshutdown=5Fsu=
per+0x48/0x140)
 r5 =3D C3E00D3C  r4 =3D C3C142E4
[<c0075ca0>] (generic=5Fshutdown=5Fsuper+0x0/0x140) from [<c00d7058>] (jffs2=5Fk=
ill=5Fsb+0x14/0x28)
 r7 =3D 00000016  r6 =3D C3DBBF4C  r5 =3D C01ED07C  r4 =3D C3C140D8
[<c00d7044>] (jffs2=5Fkill=5Fsb+0x0/0x28) from [<c0075c00>] (deactivate=5Fsuper+=
0x58/0x6c)
 r4 =3D C3C142E4
[<c0075ba8>] (deactivate=5Fsuper+0x0/0x6c) from [<c008c0a0>] (sys=5Fumount+0x9=
8/0xa0)
 r5 =3D 00000000  r4 =3D 00000000
[<c008c008>] (sys=5Fumount+0x0/0xa0) from [<c0020c40>] (ret=5Ffast=5Fsyscall+0x0=
/0x2c)
 r6 =3D BEBF9E6C  r5 =3D 00000000  r4 =3D 00086268
Code: e5931004 e24b2020 e50b3020 e5832004 (e5812000)

Segmentation fault
/ #
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxx

The point is that there still is a prompt after this error. I can see that=
 the partition was
unmounted but trying to remount the jffs2 partition fails and the cpu hang=
s.

I checked if the settings of the SMC Controller are correct and i think th=
ey are.

Are there any hints or advises=3F


Best Regards

Mirco

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
Mit der Gruppen-SMS von WEB.DE FreeMail k=F6nnen Sie eine SMS an alle=20
Freunde gleichzeitig schicken: http://freemail.web.de/features/=3Fmc=3D021179
