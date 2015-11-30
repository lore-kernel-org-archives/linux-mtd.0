Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3UKV-0007Ad-7e
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 19:41:43 +0000
Received: by lfdl133 with SMTP id l133so210586965lfd.2
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 11:41:21 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
 =?UTF-8?q?Bean=20Huo=20=E9=9C=8D=E6=96=8C=E6=96=8C=20=28beanhuo=29?=
 <beanhuo@micron.com>, Furquan Shaikh <furquan@google.com>,
 linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
 linux-kernel@vger.kernel.org (open list)
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v2] spi/nor: Fix error message with unrecognized JEDEC
Date: Mon, 30 Nov 2015 20:41:17 +0100
Message-Id: <1448912477-27057-1-git-send-email-ricardo.ribalda@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The error message was:

m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0

The new error message:

m25p80 spi32766.0: unrecognized JEDEC id bytes: 00, 00, 00

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---

v2: Changes by Marek Vasut

Use %02 instead of %.2

 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b7c038c75684..f8a9b77aac76 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -890,7 +890,7 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 				return &spi_nor_ids[tmp];
 		}
 	}
-	dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %2x, %2x\n",
+	dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %02x, %02x\n",
 		id[0], id[1], id[2]);
 	return ERR_PTR(-ENODEV);
 }
-- 
2.6.2
