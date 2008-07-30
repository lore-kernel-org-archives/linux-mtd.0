Received: from smtp123.sbc.mail.sp1.yahoo.com ([69.147.64.96])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KO3ry-0001hW-NQ
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 05:05:03 +0000
Date: Tue, 29 Jul 2008 22:07:50 -0700
From: David Brownell <david-b@pacbell.net>
To: akpm@linux-foundation.org
Subject: Re: [RESEND x2 PATCH 2.6.26-git 1/2] MTD DataFlash: bugfix, binary
	page sizes now handled (v3)
References: <200807270325.13790.david-b@pacbell.net>
	<20080729213733.3345546a.akpm@linux-foundation.org>
In-Reply-To: <20080729213733.3345546a.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20080730050750.A4C013608ED@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
Cc: dwmw2@infradead.org, cooloney@kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, michael.hennerich@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> drivers/mtd/devices/mtd_dataflash.c: In function 'jedec_probe':
> drivers/mtd/devices/mtd_dataflash.c:611: error: incompatible type for argument 1 of 'dev_name'
> drivers/mtd/devices/mtd_dataflash.c:619: error: incompatible type for argument 1 of 'dev_name'
>

It seems the MTD debug facility doesn't follow the (recent)
rule of making debug code subject to dead code elimination
rather than the more error-prone CPP level elimination.
I sense a patch coming ...

The following tweak resolves the stuff above ... do you want
a new patch?

- Dave


--- g26.orig/drivers/mtd/devices/mtd_dataflash.c	2008-07-29 22:00:32.000000000 -0700
+++ g26/drivers/mtd/devices/mtd_dataflash.c	2008-07-29 22:00:17.000000000 -0700
@@ -609,7 +609,7 @@ static struct flash_info *__devinit jede
 			tmp++, info++) {
 		if (info->jedec_id == jedec) {
 			DEBUG(MTD_DEBUG_LEVEL1, "%s: OTP, sector protect%s\n",
-				dev_name(spi->dev),
+				dev_name(&spi->dev),
 				(info->flags & SUP_POW2PS)
 					? ", binary pagesize" : ""
 				);
@@ -618,7 +618,7 @@ static struct flash_info *__devinit jede
 				if (status < 0) {
 					DEBUG(MTD_DEBUG_LEVEL1,
 						"%s: status error %d\n",
-						dev_name(spi->dev), status);
+						dev_name(&spi->dev), status);
 					return ERR_PTR(status);
 				}
 				if (status & 0x1) {
