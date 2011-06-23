MIME-Version: 1.0
In-Reply-To: <4E01F1E7.5010707@compulab.co.il>
References: <1308712645-5986-1-git-send-email-leiwen@marvell.com>
	<4E01F1E7.5010707@compulab.co.il>
Date: Thu, 23 Jun 2011 14:35:31 +0800
Message-ID: <BANLkTi=YFeVYfsp+68OA_vCF6LnJpqF-ag@mail.gmail.com>
Subject: Re: [PATCH] MTD: pxa3xx_nand: enable multiple chip select support
From: Lei Wen <adrian.wenl@gmail.com>
To: Igor Grinberg <grinberg@compulab.co.il>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Igor,

On Wed, Jun 22, 2011 at 9:45 PM, Igor Grinberg <grinberg@compulab.co.il> wr=
ote:
> Hi Lei,
>
>
> Some comments from a quick look...
>
>
> On 06/22/11 06:17, Lei Wen wrote:
>
>> Current pxa3xx_nand controller has two chip select which
>> both be workable. This patch enable this feature.
>>
>> Update platform driver to support this feature.
>>
>> Another notice should be taken that:
>> When you want to use this feature, you should not enable the
>> keep configuration feature, for two chip select could be
>> attached with different nand chip. The different page size
>> and timing requirement make the keep configuration impossible.
>
> You should _also_ put this comment inside the pxa3xx_nand.h
> may be even inside the pxa3xx_nand_platform_data structure,
> so people would not have to search the git log to find this problem.

How about just throw out a BUG() to force people cannot set keep_config
when supported cs num more than 1? Also appended with the comments above?

>
>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>> ---
>> =A0arch/arm/mach-mmp/aspenite.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 +-
>> =A0arch/arm/mach-pxa/cm-x300.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A05 +-
>> =A0arch/arm/mach-pxa/colibri-pxa3xx.c =A0 =A0 =A0 =A0 =A0 | =A0 =A05 +-
>> =A0arch/arm/mach-pxa/littleton.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A05 +-
>> =A0arch/arm/mach-pxa/mxm8x10.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A09 +-
>> =A0arch/arm/mach-pxa/raumfeld.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 +-
>> =A0arch/arm/mach-pxa/zylonite.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 +-
>> =A0arch/arm/plat-pxa/include/plat/pxa3xx_nand.h | =A0 =A08 +-
>> =A0drivers/mtd/nand/pxa3xx_nand.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0735 +=
++++++++++++++-----------
>> =A09 files changed, 444 insertions(+), 338 deletions(-)
>>
>> diff --git a/arch/arm/mach-mmp/aspenite.c b/arch/arm/mach-mmp/aspenite.c
>> index 06b5fa8..b6589d6 100644
>> --- a/arch/arm/mach-mmp/aspenite.c
>> +++ b/arch/arm/mach-mmp/aspenite.c
>> @@ -167,8 +167,9 @@ static struct mtd_partition aspenite_nand_partitions=
[] =3D {
>>
>> =A0static struct pxa3xx_nand_platform_data aspenite_nand_info =3D {
>> =A0 =A0 =A0 .enable_arbiter =3D 1,
>> - =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D aspenite_nand_partitions,
>> - =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(aspenite_nand_partitions)=
,
>> + =A0 =A0 .cs_num =3D 1,
>> + =A0 =A0 .parts[0] =A0 =A0 =A0 =3D aspenite_nand_partitions,
>> + =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(aspenite_nand_partitions),
>> =A0};
>>
>> =A0static struct i2c_board_info aspenite_i2c_info[] __initdata =3D {
>> diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
>> index b2248e7..d67eb7b 100644
>> --- a/arch/arm/mach-pxa/cm-x300.c
>> +++ b/arch/arm/mach-pxa/cm-x300.c
>> @@ -423,8 +423,9 @@ static struct mtd_partition cm_x300_nand_partitions[=
] =3D {
>> =A0static struct pxa3xx_nand_platform_data cm_x300_nand_info =3D {
>> =A0 =A0 =A0 .enable_arbiter =3D 1,
>> =A0 =A0 =A0 .keep_config =A0 =A0=3D 1,
>> - =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D cm_x300_nand_partitions,
>> - =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(cm_x300_nand_partitions),
>> + =A0 =A0 .cs_num =A0 =A0 =A0 =A0 =3D 1,
>> + =A0 =A0 .parts[0] =A0 =A0 =A0 =3D cm_x300_nand_partitions,
>> + =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(cm_x300_nand_partitions),
>> =A0};
>>
>> =A0static void __init cm_x300_init_nand(void)
>> diff --git a/arch/arm/mach-pxa/colibri-pxa3xx.c b/arch/arm/mach-pxa/coli=
bri-pxa3xx.c
>> index 3f9be41..ff7a07b 100644
>> --- a/arch/arm/mach-pxa/colibri-pxa3xx.c
>> +++ b/arch/arm/mach-pxa/colibri-pxa3xx.c
>> @@ -139,8 +139,9 @@ static struct mtd_partition colibri_nand_partitions[=
] =3D {
>> =A0static struct pxa3xx_nand_platform_data colibri_nand_info =3D {
>> =A0 =A0 =A0 .enable_arbiter =3D 1,
>> =A0 =A0 =A0 .keep_config =A0 =A0=3D 1,
>> - =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D colibri_nand_partitions,
>> - =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(colibri_nand_partitions),
>> + =A0 =A0 .cs_num =A0 =A0 =A0 =A0 =3D 1,
>> + =A0 =A0 .parts[0] =A0 =A0 =A0 =3D colibri_nand_partitions,
>> + =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(colibri_nand_partitions),
>> =A0};
>>
>> =A0void __init colibri_pxa3xx_init_nand(void)
>> diff --git a/arch/arm/mach-pxa/littleton.c b/arch/arm/mach-pxa/littleton=
.c
>> index e5e326d..6eaf852 100644
>> --- a/arch/arm/mach-pxa/littleton.c
>> +++ b/arch/arm/mach-pxa/littleton.c
>> @@ -325,8 +325,9 @@ static struct mtd_partition littleton_nand_partition=
s[] =3D {
>>
>> =A0static struct pxa3xx_nand_platform_data littleton_nand_info =3D {
>> =A0 =A0 =A0 .enable_arbiter =3D 1,
>> - =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D littleton_nand_partitions,
>> - =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(littleton_nand_partitions=
),
>> + =A0 =A0 .cs_num =A0 =A0 =A0 =A0 =3D 1,
>> + =A0 =A0 .parts[0] =A0 =A0 =A0 =3D littleton_nand_partitions,
>> + =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(littleton_nand_partitions),
>> =A0};
>>
>> =A0static void __init littleton_init_nand(void)
>> diff --git a/arch/arm/mach-pxa/mxm8x10.c b/arch/arm/mach-pxa/mxm8x10.c
>> index b5a8fd3..e7ce135 100644
>> --- a/arch/arm/mach-pxa/mxm8x10.c
>> +++ b/arch/arm/mach-pxa/mxm8x10.c
>> @@ -389,10 +389,11 @@ static struct mtd_partition mxm_8x10_nand_partitio=
ns[] =3D {
>> =A0};
>>
>> =A0static struct pxa3xx_nand_platform_data mxm_8x10_nand_info =3D {
>> - =A0 =A0 .enable_arbiter =3D 1,
>> - =A0 =A0 .keep_config =3D 1,
>> - =A0 =A0 .parts =3D mxm_8x10_nand_partitions,
>> - =A0 =A0 .nr_parts =3D ARRAY_SIZE(mxm_8x10_nand_partitions)
>> + =A0 =A0 .enable_arbiter =3D 1,
>> + =A0 =A0 .keep_config =A0 =A0=3D 1,
>> + =A0 =A0 .cs_num =A0 =A0 =A0 =A0 =3D 1,
>> + =A0 =A0 .parts[0] =A0 =A0 =A0 =3D mxm_8x10_nand_partitions,
>> + =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(mxm_8x10_nand_partitions)
>> =A0};
>>
>> =A0static void __init mxm_8x10_nand_init(void)
>> diff --git a/arch/arm/mach-pxa/raumfeld.c b/arch/arm/mach-pxa/raumfeld.c
>> index d130f77..a54846d 100644
>> --- a/arch/arm/mach-pxa/raumfeld.c
>> +++ b/arch/arm/mach-pxa/raumfeld.c
>> @@ -349,8 +349,9 @@ static struct mtd_partition raumfeld_nand_partitions=
[] =3D {
>> =A0static struct pxa3xx_nand_platform_data raumfeld_nand_info =3D {
>> =A0 =A0 =A0 .enable_arbiter =3D 1,
>> =A0 =A0 =A0 .keep_config =A0 =A0=3D 1,
>> - =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D raumfeld_nand_partitions,
>> - =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(raumfeld_nand_partitions)=
,
>> + =A0 =A0 .cs_num =A0 =A0 =A0 =A0 =3D 1,
>> + =A0 =A0 .parts[0] =A0 =A0 =A0 =3D raumfeld_nand_partitions,
>> + =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(raumfeld_nand_partitions),
>> =A0};
>>
>> =A0/**
>> diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
>> index 5821185..ea4752a 100644
>> --- a/arch/arm/mach-pxa/zylonite.c
>> +++ b/arch/arm/mach-pxa/zylonite.c
>> @@ -366,8 +366,9 @@ static struct mtd_partition zylonite_nand_partitions=
[] =3D {
>>
>> =A0static struct pxa3xx_nand_platform_data zylonite_nand_info =3D {
>> =A0 =A0 =A0 .enable_arbiter =3D 1,
>> - =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D zylonite_nand_partitions,
>> - =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(zylonite_nand_partitions)=
,
>> + =A0 =A0 .cs_num =A0 =A0 =A0 =A0 =3D 1,
>> + =A0 =A0 .parts[0] =A0 =A0 =A0 =3D zylonite_nand_partitions,
>> + =A0 =A0 .nr_parts[0] =A0 =A0=3D ARRAY_SIZE(zylonite_nand_partitions),
>> =A0};
>>
>> =A0static void __init zylonite_init_nand(void)
>> diff --git a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h b/arch/arm/pla=
t-pxa/include/plat/pxa3xx_nand.h
>> index 442301f..34a3f52 100644
>> --- a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
>> +++ b/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
>> @@ -41,6 +41,8 @@ struct pxa3xx_nand_flash {
>> =A0 =A0 =A0 struct pxa3xx_nand_timing *timing; =A0 =A0 =A0/* NAND Flash =
timing */
>> =A0};
>>
>> +/* The max num of chip select current support */
>
> /* The maximum number of chip selects currently supported */
>
>> +#define NUM_CHIP_SELECT =A0 =A0 =A0 =A0 =A0 =A0 =A0(2)
>> =A0struct pxa3xx_nand_platform_data {
>>
>> =A0 =A0 =A0 /* the data flash bus is shared between the Static Memory
>> @@ -52,8 +54,10 @@ struct pxa3xx_nand_platform_data {
>> =A0 =A0 =A0 /* allow platform code to keep OBM/bootloader defined NFC co=
nfig */
>> =A0 =A0 =A0 int =A0 =A0 keep_config;
>>
>> - =A0 =A0 const struct mtd_partition =A0 =A0 =A0 =A0 =A0 =A0 =A0*parts;
>> - =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0nr_parts;
>> + =A0 =A0 /* indicate how many chip select would be used for this platfo=
rm */
>
> /* indicate how many chip selects will be used */
>
>> + =A0 =A0 int =A0 =A0 cs_num;
>
> This name is too confusing, I think even num_cs is better or cs_count?
> Also, may be align it with the others?

 I prefer the num_cs.

>
>> + =A0 =A0 const struct mtd_partition =A0 =A0 =A0 =A0 =A0 =A0 =A0*parts[N=
UM_CHIP_SELECT];
>> + =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0nr_parts[NUM_CHIP_SELECT];
>>
>> =A0 =A0 =A0 const struct pxa3xx_nand_flash * =A0 =A0 =A0 =A0flash;
>> =A0 =A0 =A0 size_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0num_flash;
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_na=
nd.c
>> index 30689cc..259b8d5 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -92,11 +92,13 @@
>> =A0#define NDCB0_ADDR_CYC_SHIFT (16)
>>
>> =A0/* macros for registers read/write */
>> -#define nand_writel(info, off, val) =A0\
>> - =A0 =A0 __raw_writel((val), (info)->mmio_base + (off))
>> +#define nand_writel(nand, off, val) =A0\
>> + =A0 =A0 __raw_writel((val), (nand)->mmio_base + (off))
>>
>> -#define nand_readl(info, off) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
>> - =A0 =A0 __raw_readl((info)->mmio_base + (off))
>> +#define nand_readl(nand, off) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
>> + =A0 =A0 __raw_readl((nand)->mmio_base + (off))
>> +#define get_mtd_by_info(info) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
>> + =A0 =A0 (struct mtd_info *)((void *)info - sizeof(struct mtd_info))
>>
>> =A0/* error code and state */
>> =A0enum {
>> @@ -110,6 +112,7 @@ enum {
>>
>> =A0enum {
>> =A0 =A0 =A0 STATE_IDLE =3D 0,
>> + =A0 =A0 STATE_PREPARED,
>> =A0 =A0 =A0 STATE_CMD_HANDLE,
>> =A0 =A0 =A0 STATE_DMA_READING,
>> =A0 =A0 =A0 STATE_DMA_WRITING,
>> @@ -123,63 +126,63 @@ enum {
>> =A0struct pxa3xx_nand_info {
>> =A0 =A0 =A0 struct nand_chip =A0 =A0 =A0 =A0nand_chip;
>>
>> - =A0 =A0 struct nand_hw_control =A0controller;
>> - =A0 =A0 struct platform_device =A0 *pdev;
>> =A0 =A0 =A0 struct pxa3xx_nand_cmdset *cmdset;
>> + =A0 =A0 /* page size of attached chip */
>> + =A0 =A0 uint16_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0page_size;
>> + =A0 =A0 uint8_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip_select;
>> + =A0 =A0 uint8_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 use_ecc;
>> +
>> + =A0 =A0 /* calculated from pxa3xx_nand_flash data */
>> + =A0 =A0 uint8_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 col_addr_cycles;
>> + =A0 =A0 uint8_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 row_addr_cycles;
>> + =A0 =A0 uint8_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 read_id_bytes;
>> +
>> + =A0 =A0 /* cached register value */
>> + =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg_ndcr;
>> + =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndtr0cs0;
>> + =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndtr1cs0;
>>
>> + =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*nand_data;
>> +};
>> +
>> +struct pxa3xx_nand {
>> =A0 =A0 =A0 struct clk =A0 =A0 =A0 =A0 =A0 =A0 =A0*clk;
>> =A0 =A0 =A0 void __iomem =A0 =A0 =A0 =A0 =A0 =A0*mmio_base;
>> =A0 =A0 =A0 unsigned long =A0 =A0 =A0 =A0 =A0 mmio_phys;
>> + =A0 =A0 struct nand_hw_control =A0controller;
>> + =A0 =A0 struct completion =A0 =A0 =A0 cmd_complete;
>> + =A0 =A0 struct platform_device =A0 *pdev;
>
> please, align

Do you still mean cs_num? What this comment refer to?

>
>>
>> - =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0buf_start;
>> - =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0buf_count;
>> -
>> - =A0 =A0 struct mtd_info =A0 =A0 =A0 =A0 *mtd;
>> =A0 =A0 =A0 /* DMA information */
>> =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drcmr_dat;
>> =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drcmr_cmd;
>> -
>> - =A0 =A0 unsigned char =A0 =A0 =A0 =A0 =A0 *data_buff;
>> - =A0 =A0 unsigned char =A0 =A0 =A0 =A0 =A0 *oob_buff;
>> - =A0 =A0 dma_addr_t =A0 =A0 =A0 =A0 =A0 =A0 =A0data_buff_phys;
>> - =A0 =A0 size_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data_buff_size;
>> =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data_dma_ch;
>> - =A0 =A0 struct pxa_dma_desc =A0 =A0 *data_desc;
>> + =A0 =A0 dma_addr_t =A0 =A0 =A0 =A0 =A0 =A0 =A0data_buff_phys;
>> =A0 =A0 =A0 dma_addr_t =A0 =A0 =A0 =A0 =A0 =A0 =A0data_desc_addr;
>> + =A0 =A0 struct pxa_dma_desc =A0 =A0 *data_desc;
>>
>> - =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg_ndcr;
>> -
>> - =A0 =A0 /* saved column/page_addr during CMD_SEQIN */
>> - =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 seqin_column;
>> - =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 seqin_page_addr;
>> + =A0 =A0 struct pxa3xx_nand_info *info[NUM_CHIP_SELECT];
>> + =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0command;
>> + =A0 =A0 uint16_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data_size; =A0 =A0 =A0=
/* data size in FIFO */
>> + =A0 =A0 uint16_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oob_size;
>> + =A0 =A0 unsigned char =A0 =A0 =A0 =A0 =A0 *data_buff;
>> + =A0 =A0 unsigned char =A0 =A0 =A0 =A0 =A0 *oob_buff;
>> + =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buf_start;
>> + =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buf_count;
>>
>> =A0 =A0 =A0 /* relate to the command */
>> =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0state;
>> -
>> + =A0 =A0 uint8_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip_select;
>> =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 use_ecc; =A0 =A0=
 =A0 =A0/* use HW ECC ? */
>> =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 use_dma; =A0 =A0=
 =A0 =A0/* use DMA ? */
>> =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 is_ready;
>> -
>> - =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0page_size; =A0 =A0 =A0/* p=
age size of attached chip */
>> - =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0data_size; =A0 =A0 =A0/* d=
ata size in FIFO */
>> =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retcode;
>> - =A0 =A0 struct completion =A0 =A0 =A0 cmd_complete;
>>
>> =A0 =A0 =A0 /* generated NDCBx register values */
>> + =A0 =A0 uint8_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 total_cmds;
>> =A0 =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndcb0;
>> =A0 =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndcb1;
>> =A0 =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndcb2;
>> -
>> - =A0 =A0 /* timing calcuted from setting */
>> - =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndtr0cs0;
>> - =A0 =A0 uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ndtr1cs0;
>> -
>> - =A0 =A0 /* calculated from pxa3xx_nand_flash data */
>> - =A0 =A0 size_t =A0 =A0 =A0 =A0 =A0oob_size;
>> - =A0 =A0 size_t =A0 =A0 =A0 =A0 =A0read_id_bytes;
>> -
>> - =A0 =A0 unsigned int =A0 =A0col_addr_cycles;
>> - =A0 =A0 unsigned int =A0 =A0row_addr_cycles;
>> =A0};
>
> It looks like if you switch the names of the structures above,
> then the patch will be much shorter and cleaner,
> but will it make structures meaning confusion?

Could you elaborate more about this? Do you means no need to create a seper=
ated
structure?

>
>>
>> =A0static int use_dma =3D 1;
>> @@ -225,7 +228,7 @@ static struct pxa3xx_nand_flash builtin_flash_types[=
] =3D {
>> =A0/* Define a default flash type setting serve as flash detecting only =
*/
>> =A0#define DEFAULT_FLASH_TYPE (&builtin_flash_types[0])
>>
>> -const char *mtd_names[] =3D {"pxa3xx_nand-0", NULL};
>> +const char *mtd_names[] =3D {"pxa3xx_nand-0", "pxa3xx_nand-1", NULL};
>>
>> =A0#define NDTR0_tCH(c) (min((c), 7) << 19)
>> =A0#define NDTR0_tCS(c) (min((c), 7) << 16)
>> @@ -244,9 +247,11 @@ const char *mtd_names[] =3D {"pxa3xx_nand-0", NULL}=
;
>> =A0static void pxa3xx_nand_set_timing(struct pxa3xx_nand_info *info,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const=
 struct pxa3xx_nand_timing *t)
>> =A0{
>> - =A0 =A0 unsigned long nand_clk =3D clk_get_rate(info->clk);
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>> + =A0 =A0 unsigned long nand_clk;
>> =A0 =A0 =A0 uint32_t ndtr0, ndtr1;
>>
>> + =A0 =A0 nand_clk =3D clk_get_rate(nand->clk);
>> =A0 =A0 =A0 ndtr0 =3D NDTR0_tCH(ns2cycle(t->tCH, nand_clk)) |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 NDTR0_tCS(ns2cycle(t->tCS, nand_clk)) |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 NDTR0_tWH(ns2cycle(t->tWH, nand_clk)) |
>> @@ -260,26 +265,27 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_n=
and_info *info,
>>
>> =A0 =A0 =A0 info->ndtr0cs0 =3D ndtr0;
>> =A0 =A0 =A0 info->ndtr1cs0 =3D ndtr1;
>> - =A0 =A0 nand_writel(info, NDTR0CS0, ndtr0);
>> - =A0 =A0 nand_writel(info, NDTR1CS0, ndtr1);
>> + =A0 =A0 nand_writel(nand, NDTR0CS0, ndtr0);
>> + =A0 =A0 nand_writel(nand, NDTR1CS0, ndtr1);
>> =A0}
>>
>> =A0static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
>> =A0{
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>> =A0 =A0 =A0 int oob_enable =3D info->reg_ndcr & NDCR_SPARE_EN;
>>
>> - =A0 =A0 info->data_size =3D info->page_size;
>> + =A0 =A0 nand->data_size =3D info->page_size;
>> =A0 =A0 =A0 if (!oob_enable) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->oob_size =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->oob_size =3D 0;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 switch (info->page_size) {
>> =A0 =A0 =A0 case 2048:
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->oob_size =3D (info->use_ecc) ? 40 : 64;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->oob_size =3D (info->use_ecc) ? 40 : 64;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 case 512:
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->oob_size =3D (info->use_ecc) ? 8 : 16;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->oob_size =3D (info->use_ecc) ? 8 : 16;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 }
>> =A0}
>> @@ -290,185 +296,189 @@ static void pxa3xx_set_datasize(struct pxa3xx_na=
nd_info *info)
>> =A0 * We enable all the interrupt at the same time, and
>> =A0 * let pxa3xx_nand_irq to handle all logic.
>> =A0 */
>> -static void pxa3xx_nand_start(struct pxa3xx_nand_info *info)
>> +static void pxa3xx_nand_start(struct pxa3xx_nand *nand)
>> =A0{
>> + =A0 =A0 struct pxa3xx_nand_info *info;
>> =A0 =A0 =A0 uint32_t ndcr;
>>
>> + =A0 =A0 info =3D nand->info[nand->chip_select];
>> =A0 =A0 =A0 ndcr =3D info->reg_ndcr;
>> - =A0 =A0 ndcr |=3D info->use_ecc ? NDCR_ECC_EN : 0;
>> - =A0 =A0 ndcr |=3D info->use_dma ? NDCR_DMA_EN : 0;
>> + =A0 =A0 ndcr |=3D nand->use_ecc ? NDCR_ECC_EN : 0;
>> + =A0 =A0 ndcr |=3D nand->use_dma ? NDCR_DMA_EN : 0;
>> =A0 =A0 =A0 ndcr |=3D NDCR_ND_RUN;
>>
>> =A0 =A0 =A0 /* clear status bits and run */
>> - =A0 =A0 nand_writel(info, NDCR, 0);
>> - =A0 =A0 nand_writel(info, NDSR, NDSR_MASK);
>> - =A0 =A0 nand_writel(info, NDCR, ndcr);
>> + =A0 =A0 nand_writel(nand, NDCR, 0);
>> + =A0 =A0 nand_writel(nand, NDSR, NDSR_MASK);
>> + =A0 =A0 nand_writel(nand, NDCR, ndcr);
>> =A0}
>>
>> -static void pxa3xx_nand_stop(struct pxa3xx_nand_info *info)
>> +static void pxa3xx_nand_stop(struct pxa3xx_nand *nand)
>> =A0{
>> =A0 =A0 =A0 uint32_t ndcr;
>> =A0 =A0 =A0 int timeout =3D NAND_STOP_DELAY;
>>
>> =A0 =A0 =A0 /* wait RUN bit in NDCR become 0 */
>> - =A0 =A0 ndcr =3D nand_readl(info, NDCR);
>> + =A0 =A0 ndcr =3D nand_readl(nand, NDCR);
>> =A0 =A0 =A0 while ((ndcr & NDCR_ND_RUN) && (timeout-- > 0)) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 ndcr =3D nand_readl(info, NDCR);
>> + =A0 =A0 =A0 =A0 =A0 =A0 ndcr =3D nand_readl(nand, NDCR);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(1);
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 if (timeout <=3D 0) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ndcr &=3D ~NDCR_ND_RUN;
>> - =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(info, NDCR, ndcr);
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(nand, NDCR, ndcr);
>> =A0 =A0 =A0 }
>> =A0 =A0 =A0 /* clear status bits */
>> - =A0 =A0 nand_writel(info, NDSR, NDSR_MASK);
>> + =A0 =A0 nand_writel(nand, NDSR, NDSR_MASK);
>> =A0}
>>
>> -static void enable_int(struct pxa3xx_nand_info *info, uint32_t int_mask=
)
>> +static void enable_int(struct pxa3xx_nand *nand, uint32_t int_mask)
>> =A0{
>> =A0 =A0 =A0 uint32_t ndcr;
>>
>> - =A0 =A0 ndcr =3D nand_readl(info, NDCR);
>> - =A0 =A0 nand_writel(info, NDCR, ndcr & ~int_mask);
>> + =A0 =A0 ndcr =3D nand_readl(nand, NDCR);
>> + =A0 =A0 nand_writel(nand, NDCR, ndcr & ~int_mask);
>> =A0}
>>
>> -static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mas=
k)
>> +static void disable_int(struct pxa3xx_nand *nand, uint32_t int_mask)
>> =A0{
>> =A0 =A0 =A0 uint32_t ndcr;
>>
>> - =A0 =A0 ndcr =3D nand_readl(info, NDCR);
>> - =A0 =A0 nand_writel(info, NDCR, ndcr | int_mask);
>> + =A0 =A0 ndcr =3D nand_readl(nand, NDCR);
>> + =A0 =A0 nand_writel(nand, NDCR, ndcr | int_mask);
>> =A0}
>>
>> -static void handle_data_pio(struct pxa3xx_nand_info *info)
>> +static void handle_data_pio(struct pxa3xx_nand *nand)
>> =A0{
>> - =A0 =A0 switch (info->state) {
>> + =A0 =A0 switch (nand->state) {
>> =A0 =A0 =A0 case STATE_PIO_WRITING:
>> - =A0 =A0 =A0 =A0 =A0 =A0 __raw_writesl(info->mmio_base + NDDB, info->da=
ta_buff,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DIV_ROUND_UP(i=
nfo->data_size, 4));
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (info->oob_size > 0)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writesl(info->mmio_base =
+ NDDB, info->oob_buff,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 DIV_ROUND_UP(info->oob_size, 4));
>> + =A0 =A0 =A0 =A0 =A0 =A0 __raw_writesl(nand->mmio_base + NDDB, nand->da=
ta_buff,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DIV_ROUND_UP(n=
and->data_size, 4));
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (nand->oob_size > 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writesl(nand->mmio_base =
+ NDDB, nand->oob_buff,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 DIV_ROUND_UP(nand->oob_size, 4));
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 case STATE_PIO_READING:
>> - =A0 =A0 =A0 =A0 =A0 =A0 __raw_readsl(info->mmio_base + NDDB, info->dat=
a_buff,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DIV_ROUND_UP(i=
nfo->data_size, 4));
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (info->oob_size > 0)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_readsl(info->mmio_base +=
 NDDB, info->oob_buff,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 DIV_ROUND_UP(info->oob_size, 4));
>> + =A0 =A0 =A0 =A0 =A0 =A0 __raw_readsl(nand->mmio_base + NDDB, nand->dat=
a_buff,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DIV_ROUND_UP(n=
and->data_size, 4));
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (nand->oob_size > 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_readsl(nand->mmio_base +=
 NDDB, nand->oob_buff,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 DIV_ROUND_UP(nand->oob_size, 4));
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 default:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: invalid state %d\n", __=
func__,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->state);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->state);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG();
>> =A0 =A0 =A0 }
>> =A0}
>>
>> -static void start_data_dma(struct pxa3xx_nand_info *info)
>> +static void start_data_dma(struct pxa3xx_nand *nand)
>> =A0{
>> - =A0 =A0 struct pxa_dma_desc *desc =3D info->data_desc;
>> - =A0 =A0 int dma_len =3D ALIGN(info->data_size + info->oob_size, 32);
>> + =A0 =A0 struct pxa_dma_desc *desc =3D nand->data_desc;
>> + =A0 =A0 int dma_len =3D ALIGN(nand->data_size + nand->oob_size, 32);
>>
>> =A0 =A0 =A0 desc->ddadr =3D DDADR_STOP;
>> =A0 =A0 =A0 desc->dcmd =3D DCMD_ENDIRQEN | DCMD_WIDTH4 | DCMD_BURST32 | =
dma_len;
>>
>> - =A0 =A0 switch (info->state) {
>> + =A0 =A0 switch (nand->state) {
>> =A0 =A0 =A0 case STATE_DMA_WRITING:
>> - =A0 =A0 =A0 =A0 =A0 =A0 desc->dsadr =3D info->data_buff_phys;
>> - =A0 =A0 =A0 =A0 =A0 =A0 desc->dtadr =3D info->mmio_phys + NDDB;
>> + =A0 =A0 =A0 =A0 =A0 =A0 desc->dsadr =3D nand->data_buff_phys;
>> + =A0 =A0 =A0 =A0 =A0 =A0 desc->dtadr =3D nand->mmio_phys + NDDB;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc->dcmd |=3D DCMD_INCSRCADDR | DCMD_FLOWT=
RG;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 case STATE_DMA_READING:
>> - =A0 =A0 =A0 =A0 =A0 =A0 desc->dtadr =3D info->data_buff_phys;
>> - =A0 =A0 =A0 =A0 =A0 =A0 desc->dsadr =3D info->mmio_phys + NDDB;
>> + =A0 =A0 =A0 =A0 =A0 =A0 desc->dtadr =3D nand->data_buff_phys;
>> + =A0 =A0 =A0 =A0 =A0 =A0 desc->dsadr =3D nand->mmio_phys + NDDB;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc->dcmd |=3D DCMD_INCTRGADDR | DCMD_FLOWS=
RC;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 default:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: invalid state %d\n", __=
func__,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->state);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->state);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG();
>> =A0 =A0 =A0 }
>>
>> - =A0 =A0 DRCMR(info->drcmr_dat) =3D DRCMR_MAPVLD | info->data_dma_ch;
>> - =A0 =A0 DDADR(info->data_dma_ch) =3D info->data_desc_addr;
>> - =A0 =A0 DCSR(info->data_dma_ch) |=3D DCSR_RUN;
>> + =A0 =A0 DRCMR(nand->drcmr_dat) =3D DRCMR_MAPVLD | nand->data_dma_ch;
>> + =A0 =A0 DDADR(nand->data_dma_ch) =3D nand->data_desc_addr;
>> + =A0 =A0 DCSR(nand->data_dma_ch) |=3D DCSR_RUN;
>> =A0}
>>
>> =A0static void pxa3xx_nand_data_dma_irq(int channel, void *data)
>> =A0{
>> - =A0 =A0 struct pxa3xx_nand_info *info =3D data;
>> + =A0 =A0 struct pxa3xx_nand *nand =3D data;
>> =A0 =A0 =A0 uint32_t dcsr;
>>
>> =A0 =A0 =A0 dcsr =3D DCSR(channel);
>> =A0 =A0 =A0 DCSR(channel) =3D dcsr;
>>
>> =A0 =A0 =A0 if (dcsr & DCSR_BUSERR) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->retcode =3D ERR_DMABUSERR;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->retcode =3D ERR_DMABUSERR;
>> =A0 =A0 =A0 }
>>
>> - =A0 =A0 info->state =3D STATE_DMA_DONE;
>> - =A0 =A0 enable_int(info, NDCR_INT_MASK);
>> - =A0 =A0 nand_writel(info, NDSR, NDSR_WRDREQ | NDSR_RDDREQ);
>> + =A0 =A0 nand->state =3D STATE_DMA_DONE;
>> + =A0 =A0 enable_int(nand, NDCR_INT_MASK);
>> + =A0 =A0 nand_writel(nand, NDSR, NDSR_WRDREQ | NDSR_RDDREQ);
>> =A0}
>>
>> =A0static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
>> =A0{
>> - =A0 =A0 struct pxa3xx_nand_info *info =3D devid;
>> - =A0 =A0 unsigned int status, is_completed =3D 0;
>> + =A0 =A0 struct pxa3xx_nand *nand =3D devid;
>> + =A0 =A0 struct pxa3xx_nand_info *info;
>> + =A0 =A0 unsigned int status, is_completed =3D 0, cs;
>> + =A0 =A0 unsigned int ready, cmd_done, page_done, badblock_detect;
>>
>> - =A0 =A0 status =3D nand_readl(info, NDSR);
>> + =A0 =A0 cs =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D nand->chip_select;
>> + =A0 =A0 ready =A0 =A0 =A0 =A0 =A0 =3D (cs) ? NDSR_RDY : NDSR_FLASH_RDY=
;
>> + =A0 =A0 cmd_done =A0 =A0 =A0 =A0=3D (cs) ? NDSR_CS1_CMDD : NDSR_CS0_CM=
DD;
>> + =A0 =A0 page_done =A0 =A0 =A0 =3D (cs) ? NDSR_CS1_PAGED : NDSR_CS0_PAG=
ED;
>> + =A0 =A0 badblock_detect =3D (cs) ? NDSR_CS1_BBD : NDSR_CS0_BBD;
>
> This is confusing... do you use to ?: operator for differentiating betwee=
n
> cs =3D 0 and cs =3D 1?
> I think this is a bad idea.
> Moreover, the use of ?: is discouraged among the kernel.

I could use if/else to replace this statement.

>
>> + =A0 =A0 info =A0 =A0 =A0 =A0 =A0 =A0=3D nand->info[cs];
>>
>> + =A0 =A0 status =3D nand_readl(nand, NDSR);
>> =A0 =A0 =A0 if (status & NDSR_DBERR)
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->retcode =3D ERR_DBERR;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->retcode =3D ERR_DBERR;
>> =A0 =A0 =A0 if (status & NDSR_SBERR)
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->retcode =3D ERR_SBERR;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->retcode =3D ERR_SBERR;
>> =A0 =A0 =A0 if (status & (NDSR_RDDREQ | NDSR_WRDREQ)) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* whether use dma to transfer data */
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (info->use_dma) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 disable_int(info, NDCR_INT_MAS=
K);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->state =3D (status & NDSR=
_RDDREQ) ?
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (nand->use_dma) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 disable_int(nand, NDCR_INT_MAS=
K);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->state =3D (status & NDSR=
_RDDREQ) ?
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
STATE_DMA_READING : STATE_DMA_WRITING;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 start_data_dma(info);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 start_data_dma(nand);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto NORMAL_IRQ_EXIT;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->state =3D (status & NDSR=
_RDDREQ) ?
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->state =3D (status & NDSR=
_RDDREQ) ?
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
STATE_PIO_READING : STATE_PIO_WRITING;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 handle_data_pio(info);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 handle_data_pio(nand);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 }
>> - =A0 =A0 if (status & NDSR_CS0_CMDD) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->state =3D STATE_CMD_DONE;
>> + =A0 =A0 if (status & cmd_done) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->state =3D STATE_CMD_DONE;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 is_completed =3D 1;
>> =A0 =A0 =A0 }
>> - =A0 =A0 if (status & NDSR_FLASH_RDY) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->is_ready =3D 1;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->state =3D STATE_READY;
>> + =A0 =A0 if (status & ready) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->is_ready =3D 1;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->state =3D STATE_READY;
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 if (status & NDSR_WRCMDREQ) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(info, NDSR, NDSR_WRCMDREQ);
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(nand, NDSR, NDSR_WRCMDREQ);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~NDSR_WRCMDREQ;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->state =3D STATE_CMD_HANDLE;
>> - =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(info, NDCB0, info->ndcb0);
>> - =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(info, NDCB0, info->ndcb1);
>> - =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(info, NDCB0, info->ndcb2);
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->state =3D STATE_CMD_HANDLE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(nand, NDCB0, nand->ndcb0);
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(nand, NDCB0, nand->ndcb1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(nand, NDCB0, nand->ndcb2);
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 /* clear NDSR to let the controller exit the IRQ */
>> - =A0 =A0 nand_writel(info, NDSR, status);
>> + =A0 =A0 nand_writel(nand, NDSR, status);
>> =A0 =A0 =A0 if (is_completed)
>> - =A0 =A0 =A0 =A0 =A0 =A0 complete(&info->cmd_complete);
>> + =A0 =A0 =A0 =A0 =A0 =A0 complete(&nand->cmd_complete);
>> =A0NORMAL_IRQ_EXIT:
>> =A0 =A0 =A0 return IRQ_HANDLED;
>> =A0}
>>
>> -static int pxa3xx_nand_dev_ready(struct mtd_info *mtd)
>> -{
>> - =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> - =A0 =A0 return (nand_readl(info, NDSR) & NDSR_RDY) ? 1 : 0;
>> -}
>> -
>> =A0static inline int is_buf_blank(uint8_t *buf, size_t len)
>> =A0{
>> =A0 =A0 =A0 for (; len > 0; len--)
>> @@ -477,42 +487,49 @@ static inline int is_buf_blank(uint8_t *buf, size_=
t len)
>> =A0 =A0 =A0 return 1;
>> =A0}
>>
>> -static int prepare_command_pool(struct pxa3xx_nand_info *info, int comm=
and,
>> +static int prepare_command_pool(struct pxa3xx_nand *nand, int command,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint16_t column, int page_addr)
>> =A0{
>> =A0 =A0 =A0 uint16_t cmd;
>> =A0 =A0 =A0 int addr_cycle, exec_cmd, ndcb0;
>> - =A0 =A0 struct mtd_info *mtd =3D info->mtd;
>> + =A0 =A0 struct mtd_info *mtd;
>> + =A0 =A0 struct pxa3xx_nand_info *info =3D nand->info[nand->chip_select=
];
>>
>> - =A0 =A0 ndcb0 =3D 0;
>> + =A0 =A0 mtd =3D get_mtd_by_info(info);
>> + =A0 =A0 ndcb0 =3D (nand->chip_select) ? NDCB0_CSEL : 0;
>
> This one is confusing too...
> Besides, you don't need the parenthesis.

Got that. I would fix it.

>
>> =A0 =A0 =A0 addr_cycle =3D 0;
>> =A0 =A0 =A0 exec_cmd =3D 1;
>>
>> =A0 =A0 =A0 /* reset data and oob column point to handle data */
>> - =A0 =A0 info->buf_start =A0 =A0 =A0 =A0 =3D 0;
>> - =A0 =A0 info->buf_count =A0 =A0 =A0 =A0 =3D 0;
>> - =A0 =A0 info->oob_size =A0 =A0 =A0 =A0 =A0=3D 0;
>> - =A0 =A0 info->use_ecc =A0 =A0 =A0 =A0 =A0 =3D 0;
>> - =A0 =A0 info->is_ready =A0 =A0 =A0 =A0 =A0=3D 0;
>> - =A0 =A0 info->retcode =A0 =A0 =A0 =A0 =A0 =3D ERR_NONE;
>> + =A0 =A0 nand->buf_start =A0 =A0 =A0 =A0 =3D 0;
>> + =A0 =A0 nand->buf_count =A0 =A0 =A0 =A0 =3D 0;
>> + =A0 =A0 nand->oob_size =A0 =A0 =A0 =A0 =A0=3D 0;
>> + =A0 =A0 nand->use_ecc =A0 =A0 =A0 =A0 =A0 =3D 0;
>> + =A0 =A0 nand->is_ready =A0 =A0 =A0 =A0 =A0=3D 0;
>> + =A0 =A0 nand->retcode =A0 =A0 =A0 =A0 =A0 =3D ERR_NONE;
>> + =A0 =A0 nand->data_size =A0 =A0 =A0 =A0 =3D 0;
>> + =A0 =A0 nand->use_dma =A0 =A0 =A0 =A0 =A0 =3D 0;
>> + =A0 =A0 nand->command =A0 =A0 =A0 =A0 =A0 =3D command;
>>
>> =A0 =A0 =A0 switch (command) {
>> =A0 =A0 =A0 case NAND_CMD_READ0:
>> =A0 =A0 =A0 case NAND_CMD_PAGEPROG:
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->use_ecc =3D 1;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->use_ecc =3D 1;
>> =A0 =A0 =A0 case NAND_CMD_READOOB:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_set_datasize(info);
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->oob_buff =3D nand->data_buff + nand->dat=
a_size;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->use_dma =3D use_dma;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 case NAND_CMD_SEQIN:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 exec_cmd =3D 0;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 default:
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb1 =3D 0;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb2 =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb1 =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb2 =3D 0;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 }
>>
>> - =A0 =A0 info->ndcb0 =3D ndcb0;
>> + =A0 =A0 nand->ndcb0 =3D ndcb0;
>> =A0 =A0 =A0 addr_cycle =3D NDCB0_ADDR_CYC(info->row_addr_cycles
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + in=
fo->col_addr_cycles);
>>
>> @@ -521,16 +538,16 @@ static int prepare_command_pool(struct pxa3xx_nand=
_info *info, int command,
>> =A0 =A0 =A0 case NAND_CMD_READ0:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->read1;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (command =3D=3D NAND_CMD_READOOB)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->buf_start =3D mtd->write=
size + column;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->buf_start =3D mtd->write=
size + column;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->buf_start =3D column;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->buf_start =3D column;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(info->page_size < PAGE_CHUNK_SI=
ZE))
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb0 |=3D NDCB0_CMD_TYP=
E(0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb0 |=3D NDCB0_CMD_TYP=
E(0)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | addr_cycle
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | (cmd & NDCB0_CMD1_MASK);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb0 |=3D NDCB0_CMD_TYP=
E(0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb0 |=3D NDCB0_CMD_TYP=
E(0)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | NDCB0_DBC
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | addr_cycle
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | cmd;
>> @@ -538,34 +555,34 @@ static int prepare_command_pool(struct pxa3xx_nand=
_info *info, int command,
>> =A0 =A0 =A0 case NAND_CMD_SEQIN:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* small page addr setting */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(info->page_size < PAGE_CHUNK_SI=
ZE)) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb1 =3D ((page_addr & =
0xFFFFFF) << 8)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb1 =3D ((page_addr & =
0xFFFFFF) << 8)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | (column & 0xFF);
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb2 =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb2 =3D 0;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb1 =3D ((page_addr & =
0xFFFF) << 16)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb1 =3D ((page_addr & =
0xFFFF) << 16)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | (column & 0xFFFF);
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (page_addr & 0xFF0000)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb2 =
=3D (page_addr & 0xFF0000) >> 16;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb2 =
=3D (page_addr & 0xFF0000) >> 16;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb2 =
=3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb2 =
=3D 0;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->buf_count =3D mtd->writesize + mtd->oobs=
ize;
>> - =A0 =A0 =A0 =A0 =A0 =A0 memset(info->data_buff, 0xFF, info->buf_count)=
;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->buf_count =3D mtd->writesize + mtd->oobs=
ize;
>> + =A0 =A0 =A0 =A0 =A0 =A0 memset(nand->data_buff, 0xFF, nand->buf_count)=
;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>>
>> =A0 =A0 =A0 case NAND_CMD_PAGEPROG:
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (is_buf_blank(info->data_buff,
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (is_buf_blank(nand->data_buff,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (mtd->writesize + mtd->oobsize))) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exec_cmd =3D 0;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->program;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb0 |=3D NDCB0_CMD_TYPE(0x1)
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb0 |=3D NDCB0_CMD_TYPE(0x1)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | NDCB0_AUTO=
_RS
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | NDCB0_ST_R=
OW_EN
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | NDCB0_DBC
>> @@ -575,37 +592,37 @@ static int prepare_command_pool(struct pxa3xx_nand=
_info *info, int command,
>>
>> =A0 =A0 =A0 case NAND_CMD_READID:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->read_id;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->buf_count =3D info->read_id_bytes;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb0 |=3D NDCB0_CMD_TYPE(3)
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->buf_count =3D info->read_id_bytes;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb0 |=3D NDCB0_CMD_TYPE(3)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | NDCB0_ADDR=
_CYC(1)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | cmd;
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->data_size =3D 8;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->data_size =3D 8;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 case NAND_CMD_STATUS:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->read_status;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->buf_count =3D 1;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb0 |=3D NDCB0_CMD_TYPE(4)
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->buf_count =3D 1;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb0 |=3D NDCB0_CMD_TYPE(4)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | NDCB0_ADDR=
_CYC(1)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | cmd;
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->data_size =3D 8;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->data_size =3D 8;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>>
>> =A0 =A0 =A0 case NAND_CMD_ERASE1:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->erase;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb0 |=3D NDCB0_CMD_TYPE(2)
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb0 |=3D NDCB0_CMD_TYPE(2)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | NDCB0_AUTO=
_RS
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | NDCB0_ADDR=
_CYC(3)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | NDCB0_DBC
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | cmd;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb1 =3D page_addr;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb2 =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb1 =3D page_addr;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb2 =3D 0;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 case NAND_CMD_RESET:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D info->cmdset->reset;
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->ndcb0 |=3D NDCB0_CMD_TYPE(5)
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->ndcb0 |=3D NDCB0_CMD_TYPE(5)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | cmd;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> @@ -628,6 +645,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd=
, unsigned command,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int column, =
int page_addr)
>> =A0{
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>> =A0 =A0 =A0 int ret, exec_cmd;
>>
>> =A0 =A0 =A0 /*
>> @@ -638,20 +656,32 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *m=
td, unsigned command,
>> =A0 =A0 =A0 if (info->reg_ndcr & NDCR_DWIDTH_M)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 column /=3D 2;
>>
>> - =A0 =A0 exec_cmd =3D prepare_command_pool(info, command, column, page_=
addr);
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* There may be different NAND chip hooked to
>> + =A0 =A0 =A0* different chip select, so check whether
>> + =A0 =A0 =A0* chip select has been changed, if yes, reset the timing
>> + =A0 =A0 =A0*/
>> + =A0 =A0 if (nand->chip_select !=3D info->chip_select) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->chip_select =3D info->chip_select;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(nand, NDTR0CS0, info->ndtr0cs0);
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand_writel(nand, NDTR1CS0, info->ndtr1cs0);
>> + =A0 =A0 }
>> +
>> + =A0 =A0 nand->state =3D STATE_PREPARED;
>> + =A0 =A0 exec_cmd =3D prepare_command_pool(nand, command, column, page_=
addr);
>> =A0 =A0 =A0 if (exec_cmd) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 init_completion(&info->cmd_complete);
>> - =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_nand_start(info);
>> + =A0 =A0 =A0 =A0 =A0 =A0 init_completion(&nand->cmd_complete);
>> + =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_nand_start(nand);
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 ret =3D wait_for_completion_timeout(&info->cmd=
_complete,
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D wait_for_completion_timeout(&nand->cmd=
_complete,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CHIP_DELAY_T=
IMEOUT);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!ret) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Wait time o=
ut!!!\n");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Stop State Machine for ne=
xt command cycle */
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_nand_stop(info);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_nand_stop(nand);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->state =3D STATE_IDLE;
>> =A0 =A0 =A0 }
>> + =A0 =A0 nand->state =3D STATE_IDLE;
>> =A0}
>>
>> =A0static void pxa3xx_nand_write_page_hwecc(struct mtd_info *mtd,
>> @@ -665,11 +695,12 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_=
info *mtd,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nand_chip *chip, uint8_t *buf, int pa=
ge)
>> =A0{
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>>
>> =A0 =A0 =A0 chip->read_buf(mtd, buf, mtd->writesize);
>> =A0 =A0 =A0 chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>>
>> - =A0 =A0 if (info->retcode =3D=3D ERR_SBERR) {
>> + =A0 =A0 if (nand->retcode =3D=3D ERR_SBERR) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (info->use_ecc) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 1:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->ecc_stats.corrected++;
>> @@ -678,14 +709,14 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_=
info *mtd,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 } else if (info->retcode =3D=3D ERR_DBERR) {
>> + =A0 =A0 } else if (nand->retcode =3D=3D ERR_DBERR) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* for blank page (all 0xff), HW will calc=
ulate its ECC as
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 0, which is different from the ECC info=
rmation within
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* OOB, ignore such double bit errors
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (is_buf_blank(buf, mtd->writesize))
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->retcode =3D ERR_NONE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->retcode =3D ERR_NONE;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->ecc_stats.failed++;
>> =A0 =A0 =A0 }
>> @@ -696,11 +727,12 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_=
info *mtd,
>> =A0static uint8_t pxa3xx_nand_read_byte(struct mtd_info *mtd)
>> =A0{
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>> =A0 =A0 =A0 char retval =3D 0xFF;
>>
>> - =A0 =A0 if (info->buf_start < info->buf_count)
>> + =A0 =A0 if (nand->buf_start < nand->buf_count)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Has just send a new command? */
>> - =A0 =A0 =A0 =A0 =A0 =A0 retval =3D info->data_buff[info->buf_start++];
>> + =A0 =A0 =A0 =A0 =A0 =A0 retval =3D nand->data_buff[nand->buf_start++];
>>
>> =A0 =A0 =A0 return retval;
>> =A0}
>> @@ -708,11 +740,12 @@ static uint8_t pxa3xx_nand_read_byte(struct mtd_in=
fo *mtd)
>> =A0static u16 pxa3xx_nand_read_word(struct mtd_info *mtd)
>> =A0{
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>> =A0 =A0 =A0 u16 retval =3D 0xFFFF;
>>
>> - =A0 =A0 if (!(info->buf_start & 0x01) && info->buf_start < info->buf_c=
ount) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 retval =3D *((u16 *)(info->data_buff+info->buf=
_start));
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->buf_start +=3D 2;
>> + =A0 =A0 if (!(nand->buf_start & 0x01) && nand->buf_start < nand->buf_c=
ount) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 retval =3D *((u16 *)(nand->data_buff+nand->buf=
_start));
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->buf_start +=3D 2;
>> =A0 =A0 =A0 }
>> =A0 =A0 =A0 return retval;
>> =A0}
>> @@ -720,20 +753,22 @@ static u16 pxa3xx_nand_read_word(struct mtd_info *=
mtd)
>> =A0static void pxa3xx_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, =
int len)
>> =A0{
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> - =A0 =A0 int real_len =3D min_t(size_t, len, info->buf_count - info->bu=
f_start);
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>> + =A0 =A0 int real_len =3D min_t(size_t, len, nand->buf_count - nand->bu=
f_start);
>>
>> - =A0 =A0 memcpy(buf, info->data_buff + info->buf_start, real_len);
>> - =A0 =A0 info->buf_start +=3D real_len;
>> + =A0 =A0 memcpy(buf, nand->data_buff + nand->buf_start, real_len);
>> + =A0 =A0 nand->buf_start +=3D real_len;
>> =A0}
>>
>> =A0static void pxa3xx_nand_write_buf(struct mtd_info *mtd,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8_t *buf, int len)
>> =A0{
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> - =A0 =A0 int real_len =3D min_t(size_t, len, info->buf_count - info->bu=
f_start);
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>> + =A0 =A0 int real_len =3D min_t(size_t, len, nand->buf_count - nand->bu=
f_start);
>>
>> - =A0 =A0 memcpy(info->data_buff + info->buf_start, buf, real_len);
>> - =A0 =A0 info->buf_start +=3D real_len;
>> + =A0 =A0 memcpy(nand->data_buff + nand->buf_start, buf, real_len);
>> + =A0 =A0 nand->buf_start +=3D real_len;
>> =A0}
>>
>> =A0static int pxa3xx_nand_verify_buf(struct mtd_info *mtd,
>> @@ -750,10 +785,11 @@ static void pxa3xx_nand_select_chip(struct mtd_inf=
o *mtd, int chip)
>> =A0static int pxa3xx_nand_waitfunc(struct mtd_info *mtd, struct nand_chi=
p *this)
>> =A0{
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>>
>> =A0 =A0 =A0 /* pxa3xx_nand_send_command has waited for command complete =
*/
>> =A0 =A0 =A0 if (this->state =3D=3D FL_WRITING || this->state =3D=3D FL_E=
RASING) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (info->retcode =3D=3D ERR_NONE)
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (nand->retcode =3D=3D ERR_NONE)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 else {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
>> @@ -770,7 +806,8 @@ static int pxa3xx_nand_waitfunc(struct mtd_info *mtd=
, struct nand_chip *this)
>> =A0static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cons=
t struct pxa3xx_nand_flash *f)
>> =A0{
>> - =A0 =A0 struct platform_device *pdev =3D info->pdev;
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>> + =A0 =A0 struct platform_device *pdev =3D nand->pdev;
>> =A0 =A0 =A0 struct pxa3xx_nand_platform_data *pdata =3D pdev->dev.platfo=
rm_data;
>> =A0 =A0 =A0 uint32_t ndcr =3D 0x0; /* enable all interrupts */
>>
>> @@ -804,6 +841,7 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_na=
nd_info *info,
>> =A0 =A0 =A0 ndcr |=3D NDCR_SPARE_EN; /* enable spare by default */
>>
>> =A0 =A0 =A0 info->reg_ndcr =3D ndcr;
>> + =A0 =A0 info->use_ecc =3D 1;
>>
>> =A0 =A0 =A0 pxa3xx_nand_set_timing(info, f->timing);
>> =A0 =A0 =A0 return 0;
>> @@ -811,15 +849,22 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_=
nand_info *info,
>>
>> =A0static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
>> =A0{
>> - =A0 =A0 uint32_t ndcr =3D nand_readl(info, NDCR);
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>> + =A0 =A0 uint32_t ndcr =3D nand_readl(nand, NDCR);
>> +
>> + =A0 =A0 if (info->chip_select > 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "We could not detect configure=
"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 " if more than=
 one cs is supported!!\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 BUG();
>
> like Daniel already noticed, may be dev_err() is enough?
Would change to dev_err();

>
>> + =A0 =A0 }
>> =A0 =A0 =A0 info->page_size =3D ndcr & NDCR_PAGE_SZ ? 2048 : 512;
>> =A0 =A0 =A0 /* set info fields needed to read id */
>> =A0 =A0 =A0 info->read_id_bytes =3D (info->page_size =3D=3D 2048) ? 4 : =
2;
>> =A0 =A0 =A0 info->reg_ndcr =3D ndcr & ~NDCR_INT_MASK;
>> =A0 =A0 =A0 info->cmdset =3D &default_cmdset;
>>
>> - =A0 =A0 info->ndtr0cs0 =3D nand_readl(info, NDTR0CS0);
>> - =A0 =A0 info->ndtr1cs0 =3D nand_readl(info, NDTR1CS0);
>> + =A0 =A0 info->ndtr0cs0 =3D nand_readl(nand, NDTR0CS0);
>> + =A0 =A0 info->ndtr1cs0 =3D nand_readl(nand, NDTR1CS0);
>>
>> =A0 =A0 =A0 return 0;
>> =A0}
>> @@ -830,50 +875,31 @@ static int pxa3xx_nand_detect_config(struct pxa3xx=
_nand_info *info)
>> =A0 */
>> =A0#define MAX_BUFF_SIZE =A0 =A0 =A0 =A0PAGE_SIZE
>>
>> -static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
>> +static void free_cs_resource(struct pxa3xx_nand_info *info, int cs)
>> =A0{
>> - =A0 =A0 struct platform_device *pdev =3D info->pdev;
>> - =A0 =A0 int data_desc_offset =3D MAX_BUFF_SIZE - sizeof(struct pxa_dma=
_desc);
>> -
>> - =A0 =A0 if (use_dma =3D=3D 0) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->data_buff =3D kmalloc(MAX_BUFF_SIZE, GFP=
_KERNEL);
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (info->data_buff =3D=3D NULL)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> - =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> - =A0 =A0 }
>> -
>> - =A0 =A0 info->data_buff =3D dma_alloc_coherent(&pdev->dev, MAX_BUFF_SI=
ZE,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &info->data_bu=
ff_phys, GFP_KERNEL);
>> - =A0 =A0 if (info->data_buff =3D=3D NULL) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to allocate dma bu=
ffer\n");
>> - =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> - =A0 =A0 }
>> -
>> - =A0 =A0 info->data_buff_size =3D MAX_BUFF_SIZE;
>> - =A0 =A0 info->data_desc =3D (void *)info->data_buff + data_desc_offset=
;
>> - =A0 =A0 info->data_desc_addr =3D info->data_buff_phys + data_desc_offs=
et;
>> + =A0 =A0 struct pxa3xx_nand *nand;
>> + =A0 =A0 struct mtd_info *mtd;
>>
>> - =A0 =A0 info->data_dma_ch =3D pxa_request_dma("nand-data", DMA_PRIO_LO=
W,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_nand_da=
ta_dma_irq, info);
>> - =A0 =A0 if (info->data_dma_ch < 0) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to request data dm=
a\n");
>> - =A0 =A0 =A0 =A0 =A0 =A0 dma_free_coherent(&pdev->dev, info->data_buff_=
size,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->data_buf=
f, info->data_buff_phys);
>> - =A0 =A0 =A0 =A0 =A0 =A0 return info->data_dma_ch;
>> - =A0 =A0 }
>> + =A0 =A0 if (!info)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
>>
>> - =A0 =A0 return 0;
>> + =A0 =A0 nand =3D info->nand_data;
>> + =A0 =A0 mtd =3D get_mtd_by_info(info);
>> + =A0 =A0 kfree(mtd);
>> + =A0 =A0 nand->info[cs] =3D NULL;
>> =A0}
>>
>> =A0static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
>> =A0{
>> - =A0 =A0 struct mtd_info *mtd =3D info->mtd;
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>> + =A0 =A0 struct mtd_info *mtd =3D get_mtd_by_info(info);
>> =A0 =A0 =A0 struct nand_chip *chip =3D mtd->priv;
>>
>> =A0 =A0 =A0 /* use the common timing to make a try */
>> - =A0 =A0 pxa3xx_nand_config_flash(info, &builtin_flash_types[0]);
>> + =A0 =A0 if (pxa3xx_nand_config_flash(info, &builtin_flash_types[0]))
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> =A0 =A0 =A0 chip->cmdfunc(mtd, NAND_CMD_RESET, 0, 0);
>> - =A0 =A0 if (info->is_ready)
>> + =A0 =A0 if (nand->is_ready)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
>> =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>
> I think it is time to change this function return convention to propagate
> errors and not just 0 or 1, (may be in separate patch) what do you think?

How about return 0 when sensing the READY signal, or return -ENODEV?

>
>> @@ -882,7 +908,8 @@ static int pxa3xx_nand_sensing(struct pxa3xx_nand_in=
fo *info)
>> =A0static int pxa3xx_nand_scan(struct mtd_info *mtd)
>> =A0{
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> - =A0 =A0 struct platform_device *pdev =3D info->pdev;
>> + =A0 =A0 struct pxa3xx_nand *nand =3D info->nand_data;
>> + =A0 =A0 struct platform_device *pdev =3D nand->pdev;
>> =A0 =A0 =A0 struct pxa3xx_nand_platform_data *pdata =3D pdev->dev.platfo=
rm_data;
>> =A0 =A0 =A0 struct nand_flash_dev pxa3xx_flash_ids[2], *def =3D NULL;
>> =A0 =A0 =A0 const struct pxa3xx_nand_flash *f =3D NULL;
>> @@ -891,27 +918,25 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>> =A0 =A0 =A0 uint64_t chipsize;
>> =A0 =A0 =A0 int i, ret, num;
>>
>> + =A0 =A0 nand->chip_select =3D info->chip_select;
>> =A0 =A0 =A0 if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto KEEP_CONFIG;
>>
>> =A0 =A0 =A0 ret =3D pxa3xx_nand_sensing(info);
>> =A0 =A0 =A0 if (!ret) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 kfree(mtd);
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->mtd =3D NULL;
>> - =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "There is no nand chip on cs =
0!\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 free_cs_resource(info, nand->chip_select);
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "There is no nand chip on cs =
%d!\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->chip_sel=
ect);
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 chip->cmdfunc(mtd, NAND_CMD_READID, 0, 0);
>> - =A0 =A0 id =3D *((uint16_t *)(info->data_buff));
>> + =A0 =A0 id =3D *((uint16_t *)(nand->data_buff));
>> =A0 =A0 =A0 if (id !=3D 0)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "Detect a flash id %x\n", i=
d);
>> =A0 =A0 =A0 else {
>> - =A0 =A0 =A0 =A0 =A0 =A0 kfree(mtd);
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->mtd =3D NULL;
>> - =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "Read out ID 0, potential =
timing set wrong!!\n");
>
> Is this warning no longer needed?
Would readd it in the next post.

>
>> -
>> + =A0 =A0 =A0 =A0 =A0 =A0 free_cs_resource(info, nand->chip_select);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> =A0 =A0 =A0 }
>>
>> @@ -928,14 +953,16 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 if (i >=3D (ARRAY_SIZE(builtin_flash_types) + pdata->num_fla=
sh - 1)) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 kfree(mtd);
>> - =A0 =A0 =A0 =A0 =A0 =A0 info->mtd =3D NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 free_cs_resource(info, nand->chip_select);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "ERROR!! flash not defined!!=
!\n");
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> =A0 =A0 =A0 }
>>
>> - =A0 =A0 pxa3xx_nand_config_flash(info, f);
>> + =A0 =A0 if (pxa3xx_nand_config_flash(info, f)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "ERROR! Configure failed\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>
> Although, the pxa3xx_nand_config_flash() returns only 0 or -EINVAL,
> it is better to propagate its return value.

Ok, would apply this.

>
>> =A0 =A0 =A0 pxa3xx_flash_ids[0].name =3D f->name;
>> =A0 =A0 =A0 pxa3xx_flash_ids[0].id =3D (f->chip_id >> 8) & 0xffff;
>> =A0 =A0 =A0 pxa3xx_flash_ids[0].pagesize =3D f->page_size;
>> @@ -950,13 +977,13 @@ KEEP_CONFIG:
>> =A0 =A0 =A0 if (nand_scan_ident(mtd, 1, def))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> =A0 =A0 =A0 /* calculate addressing information */
>> + =A0 =A0 nand->oob_buff =3D nand->data_buff + mtd->writesize;
>> =A0 =A0 =A0 info->col_addr_cycles =3D (mtd->writesize >=3D 2048) ? 2 : 1=
;
>> - =A0 =A0 info->oob_buff =3D info->data_buff + mtd->writesize;
>> =A0 =A0 =A0 if ((mtd->size >> chip->page_shift) > 65536)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->row_addr_cycles =3D 3;
>> =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->row_addr_cycles =3D 2;
>> - =A0 =A0 mtd->name =3D mtd_names[0];
>> + =A0 =A0 mtd->name =3D mtd_names[nand->chip_select];
>> =A0 =A0 =A0 chip->ecc.mode =3D NAND_ECC_HW;
>> =A0 =A0 =A0 chip->ecc.size =3D info->page_size;
>>
>> @@ -967,51 +994,33 @@ KEEP_CONFIG:
>> =A0 =A0 =A0 return nand_scan_tail(mtd);
>> =A0}
>>
>> -static
>> -struct pxa3xx_nand_info *alloc_nand_resource(struct platform_device *pd=
ev)
>> +static int alloc_nand_resource(struct platform_device *pdev)
>> =A0{
>> + =A0 =A0 struct pxa3xx_nand_platform_data *pdata;
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info;
>> =A0 =A0 =A0 struct nand_chip *chip;
>> =A0 =A0 =A0 struct mtd_info *mtd;
>> + =A0 =A0 struct pxa3xx_nand *nand;
>> =A0 =A0 =A0 struct resource *r;
>> - =A0 =A0 int ret, irq;
>> + =A0 =A0 int ret, irq, cs;
>> + =A0 =A0 int data_desc_offset =3D MAX_BUFF_SIZE - sizeof(struct pxa_dma=
_desc);
>>
>> - =A0 =A0 mtd =3D kzalloc(sizeof(struct mtd_info) + sizeof(struct pxa3xx=
_nand_info),
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP_KERNEL);
>> - =A0 =A0 if (!mtd) {
>> + =A0 =A0 pdata =3D pdev->dev.platform_data;
>> + =A0 =A0 nand =3D kzalloc(sizeof(struct mtd_info)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + sizeof(struct pxa3xx_nand_in=
fo), GFP_KERNEL);
>> + =A0 =A0 if (!nand) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to allocate memo=
ry\n");
>> - =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> =A0 =A0 =A0 }
>>
>> - =A0 =A0 info =3D (struct pxa3xx_nand_info *)(&mtd[1]);
>> - =A0 =A0 chip =3D (struct nand_chip *)(&mtd[1]);
>> - =A0 =A0 info->pdev =3D pdev;
>> - =A0 =A0 info->mtd =3D mtd;
>> - =A0 =A0 mtd->priv =3D info;
>> - =A0 =A0 mtd->owner =3D THIS_MODULE;
>> -
>> - =A0 =A0 chip->ecc.read_page =A0 =A0 =3D pxa3xx_nand_read_page_hwecc;
>> - =A0 =A0 chip->ecc.write_page =A0 =A0=3D pxa3xx_nand_write_page_hwecc;
>> - =A0 =A0 chip->controller =A0 =A0 =A0 =A0=3D &info->controller;
>> - =A0 =A0 chip->waitfunc =A0 =A0 =A0 =A0 =A0=3D pxa3xx_nand_waitfunc;
>> - =A0 =A0 chip->select_chip =A0 =A0 =A0 =3D pxa3xx_nand_select_chip;
>> - =A0 =A0 chip->dev_ready =A0 =A0 =A0 =A0 =3D pxa3xx_nand_dev_ready;
>> - =A0 =A0 chip->cmdfunc =A0 =A0 =A0 =A0 =A0 =3D pxa3xx_nand_cmdfunc;
>> - =A0 =A0 chip->read_word =A0 =A0 =A0 =A0 =3D pxa3xx_nand_read_word;
>> - =A0 =A0 chip->read_byte =A0 =A0 =A0 =A0 =3D pxa3xx_nand_read_byte;
>> - =A0 =A0 chip->read_buf =A0 =A0 =A0 =A0 =A0=3D pxa3xx_nand_read_buf;
>> - =A0 =A0 chip->write_buf =A0 =A0 =A0 =A0 =3D pxa3xx_nand_write_buf;
>> - =A0 =A0 chip->verify_buf =A0 =A0 =A0 =A0=3D pxa3xx_nand_verify_buf;
>> -
>> - =A0 =A0 spin_lock_init(&chip->controller->lock);
>> - =A0 =A0 init_waitqueue_head(&chip->controller->wq);
>> - =A0 =A0 info->clk =3D clk_get(&pdev->dev, NULL);
>> - =A0 =A0 if (IS_ERR(info->clk)) {
>> + =A0 =A0 nand->pdev =3D pdev;
>> + =A0 =A0 nand->clk =3D clk_get(&pdev->dev, NULL);
>> + =A0 =A0 if (IS_ERR(nand->clk)) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to get nand cloc=
k\n");
>> - =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(info->clk);
>> - =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_mtd;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(nand->clk);
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto fail_alloc;
>> =A0 =A0 =A0 }
>> - =A0 =A0 clk_enable(info->clk);
>> + =A0 =A0 clk_enable(nand->clk);
>>
>> =A0 =A0 =A0 r =3D platform_get_resource(pdev, IORESOURCE_DMA, 0);
>> =A0 =A0 =A0 if (r =3D=3D NULL) {
>> @@ -1019,7 +1028,7 @@ struct pxa3xx_nand_info *alloc_nand_resource(struc=
t platform_device *pdev)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_put_clk;
>> =A0 =A0 =A0 }
>> - =A0 =A0 info->drcmr_dat =3D r->start;
>> + =A0 =A0 nand->drcmr_dat =3D r->start;
>>
>> =A0 =A0 =A0 r =3D platform_get_resource(pdev, IORESOURCE_DMA, 1);
>> =A0 =A0 =A0 if (r =3D=3D NULL) {
>> @@ -1027,7 +1036,7 @@ struct pxa3xx_nand_info *alloc_nand_resource(struc=
t platform_device *pdev)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_put_clk;
>> =A0 =A0 =A0 }
>> - =A0 =A0 info->drcmr_cmd =3D r->start;
>> + =A0 =A0 nand->drcmr_cmd =3D r->start;
>>
>> =A0 =A0 =A0 irq =3D platform_get_irq(pdev, 0);
>> =A0 =A0 =A0 if (irq < 0) {
>> @@ -1050,81 +1059,147 @@ struct pxa3xx_nand_info *alloc_nand_resource(st=
ruct platform_device *pdev)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_put_clk;
>> =A0 =A0 =A0 }
>>
>> - =A0 =A0 info->mmio_base =3D ioremap(r->start, resource_size(r));
>> - =A0 =A0 if (info->mmio_base =3D=3D NULL) {
>> + =A0 =A0 nand->mmio_base =3D ioremap(r->start, resource_size(r));
>> + =A0 =A0 if (nand->mmio_base =3D=3D NULL) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "ioremap() failed\n");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_res;
>> =A0 =A0 =A0 }
>> - =A0 =A0 info->mmio_phys =3D r->start;
>> -
>> - =A0 =A0 ret =3D pxa3xx_nand_init_buff(info);
>> - =A0 =A0 if (ret)
>> - =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_io;
>> + =A0 =A0 nand->mmio_phys =3D r->start;
>>
>> =A0 =A0 =A0 /* initialize all interrupts to be disabled */
>> - =A0 =A0 disable_int(info, NDSR_MASK);
>> + =A0 =A0 disable_int(nand, NDSR_MASK);
>>
>> =A0 =A0 =A0 ret =3D request_irq(irq, pxa3xx_nand_irq, IRQF_DISABLED,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdev->name, info);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdev->name, nand);
>> =A0 =A0 =A0 if (ret < 0) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to request IRQ\n=
");
>> - =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_buf;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_io;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 platform_set_drvdata(pdev, nand);
>> +
>> + =A0 =A0 spin_lock_init(&nand->controller.lock);
>> + =A0 =A0 init_waitqueue_head(&nand->controller.wq);
>> + =A0 =A0 for (cs =3D 0; cs < pdata->cs_num; cs++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 mtd =3D kzalloc(sizeof(struct mtd_info)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + sizeof(struc=
t pxa3xx_nand_info),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP_KERNEL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!mtd) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to=
 allocate memory\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_irq;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 info =3D (struct pxa3xx_nand_info *)(&mtd[1]);
>> + =A0 =A0 =A0 =A0 =A0 =A0 info->nand_data =3D nand;
>> + =A0 =A0 =A0 =A0 =A0 =A0 info->chip_select =3D cs;
>> + =A0 =A0 =A0 =A0 =A0 =A0 mtd->priv =3D info;
>> + =A0 =A0 =A0 =A0 =A0 =A0 mtd->owner =3D THIS_MODULE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->info[cs] =3D info;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip =3D (struct nand_chip *)(&mtd[1]);
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->controller =A0 =A0 =A0 =A0=3D &nand->con=
troller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.read_page =A0 =A0 =3D pxa3xx_nand_re=
ad_page_hwecc;
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page =A0 =A0=3D pxa3xx_nand_wr=
ite_page_hwecc;
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->waitfunc =A0 =A0 =A0 =A0 =A0=3D pxa3xx_n=
and_waitfunc;
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->select_chip =A0 =A0 =A0 =3D pxa3xx_nand_=
select_chip;
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->cmdfunc =A0 =A0 =A0 =A0 =A0 =3D pxa3xx_n=
and_cmdfunc;
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->read_word =A0 =A0 =A0 =A0 =3D pxa3xx_nan=
d_read_word;
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->read_byte =A0 =A0 =A0 =A0 =3D pxa3xx_nan=
d_read_byte;
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf =A0 =A0 =A0 =A0 =A0=3D pxa3xx_n=
and_read_buf;
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf =A0 =A0 =A0 =A0 =3D pxa3xx_nan=
d_write_buf;
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->verify_buf =A0 =A0 =A0 =A0=3D pxa3xx_nan=
d_verify_buf;
>> =A0 =A0 =A0 }
>>
>> - =A0 =A0 platform_set_drvdata(pdev, info);
>> + =A0 =A0 if (use_dma =3D=3D 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 nand->data_buff =3D kmalloc(MAX_BUFF_SIZE, GFP=
_KERNEL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (nand->data_buff =3D=3D NULL) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_buf;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto success_exit;
>> + =A0 =A0 }
>>
>> - =A0 =A0 return info;
>> + =A0 =A0 nand->data_buff =3D dma_alloc_coherent(&pdev->dev, MAX_BUFF_SI=
ZE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &nand->data_buff_phys, GFP_KER=
NEL);
>> + =A0 =A0 if (nand->data_buff =3D=3D NULL) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to allocate dma bu=
ffer\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_buf;
>> + =A0 =A0 }
>>
>> + =A0 =A0 nand->data_desc =3D (void *)nand->data_buff + data_desc_offset=
;
>> + =A0 =A0 nand->data_desc_addr =3D nand->data_buff_phys + data_desc_offs=
et;
>> + =A0 =A0 nand->data_dma_ch =3D pxa_request_dma("nand-data", DMA_PRIO_LO=
W,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_nand_data_dma_irq, nand=
);
>> + =A0 =A0 if (nand->data_dma_ch < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to request data dm=
a\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto fail_free_dma_buf;
>> + =A0 =A0 }
>> +success_exit:
>> + =A0 =A0 return 0;
>> +
>> +fail_free_dma_buf:
>> + =A0 =A0 dma_free_writecombine(&pdev->dev, MAX_BUFF_SIZE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->data_buff, nand->data_bu=
ff_phys);
>> =A0fail_free_buf:
>> - =A0 =A0 free_irq(irq, info);
>> - =A0 =A0 if (use_dma) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 pxa_free_dma(info->data_dma_ch);
>> - =A0 =A0 =A0 =A0 =A0 =A0 dma_free_coherent(&pdev->dev, info->data_buff_=
size,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->data_buff, info->data_bu=
ff_phys);
>> - =A0 =A0 } else
>> - =A0 =A0 =A0 =A0 =A0 =A0 kfree(info->data_buff);
>> + =A0 =A0 for (cs =3D 0; cs < pdata->cs_num; cs++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 info =3D nand->info[cs];
>> + =A0 =A0 =A0 =A0 =A0 =A0 free_cs_resource(info, cs);
>> + =A0 =A0 }
>> +fail_free_irq:
>> + =A0 =A0 free_irq(irq, nand);
>> =A0fail_free_io:
>> - =A0 =A0 iounmap(info->mmio_base);
>> + =A0 =A0 iounmap(nand->mmio_base);
>> =A0fail_free_res:
>> =A0 =A0 =A0 release_mem_region(r->start, resource_size(r));
>> =A0fail_put_clk:
>> - =A0 =A0 clk_disable(info->clk);
>> - =A0 =A0 clk_put(info->clk);
>> -fail_free_mtd:
>> - =A0 =A0 kfree(mtd);
>> - =A0 =A0 return NULL;
>> + =A0 =A0 clk_disable(nand->clk);
>> + =A0 =A0 clk_put(nand->clk);
>> +fail_alloc:
>> + =A0 =A0 kfree(nand);
>> + =A0 =A0 return ret;
>> =A0}
>>
>> =A0static int pxa3xx_nand_remove(struct platform_device *pdev)
>> =A0{
>> - =A0 =A0 struct pxa3xx_nand_info *info =3D platform_get_drvdata(pdev);
>> - =A0 =A0 struct mtd_info *mtd =3D info->mtd;
>> + =A0 =A0 struct pxa3xx_nand *nand =3D platform_get_drvdata(pdev);
>> + =A0 =A0 struct pxa3xx_nand_platform_data *pdata;
>> + =A0 =A0 struct pxa3xx_nand_info *info;
>> + =A0 =A0 struct mtd_info *mtd;
>> =A0 =A0 =A0 struct resource *r;
>> - =A0 =A0 int irq;
>> + =A0 =A0 int irq, cs;
>>
>> =A0 =A0 =A0 platform_set_drvdata(pdev, NULL);
>> + =A0 =A0 pdata =3D pdev->dev.platform_data;
>>
>> =A0 =A0 =A0 irq =3D platform_get_irq(pdev, 0);
>> =A0 =A0 =A0 if (irq >=3D 0)
>> - =A0 =A0 =A0 =A0 =A0 =A0 free_irq(irq, info);
>> + =A0 =A0 =A0 =A0 =A0 =A0 free_irq(irq, nand);
>> =A0 =A0 =A0 if (use_dma) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 pxa_free_dma(info->data_dma_ch);
>> - =A0 =A0 =A0 =A0 =A0 =A0 dma_free_writecombine(&pdev->dev, info->data_b=
uff_size,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->data_buf=
f, info->data_buff_phys);
>> + =A0 =A0 =A0 =A0 =A0 =A0 pxa_free_dma(nand->data_dma_ch);
>> + =A0 =A0 =A0 =A0 =A0 =A0 dma_free_writecombine(&pdev->dev, MAX_BUFF_SIZ=
E,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand->data_buf=
f, nand->data_buff_phys);
>> =A0 =A0 =A0 } else
>> - =A0 =A0 =A0 =A0 =A0 =A0 kfree(info->data_buff);
>> + =A0 =A0 =A0 =A0 =A0 =A0 kfree(nand->data_buff);
>>
>> - =A0 =A0 iounmap(info->mmio_base);
>> + =A0 =A0 iounmap(nand->mmio_base);
>> =A0 =A0 =A0 r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> =A0 =A0 =A0 release_mem_region(r->start, resource_size(r));
>>
>> - =A0 =A0 clk_disable(info->clk);
>> - =A0 =A0 clk_put(info->clk);
>> + =A0 =A0 clk_disable(nand->clk);
>> + =A0 =A0 clk_put(nand->clk);
>>
>> - =A0 =A0 if (mtd) {
>> + =A0 =A0 for (cs =3D 0; cs < pdata->cs_num; cs++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 info =3D nand->info[cs];
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!info)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 mtd =3D get_mtd_by_info(info);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd_device_unregister(mtd);
>> - =A0 =A0 =A0 =A0 =A0 =A0 kfree(mtd);
>> + =A0 =A0 =A0 =A0 =A0 =A0 free_cs_resource(info, cs);
>> =A0 =A0 =A0 }
>> =A0 =A0 =A0 return 0;
>> =A0}
>> @@ -1134,34 +1209,54 @@ static int pxa3xx_nand_probe(struct platform_dev=
ice *pdev)
>> =A0 =A0 =A0 struct pxa3xx_nand_platform_data *pdata;
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info;
>>
>> + =A0 =A0 struct pxa3xx_nand *nand;
>> + =A0 =A0 struct mtd_info *mtd;
>> + =A0 =A0 int cs, ret, nr_parts, probe_success;
>> +
>> + =A0 =A0 probe_success =3D 0;
>
> Can this be done along with declaration?
Ok, would apply to the next post.

>
>> =A0 =A0 =A0 pdata =3D pdev->dev.platform_data;
>> =A0 =A0 =A0 if (!pdata) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "no platform data define=
d\n");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> =A0 =A0 =A0 }
>>
>> - =A0 =A0 info =3D alloc_nand_resource(pdev);
>> - =A0 =A0 if (info =3D=3D NULL)
>> + =A0 =A0 ret =3D alloc_nand_resource(pdev);
>> + =A0 =A0 if (ret)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>
> Why not propagate the return value of alloc_nand_resource()?

Would apply propagate error to the next post.

>
>>
>> - =A0 =A0 if (pxa3xx_nand_scan(info->mtd)) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to scan nand\n");
>> - =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_nand_remove(pdev);
>> - =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> - =A0 =A0 }
>> + =A0 =A0 nand =3D platform_get_drvdata(pdev);
>> + =A0 =A0 for (cs =3D 0; cs < pdata->cs_num; cs++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 info =3D nand->info[cs];
>> + =A0 =A0 =A0 =A0 =A0 =A0 mtd =3D get_mtd_by_info(info);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (pxa3xx_nand_scan(mtd)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to=
 scan nand\n");
>
> I think, it would be useful also to print here the return value of pxa3xx=
_nand_scan().
Ok, would apply to the next post

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nr_parts =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (mtd_has_cmdlinepart()) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *probes[] =3D { "cm=
dlinepart", NULL };
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mtd_partition *parts;
>>
>> - =A0 =A0 if (mtd_has_cmdlinepart()) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 const char *probes[] =3D { "cmdlinepart", NULL=
 };
>> - =A0 =A0 =A0 =A0 =A0 =A0 struct mtd_partition *parts;
>> - =A0 =A0 =A0 =A0 =A0 =A0 int nr_parts;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nr_parts =3D parse_mtd_partiti=
ons(mtd, probes, &parts, 0);
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 nr_parts =3D parse_mtd_partitions(info->mtd, p=
robes, &parts, 0);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (nr_parts)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D mtd_de=
vice_register(mtd, parts, nr_parts);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (nr_parts)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return mtd_device_register(inf=
o->mtd, parts, nr_parts);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!nr_parts)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D mtd_device_register(mt=
d, pdata->parts[cs],
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pdata->nr_parts[cs]);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!ret)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 probe_success =3D 1;
>> =A0 =A0 =A0 }
>>
>> - =A0 =A0 return mtd_device_register(info->mtd, pdata->parts, pdata->nr_=
parts);
>> + =A0 =A0 if (!probe_success) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_nand_remove(pdev);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> + =A0 =A0 } else
>
> You don't need this else statement

Would apply to the next post.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> =A0}
>>
>> =A0#ifdef CONFIG_PM
>> @@ -1183,8 +1278,8 @@ static int pxa3xx_nand_resume(struct platform_devi=
ce *pdev)
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D platform_get_drvdata(pdev)=
;
>> =A0 =A0 =A0 struct mtd_info *mtd =3D info->mtd;
>>
>> - =A0 =A0 nand_writel(info, NDTR0CS0, info->ndtr0cs0);
>> - =A0 =A0 nand_writel(info, NDTR1CS0, info->ndtr1cs0);
>> + =A0 =A0 nand_writel(nand, NDTR0CS0, info->ndtr0cs0);
>> + =A0 =A0 nand_writel(nand, NDTR1CS0, info->ndtr1cs0);
>> =A0 =A0 =A0 clk_enable(info->clk);
>>
>> =A0 =A0 =A0 return 0;
>
> I won't be able to test the patch in the near future, sorry...
>

Thanks for comments.

Best regards,
Lei
