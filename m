Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZySN5-0004EF-Cx
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 22:35:36 +0000
Received: by padhx2 with SMTP id hx2so188602279pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 14:35:14 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 1/3] mtd: m25p80: fix module autoloading for "jedec,
 spi-nor" and "spi-nor"
Date: Mon, 16 Nov 2015 14:34:50 -0800
Message-Id: <1447713292-91525-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
References: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 43163022927b ("mtd: m25p80: allow arbitrary OF matching for
"jedec,spi-nor"") moved the "jedec,spi-nor" handling from the
spi_device_id table to the of_match_table, to better handle matching
complex device tree compatible strings. With that patch, device tree
support works as expected when m25p80.c is built into the kernel.

However, that commit ignored the fact that:

 (1) (non-DT) platform devices might want to use the "spi-nor" string
     for matching with this driver, rather than picking an arbitrary one
     like "m25p80"
 (2) the core SPI uevent/modalias code doesn't yet support kernel module
     autoloading via of_match_table strings; so for DT-based devices, it
     will only report (part of) the first compatible string used

Problem (1) has been reported previously, and I forgot to patch it up
afterward.

Problem (2) was noticed recently here:
http://lists.infradead.org/pipermail/linux-mtd/2015-October/062369.html
https://lkml.org/lkml/2015/11/12/574

Specifically, this patch fixes m25p80.ko module autoloading for cases
like this:

	flash@xxx {
		compatible = "jedec,spi-nor";
		...
	};

because modalias of "spi:spi-nor" (the only module loading info provided
by the SPI core for this device) will now be listed as an alias in
m25p80.ko.

Notably, it does *not* help cases like this:

	flash@xxx {
		compatible = "vendor,shiny-new-device", "jedec,spi-nor";
		...
	};

unless we also list "shiny-new-device" in m25p_ids[]. There has been
discussion on future work for this issue here:
https://lkml.org/lkml/2015/11/12/574

Cc: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Tested module autoload with each of the following:

	compatible = "m25p80";
	compatible = "jedec,spi-nor";

 drivers/mtd/devices/m25p80.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index f002a8f75374..151b453d0867 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -179,7 +179,7 @@ static int m25p_probe(struct spi_device *spi)
 	struct m25p *flash;
 	struct spi_nor *nor;
 	enum read_mode mode = SPI_NOR_NORMAL;
-	char *flash_name = NULL;
+	char *flash_name;
 	int ret;
 
 	data = dev_get_platdata(&spi->dev);
@@ -219,6 +219,8 @@ static int m25p_probe(struct spi_device *spi)
 	 */
 	if (data && data->type)
 		flash_name = data->type;
+	else if (!strcmp(spi->modalias, "spi-nor"))
+		flash_name = NULL; /* auto-detect */
 	else
 		flash_name = spi->modalias;
 
@@ -253,6 +255,13 @@ static int m25p_remove(struct spi_device *spi)
  */
 static const struct spi_device_id m25p_ids[] = {
 	/*
+	 * Allow non-DT platform devices to bind to the "spi-nor" modalias, and
+	 * hack around the fact that the SPI core does not provide uevent
+	 * matching for .of_match_table
+	 */
+	{"spi-nor"},
+
+	/*
 	 * Entries not used in DTs that should be safe to drop after replacing
 	 * them with "nor-jedec" in platform data.
 	 */
-- 
2.6.0.rc2.230.g3dd15c0
