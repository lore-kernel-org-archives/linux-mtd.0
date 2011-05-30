From: bengardiner@nanometrics.ca (Ben Gardiner)
Date: Mon, 30 May 2011 14:56:15 -0400
Subject: [PATCH] UBIFS: intialize LPT earlier
Message-ID: <mailman.1.1306923080.5904.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

The current 'mount_ubifs()' implementation does not initialize the LPT until the
the master node is marked dirty. Move the LPT initialization to before marking
the master node dirty. This is a preparation for the next patch which will move
the free-space-fixup check to before marking the master node dirty, because we
have to fix-up the free space before doing any writes.

Artem: massaged the patch and commit message.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |   29 ++++++++++++++++-------------
 1 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 1e40db7..6d357fd 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1282,17 +1282,24 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_master;
 
-	init_constants_master(c);
-
 	if ((c->mst_node->flags & cpu_to_le32(UBIFS_MST_DIRTY)) != 0) {
 		ubifs_msg("recovery needed");
 		c->need_recovery = 1;
-		if (!c->ro_mount) {
-			err = ubifs_recover_inl_heads(c, c->sbuf);
-			if (err)
-				goto out_master;
-		}
-	} else if (!c->ro_mount) {
+	}
+
+	init_constants_master(c);
+
+	if (c->need_recovery && !c->ro_mount) {
+		err = ubifs_recover_inl_heads(c, c->sbuf);
+		if (err)
+			goto out_master;
+	}
+
+	err = ubifs_lpt_init(c, 1, !c->ro_mount);
+	if (err)
+		goto out_master;
+
+	if (!c->ro_mount) {
 		/*
 		 * Set the "dirty" flag so that if we reboot uncleanly we
 		 * will notice this immediately on the next mount.
@@ -1300,13 +1307,9 @@ static int mount_ubifs(struct ubifs_info *c)
 		c->mst_node->flags |= cpu_to_le32(UBIFS_MST_DIRTY);
 		err = ubifs_write_master(c);
 		if (err)
-			goto out_master;
+			goto out_lpt;
 	}
 
-	err = ubifs_lpt_init(c, 1, !c->ro_mount);
-	if (err)
-		goto out_lpt;
-
 	err = dbg_check_idx_size(c, c->bi.old_idx_sz);
 	if (err)
 		goto out_lpt;
-- 
1.7.2.3



-- 
Best Regards,
Artem Bityutskiy (?????????? ????????????????)
