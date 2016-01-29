Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPEgh-0005b7-9R
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 19:26:34 +0000
Received: by mail-pa0-x242.google.com with SMTP id yy13so3962635pab.1
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jan 2016 11:26:11 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [PATCH v2 2/8] mtd: spi-nor: silently drop lock/unlock for already
 locked/unlocked region
Date: Fri, 29 Jan 2016 11:25:31 -0800
Message-Id: <1454095537-130536-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
References: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
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
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
v2: no change

 drivers/mtd/spi-nor/spi-nor.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ef89bed1e5ea..77c88ac69ef9 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -515,8 +515,12 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
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
@@ -569,8 +573,12 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
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
2.7.0.rc3.207.g0ac5344
