Subject: Re: [PATCH v1 2/2] mtd: nand: mediatek: add support for MT2712 NFC
 and ECC
To: Xiaolei Li <xiaolei.li@mediatek.com>, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
 rogercc.lin@mediatek.com, yt.shen@mediatek.com, srv_heupstream@mediatek.com
References: <1494487532-36594-1-git-send-email-xiaolei.li@mediatek.com>
 <1494487532-36594-3-git-send-email-xiaolei.li@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <fec726ee-86f4-4370-2517-0a1e4dc280d2@gmail.com>
Date: Thu, 11 May 2017 10:21:36 +0200
MIME-Version: 1.0
In-Reply-To: <1494487532-36594-3-git-send-email-xiaolei.li@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 11/05/17 09:25, Xiaolei Li wrote:
> MT2712 NFC and ECC HW are similar to MT2701 except those following:
> (1) MT2712 NFC supports up to 148B spare size per sector.
> (2) MT2712 ECC supports up to 80 bit ecc strength.
> (3) MT2712 ECC can only generate one ecc irq per page, but MT2701 ECC
>      generates (pagesize) / (ecc_size) irqs per page.
> (4) MT2712 ECC parity data registers's offset is different with MT2701.
> 
> Changes in this patch are:
> (1) add new enmu mtk_nfc_spare_format to list all spare format.
> (2) add new struct mtk_nfc_devdata to support different spare format
>      and size.
> (3) add new struct mtk_ecc_devdata to support different ecc strength,
>      different ecc parity register's offset, and page irq function select.
> (4) malloc ecc->eccdata buffer according to max_ecc_strength of this IP.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>

I had a quick look on this patch and I think it should at least be split 
up in two. One that adds mtk_ecc_devdata, mtk_nfc_spare_format and other 
changes needed to support other devices. And a second patch on top of 
this which actually introduces support for mt2712.

A few more comments inline.

> ---
>   drivers/mtd/nand/mtk_ecc.c  | 107 +++++++++++++++++++-----
>   drivers/mtd/nand/mtk_ecc.h  |   2 +-
>   drivers/mtd/nand/mtk_nand.c | 198 +++++++++++++++++++++++++++++++++-----------
>   3 files changed, 239 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
> index dbf2562..77c593d 100644
> --- a/drivers/mtd/nand/mtk_ecc.c
> +++ b/drivers/mtd/nand/mtk_ecc.c
> @@ -28,6 +28,7 @@
>   
>   #define ECC_IDLE_MASK		BIT(0)
>   #define ECC_IRQ_EN		BIT(0)
> +#define ECC_PG_IRQ_SEL		BIT(1)
>   #define ECC_OP_ENABLE		(1)
>   #define ECC_OP_DISABLE		(0)
>   
> @@ -53,11 +54,14 @@
>   #define		ECC_CNFG_52BIT		(0x11)
>   #define		ECC_CNFG_56BIT		(0x12)
>   #define		ECC_CNFG_60BIT		(0x13)
> +#define		ECC_CNFG_68BIT		(0x14)
> +#define		ECC_CNFG_72BIT		(0x15)
> +#define		ECC_CNFG_80BIT		(0x16)
>   #define		ECC_MODE_SHIFT		(5)
>   #define		ECC_MS_SHIFT		(16)
>   #define ECC_ENCDIADDR		(0x08)
>   #define ECC_ENCIDLE		(0x0C)
> -#define ECC_ENCPAR(x)		(0x10 + (x) * sizeof(u32))
> +#define ECC_ENCPAR0		(ecc->devdata->encode_parity_reg0)

Please don't hide access to data structures in a define, just use it 
directly in the code.

>   #define ECC_ENCIRQ_EN		(0x80)
>   #define ECC_ENCIRQ_STA		(0x84)
>   #define ECC_DECCON		(0x100)
> @@ -66,7 +70,7 @@
>   #define		DEC_CNFG_CORRECT	(0x3 << 12)
>   #define ECC_DECIDLE		(0x10C)
>   #define ECC_DECENUM0		(0x114)
> -#define		ERR_MASK		(0x3f)
> +#define		ERR_MASK		(ecc->devdata->err_mask)

Same here.

Regards,
Matthias

>   #define ECC_DECDONE		(0x124)
>   #define ECC_DECIRQ_EN		(0x200)
>   #define ECC_DECIRQ_STA		(0x204)
> @@ -78,8 +82,16 @@
>   #define ECC_IRQ_REG(op)		((op) == ECC_ENCODE ? \
>   					ECC_ENCIRQ_EN : ECC_DECIRQ_EN)
>   
> +struct mtk_ecc_devdata {
> +	u32 encode_parity_reg0;
> +	u32 err_mask;
> +	int pg_irq_sel;
> +	u8 max_ecc_strength;
> +};
> +
>   struct mtk_ecc {
>   	struct device *dev;
> +	const struct mtk_ecc_devdata *devdata;
>   	void __iomem *regs;
>   	struct clk *clk;
>   
> @@ -87,7 +99,7 @@ struct mtk_ecc {
>   	struct mutex lock;
>   	u32 sectors;
>   
> -	u8 eccdata[112];
> +	u8 *eccdata;
>   };
>   
>   static inline void mtk_ecc_wait_idle(struct mtk_ecc *ecc,
> @@ -202,6 +214,15 @@ static void mtk_ecc_config(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
>   	case 60:
>   		ecc_bit = ECC_CNFG_60BIT;
>   		break;
> +	case 68:
> +		ecc_bit = ECC_CNFG_68BIT;
> +		break;
> +	case 72:
> +		ecc_bit = ECC_CNFG_72BIT;
> +		break;
> +	case 80:
> +		ecc_bit = ECC_CNFG_80BIT;
> +		break;
>   	default:
>   		dev_err(ecc->dev, "invalid strength %d, default to 4 bits\n",
>   			config->strength);
> @@ -313,6 +334,7 @@ struct mtk_ecc *of_mtk_ecc_get(struct device_node *of_node)
>   int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
>   {
>   	enum mtk_ecc_operation op = config->op;
> +	u16 reg_val;
>   	int ret;
>   
>   	ret = mutex_lock_interruptible(&ecc->lock);
> @@ -326,7 +348,15 @@ int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
>   	writew(ECC_OP_ENABLE, ecc->regs + ECC_CTL_REG(op));
>   
>   	init_completion(&ecc->done);
> -	writew(ECC_IRQ_EN, ecc->regs + ECC_IRQ_REG(op));
> +	reg_val = ECC_IRQ_EN;
> +	/*
> +	 * For ECC_NFI_MODE, if ecc->devdata->pg_irq_sel is 1, then it
> +	 * means this chip can only generate one ecc irq during page
> +	 * read / write. If is 0, generate one ecc irq each ecc step.
> +	 */
> +	if ((ecc->devdata->pg_irq_sel) && (config->mode == ECC_NFI_MODE))
> +		reg_val |= ECC_PG_IRQ_SEL;
> +	writew(reg_val, ecc->regs + ECC_IRQ_REG(op));
>   
>   	return 0;
>   }
> @@ -396,7 +426,8 @@ int mtk_ecc_encode(struct mtk_ecc *ecc, struct mtk_ecc_config *config,
>   	len = (config->strength * ECC_PARITY_BITS + 7) >> 3;
>   
>   	/* write the parity bytes generated by the ECC back to temp buffer */
> -	__ioread32_copy(ecc->eccdata, ecc->regs + ECC_ENCPAR(0), round_up(len, 4));
> +	__ioread32_copy(ecc->eccdata, ecc->regs + ECC_ENCPAR0,
> +				round_up(len, 4));
>   
>   	/* copy into possibly unaligned OOB region with actual length */
>   	memcpy(data + bytes, ecc->eccdata, len);
> @@ -409,37 +440,80 @@ int mtk_ecc_encode(struct mtk_ecc *ecc, struct mtk_ecc_config *config,
>   }
>   EXPORT_SYMBOL(mtk_ecc_encode);
>   
> -void mtk_ecc_adjust_strength(u32 *p)
> +void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p)
>   {
> -	u32 ecc[] = {4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
> -			40, 44, 48, 52, 56, 60};
> +	u32 ecc_level[] = {4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
> +			40, 44, 48, 52, 56, 60, 68, 72, 80};
>   	int i;
>   
> -	for (i = 0; i < ARRAY_SIZE(ecc); i++) {
> -		if (*p <= ecc[i]) {
> +	if (*p >= ecc->devdata->max_ecc_strength) {
> +		*p = ecc->devdata->max_ecc_strength;
> +		return;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(ecc_level); i++) {
> +		if (*p <= ecc_level[i]) {
>   			if (!i)
> -				*p = ecc[i];
> -			else if (*p != ecc[i])
> -				*p = ecc[i - 1];
> +				*p = ecc_level[i];
> +			else if (*p != ecc_level[i])
> +				*p = ecc_level[i - 1];
>   			return;
>   		}
>   	}
>   
> -	*p = ecc[ARRAY_SIZE(ecc) - 1];
> +	*p = ecc_level[ARRAY_SIZE(ecc_level) - 1];
>   }
>   EXPORT_SYMBOL(mtk_ecc_adjust_strength);
>   
> +static const struct mtk_ecc_devdata mtk_ecc_devdata_mt2701 = {
> +	.encode_parity_reg0 = 0x10,
> +	.err_mask = 0x3f,
> +	.pg_irq_sel = 0,
> +	.max_ecc_strength = 60,
> +};
> +
> +static const struct mtk_ecc_devdata mtk_ecc_devdata_mt2712 = {
> +	.encode_parity_reg0 = 0x300,
> +	.err_mask = 0x7f,
> +	.pg_irq_sel = 1,
> +	.max_ecc_strength = 80,
> +};
> +
> +static const struct of_device_id mtk_ecc_dt_match[] = {
> +	{
> +		.compatible = "mediatek,mt2701-ecc",
> +		.data = &mtk_ecc_devdata_mt2701,
> +	}, {
> +		.compatible = "mediatek,mt2712-ecc",
> +		.data = &mtk_ecc_devdata_mt2712,
> +	},
> +	{},
> +};
> +
>   static int mtk_ecc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_ecc *ecc;
>   	struct resource *res;
> +	const struct of_device_id *of_ecc_id = NULL;
> +	u32 temp;
>   	int irq, ret;
>   
>   	ecc = devm_kzalloc(dev, sizeof(*ecc), GFP_KERNEL);
>   	if (!ecc)
>   		return -ENOMEM;
>   
> +	of_ecc_id = of_match_device(mtk_ecc_dt_match, &pdev->dev);
> +	if (!of_ecc_id)
> +		return -ENODEV;
> +	ecc->devdata = (struct mtk_ecc_devdata *)of_ecc_id->data;
> +
> +	temp = (ecc->devdata->max_ecc_strength * ECC_PARITY_BITS + 7) >> 3;
> +	temp = round_up(temp, 4);
> +	ecc->eccdata = devm_kzalloc(dev, temp, GFP_KERNEL);
> +	if (!ecc->eccdata)
> +		return -ENOMEM;
> +
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	ecc->regs = devm_ioremap_resource(dev, res);
>   	if (IS_ERR(ecc->regs)) {
> @@ -508,11 +582,6 @@ static int mtk_ecc_resume(struct device *dev)
>   static SIMPLE_DEV_PM_OPS(mtk_ecc_pm_ops, mtk_ecc_suspend, mtk_ecc_resume);
>   #endif
>   
> -static const struct of_device_id mtk_ecc_dt_match[] = {
> -	{ .compatible = "mediatek,mt2701-ecc" },
> -	{},
> -};
> -
>   MODULE_DEVICE_TABLE(of, mtk_ecc_dt_match);
>   
>   static struct platform_driver mtk_ecc_driver = {
> diff --git a/drivers/mtd/nand/mtk_ecc.h b/drivers/mtd/nand/mtk_ecc.h
> index cbeba5c..d245c14 100644
> --- a/drivers/mtd/nand/mtk_ecc.h
> +++ b/drivers/mtd/nand/mtk_ecc.h
> @@ -42,7 +42,7 @@ struct mtk_ecc_config {
>   int mtk_ecc_wait_done(struct mtk_ecc *, enum mtk_ecc_operation);
>   int mtk_ecc_enable(struct mtk_ecc *, struct mtk_ecc_config *);
>   void mtk_ecc_disable(struct mtk_ecc *);
> -void mtk_ecc_adjust_strength(u32 *);
> +void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p);
>   
>   struct mtk_ecc *of_mtk_ecc_get(struct device_node *);
>   void mtk_ecc_release(struct mtk_ecc *);
> diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
> index 6c517c6..5bdeace 100644
> --- a/drivers/mtd/nand/mtk_nand.c
> +++ b/drivers/mtd/nand/mtk_nand.c
> @@ -24,6 +24,7 @@
>   #include <linux/module.h>
>   #include <linux/iopoll.h>
>   #include <linux/of.h>
> +#include <linux/of_device.h>
>   #include "mtk_ecc.h"
>   
>   /* NAND controller register definition */
> @@ -38,23 +39,6 @@
>   #define NFI_PAGEFMT		(0x04)
>   #define		PAGEFMT_FDM_ECC_SHIFT	(12)
>   #define		PAGEFMT_FDM_SHIFT	(8)
> -#define		PAGEFMT_SPARE_16	(0)
> -#define		PAGEFMT_SPARE_26	(1)
> -#define		PAGEFMT_SPARE_27	(2)
> -#define		PAGEFMT_SPARE_28	(3)
> -#define		PAGEFMT_SPARE_32	(4)
> -#define		PAGEFMT_SPARE_36	(5)
> -#define		PAGEFMT_SPARE_40	(6)
> -#define		PAGEFMT_SPARE_44	(7)
> -#define		PAGEFMT_SPARE_48	(8)
> -#define		PAGEFMT_SPARE_49	(9)
> -#define		PAGEFMT_SPARE_50	(0xa)
> -#define		PAGEFMT_SPARE_51	(0xb)
> -#define		PAGEFMT_SPARE_52	(0xc)
> -#define		PAGEFMT_SPARE_62	(0xd)
> -#define		PAGEFMT_SPARE_63	(0xe)
> -#define		PAGEFMT_SPARE_64	(0xf)
> -#define		PAGEFMT_SPARE_SHIFT	(4)
>   #define		PAGEFMT_SEC_SEL_512	BIT(2)
>   #define		PAGEFMT_512_2K		(0)
>   #define		PAGEFMT_2K_4K		(1)
> @@ -116,6 +100,11 @@
>   #define MTK_MAX_SECTOR		(16)
>   #define MTK_NAND_MAX_NSELS	(2)
>   
> +struct mtk_nfc_devdata {
> +	const u32 *spare_format;
> +	const u8 *spare_size;
> +};
> +
>   struct mtk_nfc_bad_mark_ctl {
>   	void (*bm_swap)(struct mtd_info *, u8 *buf, int raw);
>   	u32 sec;
> @@ -155,6 +144,7 @@ struct mtk_nfc {
>   	struct mtk_ecc *ecc;
>   
>   	struct device *dev;
> +	struct mtk_nfc_devdata *devdata;
>   	void __iomem *regs;
>   
>   	struct completion done;
> @@ -163,6 +153,86 @@ struct mtk_nfc {
>   	u8 *buffer;
>   };
>   
> +/* NFC Page Format Control Register Spare Size Field Definition */
> +enum mtk_nfc_spare_format {
> +	PAGEFMT_SPARE_16,
> +	PAGEFMT_SPARE_26,
> +	PAGEFMT_SPARE_27,
> +	PAGEFMT_SPARE_28,
> +	PAGEFMT_SPARE_32,
> +	PAGEFMT_SPARE_36,
> +	PAGEFMT_SPARE_40,
> +	PAGEFMT_SPARE_44,
> +	PAGEFMT_SPARE_48,
> +	PAGEFMT_SPARE_49,
> +	PAGEFMT_SPARE_50,
> +	PAGEFMT_SPARE_51,
> +	PAGEFMT_SPARE_52,
> +	PAGEFMT_SPARE_61,
> +	PAGEFMT_SPARE_62,
> +	PAGEFMT_SPARE_63,
> +	PAGEFMT_SPARE_64,
> +	PAGEFMT_SPARE_67,
> +	PAGEFMT_SPARE_74,
> +};
> +
> +static const u32 mtk_nfc_spare_format_mt2701[] = {
> +	[PAGEFMT_SPARE_16]	= (0 << 4),
> +	[PAGEFMT_SPARE_26]	= (1 << 4),
> +	[PAGEFMT_SPARE_27]	= (2 << 4),
> +	[PAGEFMT_SPARE_28]	= (3 << 4),
> +	[PAGEFMT_SPARE_32]	= (4 << 4),
> +	[PAGEFMT_SPARE_36]	= (5 << 4),
> +	[PAGEFMT_SPARE_40]	= (6 << 4),
> +	[PAGEFMT_SPARE_44]	= (7 << 4),
> +	[PAGEFMT_SPARE_48]	= (8 << 4),
> +	[PAGEFMT_SPARE_49]	= (9 << 4),
> +	[PAGEFMT_SPARE_50]	= (10 << 4),
> +	[PAGEFMT_SPARE_51]	= (11 << 4),
> +	[PAGEFMT_SPARE_52]	= (12 << 4),
> +	[PAGEFMT_SPARE_61]	= (0 << 4),
> +	[PAGEFMT_SPARE_62]	= (13 << 4),
> +	[PAGEFMT_SPARE_63]	= (14 << 4),
> +	[PAGEFMT_SPARE_64]	= (15 << 4),
> +	[PAGEFMT_SPARE_67]	= (0 << 4),
> +	[PAGEFMT_SPARE_74]	= (0 << 4),
> +};
> +
> +static const u32 mtk_nfc_spare_format_mt2712[] = {
> +	[PAGEFMT_SPARE_16]	= (0 << 16),
> +	[PAGEFMT_SPARE_26]	= (1 << 16),
> +	[PAGEFMT_SPARE_27]	= (2 << 16),
> +	[PAGEFMT_SPARE_28]	= (3 << 16),
> +	[PAGEFMT_SPARE_32]	= (4 << 16),
> +	[PAGEFMT_SPARE_36]	= (5 << 16),
> +	[PAGEFMT_SPARE_40]	= (6 << 16),
> +	[PAGEFMT_SPARE_44]	= (7 << 16),
> +	[PAGEFMT_SPARE_48]	= (8 << 16),
> +	[PAGEFMT_SPARE_49]	= (9 << 16),
> +	[PAGEFMT_SPARE_50]	= (10 << 16),
> +	[PAGEFMT_SPARE_51]	= (11 << 16),
> +	[PAGEFMT_SPARE_52]	= (12 << 16),
> +	[PAGEFMT_SPARE_61]	= (14 << 16),
> +	[PAGEFMT_SPARE_62]	= (13 << 16),
> +	[PAGEFMT_SPARE_63]	= (15 << 16),
> +	[PAGEFMT_SPARE_64]	= (16 << 16),
> +	[PAGEFMT_SPARE_67]	= (17 << 16),
> +	[PAGEFMT_SPARE_74]	= (18 << 16),
> +};
> +
> +/*
> + * supported spare size of each IP
> + * 255 is used as ending flag
> + */
> +static const u8 spare_size_mt2701[] = {
> +	16, 26, 27, 28, 32, 36, 40, 44,	48, 49, 50, 51, 52, 62, 63, 64, 255
> +};
> +
> +static const u8 spare_size_mt2712[] = {
> +	16, 26, 27, 28, 32, 36, 40, 44,	48, 49, 50, 51, 52, 61, 62, 63, 64, 67,
> +	74, 255
> +};
> +
>   static inline struct mtk_nfc_nand_chip *to_mtk_nand(struct nand_chip *nand)
>   {
>   	return container_of(nand, struct mtk_nfc_nand_chip, nand);
> @@ -308,6 +378,7 @@ static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
>   	struct nand_chip *chip = mtd_to_nand(mtd);
>   	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
>   	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	const u32 *sparefmt = nfc->devdata->spare_format;
>   	u32 fmt, spare;
>   
>   	if (!mtd->writesize)
> @@ -354,52 +425,61 @@ static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
>   
>   	switch (spare) {
>   	case 16:
> -		fmt |= (PAGEFMT_SPARE_16 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_16];
>   		break;
>   	case 26:
> -		fmt |= (PAGEFMT_SPARE_26 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_26];
>   		break;
>   	case 27:
> -		fmt |= (PAGEFMT_SPARE_27 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_27];
>   		break;
>   	case 28:
> -		fmt |= (PAGEFMT_SPARE_28 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_28];
>   		break;
>   	case 32:
> -		fmt |= (PAGEFMT_SPARE_32 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_32];
>   		break;
>   	case 36:
> -		fmt |= (PAGEFMT_SPARE_36 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_36];
>   		break;
>   	case 40:
> -		fmt |= (PAGEFMT_SPARE_40 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_40];
>   		break;
>   	case 44:
> -		fmt |= (PAGEFMT_SPARE_44 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_44];
>   		break;
>   	case 48:
> -		fmt |= (PAGEFMT_SPARE_48 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_48];
>   		break;
>   	case 49:
> -		fmt |= (PAGEFMT_SPARE_49 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_49];
>   		break;
>   	case 50:
> -		fmt |= (PAGEFMT_SPARE_50 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_50];
>   		break;
>   	case 51:
> -		fmt |= (PAGEFMT_SPARE_51 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_51];
>   		break;
>   	case 52:
> -		fmt |= (PAGEFMT_SPARE_52 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_52];
> +		break;
> +	case 61:
> +		fmt |= sparefmt[PAGEFMT_SPARE_61];
>   		break;
>   	case 62:
> -		fmt |= (PAGEFMT_SPARE_62 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_62];
>   		break;
>   	case 63:
> -		fmt |= (PAGEFMT_SPARE_63 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_63];
>   		break;
>   	case 64:
> -		fmt |= (PAGEFMT_SPARE_64 << PAGEFMT_SPARE_SHIFT);
> +		fmt |= sparefmt[PAGEFMT_SPARE_64];
> +		break;
> +	case 67:
> +		fmt |= sparefmt[PAGEFMT_SPARE_67];
> +		break;
> +	case 74:
> +		fmt |= sparefmt[PAGEFMT_SPARE_74];
>   		break;
>   	default:
>   		dev_err(nfc->dev, "invalid spare per sector %d\n", spare);
> @@ -408,7 +488,7 @@ static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
>   
>   	fmt |= mtk_nand->fdm.reg_size << PAGEFMT_FDM_SHIFT;
>   	fmt |= mtk_nand->fdm.ecc_size << PAGEFMT_FDM_ECC_SHIFT;
> -	nfi_writew(nfc, fmt, NFI_PAGEFMT);
> +	nfi_writel(nfc, fmt, NFI_PAGEFMT);
>   
>   	nfc->ecc_cfg.strength = chip->ecc.strength;
>   	nfc->ecc_cfg.len = chip->ecc.size + mtk_nand->fdm.ecc_size;
> @@ -1009,7 +1089,7 @@ static inline void mtk_nfc_hw_init(struct mtk_nfc *nfc)
>   	 * 0  : poll the status of the busy/ready signal after [7:4]*16 cycles.
>   	 */
>   	nfi_writew(nfc, 0xf1, NFI_CNRNB);
> -	nfi_writew(nfc, PAGEFMT_8K_16K, NFI_PAGEFMT);
> +	nfi_writel(nfc, PAGEFMT_8K_16K, NFI_PAGEFMT);
>   
>   	mtk_nfc_hw_reset(nfc);
>   
> @@ -1134,8 +1214,8 @@ static void mtk_nfc_set_bad_mark_ctl(struct mtk_nfc_bad_mark_ctl *bm_ctl,
>   static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
>   {
>   	struct nand_chip *nand = mtd_to_nand(mtd);
> -	u32 spare[] = {16, 26, 27, 28, 32, 36, 40, 44,
> -			48, 49, 50, 51, 52, 62, 63, 64};
> +	struct mtk_nfc *nfc = nand_get_controller_data(nand);
> +	const u8 *spare = nfc->devdata->spare_size;
>   	u32 eccsteps, i;
>   
>   	eccsteps = mtd->writesize / nand->ecc.size;
> @@ -1144,7 +1224,7 @@ static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
>   	if (nand->ecc.size == 1024)
>   		*sps >>= 1;
>   
> -	for (i = 0; i < ARRAY_SIZE(spare); i++) {
> +	for (i = 0; ; i++) {
>   		if (*sps <= spare[i]) {
>   			if (!i)
>   				*sps = spare[i];
> @@ -1154,9 +1234,6 @@ static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
>   		}
>   	}
>   
> -	if (i >= ARRAY_SIZE(spare))
> -		*sps = spare[ARRAY_SIZE(spare) - 1];
> -
>   	if (nand->ecc.size == 1024)
>   		*sps <<= 1;
>   }
> @@ -1164,6 +1241,7 @@ static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
>   static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
>   {
>   	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct mtk_nfc *nfc = nand_get_controller_data(nand);
>   	u32 spare;
>   	int free;
>   
> @@ -1214,7 +1292,7 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
>   		}
>   	}
>   
> -	mtk_ecc_adjust_strength(&nand->ecc.strength);
> +	mtk_ecc_adjust_strength(nfc->ecc, &nand->ecc.strength);
>   
>   	dev_info(dev, "eccsize %d eccstrength %d\n",
>   		 nand->ecc.size, nand->ecc.strength);
> @@ -1354,12 +1432,35 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
>   	return 0;
>   }
>   
> +static const struct mtk_nfc_devdata mtk_nfc_devdata_mt2701 = {
> +	.spare_format = mtk_nfc_spare_format_mt2701,
> +	.spare_size = spare_size_mt2701,
> +};
> +
> +static const struct mtk_nfc_devdata mtk_nfc_devdata_mt2712 = {
> +	.spare_format = mtk_nfc_spare_format_mt2712,
> +	.spare_size = spare_size_mt2712,
> +};
> +
> +static const struct of_device_id mtk_nfc_id_table[] = {
> +	{
> +		.compatible = "mediatek,mt2701-nfc",
> +		.data = &mtk_nfc_devdata_mt2701,
> +	}, {
> +		.compatible = "mediatek,mt2712-nfc",
> +		.data = &mtk_nfc_devdata_mt2712,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
> +
>   static int mtk_nfc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev->of_node;
>   	struct mtk_nfc *nfc;
>   	struct resource *res;
> +	const struct of_device_id *of_nfc_id = NULL;
>   	int ret, irq;
>   
>   	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
> @@ -1423,6 +1524,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
>   		goto clk_disable;
>   	}
>   
> +	of_nfc_id = of_match_device(mtk_nfc_id_table, &pdev->dev);
> +	if (!of_nfc_id) {
> +		ret = -ENODEV;
> +		goto clk_disable;
> +	}
> +	nfc->devdata = (struct mtk_nfc_devdata *)of_nfc_id->data;
> +
>   	platform_set_drvdata(pdev, nfc);
>   
>   	ret = mtk_nfc_nand_chips_init(dev, nfc);
> @@ -1503,12 +1611,6 @@ static int mtk_nfc_resume(struct device *dev)
>   static SIMPLE_DEV_PM_OPS(mtk_nfc_pm_ops, mtk_nfc_suspend, mtk_nfc_resume);
>   #endif
>   
> -static const struct of_device_id mtk_nfc_id_table[] = {
> -	{ .compatible = "mediatek,mt2701-nfc" },
> -	{}
> -};
> -MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
> -
>   static struct platform_driver mtk_nfc_driver = {
>   	.probe  = mtk_nfc_probe,
>   	.remove = mtk_nfc_remove,
> -- 
> 1.9.1
> 
> ************* Email Confidentiality Notice
>   ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
>   
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank
>   you!
> 
