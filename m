Message-ID: <1494578289.15376.40.camel@mhfsdcap03>
Subject: Re: [PATCH v2 3/3] mtd: nand: mediatek: add support for MT2712 NAND
 FLASH Controller
From: xiaolei li <xiaolei.li@mediatek.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <computersforpeace@gmail.com>, <matthias.bgg@gmail.com>,
 <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <rogercc.lin@mediatek.com>, <yt.shen@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Fri, 12 May 2017 16:38:09 +0800
In-Reply-To: <20170512085904.069e7bdd@bbrezillon>
References: <1494563603-37716-1-git-send-email-xiaolei.li@mediatek.com>
 <1494563603-37716-4-git-send-email-xiaolei.li@mediatek.com>
 <20170512085904.069e7bdd@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2017-05-12 at 08:59 +0200, Boris Brezillon wrote:
> On Fri, 12 May 2017 12:33:23 +0800
> Xiaolei Li <xiaolei.li@mediatek.com> wrote:
> 
> > MT2712 NAND FLASH Controller is similar to MT2701 except those following:
> > (1) MT2712 supports up to 148B spare size per 1KB size sector (the same
> >     with 74B spare size per 512B size sector). There are three new spare
> >     format: 61, 67, 74.
> > (2) MT2712 supports up to 80 bit ecc strength. There are three new ecc
> >     strength level: 68, 72, 80.
> > (3) MT2712 ECC encode parity data register's start offset is 0x300, and
> >     different with 0x10 of MT2701.
> > (4) MT2712 improves ecc irq function. When ECC works in ECC_NFI_MODE,
> >     MT2701 will generate ecc irq number the same with ecc steps during
> >     page read. However, MT2712 can only generate one ecc irq.
> > 
> > Changes of this patch are:
> > (1) add two new variables named pg_irq_sel, encode_parity_reg0 in struct
> >     mtk_ecc_devdata.
> > (2) add three new ecc level: ECC_CNFG_68BIT, ECC_CNFG_72BIT,
> >     ECC_CNFG_80BIT.
> > (3) add new bitfield ECC_PG_IRQ_SEL for register ECC_IRQ_REG.
> > (4) add three new spare format: PAGEFMT_SPARE_61, PAGEFMT_SPARE_67,
> >     PAGEFMT_SPARE_74.
> > (5) add mt2712 nfc and ecc device compatiable and data.
> > 
> > Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> > ---
> >  drivers/mtd/nand/mtk_ecc.c  | 45 ++++++++++++++++++++++++++++++++++++----
> >  drivers/mtd/nand/mtk_nand.c | 50 +++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 91 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
> > index 94d0791..ac46fb0 100644
> > --- a/drivers/mtd/nand/mtk_ecc.c
> > +++ b/drivers/mtd/nand/mtk_ecc.c
> > @@ -28,6 +28,7 @@
> >  
> >  #define ECC_IDLE_MASK		BIT(0)
> >  #define ECC_IRQ_EN		BIT(0)
> > +#define ECC_PG_IRQ_SEL		BIT(1)
> >  #define ECC_OP_ENABLE		(1)
> >  #define ECC_OP_DISABLE		(0)
> >  
> > @@ -53,11 +54,13 @@
> >  #define		ECC_CNFG_52BIT		(0x11)
> >  #define		ECC_CNFG_56BIT		(0x12)
> >  #define		ECC_CNFG_60BIT		(0x13)
> > +#define		ECC_CNFG_68BIT		(0x14)
> > +#define		ECC_CNFG_72BIT		(0x15)
> > +#define		ECC_CNFG_80BIT		(0x16)
> 
> We could get rid of these defs and just use the index of the strength
> table (named ecc_level in your patch).

OK.

> 
> >  #define		ECC_MODE_SHIFT		(5)
> >  #define		ECC_MS_SHIFT		(16)
> >  #define ECC_ENCDIADDR		(0x08)
> >  #define ECC_ENCIDLE		(0x0C)
> > -#define ECC_ENCPAR(x)		(0x10 + (x) * sizeof(u32))
> >  #define ECC_ENCIRQ_EN		(0x80)
> >  #define ECC_ENCIRQ_STA		(0x84)
> >  #define ECC_DECCON		(0x100)
> > @@ -80,6 +83,8 @@
> >  struct mtk_ecc_devdata {
> >  	u32 err_mask;
> >  	u8 max_ecc_strength;
> > +	u32 encode_parity_reg0;
> > +	int pg_irq_sel;
> >  };
> >  
> >  struct mtk_ecc {
> > @@ -207,6 +212,15 @@ static void mtk_ecc_config(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
> >  	case 60:
> >  		ecc_bit = ECC_CNFG_60BIT;
> >  		break;
> > +	case 68:
> > +		ecc_bit = ECC_CNFG_68BIT;
> > +		break;
> > +	case 72:
> > +		ecc_bit = ECC_CNFG_72BIT;
> > +		break;
> > +	case 80:
> > +		ecc_bit = ECC_CNFG_80BIT;
> > +		break;
> >  	default:
> >  		dev_err(ecc->dev, "invalid strength %d, default to 4 bits\n",
> >  			config->strength);
> > @@ -318,6 +332,7 @@ struct mtk_ecc *of_mtk_ecc_get(struct device_node *of_node)
> >  int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
> >  {
> >  	enum mtk_ecc_operation op = config->op;
> > +	u16 reg_val;
> >  	int ret;
> >  
> >  	ret = mutex_lock_interruptible(&ecc->lock);
> > @@ -331,7 +346,15 @@ int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
> >  	writew(ECC_OP_ENABLE, ecc->regs + ECC_CTL_REG(op));
> >  
> >  	init_completion(&ecc->done);
> > -	writew(ECC_IRQ_EN, ecc->regs + ECC_IRQ_REG(op));
> > +	reg_val = ECC_IRQ_EN;
> > +	/*
> > +	 * For ECC_NFI_MODE, if ecc->devdata->pg_irq_sel is 1, then it
> > +	 * means this chip can only generate one ecc irq during page
> > +	 * read / write. If is 0, generate one ecc irq each ecc step.
> > +	 */
> > +	if ((ecc->devdata->pg_irq_sel) && (config->mode == ECC_NFI_MODE))
> > +		reg_val |= ECC_PG_IRQ_SEL;
> > +	writew(reg_val, ecc->regs + ECC_IRQ_REG(op));
> >  
> >  	return 0;
> >  }
> > @@ -401,7 +424,9 @@ int mtk_ecc_encode(struct mtk_ecc *ecc, struct mtk_ecc_config *config,
> >  	len = (config->strength * ECC_PARITY_BITS + 7) >> 3;
> >  
> >  	/* write the parity bytes generated by the ECC back to temp buffer */
> > -	__ioread32_copy(ecc->eccdata, ecc->regs + ECC_ENCPAR(0), round_up(len, 4));
> > +	__ioread32_copy(ecc->eccdata,
> > +			ecc->regs + ecc->devdata->encode_parity_reg0,
> > +			round_up(len, 4));
> >  
> >  	/* copy into possibly unaligned OOB region with actual length */
> >  	memcpy(data + bytes, ecc->eccdata, len);
> > @@ -417,7 +442,7 @@ int mtk_ecc_encode(struct mtk_ecc *ecc, struct mtk_ecc_config *config,
> >  void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p)
> >  {
> >  	u32 ecc_level[] = {4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
> > -				40, 44, 48, 52, 56, 60};
> > +				40, 44, 48, 52, 56, 60, 68, 72, 80};
> 
> Please try to align on the open curly brace.
> 
OK.

> >  	int i;
> >  
> >  	if (*p >= ecc->devdata->max_ecc_strength) {
> > @@ -442,12 +467,24 @@ void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p)
> >  static const struct mtk_ecc_devdata mtk_ecc_devdata_mt2701 = {
> >  	.err_mask = 0x3f,
> >  	.max_ecc_strength = 60,
> > +	.encode_parity_reg0 = 0x10,
> > +	.pg_irq_sel = 0,
> > +};
> > +
> > +static const struct mtk_ecc_devdata mtk_ecc_devdata_mt2712 = {
> > +	.err_mask = 0x7f,
> > +	.max_ecc_strength = 80,
> > +	.encode_parity_reg0 = 0x300,
> > +	.pg_irq_sel = 1,
> >  };
> >  
> >  static const struct of_device_id mtk_ecc_dt_match[] = {
> >  	{
> >  		.compatible = "mediatek,mt2701-ecc",
> >  		.data = &mtk_ecc_devdata_mt2701,
> > +	}, {
> > +		.compatible = "mediatek,mt2712-ecc",
> > +		.data = &mtk_ecc_devdata_mt2712,
> >  	},
> >  	{},
> >  };
> > diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
> > index 1a64ea2..5bdeace 100644
> > --- a/drivers/mtd/nand/mtk_nand.c
> > +++ b/drivers/mtd/nand/mtk_nand.c
> > @@ -168,9 +168,12 @@ enum mtk_nfc_spare_format {
> >  	PAGEFMT_SPARE_50,
> >  	PAGEFMT_SPARE_51,
> >  	PAGEFMT_SPARE_52,
> > +	PAGEFMT_SPARE_61,
> >  	PAGEFMT_SPARE_62,
> >  	PAGEFMT_SPARE_63,
> >  	PAGEFMT_SPARE_64,
> > +	PAGEFMT_SPARE_67,
> > +	PAGEFMT_SPARE_74,
> >  };
> >  
> >  static const u32 mtk_nfc_spare_format_mt2701[] = {
> > @@ -187,9 +190,34 @@ enum mtk_nfc_spare_format {
> >  	[PAGEFMT_SPARE_50]	= (10 << 4),
> >  	[PAGEFMT_SPARE_51]	= (11 << 4),
> >  	[PAGEFMT_SPARE_52]	= (12 << 4),
> > +	[PAGEFMT_SPARE_61]	= (0 << 4),
> >  	[PAGEFMT_SPARE_62]	= (13 << 4),
> >  	[PAGEFMT_SPARE_63]	= (14 << 4),
> >  	[PAGEFMT_SPARE_64]	= (15 << 4),
> > +	[PAGEFMT_SPARE_67]	= (0 << 4),
> > +	[PAGEFMT_SPARE_74]	= (0 << 4),
> > +};
> > +
> > +static const u32 mtk_nfc_spare_format_mt2712[] = {
> > +	[PAGEFMT_SPARE_16]	= (0 << 16),
> > +	[PAGEFMT_SPARE_26]	= (1 << 16),
> > +	[PAGEFMT_SPARE_27]	= (2 << 16),
> > +	[PAGEFMT_SPARE_28]	= (3 << 16),
> > +	[PAGEFMT_SPARE_32]	= (4 << 16),
> > +	[PAGEFMT_SPARE_36]	= (5 << 16),
> > +	[PAGEFMT_SPARE_40]	= (6 << 16),
> > +	[PAGEFMT_SPARE_44]	= (7 << 16),
> > +	[PAGEFMT_SPARE_48]	= (8 << 16),
> > +	[PAGEFMT_SPARE_49]	= (9 << 16),
> > +	[PAGEFMT_SPARE_50]	= (10 << 16),
> > +	[PAGEFMT_SPARE_51]	= (11 << 16),
> > +	[PAGEFMT_SPARE_52]	= (12 << 16),
> > +	[PAGEFMT_SPARE_61]	= (14 << 16),
> > +	[PAGEFMT_SPARE_62]	= (13 << 16),
> > +	[PAGEFMT_SPARE_63]	= (15 << 16),
> > +	[PAGEFMT_SPARE_64]	= (16 << 16),
> > +	[PAGEFMT_SPARE_67]	= (17 << 16),
> > +	[PAGEFMT_SPARE_74]	= (18 << 16),
> >  };
> 
> It really looks like the page format id is the index of the spare_size
> array. I think you can get rid of the PAGEFMT_SPARE_ definitions if you
> use the for loop I suggested in patch 2.
> 
OK. follow your suggestion.

> >  
> >  /*
> > @@ -200,6 +228,11 @@ enum mtk_nfc_spare_format {
> >  	16, 26, 27, 28, 32, 36, 40, 44,	48, 49, 50, 51, 52, 62, 63, 64, 255
> >  };
> >  
> > +static const u8 spare_size_mt2712[] = {
> > +	16, 26, 27, 28, 32, 36, 40, 44,	48, 49, 50, 51, 52, 61, 62, 63, 64, 67,
> > +	74, 255
> > +};
> > +
> >  static inline struct mtk_nfc_nand_chip *to_mtk_nand(struct nand_chip *nand)
> >  {
> >  	return container_of(nand, struct mtk_nfc_nand_chip, nand);
> > @@ -430,6 +463,9 @@ static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
> >  	case 52:
> >  		fmt |= sparefmt[PAGEFMT_SPARE_52];
> >  		break;
> > +	case 61:
> > +		fmt |= sparefmt[PAGEFMT_SPARE_61];
> > +		break;
> >  	case 62:
> >  		fmt |= sparefmt[PAGEFMT_SPARE_62];
> >  		break;
> > @@ -439,6 +475,12 @@ static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
> >  	case 64:
> >  		fmt |= sparefmt[PAGEFMT_SPARE_64];
> >  		break;
> > +	case 67:
> > +		fmt |= sparefmt[PAGEFMT_SPARE_67];
> > +		break;
> > +	case 74:
> > +		fmt |= sparefmt[PAGEFMT_SPARE_74];
> > +		break;
> >  	default:
> >  		dev_err(nfc->dev, "invalid spare per sector %d\n", spare);
> >  		return -EINVAL;
> > @@ -1395,10 +1437,18 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
> >  	.spare_size = spare_size_mt2701,
> >  };
> >  
> > +static const struct mtk_nfc_devdata mtk_nfc_devdata_mt2712 = {
> > +	.spare_format = mtk_nfc_spare_format_mt2712,
> > +	.spare_size = spare_size_mt2712,
> > +};
> > +
> >  static const struct of_device_id mtk_nfc_id_table[] = {
> >  	{
> >  		.compatible = "mediatek,mt2701-nfc",
> >  		.data = &mtk_nfc_devdata_mt2701,
> > +	}, {
> > +		.compatible = "mediatek,mt2712-nfc",
> > +		.data = &mtk_nfc_devdata_mt2712,
> >  	},
> >  	{}
> >  };
> 
