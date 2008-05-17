Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JxK1P-0001iv-OY
	for linux-mtd@lists.infradead.org; Sat, 17 May 2008 10:52:16 +0000
Received: by wf-out-1314.google.com with SMTP id 28so560989wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 17 May 2008 03:52:13 -0700 (PDT)
From: Bryan Wu <cooloney@kernel.org>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	mike@steroidmicros.com
Subject: [PATCH 1/1] mtd m25p80: fix bug - ATmel spi flash fails to be copied
	to
Date: Sat, 17 May 2008 18:52:06 +0800
Message-Id: <1211021526-24076-1-git-send-email-cooloney@kernel.org>
Sender: Bryan Wu <cooloney.lkml@gmail.com>
Cc: Bryan Wu <cooloney@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michael Hennerich <michael.hennerich@analog.com>

Atmel serial flash tends to power up with the protection status bits set.
http://blackfin.uclinux.org/gf/project/uclinux-dist/tracker/?action=TrackerItemEdit&tracker_item_id=4089

Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/devices/m25p80.c |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 25efd33..b10649b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -33,6 +33,7 @@
 /* Flash opcodes. */
 #define	OPCODE_WREN		0x06	/* Write enable */
 #define	OPCODE_RDSR		0x05	/* Read status register */
+#define	OPCODE_WRSR		0x01	/* Write status register 1 byte */
 #define	OPCODE_NORM_READ	0x03	/* Read data bytes (low frequency) */
 #define	OPCODE_FAST_READ	0x0b	/* Read data bytes (high frequency) */
 #define	OPCODE_PP		0x02	/* Page program (up to 256 bytes) */
@@ -112,6 +113,19 @@ static int read_sr(struct m25p *flash)
 	return val;
 }
 
+/*
+ * Write status register 1 byte
+ * Returns negative if error occurred.
+ */
+static int write_sr(struct m25p *flash, u8 val)
+{
+	flash->command[0] = OPCODE_WRSR;
+	flash->command[1] = val;
+
+	spi_write(flash->spi, flash->command, 2);
+
+	return spi_write(flash->spi, flash->command, 2);
+}
 
 /*
  * Set write enable latch with Write Enable command.
@@ -587,6 +601,16 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	mutex_init(&flash->lock);
 	dev_set_drvdata(&spi->dev, flash);
 
+	/*
+	 * Atmel serial flash tend to power up
+	 * with the software protection bits set
+	 */
+
+	if (info->jedec_id >> 16 == 0x1f) {
+		write_enable(flash);
+		write_sr(flash, 0);
+	}
+
 	if (data && data->name)
 		flash->mtd.name = data->name;
 	else
-- 
1.5.5
