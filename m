Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQPrQ-0004hP-Jl
 for linux-mtd@lists.infradead.org; Sun, 29 Sep 2013 22:53:09 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: gpmi-nand driver and jffs2 support
Date: Mon, 30 Sep 2013 00:52:46 +0200
References: <522062B4.4080709@digi.com> <201309241453.47069.marex@denx.de>
 <5242A805.50804@freescale.com>
In-Reply-To: <5242A805.50804@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201309300052.46883.marex@denx.de>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Hector Palacios <hector.palacios@digi.com>, linux-mtd@lists.infradead.org,
 dzu@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8824=E6=97=A5 20:53, Marek Vasut =E5=86=
=99=E9=81=93:
> > Hello Huang,
> >=20
> >> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8824=E6=97=A5 17:50, Marek Vasut =E5=
=86=99=E9=81=93:
> >>> Hello Huang,
> >>>=20
> >>> Can you please explain what is the exact difference between the NAND
> >>> layout when using JFFS2 in FSL 2.6.35 and in mainline with your patch=
es
> >>> ?
> >>=20
> >> In FSL 2.6.35, there are some free space in the OOB;
> >> while in mainline we use all the free space in the OOB.
> >=20
> > OK, let me understand this in more detail.
> >=20
> > How does the NAND page look when written by FSL 2.6.35 and how does the
> > NAND page look when written by current mainline ? Can you please tell in
> > detail?
>=20
> [1] for FSL 2.6.35, see gpmi_nfc_set_geometry():
>      The ecc_strength is set at a fix value, such as:
>            "set ecc_strength with 8 for page size 2048";
>=20
>      Why set the ecc_strength with 8? just based on the experiences, not
> based on the
>      chip's datasheets.
>=20
>      So we can have some spare space in the OOB, after we setting the
> BCH with the ecc_strength.
>=20
> [2] for mainline, see common_nfc_set_geometry():
>      Please see the diagrams in the set_geometry_by_ecc_info() and
> legacy_set_geometry().
>=20
>=20
>      If we CAN use the ecc info from the chip's datasheet, just like in
> FSL_2.6.35, we may
>      have some spare space in the OOB; else we use all the OOB.

This is the vital information, thank you!

So by applying this [1] and calling the legacy_set_geometry() instead of=20
set_geometry_by_ecc_info(), I can get the JFFS2 to work. Nice, thanks again!

[1] http://lists.infradead.org/pipermail/linux-mtd/2007-December/020047.html
=20
> >>> Is there any way to mount JFFS2 written with FSL 2.6.35 on current
> >>> mainline? Thus far, neither me nor Hector were able to mount such
> >>> partition with the same result.
> >>=20
> >> The gpmi driver in FSL 2.6.35 is different from the mainline.
> >=20
> > I was under the impression the mainline driver is an evolution of the F=
SL
> > 2.6.35 driver. Is this assumption incorrect?
>=20
> yes.
>=20
> >> The two drivers are not compatible to each other.
> >=20
> > OK, like I said, if we cannot produce a drop-in replacement of old FSL
> > 2.6.35 kernel, this is a problem. People will come and they will be
> > running into this issue. Thus, let us focus on producing a compatible
> > JFFS2 patch.
>=20
> I do not think it is a problem. The FSL 2.6.35 does not support the JFFS2.

It does for SLC NAND.

Best regards,
Marek Vasut
