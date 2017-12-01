Date: Fri, 1 Dec 2017 10:39:20 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Wenyou Yang
 <wenyou.yang@atmel.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Han Xu <han.xu@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux
 <slemieux.tyco@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxim Levitsky
 <maximlevitsky@gmail.com>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Marc
 Gonzalez <marc_gonzalez@sigmadesigns.com>, Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>,
 linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org,
 devel@driverdev.osuosl.org
Subject: Re: [PATCH 1/5] mtd: nand: use usual return values for the
 ->erase() hook
Message-ID: <20171201103920.1ed36f99@bbrezillon>
In-Reply-To: <20171130230246.61a9ed19@xps13>
References: <20171130170132.27522-1-miquel.raynal@free-electrons.com>
 <20171130170132.27522-2-miquel.raynal@free-electrons.com>
 <20171130215113.458d616f@bbrezillon>
 <20171130230246.61a9ed19@xps13>
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

On Thu, 30 Nov 2017 23:02:46 +0100
Miquel RAYNAL <miquel.raynal@free-electrons.com> wrote:

> > > diff --git a/drivers/mtd/nand/nand_base.c
> > > b/drivers/mtd/nand/nand_base.c index 630048f5abdc..4d1f2bda6095
> > > 100644 --- a/drivers/mtd/nand/nand_base.c
> > > +++ b/drivers/mtd/nand/nand_base.c
> > > @@ -3077,7 +3077,7 @@ int nand_erase_nand(struct mtd_info *mtd,
> > > struct erase_info *instr, status =3D chip->erase(mtd, page &
> > > chip->pagemask);=20
> > >  		/* See if block erase succeeded */
> > > -		if (status & NAND_STATUS_FAIL) {
> > > +		if (status) {
> > >  			pr_debug("%s: failed erase, page 0x%08x\n",
> > >  					__func__, page);
> > >  			instr->state =3D MTD_ERASE_FAILED;   =20
> >=20
> > You forgot to patch single_erase() accordingly. =20
>=20
> Right, sorry about that, I will fix that.

If fixed it when applying, no need to resend.

Thanks,

Boris

>=20
> Thanks,
> Miqu=C3=A8l
