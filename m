Received: from [222.66.49.139] (helo=smailsh.E28.COM)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eejys-0002Pu-12
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 21:03:36 -0500
From: kevinwu <kevinwu@e28.com>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <438322C6.6020002@inf.u-szeged.hu>
References: <1132624224.3577.15.camel@localhost.localdomain>
	<438322C6.6020002@inf.u-szeged.hu>
Content-Type: text/plain; charset=utf-8
Date: Wed, 23 Nov 2005 09:57:33 +0800
Message-Id: <1132711053.3539.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: small erase block size with EBS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ferenc,
I successfully mounted a 128KiB erase block size summary image on a
16KiB erase block size NAND. The mounting speed is very high. It takes
only about 0.5 second mounting on a 32MiB partition with 90% disk
full.(My cpu is ARM926 running at 201 MHz) It seems OK. The performance
is good. I modified JFFS2 source code a little.
I changed souce code in function jffs2_do_fill_super()
from:
c->sector_size =3D c->mtd->size;
to:
c->sector_size =3D 0x00020000; //erase block size of image you generated.=20

It does work if the jffs2 partition has no bad block.
If there is a bad block, it will get error imformation. But I will fix
this bug soon. I know what happend.=20

=E5=9C=A8 2005-11-22=E4=BA=8C=E7=9A=84 14:53 +0100=EF=BC=8CFerenc Havasi=E5=
=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
> > I have a NAND flash with a small erase block(16KiB)
> > When I use sumtool, I find that the summary image size is much larger
> > than the original one if I use option --eraseblock=3D0x4000.
> > But When I use option --eraseblock=3D0x20000, The summary image is a bi=
t
> > larger than the original one.
> > EBS fits for large erase block as far as I know.=20
> > That is to say, I can not use EBS if the NAND erase block is small. Wha=
t
> > a pitty!
>  > Is there any way to use EBS on a small erase block size NAND?
>=20
> EBS should work on your system but if the erase block size is small it=20
> may be not too usefull. Generally if you use bigger erase block size the=20
> speedup will be greater and the "used place penalty" will be smaller.
>=20
> So I suggest to test it: measure the rete of speedup and the difference=20
> in image size on your system, and you can decide it is OK for you or not.
>=20
> > What about CS?
>=20
> CS doesn't depend on erase block size as EBS does, so you may try it.=20
> The code of CS is more then one mouth old, so you should use it with=20
> earlier mtd snapshot. If you can wait a little we will update it at the=20
> first week of december.
It seems a better choise. I will try it.

Thanks for your information.
--=20
Best Regards

Kevin Wu

System Software Engineer, E28.com


Office: 86-21-23060088-352
