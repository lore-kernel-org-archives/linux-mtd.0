Received: from [202.97.181.21] (helo=mail.cnbook.com.cn)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Bnwv-0004Ny-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2002 03:12:19 +0000
Received: from RavProxy ([202.107.117.132])
	(authenticated)
	by mail.cnbook.com.cn (8.11.6/8.11.6) with ESMTP id gADF27m32439
	for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2002 10:02:08 -0500
Message-Id: <200211131502.gADF27m32439@mail.cnbook.com.cn>
From: "nbhorse" <nbhorse@163.net>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: help about jffs2 write problem.
Mime-Version: 1.0
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Nov 2002 11:42:24 +0800
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

Hello everyone,
   I have a problem with the mtd and jffs2.when I ported a linux=
 kernel(2.4.18 rmk7)to my arm 7212 board(samsung k9f560 32m=
 nandflash),and my partition for nand mtd driver like this:

const static struct mtd_partition partition_info[] =3D {
=09{ name: "kernel",
=09  offset: 0,
=09  size: 1*1024*1024},
=09{ name: "blank",
=09  offset: 1*1024*1024,
=09  size: 1*1024*1024},
=09{ name: "file system 1",
=09  offset: 2*1024*1024,
=09  size: 4*1024*1024},
=09{ name: "SamSung flash partition 1",
=09  offset: 6*1024*1024,
=09  size: 2*1024*1024},
=09{ name: "SamSung flash partition 2",
=09  offset: 8*1024*1024,
=09  size: 24*1024*1024 }
};
  and i want to mount partition 1(blank) with jffs2.
  I have a problem:
  I use "eraseall /dev/mtd1"(c 90 2) to erase the mtdblock1,and i=
 "mount -t jffs2 /dev/mtdblock1 /flash","copy /bin/busybox=
 /flash",it display following error message:
  
    ARGH. About to write node to 0x000f8760 on flash, but there's=
 data already there:
0x000f8760: 57 a6 fb 05 76 e3 29 d7 fe f0 78 b7 ce 0f b8 c6
                       .....
then i run"/flash/busybox",error is:

Node CRC b04df10c !=3D calculated CRC 49b35642 for node at=
 00020760
Node CRC b04df10c !=3D calculated CRC 49b35642 for node at=
 00020760

I'm sure that partition 1=A3=A8"blank") is be erased.

if i use ext2 filesystem,everything is ok.

Any help would be appreciated
