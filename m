Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZerJ-0000RO-GS
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 10:43:14 +0000
Date: Fri, 25 Oct 2013 07:42:47 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v2 4/5] mtd: nand: omap2: Use devm_kzalloc
Message-ID: <20131025104246.GA2489@localhost>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382696277-9063-5-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2AD60@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA2AD60@DBDE04.ent.ti.com>
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 25, 2013 at 10:25:02AM +0000, Gupta, Pekon wrote:
> Hi,
> 
> > 
> > This simplifies the error path and makes the code less error-prone.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  drivers/mtd/nand/omap2.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> > index e01a936..d3155b2 100644
> > --- a/drivers/mtd/nand/omap2.c
> > +++ b/drivers/mtd/nand/omap2.c
> > @@ -1837,7 +1837,7 @@ static int omap_nand_probe(struct
> > platform_device *pdev)
> >  		return -ENODEV;
> >  	}
> > 
> > -	info = kzalloc(sizeof(struct omap_nand_info), GFP_KERNEL);
> > +	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
> >  	if (!info)
> >  		return -ENOMEM;
> > 
> > @@ -2067,8 +2067,6 @@ out_release_mem_region:
> >  		free_irq(info->gpmc_irq_fifo, info);
> >  	release_mem_region(info->phys_base, info->mem_size);
> >  out_free_info:
> > -	kfree(info);
> > -
> >  	return err;
> >  }
> > 
> > @@ -2091,7 +2089,6 @@ static int omap_nand_remove(struct
> > platform_device *pdev)
> >  	nand_release(&info->mtd);
> >  	iounmap(info->nand.IO_ADDR_R);
> >  	release_mem_region(info->phys_base, info->mem_size);
> > -	kfree(info);
> >  	return 0;
> >  }
> > 
> > --
> > 1.8.1.5
> 
> I think these changes are already done as part of following patch..
> http://lists.infradead.org/pipermail/linux-mtd/2013-October/049418.html
> 
> Did your rebase on my patch-set ?
> 

Hm.. well the problem with that patch is that it's in the middle of an
unrelated series. As I already told you, I think you should have pushed
that as a one-patch fix. Have you seen that suggestion?

On the other side, you're fixing too many things in that single patch,
for my taste. Maybe I'm not the smarter developer, but going through
that patch is not easy to catch if there's no mistake done.

Usually if it's possible to split a patch (maintaining consistency) it makes
the reviewing process easier.
If you'd rather send this devm_xxx change yourself that's fine by me,
but *please* split the patch in two and write proper commit messages.

Anyway: this is just a silly change, the important one is the other
nand_scan_ident() fix. Could you help me review that?

I'm interested in knowing how will that work with 8-bit and 16-bit devices.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
