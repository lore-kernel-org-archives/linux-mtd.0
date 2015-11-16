Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZySNA-0004FX-CD
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 22:35:41 +0000
Received: by padhx2 with SMTP id hx2so188604242pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 14:35:19 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/3] mtd: m25p80: replace leftover "nor-jedec" with "spi-nor"
 in comments
Date: Mon, 16 Nov 2015 14:34:51 -0800
Message-Id: <1447713292-91525-3-git-send-email-computersforpeace@gmail.com>
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

I overlooked a few comments in commit 8947e396a829 ("Documentation: dt:
mtd: replace "nor-jedec" binding with "jedec, spi-nor""). Fix these up
now.

Suggested-by: Javier Martinez Canillas <javier@osg.samsung.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 151b453d0867..6cf5702706a6 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -263,13 +263,13 @@ static const struct spi_device_id m25p_ids[] = {
 
 	/*
 	 * Entries not used in DTs that should be safe to drop after replacing
-	 * them with "nor-jedec" in platform data.
+	 * them with "spi-nor" in platform data.
 	 */
 	{"s25sl064a"},	{"w25x16"},	{"m25p10"},	{"m25px64"},
 
 	/*
-	 * Entries that were used in DTs without "nor-jedec" fallback and should
-	 * be kept for backward compatibility.
+	 * Entries that were used in DTs without "jedec,spi-nor" fallback and
+	 * should be kept for backward compatibility.
 	 */
 	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
 	{"mr25h256"},
-- 
2.6.0.rc2.230.g3dd15c0
