MIME-Version: 1.0
In-Reply-To: <1309000666-5242-1-git-send-email-leiwen@marvell.com>
References: <4E031900.50108@compulab.co.il>
	<1309000666-5242-1-git-send-email-leiwen@marvell.com>
Date: Sat, 25 Jun 2011 14:32:17 +0200
Message-ID: <BANLkTimY2+qV_A7gSWOjAk0f54zKRC2wCg@mail.gmail.com>
Subject: Re: [PATCH] MTD: pxa3xx_nand: enable multiple chip select support
From: Daniel Mack <zonque@gmail.com>
To: Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 25, 2011 at 1:17 PM, Lei Wen <leiwen@marvell.com> wrote:
> Current pxa3xx_nand controller has two chip select which
> both be workable. This patch enable this feature.
>
> Update platform driver to support this feature.
>
> Another notice should be taken that:
> When you want to use this feature, you should not enable the
> keep configuration feature, for two chip select could be
> attached with different nand chip. The different page size
> and timing requirement make the keep configuration impossible.
>
> Signed-off-by: Lei Wen <leiwen@marvell.com>

I tested this on a PXA303 platform with one chipselect only, at at
least I can say that this patch doesn't seem to cause any regression
here. But I couldn't test the new feature it adds.

So, FWIW:

Tested-by: Daniel Mack <zonque@gmail.com>


Thanks!
Daniel


> ---
> =A0arch/arm/mach-mmp/aspenite.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
5 +-
> =A0arch/arm/mach-pxa/cm-x300.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A05 +-
> =A0arch/arm/mach-pxa/colibri-pxa3xx.c =A0 =A0 =A0 =A0 =A0 | =A0 =A05 +-
> =A0arch/arm/mach-pxa/littleton.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
5 +-
> =A0arch/arm/mach-pxa/mxm8x10.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A09 +-
> =A0arch/arm/mach-pxa/raumfeld.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
5 +-
> =A0arch/arm/mach-pxa/zylonite.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
5 +-
> =A0arch/arm/plat-pxa/include/plat/pxa3xx_nand.h | =A0 19 +-
> =A0drivers/mtd/nand/pxa3xx_nand.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0512 ++=
+++++++++++++-----------
> =A09 files changed, 346 insertions(+), 224 deletions(-)
>
> diff --git a/arch/arm/mach-mmp/aspenite.c b/arch/arm/mach-mmp/aspenite.c
> index 06b5fa8..c4996f3 100644
> --- a/arch/arm/mach-mmp/aspenite.c
> +++ b/arch/arm/mach-mmp/aspenite.c
> @@ -167,8 +167,9 @@ static struct mtd_partition aspenite_nand_partitions[=
] =3D {
>
> =A0static struct pxa3xx_nand_platform_data aspenite_nand_info =3D {
> =A0 =A0 =A0 =A0.enable_arbiter =3D 1,
> - =A0 =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D aspenite_nand_partitions,
> - =A0 =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(aspenite_nand_partitio=
ns),
> + =A0 =A0 =A0 .num_cs =3D 1,
> + =A0 =A0 =A0 .parts[0] =A0 =A0 =A0 =3D aspenite_nand_partitions,
> + =A0 =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(aspenite_nand_partitions=
),
> =A0};
>
> =A0static struct i2c_board_info aspenite_i2c_info[] __initdata =3D {
> diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
> index b2248e7..969d252 100644
> --- a/arch/arm/mach-pxa/cm-x300.c
> +++ b/arch/arm/mach-pxa/cm-x300.c
> @@ -423,8 +423,9 @@ static struct mtd_partition cm_x300_nand_partitions[]=
 =3D {
> =A0static struct pxa3xx_nand_platform_data cm_x300_nand_info =3D {
> =A0 =A0 =A0 =A0.enable_arbiter =3D 1,
> =A0 =A0 =A0 =A0.keep_config =A0 =A0=3D 1,
> - =A0 =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D cm_x300_nand_partitions,
> - =A0 =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(cm_x300_nand_partition=
s),
> + =A0 =A0 =A0 .num_cs =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 .parts[0] =A0 =A0 =A0 =3D cm_x300_nand_partitions,
> + =A0 =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(cm_x300_nand_partitions)=
,
> =A0};
>
> =A0static void __init cm_x300_init_nand(void)
> diff --git a/arch/arm/mach-pxa/colibri-pxa3xx.c b/arch/arm/mach-pxa/colib=
ri-pxa3xx.c
> index 3f9be41..2b8ca0d 100644
> --- a/arch/arm/mach-pxa/colibri-pxa3xx.c
> +++ b/arch/arm/mach-pxa/colibri-pxa3xx.c
> @@ -139,8 +139,9 @@ static struct mtd_partition colibri_nand_partitions[]=
 =3D {
> =A0static struct pxa3xx_nand_platform_data colibri_nand_info =3D {
> =A0 =A0 =A0 =A0.enable_arbiter =3D 1,
> =A0 =A0 =A0 =A0.keep_config =A0 =A0=3D 1,
> - =A0 =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D colibri_nand_partitions,
> - =A0 =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(colibri_nand_partition=
s),
> + =A0 =A0 =A0 .num_cs =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 .parts[0] =A0 =A0 =A0 =3D colibri_nand_partitions,
> + =A0 =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(colibri_nand_partitions)=
,
> =A0};
>
> =A0void __init colibri_pxa3xx_init_nand(void)
> diff --git a/arch/arm/mach-pxa/littleton.c b/arch/arm/mach-pxa/littleton.=
c
> index e5e326d..f6d1f9d 100644
> --- a/arch/arm/mach-pxa/littleton.c
> +++ b/arch/arm/mach-pxa/littleton.c
> @@ -325,8 +325,9 @@ static struct mtd_partition littleton_nand_partitions=
[] =3D {
>
> =A0static struct pxa3xx_nand_platform_data littleton_nand_info =3D {
> =A0 =A0 =A0 =A0.enable_arbiter =3D 1,
> - =A0 =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D littleton_nand_partitions,
> - =A0 =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(littleton_nand_partiti=
ons),
> + =A0 =A0 =A0 .num_cs =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 .parts[0] =A0 =A0 =A0 =3D littleton_nand_partitions,
> + =A0 =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(littleton_nand_partition=
s),
> =A0};
>
> =A0static void __init littleton_init_nand(void)
> diff --git a/arch/arm/mach-pxa/mxm8x10.c b/arch/arm/mach-pxa/mxm8x10.c
> index b5a8fd3..90928d6 100644
> --- a/arch/arm/mach-pxa/mxm8x10.c
> +++ b/arch/arm/mach-pxa/mxm8x10.c
> @@ -389,10 +389,11 @@ static struct mtd_partition mxm_8x10_nand_partition=
s[] =3D {
> =A0};
>
> =A0static struct pxa3xx_nand_platform_data mxm_8x10_nand_info =3D {
> - =A0 =A0 =A0 .enable_arbiter =3D 1,
> - =A0 =A0 =A0 .keep_config =3D 1,
> - =A0 =A0 =A0 .parts =3D mxm_8x10_nand_partitions,
> - =A0 =A0 =A0 .nr_parts =3D ARRAY_SIZE(mxm_8x10_nand_partitions)
> + =A0 =A0 =A0 .enable_arbiter =3D 1,
> + =A0 =A0 =A0 .keep_config =A0 =A0=3D 1,
> + =A0 =A0 =A0 .num_cs =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 .parts[0] =A0 =A0 =A0 =3D mxm_8x10_nand_partitions,
> + =A0 =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(mxm_8x10_nand_partitions=
)
> =A0};
>
> =A0static void __init mxm_8x10_nand_init(void)
> diff --git a/arch/arm/mach-pxa/raumfeld.c b/arch/arm/mach-pxa/raumfeld.c
> index d130f77..c7ec847 100644
> --- a/arch/arm/mach-pxa/raumfeld.c
> +++ b/arch/arm/mach-pxa/raumfeld.c
> @@ -349,8 +349,9 @@ static struct mtd_partition raumfeld_nand_partitions[=
] =3D {
> =A0static struct pxa3xx_nand_platform_data raumfeld_nand_info =3D {
> =A0 =A0 =A0 =A0.enable_arbiter =3D 1,
> =A0 =A0 =A0 =A0.keep_config =A0 =A0=3D 1,
> - =A0 =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D raumfeld_nand_partitions,
> - =A0 =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(raumfeld_nand_partitio=
ns),
> + =A0 =A0 =A0 .num_cs =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 .parts[0] =A0 =A0 =A0 =3D raumfeld_nand_partitions,
> + =A0 =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(raumfeld_nand_partitions=
),
> =A0};
>
> =A0/**
> diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
> index 5821185..64fdac9 100644
> --- a/arch/arm/mach-pxa/zylonite.c
> +++ b/arch/arm/mach-pxa/zylonite.c
> @@ -366,8 +366,9 @@ static struct mtd_partition zylonite_nand_partitions[=
] =3D {
>
> =A0static struct pxa3xx_nand_platform_data zylonite_nand_info =3D {
> =A0 =A0 =A0 =A0.enable_arbiter =3D 1,
> - =A0 =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D zylonite_nand_partitions,
> - =A0 =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(zylonite_nand_partitio=
ns),
> + =A0 =A0 =A0 .num_cs =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 .parts[0] =A0 =A0 =A0 =3D zylonite_nand_partitions,
> + =A0 =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(zylonite_nand_partitions=
),
> =A0};
>
> =A0static void __init zylonite_init_nand(void)
> diff --git a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h b/arch/arm/plat=
-pxa/include/plat/pxa3xx_nand.h
> index 442301f..4e17309 100644
> --- a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
> +++ b/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
> @@ -41,6 +41,19 @@ struct pxa3xx_nand_flash {
> =A0 =A0 =A0 =A0struct pxa3xx_nand_timing *timing; =A0 =A0 =A0/* NAND Flas=
h timing */
> =A0};
>
> +/*
> + * Current pxa3xx_nand controller has two chip select which
> + * both be workable.
> + *
> + * Notice should be taken that:
> + * When you want to use this feature, you should not enable the
> + * keep configuration feature, for two chip select could be
> + * attached with different nand chip. The different page size
> + * and timing requirement make the keep configuration impossible.
> + */
> +
> +/* The max num of chip select current support */
> +#define NUM_CHIP_SELECT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(2)
> =A0struct pxa3xx_nand_platform_data {
>
> =A0 =A0 =A0 =A0/* the data flash bus is shared between the Static Memory
> @@ -52,8 +65,10 @@ struct pxa3xx_nand_platform_data {
> =A0 =A0 =A0 =A0/* allow platform code to keep OBM/bootloader defined NFC =
config */
> =A0 =A0 =A0 =A0int =A0 =A0 keep_config;
>
> - =A0 =A0 =A0 const struct mtd_partition =A0 =A0 =A0 =A0 =A0 =A0 =A0*part=
s;
> - =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0nr_parts;
> + =A0 =A0 =A0 /* indicate how many chip selects will be used */
> + =A0 =A0 =A0 int =A0 =A0 num_cs;
> + =A0 =A0 =A0 const struct mtd_partition =A0 =A0 =A0 =A0 =A0 =A0 =A0*part=
s[NUM_CHIP_SELECT];
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0nr_parts[NUM_CHIP_SELECT];
>
> =A0 =A0 =A0 =A0const struct pxa3xx_nand_flash * =A0 =A0 =A0 =A0flash;
> =A0 =A0 =A0 =A0size_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0num_flash;
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index b7db1b2..0825b7d 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -110,6 +110,7 @@ enum {
>
> =A0enum {
> =A0 =A0 =A0 =A0STATE_IDLE =3D 0,
> + =A0 =A0 =A0 STATE_PREPARED,
> =A0 =A0 =A0 =A0STATE_CMD_HANDLE,
> =A0 =A0 =A0 =A0STATE_DMA_READING,
> =A0 =A0 =A0 =A0STATE_DMA_WRITING,
> @@ -120,21 +121,40 @@ enum {
> =A0 =A0 =A0 =A0STATE_READY,
> =A0};
>
> -struct pxa3xx_nand_info {
> - =A0 =A0 =A0 struct nand_chip =A0 =A0 =A0 =A0nand_chip;
> +struct pxa3xx_nand_host {
> + =A0 =A0 =A0 struct nand_chip =A0 =A0 =A0 =A0chip;
> + =A0 =A0 =A0 struct pxa3xx_nand_cmdset *cmdset;
> + =A0 =A0 =A0 struct mtd_info =A0 =A0 =A0 =A0 *mtd;
> + =A0 =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*info_data;
>
> + =A0 =A0 =A0 /* page size of attached chip */
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0page_size;
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cs;
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 use_ecc;
> +
> + =A0 =A0 =A0 /* calculated from pxa3xx_nand_flash data */
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0col_addr_cycles;
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0row_addr_cycles;
> + =A0 =A0 =A0 size_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0read_id_bytes;
> +
> + =A0 =A0 =A0 /* cached register value */
> + =A0 =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg_ndcr;
> + =A0 =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndtr0cs0;
> + =A0 =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndtr1cs0;
> +};
> +
> +struct pxa3xx_nand_info {
> =A0 =A0 =A0 =A0struct nand_hw_control =A0controller;
> =A0 =A0 =A0 =A0struct platform_device =A0 *pdev;
> - =A0 =A0 =A0 struct pxa3xx_nand_cmdset *cmdset;
>
> =A0 =A0 =A0 =A0struct clk =A0 =A0 =A0 =A0 =A0 =A0 =A0*clk;
> =A0 =A0 =A0 =A0void __iomem =A0 =A0 =A0 =A0 =A0 =A0*mmio_base;
> =A0 =A0 =A0 =A0unsigned long =A0 =A0 =A0 =A0 =A0 mmio_phys;
> + =A0 =A0 =A0 struct completion =A0 =A0 =A0 cmd_complete;
>
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0buf_start;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0buf_count;
>
> - =A0 =A0 =A0 struct mtd_info =A0 =A0 =A0 =A0 *mtd;
> =A0 =A0 =A0 =A0/* DMA information */
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drcmr_dat;
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drcmr_cmd;
> @@ -142,44 +162,27 @@ struct pxa3xx_nand_info {
> =A0 =A0 =A0 =A0unsigned char =A0 =A0 =A0 =A0 =A0 *data_buff;
> =A0 =A0 =A0 =A0unsigned char =A0 =A0 =A0 =A0 =A0 *oob_buff;
> =A0 =A0 =A0 =A0dma_addr_t =A0 =A0 =A0 =A0 =A0 =A0 =A0data_buff_phys;
> - =A0 =A0 =A0 size_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data_buff_size;
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data_dma_ch;
> =A0 =A0 =A0 =A0struct pxa_dma_desc =A0 =A0 *data_desc;
> =A0 =A0 =A0 =A0dma_addr_t =A0 =A0 =A0 =A0 =A0 =A0 =A0data_desc_addr;
>
> - =A0 =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg_ndcr;
> -
> - =A0 =A0 =A0 /* saved column/page_addr during CMD_SEQIN */
> - =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 seqin_column;
> - =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 seqin_page_addr=
;
> -
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host[NUM_CHIP_SELECT];
> =A0 =A0 =A0 =A0/* relate to the command */
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0state;
>
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cs;
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 use_ecc; =A0 =
=A0 =A0 =A0/* use HW ECC ? */
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 use_dma; =A0 =
=A0 =A0 =A0/* use DMA ? */
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 is_ready;
>
> - =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0page_size; =A0 =A0 =A0/=
* page size of attached chip */
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0data_size; =A0 =A0 =A0=
/* data size in FIFO */
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0oob_size;
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retcode;
> - =A0 =A0 =A0 struct completion =A0 =A0 =A0 cmd_complete;
>
> =A0 =A0 =A0 =A0/* generated NDCBx register values */
> =A0 =A0 =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndcb0;
> =A0 =A0 =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndcb1;
> =A0 =A0 =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndcb2;
> -
> - =A0 =A0 =A0 /* timing calcuted from setting */
> - =A0 =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndtr0cs0;
> - =A0 =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndtr1cs0;
> -
> - =A0 =A0 =A0 /* calculated from pxa3xx_nand_flash data */
> - =A0 =A0 =A0 size_t =A0 =A0 =A0 =A0 =A0oob_size;
> - =A0 =A0 =A0 size_t =A0 =A0 =A0 =A0 =A0read_id_bytes;
> -
> - =A0 =A0 =A0 unsigned int =A0 =A0col_addr_cycles;
> - =A0 =A0 =A0 unsigned int =A0 =A0row_addr_cycles;
> =A0};
>
> =A0static int use_dma =3D 1;
> @@ -225,7 +228,7 @@ static struct pxa3xx_nand_flash builtin_flash_types[]=
 =3D {
> =A0/* Define a default flash type setting serve as flash detecting only *=
/
> =A0#define DEFAULT_FLASH_TYPE (&builtin_flash_types[0])
>
> -const char *mtd_names[] =3D {"pxa3xx_nand-0", NULL};
> +const char *mtd_names[] =3D {"pxa3xx_nand-0", "pxa3xx_nand-1", NULL};
>
> =A0#define NDTR0_tCH(c) =A0 (min((c), 7) << 19)
> =A0#define NDTR0_tCS(c) =A0 (min((c), 7) << 16)
> @@ -241,9 +244,10 @@ const char *mtd_names[] =3D {"pxa3xx_nand-0", NULL};
> =A0/* convert nano-seconds to nand flash controller clock cycles */
> =A0#define ns2cycle(ns, clk) =A0 =A0 =A0(int)((ns) * (clk / 1000000) / 10=
00)
>
> -static void pxa3xx_nand_set_timing(struct pxa3xx_nand_info *info,
> +static void pxa3xx_nand_set_timing(struct pxa3xx_nand_host *host,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const=
 struct pxa3xx_nand_timing *t)
> =A0{
> + =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D host->info_data;
> =A0 =A0 =A0 =A0unsigned long nand_clk =3D clk_get_rate(info->clk);
> =A0 =A0 =A0 =A0uint32_t ndtr0, ndtr1;
>
> @@ -258,23 +262,24 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_na=
nd_info *info,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NDTR1_tWHR(ns2cycle(t->tWHR, nand_clk)) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NDTR1_tAR(ns2cycle(t->tAR, nand_clk));
>
> - =A0 =A0 =A0 info->ndtr0cs0 =3D ndtr0;
> - =A0 =A0 =A0 info->ndtr1cs0 =3D ndtr1;
> + =A0 =A0 =A0 host->ndtr0cs0 =3D ndtr0;
> + =A0 =A0 =A0 host->ndtr1cs0 =3D ndtr1;
> =A0 =A0 =A0 =A0nand_writel(info, NDTR0CS0, ndtr0);
> =A0 =A0 =A0 =A0nand_writel(info, NDTR1CS0, ndtr1);
> =A0}
>
> =A0static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
> =A0{
> - =A0 =A0 =A0 int oob_enable =3D info->reg_ndcr & NDCR_SPARE_EN;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D info->host[info->cs];
> + =A0 =A0 =A0 int oob_enable =3D host->reg_ndcr & NDCR_SPARE_EN;
>
> - =A0 =A0 =A0 info->data_size =3D info->page_size;
> + =A0 =A0 =A0 info->data_size =3D host->page_size;
> =A0 =A0 =A0 =A0if (!oob_enable) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->oob_size =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 switch (info->page_size) {
> + =A0 =A0 =A0 switch (host->page_size) {
> =A0 =A0 =A0 =A0case 2048:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->oob_size =3D (info->use_ecc) ? 40 : =
64;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> @@ -292,9 +297,10 @@ static void pxa3xx_set_datasize(struct pxa3xx_nand_i=
nfo *info)
> =A0*/
> =A0static void pxa3xx_nand_start(struct pxa3xx_nand_info *info)
> =A0{
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D info->host[info->cs];
> =A0 =A0 =A0 =A0uint32_t ndcr;
>
> - =A0 =A0 =A0 ndcr =3D info->reg_ndcr;
> + =A0 =A0 =A0 ndcr =3D host->reg_ndcr;
> =A0 =A0 =A0 =A0ndcr |=3D info->use_ecc ? NDCR_ECC_EN : 0;
> =A0 =A0 =A0 =A0ndcr |=3D info->use_dma ? NDCR_DMA_EN : 0;
> =A0 =A0 =A0 =A0ndcr |=3D NDCR_ND_RUN;
> @@ -359,8 +365,8 @@ static void handle_data_pio(struct pxa3xx_nand_info *=
info)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0DIV_ROUND_UP(info->oob_size, 4));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0default:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: invalid state %d\n", _=
_func__,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->state=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&info->pdev->dev, "%s: invalid stat=
e %d\n", __func__,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->state);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BUG();
> =A0 =A0 =A0 =A0}
> =A0}
> @@ -385,7 +391,7 @@ static void start_data_dma(struct pxa3xx_nand_info *i=
nfo)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0desc->dcmd |=3D DCMD_INCTRGADDR | DCMD_FLO=
WSRC;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0default:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: invalid state %d\n", _=
_func__,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&info->pdev->dev, "%s: invalid stat=
e %d\n", __func__,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->stat=
e);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BUG();
> =A0 =A0 =A0 =A0}
> @@ -416,9 +422,17 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *de=
vid)
> =A0{
> =A0 =A0 =A0 =A0struct pxa3xx_nand_info *info =3D devid;
> =A0 =A0 =A0 =A0unsigned int status, is_completed =3D 0;
> + =A0 =A0 =A0 unsigned int ready, cmd_done;
> +
> + =A0 =A0 =A0 if (info->cs =3D=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ready =A0 =A0 =A0 =A0 =A0 =3D NDSR_FLASH_RD=
Y;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd_done =A0 =A0 =A0 =A0=3D NDSR_CS0_CMDD;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ready =A0 =A0 =A0 =A0 =A0 =3D NDSR_RDY;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd_done =A0 =A0 =A0 =A0=3D NDSR_CS1_CMDD;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0status =3D nand_readl(info, NDSR);
> -
> =A0 =A0 =A0 =A0if (status & NDSR_DBERR)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->retcode =3D ERR_DBERR;
> =A0 =A0 =A0 =A0if (status & NDSR_SBERR)
> @@ -437,11 +451,11 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *d=
evid)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handle_data_pio(info);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 if (status & NDSR_CS0_CMDD) {
> + =A0 =A0 =A0 if (status & cmd_done) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->state =3D STATE_CMD_DONE;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0is_completed =3D 1;
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 if (status & NDSR_FLASH_RDY) {
> + =A0 =A0 =A0 if (status & ready) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->is_ready =3D 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->state =3D STATE_READY;
> =A0 =A0 =A0 =A0}
> @@ -463,12 +477,6 @@ NORMAL_IRQ_EXIT:
> =A0 =A0 =A0 =A0return IRQ_HANDLED;
> =A0}
>
> -static int pxa3xx_nand_dev_ready(struct mtd_info *mtd)
> -{
> - =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> - =A0 =A0 =A0 return (nand_readl(info, NDSR) & NDSR_RDY) ? 1 : 0;
> -}
> -
> =A0static inline int is_buf_blank(uint8_t *buf, size_t len)
> =A0{
> =A0 =A0 =A0 =A0for (; len > 0; len--)
> @@ -481,10 +489,10 @@ static int prepare_command_pool(struct pxa3xx_nand_=
info *info, int command,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint16_t column, int page_addr)
> =A0{
> =A0 =A0 =A0 =A0uint16_t cmd;
> - =A0 =A0 =A0 int addr_cycle, exec_cmd, ndcb0;
> - =A0 =A0 =A0 struct mtd_info *mtd =3D info->mtd;
> + =A0 =A0 =A0 int addr_cycle, exec_cmd;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D info->host[info->cs];
> + =A0 =A0 =A0 struct mtd_info *mtd =3D host->mtd;
>
> - =A0 =A0 =A0 ndcb0 =3D 0;
> =A0 =A0 =A0 =A0addr_cycle =3D 0;
> =A0 =A0 =A0 =A0exec_cmd =3D 1;
>
> @@ -495,6 +503,10 @@ static int prepare_command_pool(struct pxa3xx_nand_i=
nfo *info, int command,
> =A0 =A0 =A0 =A0info->use_ecc =A0 =A0 =A0 =A0 =A0 =3D 0;
> =A0 =A0 =A0 =A0info->is_ready =A0 =A0 =A0 =A0 =A0=3D 0;
> =A0 =A0 =A0 =A0info->retcode =A0 =A0 =A0 =A0 =A0 =3D ERR_NONE;
> + =A0 =A0 =A0 if (info->cs !=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb0 =3D NDCB0_CSEL;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb0 =3D 0;
>
> =A0 =A0 =A0 =A0switch (command) {
> =A0 =A0 =A0 =A0case NAND_CMD_READ0:
> @@ -512,20 +524,19 @@ static int prepare_command_pool(struct pxa3xx_nand_=
info *info, int command,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 info->ndcb0 =3D ndcb0;
> - =A0 =A0 =A0 addr_cycle =3D NDCB0_ADDR_CYC(info->row_addr_cycles
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + i=
nfo->col_addr_cycles);
> + =A0 =A0 =A0 addr_cycle =3D NDCB0_ADDR_CYC(host->row_addr_cycles
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + h=
ost->col_addr_cycles);
>
> =A0 =A0 =A0 =A0switch (command) {
> =A0 =A0 =A0 =A0case NAND_CMD_READOOB:
> =A0 =A0 =A0 =A0case NAND_CMD_READ0:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->read1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D host->cmdset->read1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (command =3D=3D NAND_CMD_READOOB)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->buf_start =3D mtd->w=
ritesize + column;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->buf_start =3D column=
;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(info->page_size < PAGE_CHUNK_S=
IZE))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(host->page_size < PAGE_CHUNK_S=
IZE))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->ndcb0 |=3D NDCB0_CMD=
_TYPE(0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| addr_cycle
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| (cmd & NDCB0_CMD1_MASK);
> @@ -537,7 +548,7 @@ static int prepare_command_pool(struct pxa3xx_nand_in=
fo *info, int command,
>
> =A0 =A0 =A0 =A0case NAND_CMD_SEQIN:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* small page addr setting */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(info->page_size < PAGE_CHUNK_S=
IZE)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(host->page_size < PAGE_CHUNK_S=
IZE)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->ndcb1 =3D ((page_add=
r & 0xFFFFFF) << 8)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| (column & 0xFF);
>
> @@ -564,7 +575,7 @@ static int prepare_command_pool(struct pxa3xx_nand_in=
fo *info, int command,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->program;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D host->cmdset->program;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->ndcb0 |=3D NDCB0_CMD_TYPE(0x1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| NDCB0_AU=
TO_RS
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| NDCB0_ST=
_ROW_EN
> @@ -574,8 +585,8 @@ static int prepare_command_pool(struct pxa3xx_nand_in=
fo *info, int command,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0case NAND_CMD_READID:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->read_id;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->buf_count =3D info->read_id_bytes;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D host->cmdset->read_id;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->buf_count =3D host->read_id_bytes;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->ndcb0 |=3D NDCB0_CMD_TYPE(3)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| NDCB0_AD=
DR_CYC(1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| cmd;
> @@ -583,7 +594,7 @@ static int prepare_command_pool(struct pxa3xx_nand_in=
fo *info, int command,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->data_size =3D 8;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0case NAND_CMD_STATUS:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->read_status;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D host->cmdset->read_status;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->buf_count =3D 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->ndcb0 |=3D NDCB0_CMD_TYPE(4)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| NDCB0_AD=
DR_CYC(1)
> @@ -593,7 +604,7 @@ static int prepare_command_pool(struct pxa3xx_nand_in=
fo *info, int command,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0case NAND_CMD_ERASE1:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->erase;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D host->cmdset->erase;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->ndcb0 |=3D NDCB0_CMD_TYPE(2)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| NDCB0_AU=
TO_RS
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| NDCB0_AD=
DR_CYC(3)
> @@ -604,7 +615,7 @@ static int prepare_command_pool(struct pxa3xx_nand_in=
fo *info, int command,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0case NAND_CMD_RESET:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->reset;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D host->cmdset->reset;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->ndcb0 |=3D NDCB0_CMD_TYPE(5)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| cmd;
>
> @@ -616,7 +627,7 @@ static int prepare_command_pool(struct pxa3xx_nand_in=
fo *info, int command,
>
> =A0 =A0 =A0 =A0default:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0exec_cmd =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "pxa3xx-nand: non-supported=
"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&info->pdev->dev, "pxa3xx-nand: non=
-supported"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0" command %x\n", command);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0}
> @@ -627,7 +638,8 @@ static int prepare_command_pool(struct pxa3xx_nand_in=
fo *info, int command,
> =A0static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command=
,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int column=
, int page_addr)
> =A0{
> - =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D host->info_data;
> =A0 =A0 =A0 =A0int ret, exec_cmd;
>
> =A0 =A0 =A0 =A0/*
> @@ -635,9 +647,21 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd=
, unsigned command,
> =A0 =A0 =A0 =A0 * "byte" address into a "word" address appropriate
> =A0 =A0 =A0 =A0 * for indexing a word-oriented device
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 if (info->reg_ndcr & NDCR_DWIDTH_M)
> + =A0 =A0 =A0 if (host->reg_ndcr & NDCR_DWIDTH_M)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0column /=3D 2;
>
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* There may be different NAND chip hooked to
> + =A0 =A0 =A0 =A0* different chip select, so check whether
> + =A0 =A0 =A0 =A0* chip select has been changed, if yes, reset the timing
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (info->cs !=3D host->cs) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->cs =3D host->cs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(info, NDTR0CS0, host->ndtr0cs0)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(info, NDTR1CS0, host->ndtr1cs0)=
;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 info->state =3D STATE_PREPARED;
> =A0 =A0 =A0 =A0exec_cmd =3D prepare_command_pool(info, command, column, p=
age_addr);
> =A0 =A0 =A0 =A0if (exec_cmd) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0init_completion(&info->cmd_complete);
> @@ -646,12 +670,12 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mt=
d, unsigned command,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D wait_for_completion_timeout(&info-=
>cmd_complete,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CHIP_DELAY=
_TIMEOUT);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!ret) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Wait time =
out!!!\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&info->pdev->dev, "=
Wait time out!!!\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Stop State Machine for =
next command cycle */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pxa3xx_nand_stop(info);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->state =3D STATE_IDLE;
> =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 info->state =3D STATE_IDLE;
> =A0}
>
> =A0static void pxa3xx_nand_write_page_hwecc(struct mtd_info *mtd,
> @@ -664,7 +688,8 @@ static void pxa3xx_nand_write_page_hwecc(struct mtd_i=
nfo *mtd,
> =A0static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nand_chip *chip, uint8_t *buf, int =
page)
> =A0{
> - =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D host->info_data;
>
> =A0 =A0 =A0 =A0chip->read_buf(mtd, buf, mtd->writesize);
> =A0 =A0 =A0 =A0chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> @@ -695,7 +720,8 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_inf=
o *mtd,
>
> =A0static uint8_t pxa3xx_nand_read_byte(struct mtd_info *mtd)
> =A0{
> - =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D host->info_data;
> =A0 =A0 =A0 =A0char retval =3D 0xFF;
>
> =A0 =A0 =A0 =A0if (info->buf_start < info->buf_count)
> @@ -707,7 +733,8 @@ static uint8_t pxa3xx_nand_read_byte(struct mtd_info =
*mtd)
>
> =A0static u16 pxa3xx_nand_read_word(struct mtd_info *mtd)
> =A0{
> - =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D host->info_data;
> =A0 =A0 =A0 =A0u16 retval =3D 0xFFFF;
>
> =A0 =A0 =A0 =A0if (!(info->buf_start & 0x01) && info->buf_start < info->b=
uf_count) {
> @@ -719,7 +746,8 @@ static u16 pxa3xx_nand_read_word(struct mtd_info *mtd=
)
>
> =A0static void pxa3xx_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, i=
nt len)
> =A0{
> - =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D host->info_data;
> =A0 =A0 =A0 =A0int real_len =3D min_t(size_t, len, info->buf_count - info=
->buf_start);
>
> =A0 =A0 =A0 =A0memcpy(buf, info->data_buff + info->buf_start, real_len);
> @@ -729,7 +757,8 @@ static void pxa3xx_nand_read_buf(struct mtd_info *mtd=
, uint8_t *buf, int len)
> =A0static void pxa3xx_nand_write_buf(struct mtd_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const uint8_t *buf, int len)
> =A0{
> - =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D host->info_data;
> =A0 =A0 =A0 =A0int real_len =3D min_t(size_t, len, info->buf_count - info=
->buf_start);
>
> =A0 =A0 =A0 =A0memcpy(info->data_buff + info->buf_start, buf, real_len);
> @@ -749,7 +778,8 @@ static void pxa3xx_nand_select_chip(struct mtd_info *=
mtd, int chip)
>
> =A0static int pxa3xx_nand_waitfunc(struct mtd_info *mtd, struct nand_chip=
 *this)
> =A0{
> - =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D host->info_data;
>
> =A0 =A0 =A0 =A0/* pxa3xx_nand_send_command has waited for command complet=
e */
> =A0 =A0 =A0 =A0if (this->state =3D=3D FL_WRITING || this->state =3D=3D FL=
_ERASING) {
> @@ -772,54 +802,69 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_n=
and_info *info,
> =A0{
> =A0 =A0 =A0 =A0struct platform_device *pdev =3D info->pdev;
> =A0 =A0 =A0 =A0struct pxa3xx_nand_platform_data *pdata =3D pdev->dev.plat=
form_data;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D info->host[info->cs];
> =A0 =A0 =A0 =A0uint32_t ndcr =3D 0x0; /* enable all interrupts */
>
> - =A0 =A0 =A0 if (f->page_size !=3D 2048 && f->page_size !=3D 512)
> + =A0 =A0 =A0 if (f->page_size !=3D 2048 && f->page_size !=3D 512) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Current only support 2=
048 and 512 size\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> + =A0 =A0 =A0 }
>
> - =A0 =A0 =A0 if (f->flash_width !=3D 16 && f->flash_width !=3D 8)
> + =A0 =A0 =A0 if (f->flash_width !=3D 16 && f->flash_width !=3D 8) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Only support 8bit and =
16 bit!\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0/* calculate flash information */
> - =A0 =A0 =A0 info->cmdset =3D &default_cmdset;
> - =A0 =A0 =A0 info->page_size =3D f->page_size;
> - =A0 =A0 =A0 info->read_id_bytes =3D (f->page_size =3D=3D 2048) ? 4 : 2;
> + =A0 =A0 =A0 host->cmdset =3D &default_cmdset;
> + =A0 =A0 =A0 host->page_size =3D f->page_size;
> + =A0 =A0 =A0 host->read_id_bytes =3D (f->page_size =3D=3D 2048) ? 4 : 2;
>
> =A0 =A0 =A0 =A0/* calculate addressing information */
> - =A0 =A0 =A0 info->col_addr_cycles =3D (f->page_size =3D=3D 2048) ? 2 : =
1;
> + =A0 =A0 =A0 host->col_addr_cycles =3D (f->page_size =3D=3D 2048) ? 2 : =
1;
>
> =A0 =A0 =A0 =A0if (f->num_blocks * f->page_per_block > 65536)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->row_addr_cycles =3D 3;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->row_addr_cycles =3D 3;
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->row_addr_cycles =3D 2;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->row_addr_cycles =3D 2;
>
> =A0 =A0 =A0 =A0ndcr |=3D (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
> - =A0 =A0 =A0 ndcr |=3D (info->col_addr_cycles =3D=3D 2) ? NDCR_RA_START =
: 0;
> + =A0 =A0 =A0 ndcr |=3D (host->col_addr_cycles =3D=3D 2) ? NDCR_RA_START =
: 0;
> =A0 =A0 =A0 =A0ndcr |=3D (f->page_per_block =3D=3D 64) ? NDCR_PG_PER_BLK =
: 0;
> =A0 =A0 =A0 =A0ndcr |=3D (f->page_size =3D=3D 2048) ? NDCR_PAGE_SZ : 0;
> =A0 =A0 =A0 =A0ndcr |=3D (f->flash_width =3D=3D 16) ? NDCR_DWIDTH_M : 0;
> =A0 =A0 =A0 =A0ndcr |=3D (f->dfc_width =3D=3D 16) ? NDCR_DWIDTH_C : 0;
>
> - =A0 =A0 =A0 ndcr |=3D NDCR_RD_ID_CNT(info->read_id_bytes);
> + =A0 =A0 =A0 ndcr |=3D NDCR_RD_ID_CNT(host->read_id_bytes);
> =A0 =A0 =A0 =A0ndcr |=3D NDCR_SPARE_EN; /* enable spare by default */
>
> - =A0 =A0 =A0 info->reg_ndcr =3D ndcr;
> + =A0 =A0 =A0 host->reg_ndcr =3D ndcr;
>
> - =A0 =A0 =A0 pxa3xx_nand_set_timing(info, f->timing);
> + =A0 =A0 =A0 pxa3xx_nand_set_timing(host, f->timing);
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> =A0static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
> =A0{
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* We set 0 by hard coding here, for we don't support kee=
p_config
> + =A0 =A0 =A0 =A0* when there is more than one chip attached to the contr=
oller
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D info->host[0];
> =A0 =A0 =A0 =A0uint32_t ndcr =3D nand_readl(info, NDCR);
> - =A0 =A0 =A0 info->page_size =3D ndcr & NDCR_PAGE_SZ ? 2048 : 512;
> - =A0 =A0 =A0 /* set info fields needed to read id */
> - =A0 =A0 =A0 info->read_id_bytes =3D (info->page_size =3D=3D 2048) ? 4 :=
 2;
> - =A0 =A0 =A0 info->reg_ndcr =3D ndcr & ~NDCR_INT_MASK;
> - =A0 =A0 =A0 info->cmdset =3D &default_cmdset;
>
> - =A0 =A0 =A0 info->ndtr0cs0 =3D nand_readl(info, NDTR0CS0);
> - =A0 =A0 =A0 info->ndtr1cs0 =3D nand_readl(info, NDTR1CS0);
> + =A0 =A0 =A0 if (ndcr & NDCR_PAGE_SZ) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->page_size =3D 2048;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->read_id_bytes =3D 4;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->page_size =3D 512;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->read_id_bytes =3D 2;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 host->reg_ndcr =3D ndcr & ~NDCR_INT_MASK;
> + =A0 =A0 =A0 host->cmdset =3D &default_cmdset;
> +
> + =A0 =A0 =A0 host->ndtr0cs0 =3D nand_readl(info, NDTR0CS0);
> + =A0 =A0 =A0 host->ndtr1cs0 =3D nand_readl(info, NDTR1CS0);
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> @@ -829,59 +874,41 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_=
nand_info *info)
> =A0* data buffer and the DMA descriptor
> =A0*/
> =A0#define MAX_BUFF_SIZE =A0PAGE_SIZE
> -
> -static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
> +static void free_cs_resource(struct pxa3xx_nand_info *info, int cs)
> =A0{
> - =A0 =A0 =A0 struct platform_device *pdev =3D info->pdev;
> - =A0 =A0 =A0 int data_desc_offset =3D MAX_BUFF_SIZE - sizeof(struct pxa_=
dma_desc);
> -
> - =A0 =A0 =A0 if (use_dma =3D=3D 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->data_buff =3D kmalloc(MAX_BUFF_SIZE, =
GFP_KERNEL);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (info->data_buff =3D=3D NULL)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 info->data_buff =3D dma_alloc_coherent(&pdev->dev, MAX_BUFF=
_SIZE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &info->data=
_buff_phys, GFP_KERNEL);
> - =A0 =A0 =A0 if (info->data_buff =3D=3D NULL) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to allocate dma=
 buffer\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 info->data_buff_size =3D MAX_BUFF_SIZE;
> - =A0 =A0 =A0 info->data_desc =3D (void *)info->data_buff + data_desc_off=
set;
> - =A0 =A0 =A0 info->data_desc_addr =3D info->data_buff_phys + data_desc_o=
ffset;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host;
> + =A0 =A0 =A0 struct mtd_info *mtd;
>
> - =A0 =A0 =A0 info->data_dma_ch =3D pxa_request_dma("nand-data", DMA_PRIO=
_LOW,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_nand=
_data_dma_irq, info);
> - =A0 =A0 =A0 if (info->data_dma_ch < 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to request data=
 dma\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_free_coherent(&pdev->dev, info->data_bu=
ff_size,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->data_=
buff, info->data_buff_phys);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return info->data_dma_ch;
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 if (!info->host[cs])
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>
> - =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 host =3D info->host[cs];
> + =A0 =A0 =A0 mtd =3D host->mtd;
> + =A0 =A0 =A0 kfree(mtd);
> + =A0 =A0 =A0 info->host[cs] =3D NULL;
> =A0}
>
> =A0static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
> =A0{
> - =A0 =A0 =A0 struct mtd_info *mtd =3D info->mtd;
> - =A0 =A0 =A0 struct nand_chip *chip =3D mtd->priv;
> + =A0 =A0 =A0 struct mtd_info *mtd =3D info->host[info->cs]->mtd;
> + =A0 =A0 =A0 int ret;
>
> =A0 =A0 =A0 =A0/* use the common timing to make a try */
> - =A0 =A0 =A0 pxa3xx_nand_config_flash(info, &builtin_flash_types[0]);
> - =A0 =A0 =A0 chip->cmdfunc(mtd, NAND_CMD_RESET, 0, 0);
> + =A0 =A0 =A0 ret =3D pxa3xx_nand_config_flash(info, &builtin_flash_types=
[0]);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> +
> + =A0 =A0 =A0 pxa3xx_nand_cmdfunc(mtd, NAND_CMD_RESET, 0, 0);
> =A0 =A0 =A0 =A0if (info->is_ready)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> - =A0 =A0 =A0 else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> +
> + =A0 =A0 =A0 return -ENODEV;
> =A0}
>
> =A0static int pxa3xx_nand_scan(struct mtd_info *mtd)
> =A0{
> - =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host =3D mtd->priv;
> + =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D host->info_data;
> =A0 =A0 =A0 =A0struct platform_device *pdev =3D info->pdev;
> =A0 =A0 =A0 =A0struct pxa3xx_nand_platform_data *pdata =3D pdev->dev.plat=
form_data;
> =A0 =A0 =A0 =A0struct nand_flash_dev pxa3xx_flash_ids[2], *def =3D NULL;
> @@ -891,26 +918,26 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0uint64_t chipsize;
> =A0 =A0 =A0 =A0int i, ret, num;
>
> + =A0 =A0 =A0 info->cs =3D host->cs;
> =A0 =A0 =A0 =A0if (pdata->keep_config && !pxa3xx_nand_detect_config(info)=
)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto KEEP_CONFIG;
>
> =A0 =A0 =A0 =A0ret =3D pxa3xx_nand_sensing(info);
> - =A0 =A0 =A0 if (!ret) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(mtd);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->mtd =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "There is no nand chip on =
cs 0!\n");
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_cs_resource(info, info->cs);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(&info->pdev->dev, "There is no nan=
d chip on cs 0!\n");
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0chip->cmdfunc(mtd, NAND_CMD_READID, 0, 0);
> =A0 =A0 =A0 =A0id =3D *((uint16_t *)(info->data_buff));
> =A0 =A0 =A0 =A0if (id !=3D 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "Detect a flash id %x\n", =
id);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(&info->pdev->dev, "Detect a flash =
id %x\n", id);
> =A0 =A0 =A0 =A0else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(mtd);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->mtd =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "Read out ID 0, potenti=
al timing set wrong!!\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_cs_resource(info, info->cs);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(&info->pdev->dev, "Read out ID 0, =
"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"potential timing set wr=
ong!!\n");
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0}
> @@ -928,14 +955,17 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (i >=3D (ARRAY_SIZE(builtin_flash_types) + pdata->num_f=
lash - 1)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(mtd);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->mtd =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "ERROR!! flash not defined!=
!!\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_cs_resource(info, info->cs);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&info->pdev->dev, "ERROR!! flash no=
t defined!!!\n");
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 pxa3xx_nand_config_flash(info, f);
> + =A0 =A0 =A0 ret =3D pxa3xx_nand_config_flash(info, f);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&info->pdev->dev, "ERROR! Configure=
 failed\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0pxa3xx_flash_ids[0].name =3D f->name;
> =A0 =A0 =A0 =A0pxa3xx_flash_ids[0].id =3D (f->chip_id >> 8) & 0xffff;
> =A0 =A0 =A0 =A0pxa3xx_flash_ids[0].pagesize =3D f->page_size;
> @@ -950,66 +980,51 @@ KEEP_CONFIG:
> =A0 =A0 =A0 =A0if (nand_scan_ident(mtd, 1, def))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
> =A0 =A0 =A0 =A0/* calculate addressing information */
> - =A0 =A0 =A0 info->col_addr_cycles =3D (mtd->writesize >=3D 2048) ? 2 : =
1;
> + =A0 =A0 =A0 if (mtd->writesize >=3D 2048)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->col_addr_cycles =3D 2;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->col_addr_cycles =3D 1;
> =A0 =A0 =A0 =A0info->oob_buff =3D info->data_buff + mtd->writesize;
> =A0 =A0 =A0 =A0if ((mtd->size >> chip->page_shift) > 65536)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->row_addr_cycles =3D 3;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->row_addr_cycles =3D 3;
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->row_addr_cycles =3D 2;
> - =A0 =A0 =A0 mtd->name =3D mtd_names[0];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->row_addr_cycles =3D 2;
> + =A0 =A0 =A0 mtd->name =3D mtd_names[info->cs];
> =A0 =A0 =A0 =A0chip->ecc.mode =3D NAND_ECC_HW;
> - =A0 =A0 =A0 chip->ecc.size =3D info->page_size;
> + =A0 =A0 =A0 chip->ecc.size =3D host->page_size;
>
> - =A0 =A0 =A0 chip->options =3D (info->reg_ndcr & NDCR_DWIDTH_M) ? NAND_B=
USWIDTH_16 : 0;
> + =A0 =A0 =A0 chip->options =3D 0;
> + =A0 =A0 =A0 if (host->reg_ndcr & NDCR_DWIDTH_M)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->options =3D NAND_BUSWIDTH_16;
> =A0 =A0 =A0 =A0chip->options |=3D NAND_NO_AUTOINCR;
> =A0 =A0 =A0 =A0chip->options |=3D NAND_NO_READRDY;
>
> =A0 =A0 =A0 =A0return nand_scan_tail(mtd);
> =A0}
>
> -static
> -struct pxa3xx_nand_info *alloc_nand_resource(struct platform_device *pde=
v)
> +static int alloc_nand_resource(struct platform_device *pdev)
> =A0{
> + =A0 =A0 =A0 struct pxa3xx_nand_platform_data *pdata;
> =A0 =A0 =A0 =A0struct pxa3xx_nand_info *info;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host;
> =A0 =A0 =A0 =A0struct nand_chip *chip;
> =A0 =A0 =A0 =A0struct mtd_info *mtd;
> =A0 =A0 =A0 =A0struct resource *r;
> - =A0 =A0 =A0 int ret, irq;
> + =A0 =A0 =A0 int ret, irq, cs;
> + =A0 =A0 =A0 int data_desc_offset =3D MAX_BUFF_SIZE - sizeof(struct pxa_=
dma_desc);
>
> - =A0 =A0 =A0 mtd =3D kzalloc(sizeof(struct mtd_info) + sizeof(struct pxa=
3xx_nand_info),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP_KERNEL);
> - =A0 =A0 =A0 if (!mtd) {
> + =A0 =A0 =A0 pdata =3D pdev->dev.platform_data;
> + =A0 =A0 =A0 info =3D kzalloc(sizeof(struct pxa3xx_nand_info), GFP_KERNE=
L);
> + =A0 =A0 =A0 if (!info) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&pdev->dev, "failed to allocate me=
mory\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> =A0 =A0 =A0 =A0}
> -
> - =A0 =A0 =A0 info =3D (struct pxa3xx_nand_info *)(&mtd[1]);
> - =A0 =A0 =A0 chip =3D (struct nand_chip *)(&mtd[1]);
> =A0 =A0 =A0 =A0info->pdev =3D pdev;
> - =A0 =A0 =A0 info->mtd =3D mtd;
> - =A0 =A0 =A0 mtd->priv =3D info;
> - =A0 =A0 =A0 mtd->owner =3D THIS_MODULE;
> -
> - =A0 =A0 =A0 chip->ecc.read_page =A0 =A0 =3D pxa3xx_nand_read_page_hwecc=
;
> - =A0 =A0 =A0 chip->ecc.write_page =A0 =A0=3D pxa3xx_nand_write_page_hwec=
c;
> - =A0 =A0 =A0 chip->controller =A0 =A0 =A0 =A0=3D &info->controller;
> - =A0 =A0 =A0 chip->waitfunc =A0 =A0 =A0 =A0 =A0=3D pxa3xx_nand_waitfunc;
> - =A0 =A0 =A0 chip->select_chip =A0 =A0 =A0 =3D pxa3xx_nand_select_chip;
> - =A0 =A0 =A0 chip->dev_ready =A0 =A0 =A0 =A0 =3D pxa3xx_nand_dev_ready;
> - =A0 =A0 =A0 chip->cmdfunc =A0 =A0 =A0 =A0 =A0 =3D pxa3xx_nand_cmdfunc;
> - =A0 =A0 =A0 chip->read_word =A0 =A0 =A0 =A0 =3D pxa3xx_nand_read_word;
> - =A0 =A0 =A0 chip->read_byte =A0 =A0 =A0 =A0 =3D pxa3xx_nand_read_byte;
> - =A0 =A0 =A0 chip->read_buf =A0 =A0 =A0 =A0 =A0=3D pxa3xx_nand_read_buf;
> - =A0 =A0 =A0 chip->write_buf =A0 =A0 =A0 =A0 =3D pxa3xx_nand_write_buf;
> - =A0 =A0 =A0 chip->verify_buf =A0 =A0 =A0 =A0=3D pxa3xx_nand_verify_buf;
> -
> - =A0 =A0 =A0 spin_lock_init(&chip->controller->lock);
> - =A0 =A0 =A0 init_waitqueue_head(&chip->controller->wq);
> =A0 =A0 =A0 =A0info->clk =3D clk_get(&pdev->dev, NULL);
> =A0 =A0 =A0 =A0if (IS_ERR(info->clk)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&pdev->dev, "failed to get nand cl=
ock\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D PTR_ERR(info->clk);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_mtd;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_alloc;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0clk_enable(info->clk);
>
> @@ -1058,10 +1073,6 @@ struct pxa3xx_nand_info *alloc_nand_resource(struc=
t platform_device *pdev)
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0info->mmio_phys =3D r->start;
>
> - =A0 =A0 =A0 ret =3D pxa3xx_nand_init_buff(info);
> - =A0 =A0 =A0 if (ret)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_io;
> -
> =A0 =A0 =A0 =A0/* initialize all interrupts to be disabled */
> =A0 =A0 =A0 =A0disable_int(info, NDSR_MASK);
>
> @@ -1069,21 +1080,80 @@ struct pxa3xx_nand_info *alloc_nand_resource(stru=
ct platform_device *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pdev->name, info);
> =A0 =A0 =A0 =A0if (ret < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&pdev->dev, "failed to request IRQ=
\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_buf;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D ENXIO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_io;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0platform_set_drvdata(pdev, info);
>
> - =A0 =A0 =A0 return info;
> + =A0 =A0 =A0 for (cs =3D 0; cs < pdata->num_cs; cs++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd =3D kzalloc(sizeof(struct mtd_info)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + sizeof(st=
ruct pxa3xx_nand_host),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP_KERNEL)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!mtd) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed=
 to allocate memory\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_irq;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host =3D (struct pxa3xx_nand_host *)(&mtd[1=
]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->info_data =3D info;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->cs =3D cs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->mtd =3D mtd;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->priv =3D host;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->owner =3D THIS_MODULE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->host[cs] =3D host;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip =3D (struct nand_chip *)(&mtd[1]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.read_page =A0 =A0 =3D pxa3xx_nand=
_read_page_hwecc;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page =A0 =A0=3D pxa3xx_nand=
_write_page_hwecc;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->waitfunc =A0 =A0 =A0 =A0 =A0=3D pxa3x=
x_nand_waitfunc;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->select_chip =A0 =A0 =A0 =3D pxa3xx_na=
nd_select_chip;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->cmdfunc =A0 =A0 =A0 =A0 =A0 =3D pxa3x=
x_nand_cmdfunc;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_word =A0 =A0 =A0 =A0 =3D pxa3xx_=
nand_read_word;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_byte =A0 =A0 =A0 =A0 =3D pxa3xx_=
nand_read_byte;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf =A0 =A0 =A0 =A0 =A0=3D pxa3x=
x_nand_read_buf;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf =A0 =A0 =A0 =A0 =3D pxa3xx_=
nand_write_buf;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->verify_buf =A0 =A0 =A0 =A0=3D pxa3xx_=
nand_verify_buf;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (use_dma =3D=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->data_buff =3D kmalloc(MAX_BUFF_SIZE, =
GFP_KERNEL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (info->data_buff =3D=3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_buf;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto success_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 info->data_buff =3D dma_alloc_coherent(&pdev->dev, MAX_BUFF=
_SIZE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &info->data_buff_phys, GFP_=
KERNEL);
> + =A0 =A0 =A0 if (info->data_buff =3D=3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to allocate dma=
 buffer\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_buf;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 info->data_desc =3D (void *)info->data_buff + data_desc_off=
set;
> + =A0 =A0 =A0 info->data_desc_addr =3D info->data_buff_phys + data_desc_o=
ffset;
> + =A0 =A0 =A0 info->data_dma_ch =3D pxa_request_dma("nand-data", DMA_PRIO=
_LOW,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_nand=
_data_dma_irq, info);
> + =A0 =A0 =A0 if (info->data_dma_ch < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to request data=
 dma\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_dma_buf;
> + =A0 =A0 =A0 }
> +success_exit:
> + =A0 =A0 =A0 return 0;
>
> +fail_free_dma_buf:
> + =A0 =A0 =A0 dma_free_writecombine(&pdev->dev, MAX_BUFF_SIZE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->data_buff, info->data=
_buff_phys);
> =A0fail_free_buf:
> + =A0 =A0 =A0 for (cs =3D 0; cs < pdata->num_cs; cs++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_cs_resource(info, cs);
> +fail_free_irq:
> =A0 =A0 =A0 =A0free_irq(irq, info);
> - =A0 =A0 =A0 if (use_dma) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pxa_free_dma(info->data_dma_ch);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_free_coherent(&pdev->dev, info->data_bu=
ff_size,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->data_buff, info->data=
_buff_phys);
> - =A0 =A0 =A0 } else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(info->data_buff);
> =A0fail_free_io:
> =A0 =A0 =A0 =A0iounmap(info->mmio_base);
> =A0fail_free_res:
> @@ -1091,18 +1161,20 @@ fail_free_res:
> =A0fail_put_clk:
> =A0 =A0 =A0 =A0clk_disable(info->clk);
> =A0 =A0 =A0 =A0clk_put(info->clk);
> -fail_free_mtd:
> - =A0 =A0 =A0 kfree(mtd);
> - =A0 =A0 =A0 return NULL;
> +fail_alloc:
> + =A0 =A0 =A0 kfree(info);
> + =A0 =A0 =A0 return ret;
> =A0}
>
> =A0static int pxa3xx_nand_remove(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct pxa3xx_nand_info *info =3D platform_get_drvdata(pde=
v);
> - =A0 =A0 =A0 struct mtd_info *mtd =3D info->mtd;
> + =A0 =A0 =A0 struct pxa3xx_nand_platform_data *pdata;
> + =A0 =A0 =A0 struct pxa3xx_nand_host *host;
> =A0 =A0 =A0 =A0struct resource *r;
> - =A0 =A0 =A0 int irq;
> + =A0 =A0 =A0 int irq, cs;
>
> + =A0 =A0 =A0 pdata =3D pdev->dev.platform_data;
> =A0 =A0 =A0 =A0platform_set_drvdata(pdev, NULL);
>
> =A0 =A0 =A0 =A0irq =3D platform_get_irq(pdev, 0);
> @@ -1110,7 +1182,7 @@ static int pxa3xx_nand_remove(struct platform_devic=
e *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0free_irq(irq, info);
> =A0 =A0 =A0 =A0if (use_dma) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pxa_free_dma(info->data_dma_ch);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_free_writecombine(&pdev->dev, info->dat=
a_buff_size,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_free_writecombine(&pdev->dev, MAX_BUFF_=
SIZE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->data=
_buff, info->data_buff_phys);
> =A0 =A0 =A0 =A0} else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(info->data_buff);
> @@ -1122,9 +1194,12 @@ static int pxa3xx_nand_remove(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0clk_disable(info->clk);
> =A0 =A0 =A0 =A0clk_put(info->clk);
>
> - =A0 =A0 =A0 if (mtd) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand_release(mtd);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(mtd);
> + =A0 =A0 =A0 for (cs =3D 0; cs < pdata->num_cs; cs++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host =3D info->host[cs];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!host)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand_release(host->mtd);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_cs_resource(info, cs);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0return 0;
> =A0}
> @@ -1133,6 +1208,7 @@ static int pxa3xx_nand_probe(struct platform_device=
 *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct pxa3xx_nand_platform_data *pdata;
> =A0 =A0 =A0 =A0struct pxa3xx_nand_info *info;
> + =A0 =A0 =A0 int cs, ret, probe_success =3D 0;
>
> =A0 =A0 =A0 =A0pdata =3D pdev->dev.platform_data;
> =A0 =A0 =A0 =A0if (!pdata) {
> @@ -1140,18 +1216,38 @@ static int pxa3xx_nand_probe(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 info =3D alloc_nand_resource(pdev);
> - =A0 =A0 =A0 if (info =3D=3D NULL)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 if (pdata->keep_config && pdata->num_cs > 1) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(&pdev->dev, "keep_config is prohib=
ited with multiple"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0" chip selects feature!\=
n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->keep_config =3D 0;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D alloc_nand_resource(pdev);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "alloc nand resource fa=
iled\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 info =3D platform_get_drvdata(pdev);
> + =A0 =A0 =A0 for (cs =3D 0; cs < pdata->num_cs; cs++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D pxa3xx_nand_scan(info->host[cs]->mt=
d);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed=
 to scan nand\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D mtd_device_parse_register(info->hos=
t[cs]->mtd, NULL, 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->parts[cs], pdata->nr=
_parts[cs]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 probe_success =3D 1;
> + =A0 =A0 =A0 }
>
> - =A0 =A0 =A0 if (pxa3xx_nand_scan(info->mtd)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to scan nand\n"=
);
> + =A0 =A0 =A0 if (!probe_success) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pxa3xx_nand_remove(pdev);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 return mtd_device_parse_register(info->mtd, NULL, 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->parts, pdata->nr_par=
ts);
> + =A0 =A0 =A0 return 0;
> =A0}
>
> =A0#ifdef CONFIG_PM
> @@ -1171,8 +1267,12 @@ static int pxa3xx_nand_resume(struct platform_devi=
ce *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct pxa3xx_nand_info *info =3D platform_get_drvdata(pde=
v);
>
> - =A0 =A0 =A0 nand_writel(info, NDTR0CS0, info->ndtr0cs0);
> - =A0 =A0 =A0 nand_writel(info, NDTR1CS0, info->ndtr1cs0);
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Directly set the chip select to a invalid value,
> + =A0 =A0 =A0 =A0* then the driver would reset the timing according
> + =A0 =A0 =A0 =A0* to current chip select at the beginning of cmdfunc
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 info->cs =3D 0xff;
> =A0 =A0 =A0 =A0clk_enable(info->clk);
>
> =A0 =A0 =A0 =A0return 0;
> --
> 1.7.0.4
>
>
