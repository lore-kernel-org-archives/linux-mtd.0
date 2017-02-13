Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdBlc-0001EC-4m
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 08:13:51 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicholas Mc Guire <der.herr@hofr.at>
Subject: [PATCH V2] mtd: spi-nor: intel: use true/false for boolean
Date: Mon, 13 Feb 2017 09:13:56 +0100
Message-Id: <1486973636-1117-1-git-send-email-der.herr@hofr.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

writeable in struct intel_spi is a boolean and assignment should be to
true/false not 1/0 as recommended by boolinit.cocci.

Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---

make coccicheck complained with:
 ./drivers/mtd/spi-nor/intel-spi.c:707:3-18: WARNING: Assignment of bool to 0/1

Patch was compile tested with: multi_v7_defconfig (implies CONFIG_MTD_SPI_NOR=y)

Patch is against 4.10-rc7 (localversion-next is next-20170213)

 drivers/mtd/spi-nor/intel-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index 4630716..2956f2c 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -704,7 +704,7 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
 		 * whole partition read-only to be on the safe side.
 		 */
 		if (intel_spi_is_protected(ispi, base, limit))
-			ispi->writeable = 0;
+			ispi->writeable = false;
 
 		end = (limit << 12) + 4096;
 		if (end > part->size)
-- 
2.1.4
