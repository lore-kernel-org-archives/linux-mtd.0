Received: from [202.106.127.236] (helo=harbournetworks.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19fueM-00023n-B0
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2003 05:57:50 +0100
From: "Yuxiao Xi" <xiyuxiao@harbournetworks.com>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Date: Fri, 25 Jul 2003 13:0:13 +0800
Message-Id: <E19fueM-00023n-B0@pentafluge.infradead.org>
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Subject: compiling MTD error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Which MTD version works well with linux kernel 2.4.17?
=09

=3D=3D=3D=3D=3D=3D=3D 2003-07-22 20:35:00 =C4=FA=D4=DA=C0=B4=D0=C5=D6=D0=D0=B4=B5=C0=A3=BA=3D=3D=3D=3D=3D=3D=3D

>Hello,
>     My armlinux kernel version is 2.4.18 rmk6. MTD source code
>is downloaded form CVS and added to kernel tree using=
 patch.sh.When I compiled the kernel compiler reported info as=
 follow:
>
>drivers/mtd/mtdlink.o:In function 'put_mtd_device':
>/home/linux/drivers/mtd/mtdcore.c:225:undefined reference=
 'BUG_ON'
>drivers/mtd/mtdlink.o:In function 'mtdblock_writesect':
>/home/linux/drivers/mtd/mtdblock.c:251:undefined reference to=
 'unlikely'
>drivers/mtd/mtdlink.o:In function 'mtd_blktrans_thread':
>/home/linux/drivers/mtd/mtd/mtd_blkdevs-24.c:180:undefined=
 reference to 'BUG_ON'
>     I have used grep searching the kernel tree ,but can not=
 find  where
>defined 'BUG_ON' and 'unlikely'.
>Thanks.
>Gavin
> 
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/

=3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D
=09=09=09

=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=D6=C2
=C0=F1=A3=A1
 
=09=09=09=09 
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1Yuxiao Xi
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1xiyuxiao@harbournetworks.com
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A12003-07-25
