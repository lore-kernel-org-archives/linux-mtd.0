Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzvhC-0005OD-1r
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 23:01:54 +0000
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Huang Shijie <b32955@freescale.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] mtd: spi-nor: don't return found by JEDEC ID a non-JEDEC flash
Date: Sun, 14 Dec 2014 01:00:47 +0200
Message-ID: <1418511647-24736-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In attempt to spi_nor_scan() for an expected JEDEC compliant device by
reading RDID register don't return the first found non-JEDEC device
entry from spi_nor_ids[] table, if RDID is zero.

First of all zeroes in RDID may be evidence for not correctly working
SPI, secondly empty RDID can not be used to select a particular JEDEC
non-compliant device correctly.

The best possible solution is
* not to rely on spi_nor_read_id(), if expected device is non-JEDEC,
* not to substitute an expected JEDEC device with some arbitrary
  chosen non-JEDEC device, if RDID is zero.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/mtd/spi-nor/spi-nor.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c51ee52..119ace9 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -661,6 +661,12 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
 
 	ext_jedec = id[3] << 8 | id[4];
 
+	/* Non-JEDEC flash memory can not be detected correctly */
+	if (!jedec && !ext_jedec) {
+		dev_err(nor->dev, "JEDEC compliant device is not found\n");
+		return ERR_PTR(-ENODEV);
+	}
+
 	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
 		info = (void *)spi_nor_ids[tmp].driver_data;
 		if (info->jedec_id == jedec) {
-- 
1.7.10.4
