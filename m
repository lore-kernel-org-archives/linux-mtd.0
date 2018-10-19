Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDQXG-0007Xv-La
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 08:54:11 +0000
Date: Fri, 19 Oct 2018 10:53:12 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Cyrille Pitchen - M19942 <cyrille.pitchen@microchip.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Marek Vasut
 <marek.vasut@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Make SFDP-based 4B_OPCODE support
 detection works correctly
Message-ID: <20181019105312.52511df2@bbrezillon>
In-Reply-To: <166fc7d5-695f-5c60-be07-c819736a123d@microchip.com>
References: <20181017144424.17554-1-boris.brezillon@bootlin.com>
 <166fc7d5-695f-5c60-be07-c819736a123d@microchip.com>
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

On Fri, 19 Oct 2018 09:50:31 +0200
Cyrille Pitchen - M19942 <cyrille.pitchen@microchip.com> wrote:

> Hi Boris,
>=20
> looks good, just a small remark below:
>=20
> Le 17/10/2018 =C3=A0 16:44, Boris Brezillon a =C3=A9crit=C2=A0:
> > Some flash_info entries have the SPI_NOR_4B_OPCODES to let the core
> > know that the flash supports 4B opcode. While this solution works fine
> > for id-based caps detection, it doesn't work that well when relying on
> > SFDP-based caps detection. Let's add an SNOR_F_4B_OPCODES flag so that
> > spi_nor_parse_bfpt() can add it when the BFPT_DWORD1_ADDRESS_BYTES
> > field is set to BFPT_DWORD1_ADDRESS_BYTES_4_ONLY.
> >=20
> > Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 11 ++++++++---
> >  include/linux/mtd/spi-nor.h   |  1 +
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-no=
r.c
> > index 9407ca5f9443..85e57e9ea1b5 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2643,6 +2643,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >  		break;
> > =20
> >  	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
> > +		nor->flags |=3D SNOR_F_4B_OPCODES; =20
>=20
> if spi_nor_parse_sdfp() fails, there is a kind of roll-back operation done
> in spi_nor_init_params() to set the struct spi_nor *nor back to its previ=
ous
> state.
>=20
> 		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
> 			nor->addr_width =3D 0;

Looks like the ->addr_width=3D0; as been lost when adding support for
non-uniform erase size.

> 			nor->mtd.erasesize =3D 0;
> 		} else {
> 			[...]
>=20
> maybe "nor->flags &=3D ~SNOR_F_4B_OPCODES;" should be added there.
> If this roll-back block grows too much, maybe we could introduce a
> void spi_nor_roll_back_sfdp(struct spi_nor *nor) function.
> Also it would make the roll back operation more explicit.
>=20
> Best regards,
>=20
> Cyrille
>=20
> >  		nor->addr_width =3D 4;
> >  		break;
> > =20
> > @@ -3552,7 +3553,7 @@ static int spi_nor_init(struct spi_nor *nor)
> > =20
> >  	if ((nor->addr_width =3D=3D 4) &&
> >  	    (JEDEC_MFR(nor->info) !=3D SNOR_MFR_SPANSION) &&
> > -	    !(nor->info->flags & SPI_NOR_4B_OPCODES)) {
> > +	    !(nor->flags & SNOR_F_4B_OPCODES)) {
> >  		/*
> >  		 * If the RESET# pin isn't hooked up properly, or the system
> >  		 * otherwise doesn't perform a reset command in the boot
> > @@ -3586,7 +3587,7 @@ void spi_nor_restore(struct spi_nor *nor)
> >  	/* restore the addressing mode */
> >  	if ((nor->addr_width =3D=3D 4) &&
> >  	    (JEDEC_MFR(nor->info) !=3D SNOR_MFR_SPANSION) &&
> > -	    !(nor->info->flags & SPI_NOR_4B_OPCODES) &&
> > +	    !(nor->flags & SNOR_F_4B_OPCODES) &&
> >  	    (nor->flags & SNOR_F_BROKEN_RESET))
> >  		set_4byte(nor, nor->info, 0);
> >  }
> > @@ -3744,11 +3745,15 @@ int spi_nor_scan(struct spi_nor *nor, const cha=
r *name,
> >  		nor->addr_width =3D 4;
> >  		if (JEDEC_MFR(info) =3D=3D SNOR_MFR_SPANSION ||
> >  		    info->flags & SPI_NOR_4B_OPCODES)
> > -			spi_nor_set_4byte_opcodes(nor, info);
> > +			nor->flags |=3D SNOR_F_4B_OPCODES;
> >  	} else {
> >  		nor->addr_width =3D 3;
> >  	}
> > =20
> > +	if (info->addr_width =3D=3D 4 &&
> > +	    nor->flags & SNOR_F_4B_OPCODES)
> > +		spi_nor_set_4byte_opcodes(nor, info);
> > +
> >  	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
> >  		dev_err(dev, "address width is too large: %u\n",
> >  			nor->addr_width);
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index 7f0c7303575e..4ffb165f4f85 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -236,6 +236,7 @@ enum spi_nor_option_flags {
> >  	SNOR_F_READY_XSR_RDY	=3D BIT(4),
> >  	SNOR_F_USE_CLSR		=3D BIT(5),
> >  	SNOR_F_BROKEN_RESET	=3D BIT(6),
> > +	SNOR_F_4B_OPCODES	=3D BIT(7)
> >  };
> > =20
> >  /**
> >  =20
