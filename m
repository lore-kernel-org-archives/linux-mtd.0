Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8ueg-0003OJ-Ep
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 18:48:59 +0000
Received: by mail-pa0-x243.google.com with SMTP id fl14so1217225pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 15 Dec 2015 10:48:38 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Daniel Kurtz <djkurtz@chromium.org>, Marek Vasut <marex@denx.de>,
 Bayi Cheng <bayi.cheng@mediatek.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>,
 =?UTF-8?q?Eddie=20Huang=20=28=E9=BB=83=E6=99=BA=E5=82=91=29?=
 <eddie.huang@mediatek.com>,
 =?UTF-8?q?Milton=20Chiang=20=28=E6=B1=9F=E6=98=8E=E6=99=8F=29?=
 <Milton.Chiang@mediatek.com>
Subject: [PATCH for-4.4 2/2] mtd: spi-nor: fix stm_is_locked_sr() parameters
Date: Tue, 15 Dec 2015 10:48:21 -0800
Message-Id: <1450205301-32207-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

stm_is_locked_sr() takes the status register (SR) value as the last
parameter, not the second.

Reported-by: Bayi Cheng <bayi.cheng@mediatek.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Bayi Cheng <bayi.cheng@mediatek.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f5d59de1ee6e..32477c4eb421 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -516,8 +516,8 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	status_old = read_sr(nor);
 
 	/* Cannot unlock; would unlock larger region than requested */
-	if (stm_is_locked_sr(nor, status_old, ofs - mtd->erasesize,
-			     mtd->erasesize))
+	if (stm_is_locked_sr(nor, ofs - mtd->erasesize, mtd->erasesize,
+			     status_old))
 		return -EINVAL;
 
 	/*
-- 
2.6.0.rc2.230.g3dd15c0
