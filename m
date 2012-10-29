Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TSsyB-0008Cf-Ib
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2012 17:17:48 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so3253465pad.36
 for <linux-mtd@lists.infradead.org>; Mon, 29 Oct 2012 10:17:45 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: map: Fix compilation warning
Date: Mon, 29 Oct 2012 22:47:26 +0530
Message-Id: <dd11b4d47ab566931cb943dea34e67c1ce2c3e59.1351530856.git.viresh.kumar@linaro.org>
Cc: linaro-dev@lists.linaro.org, dedekind1@gmail.com,
 Viresh Kumar <viresh.kumar@linaro.org>, patches@linaro.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is an attempt to fix following compilation warning.

In file included from drivers/mtd/chips/cfi_cmdset_0001.c:35:0:
drivers/mtd/chips/cfi_cmdset_0001.c: In function 'cfi_intelext_write_words':
include/linux/mtd/map.h:331:11: warning: 'r.x[0]' may be used uninitialized in this function [-Wmaybe-uninitialized]

I could have used uninitialized_var() too, but didn't used it as the final else
part of map_word_load() is missing. So there is a chance that it might be passed
uninitialized. Better initialize to zero.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/linux/mtd/map.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 3595a02..56c7936 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -328,7 +328,7 @@ static inline int map_word_bitsset(struct map_info *map, map_word val1, map_word
 
 static inline map_word map_word_load(struct map_info *map, const void *ptr)
 {
-	map_word r;
+	map_word r = {{0} };
 
 	if (map_bankwidth_is_1(map))
 		r.x[0] = *(unsigned char *)ptr;
-- 
1.7.12.rc2.18.g61b472e
