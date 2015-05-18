Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuGek-0005zh-7J
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 08:44:15 +0000
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5 2014))
 with ESMTP id <0NOJ002AVEX26ID0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Mon, 18 May 2015 17:43:50 +0900 (KST)
From: Chao Yu <chao2.yu@samsung.com>
To: dedekind1@gmail.com, adrian.hunter@intel.com
Subject: [PATCH] ubifs: fix to check error code of register_shrinker
Date: Mon, 18 May 2015 16:43:02 +0800
Message-id: <003001d09146$c124b150$436e13f0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: zh-cn
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

register_shrinker() in ubifs_init() can fail due to fail to call kzalloc.
This patch fixes to check the return value of register_shrinker, otherwise
our shrinker may be unregistered after ubifs initialized successfully.

Signed-off-by: Chao Yu <chao2.yu@samsung.com>
---
 fs/ubifs/super.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 75e6f04..fa83d1b 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2245,7 +2245,9 @@ static int __init ubifs_init(void)
 	if (!ubifs_inode_slab)
 		return -ENOMEM;
 
-	register_shrinker(&ubifs_shrinker_info);
+	err = register_shrinker(&ubifs_shrinker_info);
+	if (err)
+		goto out_slab;
 
 	err = ubifs_compressors_init();
 	if (err)
@@ -2269,6 +2271,7 @@ out_compr:
 	ubifs_compressors_exit();
 out_shrinker:
 	unregister_shrinker(&ubifs_shrinker_info);
+out_slab:
 	kmem_cache_destroy(ubifs_inode_slab);
 	return err;
 }
-- 
2.3.3
