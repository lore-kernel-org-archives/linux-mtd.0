Received: from mail-pa0-f47.google.com ([209.85.220.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZX5xw-0006uT-PN
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 11:12:33 +0000
Received: by pacex6 with SMTP id ex6so3325236pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 04:12:12 -0700 (PDT)
Date: Wed, 2 Sep 2015 16:42:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stefan Roese <sr@denx.de>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: fsmc: Add BCH4 SW ECC support for SPEAr600
Message-ID: <20150902111206.GF26744@linux>
References: <1441187581-12928-1-git-send-email-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441187581-12928-1-git-send-email-sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02-09-15, 11:53, Stefan Roese wrote:
> This patch adds support for 4-bit ECC BCH4 for the SPEAr600 SoC. This can
> be used by boards equipped with a NAND chip that requires 4-bit ECC
> strength. The SPEAr600 HW ECC only supports 1-bit ECC strength.
> 
> To enable SW BCH4, you need to specify this in your nand controller
> DT node:
> 
> 	nand-ecc-mode = "soft_bch";
> 
> Tested on a custom SPEAr600 board.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/fsmc_nand.c | 72 ++++++++++++++++++++++++++++++++------------
>  include/linux/mtd/fsmc.h     |  2 ++
>  2 files changed, 54 insertions(+), 20 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
