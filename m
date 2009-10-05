Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MuutR-0003tq-QN
	for linux-mtd@lists.infradead.org; Mon, 05 Oct 2009 21:15:03 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/3] mtd: m25p80: disable SST software protection bits by
	default
Date: Mon,  5 Oct 2009 17:14:47 -0400
Message-Id: <1254777289-32109-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1254777289-32109-1-git-send-email-vapier@gentoo.org>
References: <1254777289-32109-1-git-send-email-vapier@gentoo.org>
Cc: Graf Yang <graf.yang@analog.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Graf Yang <graf.yang@analog.com>

The SST SPI flashes is like Atmel SPI flashes in that the software
protection bits are set by default at power up, so clear them at init
time.

Signed-off-by: Graf Yang <graf.yang@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/devices/m25p80.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 379c316..933267a 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -775,11 +775,12 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	dev_set_drvdata(&spi->dev, flash);
 
 	/*
-	 * Atmel serial flash tend to power up
-	 * with the software protection bits set
+	 * Atmel and SST serial flash tend to power
+	 * up with the software protection bits set
 	 */
 
-	if (info->jedec_id >> 16 == 0x1f) {
+	if (info->jedec_id >> 16 == 0x1f ||
+	    info->jedec_id >> 16 == 0xbf) {
 		write_enable(flash);
 		write_sr(flash, 0);
 	}
-- 
1.6.5.rc2
