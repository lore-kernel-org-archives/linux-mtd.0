Message-ID: <1509530823.19864.41.camel@mhfsdcap03>
Subject: Re: [PATCH] mtd: nand: mtk: deselect the chip that was selected in
 resume function
From: xiaolei li <xiaolei.li@mediatek.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <rogercc.lin@mediatek.com>, <srv_heupstream@mediatek.com>,
 <bayi.cheng@mediatek.com>
Date: Wed, 1 Nov 2017 18:07:03 +0800
In-Reply-To: <20171101110021.221fb256@bbrezillon>
References: <1509517197-60350-1-git-send-email-xiaolei.li@mediatek.com>
 <20171101110021.221fb256@bbrezillon>
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

Hi Boris,

On Wed, 2017-11-01 at 11:00 +0100, Boris Brezillon wrote:
> Hi Xiaolei,
> 
> On Wed, 1 Nov 2017 14:19:57 +0800
> <xiaolei.li@mediatek.com> wrote:
> 
> > From: Xiaolei Li <xiaolei.li@mediatek.com>
> > 
> > It is necessary to deselect the chip if it was selected before.
> > But now we only select chips when resume nand driver.
> > So, deselect the chip after doing nand reset.
> > 
> > Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> > ---
> >  drivers/mtd/nand/mtk_nand.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
> > index d86a7d1..a8bf61a 100644
> > --- a/drivers/mtd/nand/mtk_nand.c
> > +++ b/drivers/mtd/nand/mtk_nand.c
> > @@ -1557,6 +1557,7 @@ static int mtk_nfc_resume(struct device *dev)
> >  		for (i = 0; i < chip->nsels; i++) {
> >  			nand->select_chip(mtd, i);
> >  			nand->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> > +			nand->select_chip(mtd, -1);
> 
> Can you use nand_reset() instead of open-coding this sequence?
> 
OK. Got it.
Will update it in PATCH v2.

Thanks,

Xiaolei

> Thanks,
> 
> Boris
> 
> >  		}
> >  	}
> >  
> 
