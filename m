Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMiMC-00050q-6h
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 22:40:02 +0000
Date: Wed, 6 Dec 2017 23:39:27 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: gpio: Fix ALE gpio configuration
Message-ID: <20171206233927.3869372b@bbrezillon>
In-Reply-To: <18914914.8jQtQ4ab2h@blindfold>
References: <20171206172714.ABE156C6B0@po15668-vm-win7.idsi0.si.c-s.fr>
 <18914914.8jQtQ4ab2h@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 06 Dec 2017 23:28:11 +0100
Richard Weinberger <richard@nod.at> wrote:

> Am Mittwoch, 6. Dezember 2017, 18:27:14 CET schrieb Christophe Leroy:
> > Fixes a copy/paste error in commit f3d0d8d938b4d ("mtd: nand: gpio:
> > Convert to use GPIO descriptors") which breaks gpio-nand driver
> > 
> > Fixes: f3d0d8d938b4d ("mtd: nand: gpio: Convert to use GPIO descriptors")
> > Cc: Linus Walleij <linus.walleij@linaro.org>

Cc: <stable@vger.kernel.org>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Richard, can you queue that one to the fixes branch?

> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > ---
> >  drivers/mtd/nand/gpio.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
> > index 484f7fbc3f7d..a8bde6665c24 100644
> > --- a/drivers/mtd/nand/gpio.c
> > +++ b/drivers/mtd/nand/gpio.c
> > @@ -253,9 +253,9 @@ static int gpio_nand_probe(struct platform_device *pdev)
> > goto out_ce;
> >  	}
> > 
> > -	gpiomtd->nwp = devm_gpiod_get(dev, "ale", GPIOD_OUT_LOW);
> > -	if (IS_ERR(gpiomtd->nwp)) {
> > -		ret = PTR_ERR(gpiomtd->nwp);
> > +	gpiomtd->ale = devm_gpiod_get(dev, "ale", GPIOD_OUT_LOW);
> > +	if (IS_ERR(gpiomtd->ale)) {
> > +		ret = PTR_ERR(gpiomtd->ale);
> >  		goto out_ce;
> >  	}  
> 
> Reviewed-by: Richard Weinberger <richard@nod.at>
> 
> Thanks,
> //richard
