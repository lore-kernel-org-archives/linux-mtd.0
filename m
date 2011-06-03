Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSUhL-0004hl-Qu
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:46:06 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p53Djuqm013884
	for <linux-mtd@lists.infradead.org>; Fri, 3 Jun 2011 16:45:58 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/10] UBIFS: intialize LPT earlier
Date: Fri,  3 Jun 2011 16:50:00 +0300
Message-Id: <1307109001-19761-10-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
References: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ben Gardiner <bengardiner@nanometrics.ca>

The current 'mount_ubifs()' implementation does not initialize the LPT until the
the master node is marked dirty. Move the LPT initialization to before marking
the master node dirty. This is a preparation for the next patch which will move
the free-space-fixup check to before marking the master node dirty, because we
have to fix-up the free space before doing any writes.

Artem: massaged the patch and commit message.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Reviewed-by: Matthew L. Creech <mlcreech@gmail.com>
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
