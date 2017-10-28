Message-ID: <1509163557.19864.38.camel@mhfsdcap03>
Subject: Re: [PATCH v1 2/2] mtd: nand: mtk: fix infinite ECC decode IRQ issue
From: xiaolei li <xiaolei.li@mediatek.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <computersforpeace@gmail.com>, <srv_heupstream@mediatek.com>,
 <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <dwmw2@infradead.org>, <rogercc.lin@mediatek.com>
Date: Sat, 28 Oct 2017 12:05:57 +0800
In-Reply-To: <20171027144416.2e2294a7@bbrezillon>
References: <1508746897-62291-1-git-send-email-xiaolei.li@mediatek.com>
 <1508746897-62291-3-git-send-email-xiaolei.li@mediatek.com>
 <20171027144416.2e2294a7@bbrezillon>
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

On Fri, 2017-10-27 at 14:44 +0200, Boris Brezillon wrote:
> Hi Xiaolei,
> 
> On Mon, 23 Oct 2017 16:21:37 +0800
> Xiaolei Li <xiaolei.li@mediatek.com> wrote:
> 
> > For MT2701 NAND Controller, there may generate infinite ECC decode IRQ
> > during long time burn test on some platforms. Once this issue occurred,
> > the ECC decode IRQ status cannot be cleared in the IRQ handler function,
> > and threads cannot be scheduled.
> > 
> > ECC HW generates decode IRQ each sector, so there will have more than one
> > decode IRQ if read one page of large page NAND.
> > 
> > Currently, ECC IRQ handle flow is that we will check whether it is decode
> > IRQ at first by reading the register ECC_DECIRQ_STA. This is a read-clear
> > type register. If this IRQ is decode IRQ, then the ECC IRQ signal will be
> > cleared at the same time.
> > Secondly, we will check whether all sectors are decoded by reading the
> > register ECC_DECDONE. This is because the current IRQ may be not dealed
> > in time, and the next sectors have been decoded before reading the
> > register ECC_DECIRQ_STA. Then, the next sectors's decode IRQs will not
> > be generated.
> > Thirdly, if all sectors are decoded by comparing with ecc->sectors, then we
> > will complete ecc->done, set ecc->sectors as 0, and disable ECC IRQ by
> > programming the register ECC_IRQ_REG(op) as 0. Otherwise, wait for the
> > next ECC IRQ.
> > 
> > But, there is a timing issue between step one and two. When we read the
> > reigster ECC_DECIRQ_STA, all sectors are decoded except the last sector,
> > and the ECC IRQ signal is cleared. But the last sector is decoded before
> > reading ECC_DECDONE, so the ECC IRQ signal is enabled again by ECC HW, and
> > it means we will receive one extra ECC IRQ later. In step three, we will
> > find that all sectors were decoded, then disable ECC IRQ and return.
> > When deal with the extra ECC IRQ, the ECC IRQ status cannot be cleared
> > anymore. That is because the register ECC_DECIRQ_STA can only be cleared
> > when the register ECC_IRQ_REG(op) is enabled. But actually we have
> > disabled ECC IRQ in the previous ECC IRQ handle. So, there will
> > keep receiving ECC decode IRQ.
> > 
> > Now, we read the register ECC_DECIRQ_STA once again before completing the
> > ecc done event. This ensures that there will be no extra ECC decode IRQ.
> 
> Why don't you remove the
> 
> 	writel(0, ecc->regs + ECC_IRQ_REG(op));
> 
> line in the irq handler and add
> 
> 	readw(ecc->regs + ECC_DECIRQ_STA);
> 
> just before disabling the irq in mtk_ecc_disable().
> 
> It really looks weird to have the IRQ handler disable the IRQ on its
> own. It's usually the caller who decides when the IRQ (or set of IRQs)
> should be enabled/disabled. 

It is reasonable. I will remove
 writel(0, ecc->regs + ECC_IRQ_REG(op));
from irq handler, and keep it in mtk_ecc_disable().

But I thinks it is better to add
 readw(ecc->regs + ECC_DECIRQ_STA);
before completing ecc done event in the irq handler than in
mtk_ecc_disable().

Please let me show some backgrounds at first:
1. ECC irq signal is low level vaild.
2. Reading ECC_DECIRQ_STA can pull ecc irq signal high, but it is just
valid if ECC_IRQ_REG(op) is enabled.

At the beginning of irq handler, I read ECC_DECIRQ_STA and this pulls
ecc irq signal high. But ecc irq signal may be pulled down again between
ECC_DECIRQ_STA read and ECC_DECDONE read, if one sector is decoded done
between them. And this means that one IRQ will come in later. But if all
sectors are decoded done now, we will complete ecc done event, and there
is really no need to deal with this extra IRQ.
So, read ECC_DECIRQ_STA before completing ecc done event, this can
guarantee that ecc irq signal is always high and no extra IRQ later.

We can keep mtk_ecc_disable() the same. Because all irqs have been
handled.

I am not sure whether this explanation is clear?

> Moreover, I'm not sure you're guaranteed
> that no new interrupts will come in between the ECC_DECIRQ_STA read
> and the ECC_IRQ_REG() write you're doing in your irq handler, while,
> doing that after the engine has been disabled (in mtk_ecc_disable())
> should guarantee that nothing can happen after you have read the status
> reg.
> 
> > 
> > MT2712 ECC HW is designed to generate only one decode IRQ each page, so
> > there is no this problem on MT2712 platforms.
> > 
> > Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> 
> You miss a Fixes tag, and you might want to add a Cc-stable tag to
> backport the fix.
> 
OK. Thanks.

> Regards,
> 
> Boris
> 
> > ---
> >  drivers/mtd/nand/mtk_ecc.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
> > index 82aa6f2..0e04323 100644
> > --- a/drivers/mtd/nand/mtk_ecc.c
> > +++ b/drivers/mtd/nand/mtk_ecc.c
> > @@ -115,6 +115,11 @@ static irqreturn_t mtk_ecc_irq(int irq, void *id)
> >  		op = ECC_DECODE;
> >  		dec = readw(ecc->regs + ECC_DECDONE);
> >  		if (dec & ecc->sectors) {
> > +			/**
> > +			 * Clear decode IRQ status once again to ensure that
> > +			 * there will be no extra IRQ.
> > +			 */
> > +			dec = readw(ecc->regs + ECC_DECIRQ_STA);
> >  			ecc->sectors = 0;
> >  			complete(&ecc->done);
> >  		} else {
> 
