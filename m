Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwf5z-0006xu-Hg
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 23:46:31 +0000
Received: by padhx2 with SMTP id hx2so44929985pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 15:46:10 -0800 (PST)
Date: Wed, 11 Nov 2015 15:46:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
Subject: Re: [PATCH v2 06/11] mtd: nand: drop unnecessary partition parser data
Message-ID: <20151111234607.GA96199@google.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
 <1446262410-45754-7-git-send-email-computersforpeace@gmail.com>
 <20151101233237.21155d9e@bbrezillon>
 <20151102210001.GB7274@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151102210001.GB7274@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 02, 2015 at 01:00:01PM -0800, Brian Norris wrote:
> On Sun, Nov 01, 2015 at 11:32:37PM +0100, Boris Brezillon wrote:
> > On Fri, 30 Oct 2015 20:33:25 -0700
> > Brian Norris <computersforpeace@gmail.com> wrote:
> > 
> [...]
> > > diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> > > index dcb1f7f4873f..850546dc98c8 100644
> > > --- a/drivers/mtd/nand/fsl_elbc_nand.c
> > > +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> > > @@ -748,6 +748,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
> > >  	/* Fill in fsl_elbc_mtd structure */
> > >  	priv->mtd.priv = chip;
> > >  	priv->mtd.dev.parent = priv->dev;
> > > +	chip->flash_node = priv->dev->of_node;
> > 
> > Shouldn't we use the nand_set_flash_node() helper here? Here is a diff replacing
> > all 'chip->flash_node =' occurrences by nand_set_flash_node():
> 
> Hmm, I don't know why I overlooked those. I think maybe I did the
> initial replacement before this patch and forgot to do the same
> replacement on my subsequent work. I guess that's what happens when I
> rebase/rework too much...
> 
> Thanks for the diff. I'll probably squash it into v3 if/when that comes.

Pushed my patch 6 + your diff to l2-mtd.git/next. Thanks!
