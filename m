Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MA4O2-0005Wi-Mz
	for linux-mtd@lists.infradead.org; Fri, 29 May 2009 15:52:58 +0000
Date: Sat, 30 May 2009 00:52:47 +0900 (JST)
Message-Id: <20090530.005247.95058787.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: Re: mtd: remove driver-core BUS_ID_SIZE
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1243604021.19886.152.camel@macbook.infradead.org>
References: <1243603308.19886.149.camel@macbook.infradead.org>
	<ac3eb2510905290625g4f89ef7cj597892affb94a9e6@mail.gmail.com>
	<1243604021.19886.152.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: kay.sievers@vrfy.org, linux-mtd@lists.infradead.org, gregkh@suse.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 29 May 2009 14:33:41 +0100, David Woodhouse <dwmw2@infradead.org> wrote:
> > > This might work better. Nemoto-san, can you test and confirm?

Sure, I will test it on next week.

> > > diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
> > 
> > >                if (plat->ch_mask != 1) {
> > > +                       char *devname = dev_name(&dev->dev);
> > >                        txx9_priv->cs = i;
> > > +                       txx9_priv->mtdname = kmalloc(strlen(devname) + 3,
> > > +                                                    GFP_KERNEL);
> > 
> > kasprintf() might be nicer here?
> 
> True; thanks. (Er, how have I managed not to know that asprintf()
> exists, for the last 20-odd years?)
> 
> diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
...
>  		} else {
>  			txx9_priv->cs = -1;
> -			strcpy(txx9_priv->mtdname, dev_name(&dev->dev));
> +			txx9_priv->mtdname = dev_name(&dev->dev);

Use kstrdup() here, otherwise nand_scan() failure will cause memory
leak.

Or you can add conditional kfree into failure path of nand_scan(), but
I think saving few bytes is not worth to complicate an error (and
removal) path.

>  		}
>  		if (plat->wide_mask & (1 << i))
>  			chip->options |= NAND_BUSWIDTH_16;
> @@ -385,6 +391,8 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
>  		kfree(drvdata->parts[i]);
>  #endif
>  		del_mtd_device(mtd);
> +		if (txx9_priv->mtdname != dev_name(&dev->dev))
> +			kfree(txx9_priv->mtdname);

If you did kstrdup() as above, you can just call kfree unconditionally.

---
Atsushi Nemoto
