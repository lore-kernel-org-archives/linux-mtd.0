Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayipj-0005a7-Gj
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 16:42:32 +0000
Received: by mail-pa0-x235.google.com with SMTP id bt5so48858635pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 06 May 2016 09:42:11 -0700 (PDT)
Date: Fri, 6 May 2016 09:42:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [RESEND PULL] mtd: nand: changes for 4.7
Message-ID: <20160506164207.GA76775@google.com>
References: <20160506001823.09386543@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160506001823.09386543@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 06, 2016 at 12:18:23AM +0200, Boris Brezillon wrote:
> Hi Brian,

Hi Boris,

Nit: I might call this "PULL v2" or something else, not "PULL RESEND".

> I pushed a new nand/for-4.7 tag addressing your comments and fixing the
> circular dependency bug and white space problems you reported.

Thanks, looks better this time.

> Let me know if you see anything else.
> 
> Thanks,
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
> for you to fetch changes up to 666b65683dad9aa90efaa4aad24ef3710101e3aa:
> 
>   mtd: brcmnand: respect ECC algorithm set by NAND subsystem (2016-05-05 23:55:15 +0200)

Pulled into l2-mtd.git. Thanks!

> ----------------------------------------------------------------
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
> 
> ----------------------------------------------------------------

[...]

Brian
