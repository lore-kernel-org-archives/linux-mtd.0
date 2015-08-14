Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQBKo-0003PL-2y
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 09:31:34 +0000
Date: 14 Aug 2015 09:23:09 -0000
Message-Id: <1592668a061137b33c9a6392dfccc67c69fc1fe6.1439543572.git.hramrach@gmail.com>
In-Reply-To: <cover.1439543572.git.hramrach@gmail.com>
References: <cover.1439543572.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v4 7/7] mtd: spi-nor: add read loop
To: Hou Zhiqiang <B48286@freescale.com>, shijie.huang@intel.com,
  David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
  "Bean Huo 霍斌斌, " <beanhuo@micron.com>, linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtdblock and ubi do not handle the situation when read returns less data
than requested. Loop in spi-nor until buffer is filled or an error is
returned.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e0ae9cf..246fac7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -738,14 +738,22 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (ret)
 		return ret;
 
-	ret = nor->read(nor, from, len, buf);
+	while (len) {
+		ret = nor->read(nor, from, len, buf);
+		if (ret <= 0)
+			goto read_err;
+
+		BUG_ON(ret > len);
+		*retlen += ret;
+		buf += ret;
+		from += ret;
+		len -= ret;
+	}
+	ret = 0;
 
+read_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
-	if (ret < 0)
-		return ret;
-
-	*retlen += ret;
-	return 0;
+	return ret;
 }
 
 static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
-- 
2.1.4
