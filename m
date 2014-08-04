Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEPdq-0004gW-1e
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 21:18:02 +0000
Received: by mail-pa0-f48.google.com with SMTP id et14so27764pad.7
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 14:17:41 -0700 (PDT)
Date: Mon, 4 Aug 2014 14:17:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: increase chip_delay
Message-ID: <20140804211737.GY3711@ld-irv-0074>
References: <1406640447-9080-1-git-send-email-poggi.raph@gmail.com>
 <53D8BC92.4050907@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53D8BC92.4050907@atmel.com>
Cc: dwmw2@infradead.org, Raphael Poggi <poggi.raph@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 30, 2014 at 05:36:18PM +0800, Josh Wu wrote:
> On 7/29/2014 9:27 PM, Raphael Poggi wrote:
> >Some nand with 8k page size like Micron MT29F32G08ABAAAWP need more than 20us.
> >
> >Signed-off-by: Raphaël Poggi <poggi.raph@gmail.com>
> >---
> >  drivers/mtd/nand/atmel_nand.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> >index e321c56..77bd877 100644
> >--- a/drivers/mtd/nand/atmel_nand.c
> >+++ b/drivers/mtd/nand/atmel_nand.c
> >@@ -2099,7 +2099,7 @@ static int atmel_nand_probe(struct platform_device *pdev)
> >  	}
> >  	nand_chip->ecc.mode = host->board.ecc_mode;
> >-	nand_chip->chip_delay = 20;		/* 20us command delay time */
> >+	nand_chip->chip_delay = 40;		/* 40us command delay time */
> >  	if (host->board.bus_width_16)	/* 16-bit bus width */
> >  		nand_chip->options |= NAND_BUSWIDTH_16;
> 
> I just post a patch [1] days ago which does almost the same thing to
> support 4k-page nand flash.
> personally I am fine with your patch.
> 
> Brain, you only need to take care this patch. And drop my patch [1].
> 
> [1] http://patchwork.ozlabs.org/patch/372406/

OK, queued to l2-mtd.git/next. Thanks!

Brian
