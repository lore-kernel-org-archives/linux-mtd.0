Message-ID: <1511950359.7778.2.camel@mtkswgap22>
Subject: Re: [PATCH 2/3] mtd: nand: mtk: Support different MTK NAND flash
 controller IP
From: RogerCC.Lin <rogercc.lin@mediatek.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <computersforpeace@gmail.com>, <srv_heupstream@mediatek.com>,
 <bayi.cheng@mediatek.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xiaolei.li@mediatek.com>,
 <dwmw2@infradead.org>
Date: Wed, 29 Nov 2017 18:12:39 +0800
In-Reply-To: <20171129110441.3c6f1e3a@bbrezillon>
References: <1511947486-7707-1-git-send-email-rogercc.lin@mediatek.com>
 <1511947486-7707-3-git-send-email-rogercc.lin@mediatek.com>
 <20171129110441.3c6f1e3a@bbrezillon>
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

Hi, Boris,

On Wed, 2017-11-29 at 11:04 +0100, Boris Brezillon wrote:
> Hi,
> 
> On Wed, 29 Nov 2017 17:24:45 +0800
> RogerCC Lin <rogercc.lin@mediatek.com> wrote:
> 
> 
> > diff --git a/drivers/mtd/nand/mtk_ecc.h b/drivers/mtd/nand/mtk_ecc.h
> > index d245c14..764adb6 100644
> > --- a/drivers/mtd/nand/mtk_ecc.h
> > +++ b/drivers/mtd/nand/mtk_ecc.h
> > @@ -14,8 +14,6 @@
> >  
> >  #include <linux/types.h>
> >  
> > -#define ECC_PARITY_BITS		(14)
> > -
> >  enum mtk_ecc_mode {ECC_DMA_MODE = 0, ECC_NFI_MODE = 1};
> >  enum mtk_ecc_operation {ECC_ENCODE, ECC_DECODE};
> >  
> > @@ -37,6 +35,29 @@ struct mtk_ecc_config {
> >  	u32 len;
> >  };
> >  
> > +struct mtk_ecc_caps {
> > +	u32 err_mask;
> > +	const u8 *ecc_strength;
> > +	const u32 *ecc_regs;
> > +	u8 num_ecc_strength;
> > +	u8 ecc_mode_shift;
> > +	u8 parity_bits;
> > +	int pg_irq_sel;
> > +};
> > +
> > +struct mtk_ecc {
> > +	struct device *dev;
> > +	const struct mtk_ecc_caps *caps;
> > +	void __iomem *regs;
> > +	struct clk *clk;
> > +
> > +	struct completion done;
> > +	struct mutex lock;
> > +	u32 sectors;
> > +
> > +	u8 *eccdata;
> > +};
> 
> Can you please keep these information private and instead provide a
> helper to query the parity bits info, something like:
> 
> unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc);

Yes, got it, I will do this in next patch, 

thanks,

Roger

> Regards,
> 
> Boris
> 
> 
