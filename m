Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOfVa-00049D-4f
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 05:52:44 +0000
Received: by mail-pa0-x241.google.com with SMTP id a20so1438127pag.3
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2016 21:52:21 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [PATCH 2/8] mtd: spi-nor: guard against underflows in stm_is_locked_sr
Date: Wed, 27 Jan 2016 21:51:41 -0800
Message-Id: <1453960307-10181-3-git-send-email-computersforpeace@gmail.com>
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

Users of stm_is_locked_sr() might do arithmetic that could result in a
negative offset. For example, when stm_unlock() tries to check the
status of the eraseblock below the range, it doesn't check for:

  ofs - mtd->erasesize < 0

Instead of forcing callers to be extra careful, let's just make
stm_is_locked_sr() do the right thing and report errors for invalid
ranges.

Also, fixup the calculations in stm_unlock(), so we:
(a) can handle non-eraseblock-aligned offsets and
(b) don't look for a negative offset when checking the first block

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ef89bed1e5ea..c19674573eec 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -447,6 +447,9 @@ static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 	loff_t lock_offs;
 	uint64_t lock_len;
 
+	if (ofs < 0 || ofs + len > nor->mtd.size)
+		return -EINVAL;
+
 	stm_get_locked_range(nor, sr, &lock_offs, &lock_len);
 
 	return (ofs + len <= lock_offs + lock_len) && (ofs >= lock_offs);
@@ -543,9 +546,13 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (status_old < 0)
 		return status_old;
 
-	/* Cannot unlock; would unlock larger region than requested */
-	if (stm_is_locked_sr(nor, ofs - mtd->erasesize, mtd->erasesize,
-			     status_old))
+	/*
+	 * Check the eraseblock next to us; if locked, then this would unlock
+	 * larger region than requested
+	 */
+	if (ofs > 0 && stm_is_locked_sr(nor, ALIGN(ofs - mtd->erasesize,
+					mtd->erasesize), mtd->erasesize,
+					status_old))
 		return -EINVAL;
 
 	/*
-- 
1.7.9.5
