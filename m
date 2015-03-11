Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVodh-0006nm-He
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 21:58:06 +0000
Received: by pdjy10 with SMTP id y10so14347956pdj.12
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2015 14:57:44 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: m25p80: bind to "nor-jedec" ID, for auto-detection
Date: Wed, 11 Mar 2015 14:57:26 -0700
Message-Id: <1426111046-29900-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the new 'nor-jedec' binding to provide automatic detection of flash
that use the 0x9F READ ID opcode. This can help for use cases where
platforms just specify compatibility with "m25p80", and then see
messages like this:

  m25p80 spi32766.0: found s25fl256s1, expected m25p80

Instead, they can just specify the generic string and see this:

  m25p80 spi32766.0: s25fl256s1 (32768 Kbytes)

Also, update the language about m25p_ids[] to straighten out the
expectations here. We should no longer need to continuously grow the
m25p_ids[] table, and in fact, we might want to start removing entries
which are not used in device trees so far, so we can just default to
auto-detection as much as possible in the future.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 85e35467fba6..7c8b1694a134 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -223,6 +223,8 @@ static int m25p_probe(struct spi_device *spi)
 	 */
 	if (data && data->type)
 		flash_name = data->type;
+	else if (!strcmp(spi->modalias, "nor-jedec"))
+		flash_name = NULL; /* auto-detect */
 	else
 		flash_name = spi->modalias;
 
@@ -247,9 +249,16 @@ static int m25p_remove(struct spi_device *spi)
 }
 
 /*
- * XXX This needs to be kept in sync with spi_nor_ids.  We can't share
- * it with spi-nor, because if this is built as a module then modpost
- * won't be able to read it and add appropriate aliases.
+ * Do NOT add to this array without reading the following:
+ *
+ * Historically, many flash devices are bound to this driver by their name. But
+ * since most of these flash are compatible to some extent, and their
+ * differences can often be differentiated by the JEDEC read-ID command, we
+ * encourage new users to add support to the spi-nor library, and simply bind
+ * against a generic string here (e.g., "nor-jedec").
+ *
+ * Many flash names are kept here in this list (as well as in spi-nor.c) to
+ * keep them available as module aliases for existing platforms.
  */
 static const struct spi_device_id m25p_ids[] = {
 	{"at25fs010"},	{"at25fs040"},	{"at25df041a"},	{"at25df321a"},
@@ -291,6 +300,12 @@ static const struct spi_device_id m25p_ids[] = {
 	{"w25x64"},	{"w25q64"},	{"w25q80"},	{"w25q80bl"},
 	{"w25q128"},	{"w25q256"},	{"cat25c11"},
 	{"cat25c03"},	{"cat25c09"},	{"cat25c17"},	{"cat25128"},
+
+	/*
+	 * Generic support for SPI NOR that can be identified by the JEDEC READ
+	 * ID opcode (0x9F). Use this, if possible.
+	 */
+	{"nor-jedec"},
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, m25p_ids);
-- 
1.9.1
