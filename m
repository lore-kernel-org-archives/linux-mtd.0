Received: from mtaout02-winn.ispmail.ntl.com ([81.103.221.48])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OzDr6-0005Ry-6b
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 19:22:49 +0000
From: Daniel Drake <dsd@laptop.org>
To: dwmw2@infradead.org
Subject: [PATCH] [JFFS2] Speed up mounts by inreasing INO_CACHE_HASHSIZE to
	1024
Message-Id: <20100924192242.400DA9D401B@zog.reactivated.net>
Date: Fri, 24 Sep 2010 20:22:42 +0100 (BST)
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Woodhouse <dwmw2@infradead.org>

This significantly speeds up jffs2 mounting on OLPC laptops.

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Daniel Drake <dsd@laptop.org>
---

OLPC have carried this kernel patch for years.
Is it upstream-suitable?

 fs/jffs2/nodelist.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 523a916..976e237 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -199,7 +199,7 @@ struct jffs2_inode_cache {
 #define RAWNODE_CLASS_XATTR_DATUM	1
 #define RAWNODE_CLASS_XATTR_REF		2
 
-#define INOCACHE_HASHSIZE 128
+#define INOCACHE_HASHSIZE 1024
 
 #define write_ofs(c) ((c)->nextblock->offset + (c)->sector_size - (c)->nextblock->free_size)
 
-- 
1.7.2.2
