Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOPCR-0005le-A0
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 13:32:24 +0000
Date: Tue, 3 Jan 2017 14:32:01 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "Valdis.Kletnieks@vt.edu" <valdis.kletnieks@vt.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 14/15] mtd: nand: hynix: rework NAND ID decoding to
 extract more information
Message-ID: <20170103143201.14fcf294@bbrezillon>
In-Reply-To: <3073151483449433@web27m.yandex.ru>
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
 <1483448495-31607-15-git-send-email-boris.brezillon@free-electrons.com>
 <3073151483449433@web27m.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 03 Jan 2017 21:17:13 +0800
Icenowy Zheng <icenowy@aosc.xyz> wrote:

> 03.01.2017, 21:01, "Boris Brezillon" <boris.brezillon@free-electrons.com>:
> > The current NAND ID detection in nand_hynix.c is not handling the
> > different scheme used by Hynix, thus forcing developers to add new
> > entries in the nand_ids table each time they want to support a new MLC
> > NAND.
> >
> > Enhance the detection logic to handle all known formats. This does not
> > necessarily mean we are handling all the cases, but if new formats are
> > discovered, the code should evolve to take them into account instead of
> > adding more full-id entries in the nand_ids table.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> > =C2=A0drivers/mtd/nand/nand_hynix.c | 228 +++++++++++++++++++++++++++++=
+++++++++----
> > =C2=A01 file changed, 209 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hyni=
x.c
> > index 06c8e8b0ec68..a35ca3a593f5 100644
> > --- a/drivers/mtd/nand/nand_hynix.c
> > +++ b/drivers/mtd/nand/nand_hynix.c
> > @@ -13,21 +13,56 @@
> > =C2=A0=C2=A0*/
> >

[...]

> > + switch (oobsize) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 0:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0mtd->oobsize =3D 128;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0break;
> > @@ -46,23 +81,178 @@ static void hynix_nand_decode_id(struct nand_chip =
*chip)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 5:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0mtd->oobsize =3D 16;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0break;
> > - default:
> > + case 6:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0mtd->oobsize =3D 640;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0break;
> > + default:
> > + /*
> > + * We should never reach this case, but if that
> > + * happens, this probably means Samsung decided to use =20
>=20
> Is this "Samsung" a copy-n-paste error? ;-)

Indeed, and this is not the only place where I'm wrongly mentioning
Samsung. I'll fix that.

Thanks,

Boris
