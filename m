Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzIU1-0001qD-Sx
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 06:14:15 +0000
Date: Thu, 19 Nov 2015 07:13:45 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Brian Norris <computersforpeace@gmail.com>
cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Jason Cooper <jason@lakedaemon.net>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 1/4] mtd: brcmnand: improve memory management
In-Reply-To: <20151118224440.GC64635@google.com>
Message-ID: <alpine.DEB.2.02.1511190713140.2008@localhost6.localdomain6>
References: <1447884254-26336-1-git-send-email-Julia.Lawall@lip6.fr>
 <1447884254-26336-2-git-send-email-Julia.Lawall@lip6.fr>
 <20151118224440.GC64635@google.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Wed, 18 Nov 2015, Brian Norris wrote:

> On Wed, Nov 18, 2015 at 11:04:11PM +0100, Julia Lawall wrote:
> > This patch addresses several related memory management issues in the probe
> > function:
> > 
> > 1. for_each_available_child_of_node performs an of_node_get on each
> > iteration, so a break out of the loop requires an of_node_put.
> > 
> > A simplified version of the semantic patch that fixes this problem is as
> > follows (http://coccinelle.lip6.fr):
> > 
> > // <smpl>
> > @@
> > expression root,e;
> > local idexpression child;
> > @@
> > 
> >  for_each_available_child_of_node(root, child) {
> >    ... when != of_node_put(child)
> >        when != e = child
> > (
> >    return child;
> > |
> > +  of_node_put(child);
> > ?  return ...;
> > )
> >    ...
> >  }
> > // </smpl>
> 
> Good catch again
> 
> > 2. The devm_kzalloc'd data is not used if brcmnand_init_cs fails.  Free it
> > immediately, using devm_kfree in this case, instead of waiting for the
> > remove function.
> 
> Same
> 
> > 3. If the continue is not taken, then host is added to a list, that has a
> > lifetime beyond the end of the for_each_available_child_of_node loop body.
> > Thus, of_node_get is needed on child, which is referenced by host.  A
> > corresponding of_node_put is needed in the remove function.
> 
> This one's a bit silly. We really shouldn't be keeping the reference in
> 'host' at all. Also, as of commit 215a02fd3087 ("mtd: grab a reference to
> the MTD of_node before registering it"), the MTD core will actually be
> refcounting the node for us, too, so this isn't really necessary.
> 
> I have a patch to remove brcmnand_host::of_node (appended below), which
> should make this step obsolete, and be more obvious that no extra
> of_node_get()'ing is required.

OK.  Should I resend my patch without this change?

julia

> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> > 
> > ---
> > 
> > One could consider whether the of_node_get should be on host->of_node,
> > which looks more similar to the thing that is stored in the list.  I used
> > child, to be more similar to the of_node_put in the same function.
> > 
> >  drivers/mtd/nand/brcmnand/brcmnand.c |   14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> > index 2a437c7..b0cb55d 100644
> > --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> > +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> > @@ -2237,16 +2237,20 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
> >  			struct brcmnand_host *host;
> >  
> >  			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> > -			if (!host)
> > +			if (!host) {
> > +				of_node_put(child);
> >  				return -ENOMEM;
> 
> In code reading, I noticed that we don't actually cleanup for prior
> iterations of brcmnand_init_cs() here. i.e., if we're exiting here, we
> should be doing nand_release() on all previously-registered chips.
> 
> > +			}
> >  			host->pdev = pdev;
> >  			host->ctrl = ctrl;
> >  			host->of_node = child;
> >  
> >  			ret = brcmnand_init_cs(host);
> > -			if (ret)
> > +			if (ret) {
> > +				devm_kfree(dev, host);
> >  				continue; /* Try all chip-selects */
> > -
> > +			}
> > +			of_node_get(child);
> >  			list_add_tail(&host->node, &ctrl->host_list);
> >  		}
> >  	}
> > @@ -2264,8 +2268,10 @@ int brcmnand_remove(struct platform_device *pdev)
> >  	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
> >  	struct brcmnand_host *host;
> >  
> > -	list_for_each_entry(host, &ctrl->host_list, node)
> > +	list_for_each_entry(host, &ctrl->host_list, node) {
> > +		of_node_put(host->of_node);
> >  		nand_release(&host->mtd);
> > +	}
> >  
> >  	dev_set_drvdata(&pdev->dev, NULL);
> >  
> 
> Patch to kill off some of this:
> 
> ---8<---
> From 6c51a9ef1325e7b06a7623c1fbca1adf6eeb8253 Mon Sep 17 00:00:00 2001
> From: Brian Norris <computersforpeace@gmail.com>
> Date: Wed, 18 Nov 2015 14:33:24 -0800
> Subject: [PATCH] mtd: brcmnand: drop brcmnand_host::of_node field
> 
> We don't actually need to stash a copy of this device_node indefinitely;
> we only need it in brcmnand_init_cs().
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: <bcm-kernel-feedback-list@broadcom.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index c395b4a75fb1..351438a62aaa 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -176,7 +176,6 @@ struct brcmnand_cfg {
>  
>  struct brcmnand_host {
>  	struct list_head	node;
> -	struct device_node	*of_node;
>  
>  	struct nand_chip	chip;
>  	struct mtd_info		mtd;
> @@ -1896,10 +1895,9 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>  	return 0;
>  }
>  
> -static int brcmnand_init_cs(struct brcmnand_host *host)
> +static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
>  {
>  	struct brcmnand_controller *ctrl = host->ctrl;
> -	struct device_node *dn = host->of_node;
>  	struct platform_device *pdev = host->pdev;
>  	struct mtd_info *mtd;
>  	struct nand_chip *chip;
> @@ -2231,9 +2229,8 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  				return -ENOMEM;
>  			host->pdev = pdev;
>  			host->ctrl = ctrl;
> -			host->of_node = child;
>  
> -			ret = brcmnand_init_cs(host);
> +			ret = brcmnand_init_cs(host, child);
>  			if (ret)
>  				continue; /* Try all chip-selects */
>  
> -- 
> 2.6.0.rc2.230.g3dd15c0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
