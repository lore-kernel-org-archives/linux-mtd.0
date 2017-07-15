Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dWKga-0008Ai-IK
 for linux-mtd@lists.infradead.org; Sat, 15 Jul 2017 10:52:34 +0000
Date: Sat, 15 Jul 2017 12:52:00 +0200
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Han Xu <han.xu@nxp.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: gpmi-nand: do not fail setting ONFI timing mode if
 available
Message-ID: <20170715125200.0b74d494@xps13>
In-Reply-To: <20170714193143.034c4c24@bbrezillon>
References: <20170713192030.22177-1-miquel.raynal@free-electrons.com>
 <20170713221520.268bc554@bbrezillon>
 <178298b1-b482-e636-2daa-1a6595b8c139@nxp.com>
 <20170714193143.034c4c24@bbrezillon>
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

Hi Han and Boris,

On Fri, 14 Jul 2017 19:31:43 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Han,
>=20
> Le Fri, 14 Jul 2017 14:53:39 +0000,
> Han Xu <han.xu@nxp.com> a =C3=A9crit :
>=20
> > On 07/13/2017 03:15 PM, Boris Brezillon wrote: =20
> > > Hi Miquel,
> > >
> > > Le Thu, 13 Jul 2017 21:20:30 +0200,
> > > Miquel Raynal <miquel.raynal@free-electrons.com> a =C3=A9crit :
> > >   =20
> > >> GPMI NFC driver fails to apply timing mode if the
> > >> ->onfi_get_features() does not return the mode that was
> > >> previously applied.
> > >>
> > >> We can assume that a nand chip supports a timing as long as it is
> > >> read from the ONFI parameter page. Reading back a different mode
> > >> than the one previously applied does not mean the mode is
> > >> unsupported but that the nand chip does not implement the ONFI
> > >> feature because it probably does not need to.
> > >>
> > >> The output of ->onfi_get_feature() is irrelevant so delete
> > >> it.   =20
> > > Having the NAND part that is not supporting the
> > > get/set(timing_mode) feature explicitly mentioned in the commit
> > > message would help reviewers understand why this patch is needed.
> > >
> > > Also mention that, even though the SET/GET_FEATURES(timing_mode)
> > > is marked as required in the ONFI spec, this Macronix chip does
> > > not support it which could be considered as a bug.
> > >
> > > Regards,
> > >
> > > Boris   =20
> >=20
> > Yes, this is a Macronix chip bug and I have reproduced on my side,=20
> > ignoring the GET_FEATURE checking is a workaround and the chip will=20
> > still works in EDO mode 5, but I don't accept to remove the
> > reasonable checking code for a chip bug. =20
>=20
> I understand why you're reluctant to remove this check just to make
> one particular chip work correctly, but, on the other hand, if we were
> only supporting non-broken NAND chip in mainline, plenty of boards
> wouldn't be supported. Flash vendors tend to take liberties with
> standards, that's a fact, and once the chip is out there's nothing we
> can do about it, except add a workaround to support it.
>=20
> So let's try to find a solution that makes everyone happy: now that we
> have nand_manufacturer_ops, we can easily let manufacturer code flag
> specific chip features as broken and let the core or drivers test for
> it before using the feature.
> This way, the gpmi-nand driver could check this flag before trying to
> call ->onfi_set/get_features(TIMING).
> Would that work for you?
>=20
> BTW, that'd be great to have this driver converted to the
> ->setup_data_interface() approach at some point. =20

I do agree with both of you.

If sent this patch without asking myself more questions because:
not checking if the timings have been properly set by a call to
->onfi_get_features() is what the nand core does.

http://elixir.free-electrons.com/linux/v4.12/source/drivers/mtd/nand/nand_b=
ase.c#L1110

Of course it would be better to use the ->setup_data_interface()
but this is much bigger effort.


Regards,
Miqu=C3=A8l

>=20
> Regards,
>=20
> Boris
>=20
> >  =20
> > >> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> > >> ---
> > >>   drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 7 -------
> > >>   1 file changed, 7 deletions(-)
> > >>
> > >> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> > >> b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c index
> > >> 141bd70a49c2..4d137145439c 100644 ---
> > >> a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c +++
> > >> b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c @@ -939,13 +939,6 @@
> > >> static int enable_edo_mode(struct gpmi_nand_data *this, int
> > >> mode) if (ret) goto err_out;
> > >>  =20
> > >> -	/* [2] send GET FEATURE command to double-check the
> > >> timing mode */
> > >> -	memset(feature, 0, ONFI_SUBFEATURE_PARAM_LEN);
> > >> -	ret =3D nand->onfi_get_features(mtd, nand,
> > >> -				ONFI_FEATURE_ADDR_TIMING_MODE,
> > >> feature);
> > >> -	if (ret || feature[0] !=3D mode)
> > >> -		goto err_out;
> > >> -
> > >>   	nand->select_chip(mtd, -1);
> > >>  =20
> > >>   	/* [3] set the main IO clock, 100MHz for mode 5, 80MHz
> > >> for mode 4. */   =20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
