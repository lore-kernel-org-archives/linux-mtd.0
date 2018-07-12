Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdZMu-0007lR-DA
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2018 11:02:46 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/5] ubifs: Turn two ubifs_assert() into a WARN_ON()
Date: Thu, 12 Jul 2018 13:01:56 +0200
Message-Id: <20180712110200.13054-2-richard@nod.at>
In-Reply-To: <20180712110200.13054-1-richard@nod.at>
References: <20180712110200.13054-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are going to pass struct ubifs_info to ubifs_assert()
but while unloading the UBIFS module we don't have the info
struct anymore.
Therefore replace the asserts by a regular WARN_ON().

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index c5466c70d620..90ebfcc8a8ea 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2304,8 +2304,8 @@ late_initcall(ubifs_init);
 
 static void __exit ubifs_exit(void)
 {
-	ubifs_assert(list_empty(&ubifs_infos));
-	ubifs_assert(atomic_long_read(&ubifs_clean_zn_cnt) == 0);
+	WARN_ON(list_empty(&ubifs_infos));
+	WARN_ON(atomic_long_read(&ubifs_clean_zn_cnt) == 0);
 
 	dbg_debugfs_exit();
 	ubifs_compressors_exit();
-- 
2.18.0
