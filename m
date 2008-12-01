Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L77Pj-0000iW-LZ
	for linux-mtd@lists.infradead.org; Mon, 01 Dec 2008 11:58:08 +0000
Date: Mon, 1 Dec 2008 12:57:57 +0100
From: Daniel Mack <daniel@caiaq.de>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: [PATCH] add missing cmdset field in PXA3xx NAND code
Message-ID: <20081201115757.GA14755@buzzloop.caiaq.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds a missing .cmdset parameter for STM 2G NAND chip
definition. Even though support for built-in NAND chips is
marked deprecated, the driver crashes in __readid() due to a NULL
pointer dereference if it's not there.

Signed-off-by: Daniel Mack <daniel@caiaq.de>

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index c0fa9c9..ff4d28e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -269,6 +269,7 @@ static struct pxa3xx_nand_timing stm2GbX16_timing = {
 
 static struct pxa3xx_nand_flash stm2GbX16 = {
        .timing = &stm2GbX16_timing,
+       .cmdset = &largepage_cmdset,
        .page_per_block = 64,
        .page_size = 2048,
        .flash_width = 16,
