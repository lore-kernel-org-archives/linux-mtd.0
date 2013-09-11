Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJstU-0003ki-U2
 for linux-mtd@lists.infradead.org; Wed, 11 Sep 2013 22:28:17 +0000
Received: by mail-ob0-f175.google.com with SMTP id xn12so9011449obc.6
 for <linux-mtd@lists.infradead.org>; Wed, 11 Sep 2013 15:27:55 -0700 (PDT)
Date: Wed, 11 Sep 2013 15:27:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 00/12] mtd: miscellaneous fixes
Message-ID: <20130911222751.GD4550@ld-irv-0074.broadcom.com>
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
Cc: David Brownell <david-b@pacbell.net>, Huang Shijie <b32955@freescale.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 04, 2013 at 11:25:14AM -0700, Brian Norris wrote:
> Hi all,
> 
> In poking around various drivers for my own work and for (sub)maintaining
> MTD stuff, I found an assortment of fixes to make. Most of these should be
> trivial and obvious, but they could use a glance by a few people. They have
> generally been compile tested only.
> 
> Brian
> 
> Brian Norris (12):
>   nand: docg4: use nand_base's default BBT scan
>   mtd: nand: lpc32xx_slc: don't call nand_default_bbt directly
>   mtd: nandsim: don't call nand_default_bbt() directly
>   mtd: nand: stop exporting nand_default_bbt
>   mtd: dataflash: remove unused field
>   mtd: denali: make init function static
>   mtd: nand: return failure when failing to get ECC from ONFI
>   mtd: nand: don't print ONFI buswidth errors unless we need to
>   mtd: onenand: remove redundant offset check
>   mtd: nand: remove obsolete 'ecclayout' field
>   mtd: onenand: remove unused variable assignments
>   mtd: lpddr_cmds: make function static
> 
>  drivers/mtd/devices/mtd_dataflash.c |  2 --
>  drivers/mtd/lpddr/lpddr_cmds.c      |  2 +-
>  drivers/mtd/nand/denali.c           |  2 +-
>  drivers/mtd/nand/docg4.c            |  1 -
>  drivers/mtd/nand/fsl_elbc_nand.c    |  2 --
>  drivers/mtd/nand/fsl_ifc_nand.c     |  2 --
>  drivers/mtd/nand/lpc32xx_slc.c      |  8 --------
>  drivers/mtd/nand/nand_base.c        | 23 ++++++++++++++++-------
>  drivers/mtd/nand/nand_bbt.c         |  1 -
>  drivers/mtd/nand/nandsim.c          |  2 +-
>  drivers/mtd/onenand/onenand_base.c  | 17 ++++++-----------
>  include/linux/mtd/nand.h            |  1 -
>  12 files changed, 25 insertions(+), 38 deletions(-)

Pushed everything but the ONFI stuff to l2-mtd.git. I will follow up
with a separate patch for that one.

Brian
