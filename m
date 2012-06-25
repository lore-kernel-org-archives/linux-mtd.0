MIME-Version: 1.0
In-Reply-To: <1340618866-28776-3-git-send-email-josh.wu@atmel.com>
References: <1340618866-28776-1-git-send-email-josh.wu@atmel.com>
 <1340618866-28776-3-git-send-email-josh.wu@atmel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 25 Jun 2012 12:35:24 +0200
Message-ID: <CACQ1gAgg4VREYPuZU1J+CkSRcypXdtqGvU-DiyJ=bTjb-3fRKQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/4] MTD: at91: add dt parameters for Atmel PMECC
To: Josh Wu <josh.wu@atmel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: hongxu.cn@gmail.com, jack.lan@freescale.com, nick.spence@freescale.com,
 dedekind1@gmail.com, dwmw2@infradead.org, plagnioj@jcrosoft.com,
 nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 scottwood@freescale.com, Dipen.Dudhat@freescale.com, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, tie-fei.zang@freescale.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, bryan.wu@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/6/25 Josh Wu <josh.wu@atmel.com>:
> Add DT support for PMECC parameters.
>
> Signed-off-by: Hong Xu <hong.xu@atmel.com>
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> ---
> =C2=A0.../devicetree/bindings/mtd/atmel-nand.txt =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A09 ++++
> =C2=A0drivers/mtd/nand/atmel_nand.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 52 +++++++++++++++++++-
> =C2=A02 files changed, 60 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Docum=
entation/devicetree/bindings/mtd/atmel-nand.txt
> index a200695..ed6927a 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -16,6 +16,15 @@ Optional properties:
> =C2=A0- nand-ecc-mode : String, operation mode of the NAND ecc mode, soft=
 by default.
> =C2=A0 Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob=
_first",
> =C2=A0 "soft_bch".
> +- atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware=
.
> + =C2=A0Only supported by at91sam9x5 or later sam9 product.
> +- atmel,pmecc-cap : error correct capability for Programmable Multibit E=
CC
> + =C2=A0Controller. Supported values are: 2, 4, 8, 12, 24.
> +- atmel,pmecc-sector-size : sector size for ECC computation. Supported v=
alues
> + =C2=A0are: 512, 1024.
> +- atmel,pmecc-lookup-table-offset : includes two offsets of lookup table=
 in ROM
> + =C2=A0for different sector size. First one is for sector size 512, the =
next is for
> + =C2=A0sector size 1024.
> =C2=A0- nand-bus-width : 8 or 16 bus width if not present 8
> =C2=A0- nand-on-flash-bbt: boolean to enable on flash bbt option if not p=
resent false
>
Maybe you should update the reg parameter documentation with the
needed resources.


> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.=
c
> index 7a41a04..b97ad9f 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -93,6 +93,11 @@ struct atmel_nand_host {
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct completion =C2=A0 =C2=A0 =C2=A0 comp;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_chan =C2=A0 =C2=A0 =C2=A0 =C2=A0 *d=
ma_chan;
> +
> + =C2=A0 =C2=A0 =C2=A0 bool =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0has_pmecc;
> + =C2=A0 =C2=A0 =C2=A0 u8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pmecc_corr_cap;
> + =C2=A0 =C2=A0 =C2=A0 u16 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 pmecc_sector_size;
> + =C2=A0 =C2=A0 =C2=A0 u32 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 pmecc_lookup_table_offset;
> =C2=A0};
>
> =C2=A0static int cpu_has_dma(void)
> @@ -481,7 +486,8 @@ static void atmel_nand_hwctl(struct mtd_info *mtd, in=
t mode)
> =C2=A0static int __devinit atmel_of_init_port(struct atmel_nand_host *hos=
t,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct d=
evice_node *np)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 u32 val;
> + =C2=A0 =C2=A0 =C2=A0 u32 val, table_offset;
> + =C2=A0 =C2=A0 =C2=A0 u32 offset[2];
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ecc_mode;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct atmel_nand_data *board =3D &host->board=
;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0enum of_gpio_flags flags;
> @@ -517,6 +523,50 @@ static int __devinit atmel_of_init_port(struct atmel=
_nand_host *host,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0board->enable_pin =3D of_get_gpio(np, 1);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0board->det_pin =3D of_get_gpio(np, 2);
>
> + =C2=A0 =C2=A0 =C2=A0 host->has_pmecc =3D of_property_read_bool(np, "atm=
el,has-pmecc");
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!(board->ecc_mode =3D=3D NAND_ECC_HW) || !host=
->has_pmecc)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0; =C2=A0 =C2=
=A0 =C2=A0 /* Not using PMECC */
> +
> + =C2=A0 =C2=A0 =C2=A0 /* use PMECC, get correction capability, sector si=
ze and lookup
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* table offset.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 if (of_property_read_u32(np, "atmel,pmecc-cap", &v=
al) !=3D 0) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(host->dev, "Ca=
nnot decide PMECC Capability\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 } else if ((val !=3D 2) && (val !=3D 4) && (val !=
=3D 8) && (val !=3D 12) &&
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (val !=3D 24)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(host->dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 "Unsupported PMECC correction capability: %d; should be 2, 4, 8, 12 =
or 24\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 val);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 host->pmecc_corr_cap =3D (u8)val;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (of_property_read_u32(np, "atmel,pmecc-sector-s=
ize", &val) !=3D 0) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(host->dev, "Ca=
nnot decide PMECC Sector Size\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 } else if ((val !=3D 512) && (val !=3D 1024)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(host->dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 "Unsupported PMECC sector size: %d; should be 512 or 1024 bytes\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 val);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 host->pmecc_sector_size =3D (u16)val;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (of_property_read_u32_array(np, "atmel,pmecc-lo=
okup-table-offset",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 offset, 2) !=3D 0) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(host->dev, "Ca=
nnot get PMECC lookup table offset\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 table_offset =3D host->pmecc_sector_size =3D=3D 51=
2 ? offset[0] : offset[1];
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!table_offset) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(host->dev, "In=
valid PMECC lookup table offset\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 host->pmecc_lookup_table_offset =3D table_offset;
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
> =C2=A0#else
> --
> 1.7.9.5
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Richard.

--=20
for me, ck means con kolivas and not calvin klein... does it mean I'm a gee=
k ?
