From: Anup Patel <anup.patel@broadcom.com>
To: Anup Patel <anup.patel@broadcom.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Linux MTD
 <linux-mtd@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, "Ian
 Campbell" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "Florian
 Fainelli" <f.fainelli@gmail.com>, Pramod Kumar <pramodku@broadcom.com>,
 Vikram Prakash <vikramp@broadcom.com>, Sandeep Tripathy
 <tripathy@broadcom.com>, Linux ARM Kernel
 <linux-arm-kernel@lists.infradead.org>, Device Tree
 <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Subject: RE: [PATCH v4 2/3] mtd: brcmnand: Force 8bit mode before doing
 nand_scan_ident()
Date: Fri, 30 Oct 2015 06:58:59 +0000
Message-ID: <39063E8F96E11742B35A201CC5D095B7B021B5@SJEXCHMB10.corp.ad.broadcom.com>
References: <1446185938-17520-1-git-send-email-anup.patel@broadcom.com>
 <1446185938-17520-3-git-send-email-anup.patel@broadcom.com>
In-Reply-To: <1446185938-17520-3-git-send-email-anup.patel@broadcom.com>
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
> From: Anup Patel [mailto:anup.patel@broadcom.com]
> Sent: 30 October 2015 11:49
> To: David Woodhouse; Brian Norris; Linux MTD
> Cc: Rob Herring; Pawel Moll; Mark Rutland; Catalin Marinas; Will Deacon;
> Sudeep Holla; Ian Campbell; Kumar Gala; Ray Jui; Scott Branden; Florian F=
ainelli;
> Pramod Kumar; Vikram Prakash; Sandeep Tripathy; Linux ARM Kernel; Device
> Tree; Linux Kernel; bcm-kernel-feedback-list; Anup Patel
> Subject: [PATCH v4 2/3] mtd: brcmnand: Force 8bit mode before doing
> nand_scan_ident()
>=20
> Just like other NAND controllers, the NAND READID command only works in 8=
bit
> mode for all versions of BRCMNAND controller.
>=20
> This patch forces 8bit mode for each NAND CS in brcmnand_init_cs() before
> doing nand_scan_ident() to ensure that BRCMNAND controller is in 8bit mod=
e
> when NAND READID command is issued.
>=20
> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c
> b/drivers/mtd/nand/brcmnand/brcmnand.c
> index dda96fa..641591d 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1912,6 +1912,7 @@ static int brcmnand_init_cs(struct brcmnand_host
> *host)
>  	struct mtd_info *mtd;
>  	struct nand_chip *chip;
>  	int ret;
> +	u16 cfg_offs;
>  	struct mtd_part_parser_data ppdata =3D { .of_node =3D dn };
>=20
>  	ret =3D of_property_read_u32(dn, "reg", &host->cs); @@ -1954,6
> +1955,15 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
>=20
>  	chip->controller =3D &ctrl->controller;
>=20
> +	/*
> +	 * The bootloader might have configured 16bit mode but
> +	 * NAND READID command only works in 8bit mode. We force
> +	 * 8bit mode here to ensure that NAND READID commands works.
> +	 */
> +	cfg_offs =3D brcmnand_cs_offset(ctrl, host->cs, BRCMNAND_CS_CFG);
> +	nand_writereg(ctrl, cfg_offs,
> +		      nand_readreg(ctrl, cfg_offs) & CFG_BUS_WIDTH);

This should have been "nand_readreg(ctrl, cfg_offs) & ~CFG_BUS_WIDTH".

My bad ...

--
Anup
