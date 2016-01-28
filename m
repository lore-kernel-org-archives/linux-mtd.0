Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOfVZ-0004CY-9a
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 05:52:43 +0000
Received: by mail-pa0-x244.google.com with SMTP id pv5so1442020pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2016 21:52:22 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [PATCH 3/8] mtd: spi-nor: silently drop lock/unlock for already
 locked/unlocked region
Date: Wed, 27 Jan 2016 21:51:42 -0800
Message-Id: <1453960307-10181-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
References: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If, for instance, the entire flash is already unlocked and I try to
mtd_unlock() the entire device, I don't expect to see an EINVAL error.
It should just silently succeed. Ditto for mtd_lock().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c19674573eec..3a08aa53c171 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -518,8 +518,12 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_new = (status_old & ~mask) | val;
 
+	/* Don't bother if they're the same */
+	if (status_new == status_old)
+		return 0;
+
 	/* Only modify protection if it will not unlock other areas */
-	if ((status_new & mask) <= (status_old & mask))
+	if ((status_new & mask) < (status_old & mask))
 		return -EINVAL;
 
 	write_enable(nor);
@@ -576,8 +580,12 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_new = (status_old & ~mask) | val;
 
+	/* Don't bother if they're the same */
+	if (status_new == status_old)
+		return 0;
+
 	/* Only modify protection if it will not lock other areas */
-	if ((status_new & mask) >= (status_old & mask))
+	if ((status_new & mask) > (status_old & mask))
 		return -EINVAL;
 
 	write_enable(nor);
-- 
1.7.9.5
