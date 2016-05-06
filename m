Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayThT-0006Lg-TD
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:33:00 +0000
Received: by mail-pa0-x233.google.com with SMTP id r5so42358360pag.1
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 17:32:39 -0700 (PDT)
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
Subject: [PATCH v7 05/10] mtd: nxp-spifi: return amount of data transferred or
 error in read/write
Date: Thu,  5 May 2016 17:31:51 -0700
Message-Id: <1462494716-95312-6-git-send-email-computersforpeace@gmail.com>
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

Add checking of SPI transfer errors and return them from read/write
functions. Also return the amount of data transferred.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
New in v7

 drivers/mtd/spi-nor/nxp-spifi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
index 187adba5e69f..b0fb86996b8f 100644
--- a/drivers/mtd/spi-nor/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/nxp-spifi.c
@@ -185,7 +185,7 @@ static ssize_t nxp_spifi_read(struct spi_nor *nor, loff_t from, size_t len,
 	memcpy_fromio(buf, spifi->flash_base + from, len);
 	*retlen += len;
 
-	return 0;
+	return len;
 }
 
 static ssize_t nxp_spifi_write(struct spi_nor *nor, loff_t to, size_t len,
@@ -194,6 +194,7 @@ static ssize_t nxp_spifi_write(struct spi_nor *nor, loff_t to, size_t len,
 	struct nxp_spifi *spifi = nor->priv;
 	u32 cmd;
 	int ret;
+	size_t i;
 
 	ret = nxp_spifi_set_memory_mode_off(spifi);
 	if (ret)
@@ -209,10 +210,14 @@ static ssize_t nxp_spifi_write(struct spi_nor *nor, loff_t to, size_t len,
 	      SPIFI_CMD_FRAMEFORM(spifi->nor.addr_width + 1);
 	writel(cmd, spifi->io_base + SPIFI_CMD);
 
-	while (len--)
-		writeb(*buf++, spifi->io_base + SPIFI_DATA);
+	for (i = 0; i < len; i++)
+		writeb(buf[i], spifi->io_base + SPIFI_DATA);
 
-	return nxp_spifi_wait_for_cmd(spifi);
+	ret = nxp_spifi_wait_for_cmd(spifi);
+	if (ret)
+		return ret;
+
+	return len;
 }
 
 static int nxp_spifi_erase(struct spi_nor *nor, loff_t offs)
-- 
2.8.0.rc3.226.g39d4020
