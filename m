Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlSrn-0002M6-Ta
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 00:20:32 +0000
Received: by mail-ob0-f177.google.com with SMTP id va2so6561084obc.22
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 16:20:10 -0800 (PST)
Date: Tue, 26 Nov 2013 16:20:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH] mtd: mpc5121_nfc: drop devm_free_irq of devm_
 allocated irq
Message-ID: <20131127002003.GP9468@ld-irv-0074.broadcom.com>
References: <CAPgLHd8G-uaG3a7DfA-eAhcdKD3yXzpCuQJ2c8qFe0412pQX2Q@mail.gmail.com>
 <20131126235401.GO9468@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131126235401.GO9468@ld-irv-0074.broadcom.com>
Cc: artem.bityutskiy@linux.intel.com, gsi@denx.de, rob.herring@calxeda.com,
 yongjun_wei@trendmicro.com.cn, wfp5p@virginia.edu,
 linux-mtd@lists.infradead.org, grant.likely@linaro.org, agust@denx.de,
 shijie8@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 26, 2013 at 03:54:01PM -0800, Brian Norris wrote:
> On Wed, Sep 25, 2013 at 03:40:38PM +0800, Wei Yongjun wrote:
> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > 
> > The devm_request_irq function allocates irq that is released
> > when a driver detaches. Thus, there is no reason to explicitly
> > call devm_free_irq in probe or remove functions.
> > 
> > Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > ---
> >  drivers/mtd/nand/mpc5121_nfc.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
> > index 3c60a00..7df37f0 100644
> > --- a/drivers/mtd/nand/mpc5121_nfc.c
> > +++ b/drivers/mtd/nand/mpc5121_nfc.c
> > @@ -838,7 +835,6 @@ static int mpc5121_nfc_remove(struct platform_device *op)
> >  	struct mpc5121_nfc_prv *prv = chip->priv;
> >  
> >  	nand_release(mtd);
> > -	devm_free_irq(dev, prv->irq, mtd);
> >  	mpc5121_nfc_free(dev, mtd);
> >  
> >  	return 0;
> > 
> 
> Just noticed a new warning after this hunk:
> 
> drivers/mtd/nand/mpc5121_nfc.c:837:26: warning: unused variable 'prv' [-Wunused-variable]

...and one more:

drivers/mtd/nand/mpc5121_nfc.c:836:20: warning: unused variable 'chip' [-Wunused-variable]

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 435f684..d744cf7 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -833,7 +833,6 @@ static int mpc5121_nfc_remove(struct platform_device *op)
 {
 	struct device *dev = &op->dev;
 	struct mtd_info *mtd = dev_get_drvdata(dev);
-	struct nand_chip *chip = mtd->priv;
 
 	nand_release(mtd);
 	mpc5121_nfc_free(dev, mtd);
