Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYfHX-0007Ge-8A
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 21:48:37 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23992404AbeAHVsUxJgRB (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Mon, 8 Jan 2018 22:48:20 +0100
Date: Mon, 8 Jan 2018 22:48:19 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 Miquel RAYNAL <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH v4 0/4] mtd: Preparation patches for the SPI NAND framework
Message-ID: <20180108214819.GA16174@lenoch>
References: <20180108211542.11891-1-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180108211542.11891-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 08, 2018 at 10:15:39PM +0100, Boris Brezillon wrote:
> Hello,
> 
> Here is a set of patches preparing the introduction of the generic
> NAND and SPI frameworks.

Tested on IGEPv2 Rev. B (TI OMAP3530) with Muxed OneNAND(DDP) 512MB 1.8V
16-bit (0x58) after fixing PATCH v4 1/3.

Tested-by: Ladislav Michl <ladis@linux-mips.org>

> If you want to see the overall picture of the SPI NAND framework you can
> have a look at this branch [2].
> 
> Regards,
> 
> Boris
> 
> Change in v4:
> - add "mtd: mtdpart: Make ECC stat handling consistent" and
> - integrate "mtd: Remove duplicate checks on mtd_oob_ops parameter"
>   into this series
> - drop "mtd: Stop directly calling master ->_xxx() hooks from mtdpart
>   code"
> 
> Boris Brezillon (3):
>   mtd: mtdpart: Make ECC stat handling consistent
>   mtd: Fallback to ->_read/write_oob() when ->_read/write() is missing
>   mtd: Remove duplicate checks on mtd_oob_ops parameter
> 
>  drivers/mtd/devices/docg3.c        | 70 ------------------------------
>  drivers/mtd/mtdcore.c              | 31 +++++++++++++-
>  drivers/mtd/mtdpart.c              | 42 +++++-------------
>  drivers/mtd/nand/nand_base.c       | 87 --------------------------------------
>  drivers/mtd/onenand/onenand_base.c | 81 -----------------------------------
>  5 files changed, 40 insertions(+), 271 deletions(-)
> 
> -- 
> 2.11.0
