Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAkpr-0002Kg-RG
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 22:21:05 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com, dedekind1@gmail.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/2] ubifs: Unexport ubifs_inode_slab
Date: Wed, 17 May 2017 00:20:26 +0200
Message-Id: <1494973227-17271-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This SLAB is only being used in super.c, there is no need to expose
it into the global namespace.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/super.c | 2 +-
 fs/ubifs/ubifs.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b73811bd7676..bbc87693f500 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -45,7 +45,7 @@
 #define UBIFS_KMALLOC_OK (128*1024)
 
 /* Slab cache for UBIFS inodes */
-struct kmem_cache *ubifs_inode_slab;
+static struct kmem_cache *ubifs_inode_slab;
 
 /* UBIFS TNC shrinker description */
 static struct shrinker ubifs_shrinker_info = {
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 4d57e488038e..c2797d999caa 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1453,7 +1453,6 @@ struct ubifs_info {
 extern struct list_head ubifs_infos;
 extern spinlock_t ubifs_infos_lock;
 extern atomic_long_t ubifs_clean_zn_cnt;
-extern struct kmem_cache *ubifs_inode_slab;
 extern const struct super_operations ubifs_super_operations;
 extern const struct address_space_operations ubifs_file_address_operations;
 extern const struct file_operations ubifs_file_operations;
-- 
2.7.3
