Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqFzA-0001GC-Tg
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 07:12:45 +0000
Received: by pdea3 with SMTP id a3so33307671pde.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2015 00:12:23 -0700 (PDT)
Date: Thu, 7 May 2015 00:12:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] mtd: nand: pxa3xx: fix build on ARM64
Message-ID: <20150507071219.GH6055@norris-Latitude-E6410>
References: <1430425067-26996-1-git-send-email-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1430425067-26996-1-git-send-email-robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 30, 2015 at 03:17:47PM -0500, Rob Herring wrote:
> In preparation to enable ARCH_MMP on ARM64, a couple of fixes are needed
> to build the pxa3xx_nand driver:
> 
> Legacy DMA will only used on ARM, so also make it condtional on
> CONFIG_ARM.
> __raw_{read,write}sl are not available on ARM64 or generically, so use
> the readsl/writesl variants instead. Somewhat inconsistently,
> {read,write}sl are inherently non-swapping with the generic version
> using __raw_{read,write}l.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> ---
> This never got applied. It is essentially the same as v1, but I added 
> some more explanation that {read,write}sl are inherently non-swapping 
> and I dropped an unneeded cast.

Applied to l2-mtd.git. Squashed this in too:

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 291396eaf896..1259cc558ce9 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -496,7 +496,7 @@ static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
 		 * the polling on the last read.
 		 */
 		while (len > 8) {
-			__raw_readsl(info->mmio_base + NDDB, data, 8);
+			readsl(info->mmio_base + NDDB, data, 8);
 
 			ret = readl_relaxed_poll_timeout(info->mmio_base + NDSR, val,
 							 val & NDSR_RDDREQ, 1000, 5000);
