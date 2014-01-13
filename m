Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2cVV-0007It-GF
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 08:04:26 +0000
Received: by mail-pa0-f46.google.com with SMTP id rd3so1543256pab.19
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2014 00:04:04 -0800 (PST)
Date: Mon, 13 Jan 2014 00:04:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 3/5] mtd: nand: add generic READ RETRY support
Message-ID: <20140113080400.GK1992@norris-Latitude-E6410>
References: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
 <1388795828-24808-3-git-send-email-computersforpeace@gmail.com>
 <20140107061733.GD8109@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140107061733.GD8109@shlinux2.ap.freescale.net>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 07, 2014 at 02:17:34PM +0800, Huang Shijie wrote:
> On Fri, Jan 03, 2014 at 04:37:06PM -0800, Brian Norris wrote:
> > @@ -1514,8 +1535,27 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
> >  					nand_wait_ready(mtd);
> >  			}
> >  
> > -			if (mtd->ecc_stats.failed - ecc_failures)
> > -				ecc_fail = true;
> > +			if (mtd->ecc_stats.failed - ecc_failures) {
> > +				if (retry_mode + 1 <= chip->read_retries) {
> > +					retry_mode++;
> > +					pr_debug("ECC error; performing READ RETRY %d\n",
> > +							retry_mode);
> 
> you can move this pr_debug into the nand_set_read_retry().

OK.

> > +
> > +					ret = nand_set_read_retry(mtd,
> > +							retry_mode);
> > +					if (ret < 0)
> > +						break;
> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > index 029fe5948dc4..ef70505dade1 100644
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h
> > @@ -472,6 +472,8 @@ struct nand_buffers {
> >   *			commands to the chip.
> >   * @waitfunc:		[REPLACEABLE] hardwarespecific function for wait on
> >   *			ready.
> > + * @set_read_retry:	[FLASHSPECIFIC] flash (vendor) specific function for
> > + *			setting the read-retry mode. Mostly needed for MLC NAND.
> 
> why not use the name "read_retry"?
> i think it is more clear.

It's not actually performing any "read" or a "retry"; the function is
just configuring the device for a retry. So I don't think read_retry is
correct. For my name, I was abbreviating "set read retry mode". How do
you like "setup_read_retry" or "set_read_retry_mode"?

Brian
