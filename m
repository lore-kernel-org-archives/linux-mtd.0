Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RljRt-00012k-Rf
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 15:53:50 +0000
Received: by mail-gx0-f177.google.com with SMTP id l1so1983965ggn.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 07:53:49 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH 4/7] mtd: use for_each_clear_bit
Date: Sat, 14 Jan 2012 00:53:21 +0900
Message-Id: <1326470004-10096-5-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1326470004-10096-1-git-send-email-akinobu.mita@gmail.com>
References: <1326470004-10096-1-git-send-email-akinobu.mita@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use for_each_clear_bit() to iterate over all the cleared bit in a
memory region.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e1e122f..9bcd1f4 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2526,12 +2526,10 @@ static void cfi_intelext_restore_locks(struct mtd_info *mtd)
 		if (!region->lockmap)
 			continue;
 
-		for (block = 0; block < region->numblocks; block++) {
+		for_each_clear_bit(block, region->lockmap, region->numblocks) {
 			len = region->erasesize;
 			adr = region->offset + block * len;
-
-			if (!test_bit(block, region->lockmap))
-				cfi_intelext_unlock(mtd, adr, len);
+			cfi_intelext_unlock(mtd, adr, len);
 		}
 	}
 }
-- 
1.7.4.4
