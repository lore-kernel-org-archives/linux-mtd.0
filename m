Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkrZh-0005eW-Vb
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2018 13:54:04 +0000
Date: Wed, 1 Aug 2018 15:53:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Ofer Heifetz <oferh@marvell.com>
Subject: Re: [PATCH] mtd: nand: use regmap_update_bits() in marvell_nand for
 syscon access
Message-ID: <20180801155348.35080ae8@xps13>
In-Reply-To: <20180801143417.34600a30@windsurf>
References: <20180801102505.18383-1-thomas.petazzoni@bootlin.com>
 <20180801142741.66102538@xps13> <20180801143417.34600a30@windsurf>
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

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote on Wed, 1 Aug
2018 14:34:17 +0200:

> Hello,
>=20
> On Wed, 1 Aug 2018 14:27:41 +0200, Miquel Raynal wrote:
>=20
> > Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote on Wed,  1 Aug
> > 2018 12:25:05 +0200:
> >  =20
> > > The marvell_nfc_init() function fiddles with some bits of a system
> > > controller on Armada 7K/8K. However:
> > >=20
> > >  - It does a regmap_write() on GENCONF_SOC_DEVICE_MUX, potentially
> > >    losing other bits that might have been set by other drivers.   =20
> >=20
> > AFAIR, this was done on purpose. In the aim of being as independent as
> > possible from the earlier stages, we set here the full configuration of
> > register 0xF2440208 "SoC Device Multiplex Register". Bits are either
> > reserved or NAND controller related, nobody else is supposed to poke
> > here. I'm not sure using regmap_update_bits() here is relevant? =20
>=20
> Well, using regmap_update_bits() still makes you "independent from the
> earlier stages", as long as you set/clear all the bits that you think
> should be set/clear. I'm not sure it's very wise to ruthlessly
> overwrite those reserved bits.

I'm not sure my regmap knowledge is enough to understand the depth of
the above comment. This is what (I think) I know, please correct me:

Overwriting reserved bits (ie. writing 0 to them) is what we always do.
Even if reserved these bits are not in the regmap mask, as the regmap is
defined to do 32-bit access only, I suppose a regmap_update_bits() will
just read these bytes (all should be 0, tells the spec) then rewrite
them (still 0). Other fields being at this time initialized to 0 or 1.
So if we want to use regmap_update_bits() here then we should probably
mask all bits but the one reserved?

I'm really not against this change, but I don't think I get the
impact/difference of this change with "just writing" the register.

>=20
> > > -		regmap_read(sysctrl_base, GENCONF_ND_CLK_CTRL, &reg);
> > > -		reg |=3D GENCONF_ND_CLK_CTRL_EN;
> > > -		regmap_write(sysctrl_base, GENCONF_ND_CLK_CTRL, reg);
> > > +		mask =3D GENCONF_SOC_DEVICE_MUX_NFC_EN |
> > > +			GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST |
> > > +			GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST |
> > > +			GENCONF_SOC_DEVICE_MUX_NFC_INT_EN;   =20
> >=20
> > Minor nit: indentation looks wrong here? =20
>=20
> This is what Emacs did, so it must be correct ? :-)

Hehe, I do have the same setup. If you find out how to fix it, please
share :)

>=20
> I'll fix up in v2, once we agree about the GENCONF_SOC_DEVICE_MUX
> register situation.
>=20
> Thanks!
>=20
> Thomas

Thanks,
Miqu=C3=A8l
