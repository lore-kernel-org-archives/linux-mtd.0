Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1enrIH-0004AF-4s
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 19:40:10 +0000
Received: by mail-pg0-x243.google.com with SMTP id y8so6223213pgr.9
 for <linux-mtd@lists.infradead.org>; Mon, 19 Feb 2018 11:39:58 -0800 (PST)
Message-ID: <1519069191.2102.3.camel@gmail.com>
Subject: Re: [PATCH NAND] mtd: nand: Replace printk() with appropriate
 dev_*macro()
From: Shreeya Patel <shreeya.patel23498@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr,  maximlevitsky@gmail.com,
 linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar,  outreachy-kernel@googlegroups.com
Date: Tue, 20 Feb 2018 01:09:51 +0530
In-Reply-To: <20180219161216.4f3ec2f3@bbrezillon>
References: <1519046339-9678-1-git-send-email-shreeya.patel23498@gmail.com>
 <20180219161216.4f3ec2f3@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2018-02-19 at 16:12 +0100, Boris Brezillon wrote:
> On Mon, 19 Feb 2018 18:48:59 +0530
> Shreeya Patel <shreeya.patel23498@gmail.com> wrote:
> 
> > 
> > Replace printks having a log level with the appropriate
> > dev_*macro.
> > Also, use pdev->dev as it is guaranteed in each case to be
> > properly initialized when passed into dev_*macro().
> > 
> > Signed-off-by: Shreeya Patel <shreeya.patel23498@gmail.com>
> > ---
> >  drivers/mtd/nand/ams-delta.c | 6 ++++--
> >  drivers/mtd/nand/cafe_nand.c | 5 +++--
> >  drivers/mtd/nand/sh_flctl.c  | 2 +-
> >  3 files changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-
> > delta.c
> > index dcec9cf..2419ca8 100644
> > --- a/drivers/mtd/nand/ams-delta.c
> > +++ b/drivers/mtd/nand/ams-delta.c
> > @@ -185,7 +185,8 @@ static int ams_delta_init(struct
> > platform_device *pdev)
> >  	/* Allocate memory for MTD device structure and private
> > data */
> >  	this = kzalloc(sizeof(struct nand_chip), GFP_KERNEL);
> >  	if (!this) {
> > -		printk (KERN_WARNING "Unable to allocate E3 NAND
> > MTD device structure.\n");
> > +		dev_warn(&pdev->dev,
> > +			 "Unable to allocate E3 NAND MTD device
> > structure.\n");
> >  		err = -ENOMEM;
> >  		goto out;
> >  	}
> > @@ -219,7 +220,8 @@ static int ams_delta_init(struct
> > platform_device *pdev)
> >  		this->dev_ready = ams_delta_nand_ready;
> >  	} else {
> >  		this->dev_ready = NULL;
> > -		printk(KERN_NOTICE "Couldn't request gpio for
> > Delta NAND ready.\n");
> > +		dev_notice(&pdev->dev,
> > +			   "Couldn't request gpio for Delta NAND
> > ready.\n");
> >  	}
> >  	/* 25 us command delay time */
> >  	this->chip_delay = 30;
> > diff --git a/drivers/mtd/nand/cafe_nand.c
> > b/drivers/mtd/nand/cafe_nand.c
> > index bc558c4..51f58ea 100644
> > --- a/drivers/mtd/nand/cafe_nand.c
> > +++ b/drivers/mtd/nand/cafe_nand.c
> > @@ -773,8 +773,9 @@ static int cafe_nand_probe(struct pci_dev
> > *pdev,
> >  		cafe->nand.bbt_td = &cafe_bbt_main_descr_512;
> >  		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_512;
> >  	} else {
> > -		printk(KERN_WARNING "Unexpected NAND flash
> > writesize %d. Aborting\n",
> > -		       mtd->writesize);
> > +		dev_warn(&cafe->pdev->dev,
> > +			 "Unexpected NAND flash writesize %d.
> > Aborting\n",
> > +			 mtd->writesize);
> >  		goto out_free_dma;
> I see plenty of printk()s (or pr_xxx()s if this patch is applied
> after
> the printk() -> pr_xxx() replacement) that are not converted to
> dev_xxx() in this driver. If we start using dev_xxx() it should be
> used
> consistently.
> 
> How about we convert all printk()s to pr_xxx()s first (what you do in
> your first patch), including those you convert to dev_xxx() here, and
> then we consider patching some of the drivers to use dev_xxx()
> instead
> of pr_xxx().

Yes, this will be better :)
I'll include these changes in my pr_xxx() patch.
Then we will work for dev_xxx().

Thanks

> 
> > 
> >  	}
> >  	cafe->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
> > diff --git a/drivers/mtd/nand/sh_flctl.c
> > b/drivers/mtd/nand/sh_flctl.c
> > index e7f3c98..c534c49 100644
> > --- a/drivers/mtd/nand/sh_flctl.c
> > +++ b/drivers/mtd/nand/sh_flctl.c
> > @@ -877,7 +877,7 @@ static void flctl_cmdfunc(struct mtd_info *mtd,
> > unsigned int command,
> >  			else if (!flctl->seqin_column)
> >  				execmd_write_page_sector(mtd);
> >  			else
> > -				printk(KERN_ERR "Invalid address
> > !?\n");
> > +				dev_err(&flctl->pdev->dev,
> > "Invalid address !?\n");
> >  			break;
> >  		}
> >  		set_cmd_regs(mtd, command, (command << 8) |
> > NAND_CMD_SEQIN);
> 
> 
