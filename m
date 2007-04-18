Received: from ntfw.echelon.com ([205.229.50.10])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HeDvw-0007Im-L8
	for linux-mtd@lists.infradead.org; Wed, 18 Apr 2007 13:27:09 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Got Permission denied error message when issuing flash_eraseall on
	mtd1 partition
Date: Wed, 18 Apr 2007 10:27:07 -0700
Message-ID: <BFDC5D4D8B9FB544936B508A6B8F48AA01D08985@monk.echelon.echcorp.com>
From: "Ian Phan" <iphan@echelon.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
=A0
I am new to Linux development and I try to get JFFS2 mounted on the 5 MB =
(mtd1) partition of the on-board 8 MB NOR flash on the Freescale =
MPC8349EMDS. When the linux kernel (2.6.14.7-selinux1-WR1.4aq_cgl) comes =
up, I can see the 4 mtd partitions.=A0 I can see these partitions using =
cat /proc/mtd and ls /dev/mtd*.=A0 I even able to issue flash_info =
/dev/mtd1 command.=A0 However, when I issue flash_eraseall /dev/mtd1, I =
got the following error: "flash_erase: /dev/mtd1: Permission denied" as =
shown below.
=A0
Can anyone tell me why I am getting this error?
=A0
Thanks,=20
Ian

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=A0
# cat /proc/mtd
dev:=A0=A0=A0 size=A0=A0 erasesize=A0 name
mtd0: 00020000 00020000 "HRCW"
mtd1: 00500000 00020000 "JFFS2"
mtd2: 00100000 00020000 "Kernel"
mtd3: 00100000 00020000 "U-Boot"
#
=A0
# ls -lLat /dev/mtd*
brw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 31,=A0=A0 3 =
Apr 18=A0 2007 /dev/mtdblock3
brw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 31,=A0=A0 2 =
Apr 18=A0 2007 /dev/mtdblock2
brw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 31,=A0=A0 1 =
Apr 18=A0 2007 /dev/mtdblock1
brw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 31,=A0=A0 0 =
Apr 18=A0 2007 /dev/mtdblock0
crw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 90,=A0=A0 3 =
Apr 18=A0 2007 /dev/mtd3
crw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 90,=A0=A0 2 =
Apr 18=A0 2007 /dev/mtd2
crw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 90,=A0=A0 1 =
Apr 18=A0 2007 /dev/mtd1
crw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 90,=A0=A0 0 =
Apr 18=A0 2007 /dev/mtd0 #
=A0
# flash_info /dev/mtd1
MTD_open
MTD_ioctl
Device /dev/mtd1MTD_close
=A0has 0 erase regions
#
=A0
# flash_eraseall /dev/mtd1
MTD_open
flash_eraseall: /dev/mtd1: Permission denied
#
=A0
# whoami
root
#
=A0
# uname -r
2.6.14.7-selinux1-WR1.4aq_cgl
=A0
=A0
=A0
