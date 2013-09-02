Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGSNP-0005Uh-8Y
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2013 11:33:00 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: gpmi-nand driver and jffs2 support
Date: Mon, 2 Sep 2013 13:32:33 +0200
References: <522062B4.4080709@digi.com> <52246421.1020900@digi.com>
 <5224670F.6000703@freescale.com>
In-Reply-To: <5224670F.6000703@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201309021332.34063.marex@denx.de>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Hector Palacios <hector.palacios@digi.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 scottwood@freescale.com, Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8802=E6=97=A5 18:10, Hector Palacios =E5=
=86=99=E9=81=93:
> > So does this mean that U-Boot is now unable to properly write a JFFS2
> > partition for it to be understood by the linux-next
>=20
> For the gpmi nand controller, the uboot is not proper to write a jffs2 no=
w.
>=20
> > kernel? What is exactly the difference? Does it only affect Freescale
> > NAND controllers?
>=20
> I think there are many difference. Just diff the nand_base.c, you can
> see there are many patches merged in
> the kernel's mtd code, but not exit in the uboot's mtd code.

This makes not much sense to me. If what you claim is true, than JFFS2 in U=
=2DBoot=20
and Linux would be incompatible for all MTD drivers. This would also mean t=
hat=20
JFFS2 in Linux 3.7 is incompatible with Linux-next (since 3.7 was the last =
sync=20
point between U-Boot and Linux MTD). Is that really the case?

Best regards,
Marek Vasut
