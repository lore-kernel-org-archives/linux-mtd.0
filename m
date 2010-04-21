From: t.stanislaws@samsung.com (Tomasz Stanislawski)
Date: Wed, 21 Apr 2010 14:59:33 +0200
Subject: [PATCH] changed kmalloc to vmalloc to fix fragmentation problem
Message-ID: <mailman.318.1272289168.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

---
 fs/ubifs/journal.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 64b5f3a..29d3db1 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -694,7 +694,7 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 		DBGKEY(key));
 	ubifs_assert(len <= UBIFS_BLOCK_SIZE);
 
-	data = kmalloc(dlen, GFP_NOFS);
+	data = vmalloc(dlen);
 	if (!data)
 		return -ENOMEM;
 
@@ -732,7 +732,7 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 		goto out_ro;
 
 	finish_reservation(c);
-	kfree(data);
+	vfree(data);
 	return 0;
 
 out_release:
@@ -741,7 +741,7 @@ out_ro:
 	ubifs_ro_mode(c, err);
 	finish_reservation(c);
 out_free:
-	kfree(data);
+	vfree(data);
 	return err;
 }
 
-- 
1.6.3.3


--Boundary_(ID_dxXn63fyCtaNjH/oHfaX3Q)--
