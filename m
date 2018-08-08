Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fnNfK-0003Dk-7z
 for linux-mtd@lists.infradead.org; Wed, 08 Aug 2018 12:34:16 +0000
Date: Wed, 8 Aug 2018 14:33:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Jane Wan <Jane.Wan@nokia.com>, Jagdish
 Gediya <jagdish.gediya@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: nand: fsl-ifc: fixup SRAM init for newer ctrl
 versions
Message-ID: <20180808143352.2f5b999c@xps13>
In-Reply-To: <20180808100909.anfi3qlfjnzb74p2@linutronix.de>
References: <20180806092137.9287-1-kurt@linutronix.de>
 <20180806092137.9287-3-kurt@linutronix.de>
 <20180808114832.61d31c29@xps13>
 <20180808100909.anfi3qlfjnzb74p2@linutronix.de>
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

Hi Kurt,


> > > @@ -769,6 +770,23 @@ static int fsl_ifc_sram_init(struct fsl_ifc_mtd =
*priv)
> > >  	uint32_t csor =3D 0, csor_8k =3D 0, csor_ext =3D 0;
> > >  	uint32_t cs =3D priv->bank;
> > >
> > > +	if (ctrl->version > FSL_IFC_VERSION_1_1_0) { =20
> >
> > This is redundant and fsl_ifc_sram_init() is called only if
> > "ctrl->version > FSL_FC_VERSION_1_1_0". =20
>=20
> No, it's not. It's called when ctrl->version >=3D
> FSL_IFC_VERSION_1_1_0. Therefore, this check is needed.

Oh right, I missed the "=3D".

>=20
> >
> > So this means this function has never worked? =20
>=20
> It did work for e.g. IFC controller in version 1.1.0.
>=20
> However, it worked for the newer versions by accident, because U-Boot
> already initialized the SRAM correctly. If you boot without NAND
> initialization in U-Boot, then you'll hit the issue.
>=20
> >
> > If this is the case, there should be at least a Fixes: tag.
> >
> > Maybe it would be cleaner to always call fsl_ifc_sram_init() from the
> > probe(), and just exit with a "return 0" here if the version is old?
> > (I'll let you choose the way you prefer). =20
>=20
> Sounds like a good idea. Otherwise we have to check the version twice.
>=20
> > =20
> > > +		u32 ncfgr, status;
> > > +		int ret;
> > > +
> > > +		/* Trigger auto initialization */
> > > +		ncfgr =3D ifc_in32(&ifc_runtime->ifc_nand.ncfgr);
> > > +		ifc_out32(ncfgr | IFC_NAND_NCFGR_SRAM_INIT_EN, &ifc_runtime->ifc_n=
and.ncfgr);
> > > +
> > > +		/* Wait until done */
> > > +		ret =3D readx_poll_timeout(ifc_in32, &ifc_runtime->ifc_nand.ncfgr,
> > > +					 status, !(status & IFC_NAND_NCFGR_SRAM_INIT_EN),
> > > +					 10, 1000); =20
> >
> > Nit: I always prefer when delays/timeouts are defined (and may be
> > reused). =20
>=20
> Me too. I've missed that there is already a timeout constant
> IFC_TIMEOUT_MSECS (500). As it's huge, I'll add a second one.

Well, I'm not bothered with huge timeouts, it's in the error path so we
don't really care.

Thanks,
Miqu=C3=A8l
