Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eXvGJ-0001B0-Sj
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 20:40:18 +0000
Date: Sat, 6 Jan 2018 21:40:00 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, architt@codeaurora.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH 2/2] mtd: brcmnand: Add a NULL check for devm_kasprintf()
Message-ID: <20180106214000.4d75c709@bbrezillon>
In-Reply-To: <20180106103557.6612a12c@bbrezillon>
References: <1515182576-2704-1-git-send-email-festevam@gmail.com>
 <1515182576-2704-2-git-send-email-festevam@gmail.com>
 <20180106103557.6612a12c@bbrezillon>
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

On Sat, 6 Jan 2018 10:35:57 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Fabio,
> 
> The prefix should be "mtd: nand: brcmnand: ".
> 
> No need to resend, I'll fix it when applying.
> 
> Thanks,
> 
> Boris
> 
> On Fri,  5 Jan 2018 18:02:56 -0200
> Fabio Estevam <festevam@gmail.com> wrote:
> 
> > From: Fabio Estevam <fabio.estevam@nxp.com>
> > 
> > devm_kasprintf() may fail, so we should better add a NULL check
> > and propagate an error on failure.
> > 
> > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Applied.

Thanks,

Boris

> > ---
> >  drivers/mtd/nand/brcmnand/brcmnand.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> > index 3310e14..8942aa6 100644
> > --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> > +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> > @@ -2237,6 +2237,8 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
> >  	nand_set_controller_data(chip, host);
> >  	mtd->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "brcmnand.%d",
> >  				   host->cs);
> > +	if (!mtd->name)
> > +		return -ENOMEM;
> >  	mtd->owner = THIS_MODULE;
> >  	mtd->dev.parent = &pdev->dev;
> >    
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
