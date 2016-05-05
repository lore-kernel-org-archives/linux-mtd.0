Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayOAa-00073O-92
 for linux-mtd@lists.infradead.org; Thu, 05 May 2016 18:38:40 +0000
Received: by mail-pa0-x22e.google.com with SMTP id xk12so38918620pac.0
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 11:38:19 -0700 (PDT)
Date: Thu, 5 May 2016 11:38:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PULL] mtd: nand: changes for 4.7
Message-ID: <20160505183815.GA89390@google.com>
References: <20160429101348.309d4784@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160429101348.309d4784@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Fri, Apr 29, 2016 at 10:13:48AM +0200, Boris Brezillon wrote:
> Hi Brian,
> 
> This is my first PR for the NAND subsystem, so don't hesitate to tell me
> if I did something wrong ;).

Overall things aren't too bad, but I do have some comments.

> This pull request contains the following infrastructure changes:
> * introduction of the ECC algo concept to extend the ECC mode one
> * replacement of the nand_ecclayout infrastructure by something more
>   future-proof.
> * addition of an mtd-activity led trigger to replace the nand-activity
>   one
> 
> And a bunch of specific NAND driver improvements/fixes. Here are the
> changes that are worth mentioning:
> * rework of the OMAP GPMC and NAND drivers
> * prepare the sunxi NAND driver to receive DMA support
> * handle bitflips in erased pages on GPMI revisions that do not support
>   this in hardware.

Thanks for the summary; it'd be nice if you can include this in the tag
description next time. Then it'll get auto-populated below with
git-request-pull, and it'll get pulled in automatically for me.

I also see this when I try to build a reasonably simple kernel:

depmod: ERROR: Found 5 modules in dependency cycles!
depmod: ERROR: Cycle detected: nand -> nand_bch -> nand

I think the new reference to &nand_ooblayout_lp_ops in nand_bch.c is
causing this (I can at least build/boot if I hack that out).

I haven't finished looking through everything else, but mostly looks
sane.

Regards,
Brian

> Best Regards,
> 
> Boris
> 
> The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:
> 
>   Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)
> 
> are available in the git repository at:
> 
>   git@github.com:linux-nand/linux.git tags/nand/for-4.7
> 
> for you to fetch changes up to 4ab41e74ae5df89b8bc9909ba35fc19bbd1d6221:
> 
>   mtd: brcmnand: respect ECC algorithm set by NAND subsystem (2016-04-27 09:51:43 +0200)
> 
> ----------------------------------------------------------------
> This tag contains all the NAND related changes for 4.7.
> 
> ----------------------------------------------------------------

[snip]
