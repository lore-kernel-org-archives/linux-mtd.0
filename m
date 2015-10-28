From: Anup Patel <anup.patel@broadcom.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Linux MTD
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll
 <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Kumar
 Gala" <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, "Pramod
 Kumar" <pramodku@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>,
 Sandeep Tripathy <tripathy@broadcom.com>, Linux ARM Kernel
 <linux-arm-kernel@lists.infradead.org>, Device Tree
 <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Subject: RE: [PATCH v3 1/2] mtd: brcmnand: Force 8bit mode before doing
 nand_scan_ident()
Date: Wed, 28 Oct 2015 09:13:45 +0000
Message-ID: <39063E8F96E11742B35A201CC5D095B7AFFBBB@SJEXCHMB10.corp.ad.broadcom.com>
References: <1445577373-21252-1-git-send-email-anup.patel@broadcom.com>
 <1445577373-21252-2-git-send-email-anup.patel@broadcom.com>
 <20151028001443.GX13239@google.com>
In-Reply-To: <20151028001443.GX13239@google.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Brian Norris [mailto:computersforpeace@gmail.com]
> Sent: 28 October 2015 05:45
> To: Anup Patel
> Cc: David Woodhouse; Linux MTD; Rob Herring; Pawel Moll; Mark Rutland;
> Catalin Marinas; Will Deacon; Sudeep Holla; Ian Campbell; Kumar Gala; Ray=
 Jui;
> Scott Branden; Florian Fainelli; Pramod Kumar; Vikram Prakash; Sandeep
> Tripathy; Linux ARM Kernel; Device Tree; Linux Kernel; bcm-kernel-feedbac=
k-list
> Subject: Re: [PATCH v3 1/2] mtd: brcmnand: Force 8bit mode before doing
> nand_scan_ident()
>=20
> On Fri, Oct 23, 2015 at 10:46:12AM +0530, Anup Patel wrote:
> > Just like other NAND controllers, the NAND READID command only works
> > in 8bit mode for all versions of BRCMNAND controller.
> >
> > This patch forces 8bit mode for each NAND CS in brcmnand_init_cs()
> > before doing nand_scan_ident() to ensure that BRCMNAND controller is
> > in 8bit mode when NAND READID command is issued.
> >
> > Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> > Reviewed-by: Ray Jui <rjui@broadcom.com>
> > Reviewed-by: Scott Branden <sbranden@broadcom.com>
> > ---
> >  drivers/mtd/nand/brcmnand/brcmnand.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c
> > b/drivers/mtd/nand/brcmnand/brcmnand.c
> > index 4cba03d..0be8ef9 100644
> > --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> > +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> > @@ -1888,6 +1888,7 @@ static int brcmnand_init_cs(struct brcmnand_host
> *host)
> >  	struct mtd_info *mtd;
> >  	struct nand_chip *chip;
> >  	int ret;
> > +	u16 cfg_offs;
> >  	struct mtd_part_parser_data ppdata =3D { .of_node =3D dn };
> >
> >  	ret =3D of_property_read_u32(dn, "reg", &host->cs); @@ -1930,6
> > +1931,14 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
> >
> >  	chip->controller =3D &ctrl->controller;
> >
> > +	/*
> > +	 * The bootloader might have configured 16bit mode but
> > +	 * NAND READID command only works in 8bit mode. We force
> > +	 * 8bit mode here to ensure that NAND READID commands works.
> > +	 */
> > +	cfg_offs =3D brcmnand_cs_offset(ctrl, host->cs, BRCMNAND_CS_CFG);
> > +	nand_writereg(ctrl, cfg_offs, nand_readreg(ctrl, cfg_offs) &
> > +~BIT(23));
>=20
> Can we get a new enum for cfg bits? Unfortunately, I never managed that i=
n
> brcmnand_set_cfg(); just magic numbers :( But I'd like to stop that if we=
're going
> to have to touch these bits outside of brcmnand_set_cfg().

Even I felt the need to have enum for cfg bits, just like other parts of th=
e
BRCM NAND driver.

>=20
> > +
> >  	if (nand_scan_ident(mtd, 1, NULL))
> >  		return -ENXIO;
> >
>=20
> How about the following, as a preparatory patch? Only compile tested.
>=20
> From c5423a86dbfa33b550d2b170bda3c12ecf4d5313 Mon Sep 17 00:00:00
> 2001
> From: Brian Norris <computersforpeace@gmail.com>
> Date: Tue, 27 Oct 2015 17:12:13 -0700
> Subject: [PATCH] mtd: brcmnand: factor out CFG and CFG_EXT bitfields
>=20
> These used magic numbers. Shame on me.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Anup Patel <anup.patel@broadcom.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 38
> +++++++++++++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c
> b/drivers/mtd/nand/brcmnand/brcmnand.c
> index d694d876631e..c93fbc3869ee 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -344,6 +344,28 @@ static const u8 brcmnand_cs_offsets_cs0[] =3D {
>  	[BRCMNAND_CS_TIMING2]		=3D 0x14,
>  };
>=20
> +/*
> + * Bitfields for the CFG and CFG_EXT registers. Pre-v7.1 controllers
> +only had
> + * one config register, but once the bitfields overflowed, newer
> +controllers
> + * (v7.1 and newer) added a CFG_EXT register and shuffled a few fields a=
round.
> + */
> +enum {
> +	CFG_BLK_ADR_BYTES_SHIFT		=3D 8,
> +	CFG_COL_ADR_BYTES_SHIFT		=3D 12,
> +	CFG_FUL_ADR_BYTES_SHIFT		=3D 16,
> +	CFG_BUS_WIDTH_SHIFT		=3D 23,
> +	CFG_BUS_WIDTH			=3D
> BIT(CFG_BUS_WIDTH_SHIFT),
> +	CFG_DEVICE_SIZE_SHIFT		=3D 24,
> +
> +	/* Only for pre-v7.1 (with no CFG_EXT register) */
> +	CFG_PAGE_SIZE_SHIFT		=3D 20,
> +	CFG_BLK_SIZE_SHIFT		=3D 28,
> +
> +	/* Only for v7.1+ (with CFG_EXT register) */
> +	CFG_EXT_PAGE_SIZE_SHIFT		=3D 0,
> +	CFG_EXT_BLK_SIZE_SHIFT		=3D 4,
> +};
> +
>  /* BRCMNAND_INTFC_STATUS */
>  enum {
>  	INTFC_FLASH_STATUS		=3D GENMASK(7, 0),
> @@ -1710,17 +1732,19 @@ static int brcmnand_set_cfg(struct brcmnand_host
> *host,
>  	}
>  	device_size =3D fls64(cfg->device_size) -
> fls64(BRCMNAND_MIN_DEVSIZE);
>=20
> -	tmp =3D (cfg->blk_adr_bytes << 8) |
> -		(cfg->col_adr_bytes << 12) |
> -		(cfg->ful_adr_bytes << 16) |
> -		(!!(cfg->device_width =3D=3D 16) << 23) |
> -		(device_size << 24);
> +	tmp =3D (cfg->blk_adr_bytes << CFG_BLK_ADR_BYTES_SHIFT) |
> +		(cfg->col_adr_bytes << CFG_BLK_ADR_BYTES_SHIFT) |
> +		(cfg->ful_adr_bytes << CFG_FUL_ADR_BYTES_SHIFT) |
> +		(!!(cfg->device_width =3D=3D 16) << CFG_BUS_WIDTH_SHIFT) |
> +		(device_size << CFG_DEVICE_SIZE_SHIFT);
>  	if (cfg_offs =3D=3D cfg_ext_offs) {
> -		tmp |=3D (page_size << 20) | (block_size << 28);
> +		tmp |=3D (page_size << CFG_PAGE_SIZE_SHIFT) |
> +		       (block_size << CFG_BLK_SIZE_SHIFT);
>  		nand_writereg(ctrl, cfg_offs, tmp);
>  	} else {
>  		nand_writereg(ctrl, cfg_offs, tmp);
> -		tmp =3D page_size | (block_size << 4);
> +		tmp =3D (page_size << CFG_EXT_PAGE_SIZE_SHIFT) |
> +		      (block_size << CFG_EXT_BLK_SIZE_SHIFT);
>  		nand_writereg(ctrl, cfg_ext_offs, tmp);
>  	}

Your patch looks good to me. I will base this patch upon your
patch and test it at my end.

I will send a revised patchset which will include your patch (preserving
your authorship) and tested on NS2 SVK.

Thanks,
Anup
