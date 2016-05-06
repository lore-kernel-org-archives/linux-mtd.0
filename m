Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayThY-0006RD-7N
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:33:05 +0000
Received: by mail-pf0-x22b.google.com with SMTP id 206so43417561pfu.0
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 17:32:43 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@nxp.com>,
 Michal Suchanek <hramrach@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Rafal Milecki <zajec5@gmail.com>, Jagan Teki <jteki@openedev.com>,
 "Andrew F. Davis" <afd@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, Bean Huo <beanhuo@micron.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v7 09/10] mtd: spi-nor: add read loop
Date: Thu,  5 May 2016 17:31:55 -0700
Message-Id: <1462494716-95312-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
References: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michal Suchanek <hramrach@gmail.com>

mtdblock and ubi do not handle the situation when read returns less data
than requested. Loop in spi-nor until buffer is filled or an error is
returned.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v6 -> v7:
 * no change

 drivers/mtd/spi-nor/spi-nor.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ff96e1b54384..a78adcda1b85 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1030,14 +1030,27 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (ret)
 		return ret;
 
-	ret = nor->read(nor, from, len, buf);
+	while (len) {
+		ret = nor->read(nor, from, len, buf);
+		if (ret == 0) {
+			/* We shouldn't see 0-length reads */
+			ret = -EIO;
+			goto read_err;
+		}
+		if (ret < 0)
+			goto read_err;
 
-	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
-	if (ret < 0)
-		return ret;
+		WARN_ON(ret > len);
+		*retlen += ret;
+		buf += ret;
+		from += ret;
+		len -= ret;
+	}
+	ret = 0;
 
-	*retlen += ret;
-	return 0;
+read_err:
+	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
+	return ret;
 }
 
 static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
-- 
2.8.0.rc3.226.g39d4020
