Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOfVZ-00047b-9Z
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 05:52:42 +0000
Received: by mail-pa0-x244.google.com with SMTP id yy13so1429995pab.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2016 21:52:20 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org,
 Stas Sergeev <stsp@users.sourceforge.net>
Subject: [PATCH 1/8] mtd: spi-nor: wait for SR_WIP to clear on initial unlock
Date: Wed, 27 Jan 2016 21:51:40 -0800
Message-Id: <1453960307-10181-2-git-send-email-computersforpeace@gmail.com>
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

Fixup a piece leftover by commit 32321e950d8a ("mtd: spi-nor: wait until
lock/unlock operations are ready"). That commit made us wait for the WIP
bit to settle after lock/unlock operations, but it missed the open-coded
"unlock" that happens at probe() time.

We should probably have this code utilize the unlock() routines in the
future, to avoid duplication, but unfortunately, flash which need to be
unlocked don't all have a proper ->flash_unlock() callback.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/spi-nor/spi-nor.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ed0c19c558b5..ef89bed1e5ea 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1236,6 +1236,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	    JEDEC_MFR(info) == SNOR_MFR_SST) {
 		write_enable(nor);
 		write_sr(nor, 0);
+		spi_nor_wait_till_ready(nor);
 	}
 
 	if (!mtd->name)
-- 
1.7.9.5
