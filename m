Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSUhQ-0004hm-F6
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:46:07 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p53Djuqn013884
	for <linux-mtd@lists.infradead.org>; Fri, 3 Jun 2011 16:45:58 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/10] UBIFS: fix-up free space earlier
Date: Fri,  3 Jun 2011 16:50:01 +0300
Message-Id: <1307109001-19761-11-git-send-email-dedekind1@gmail.com>
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

The free space fixup is currently initiated during mount after the call to
ubifs_write_master() which results in a write to PEBs; this has been observed
with the patch 'assert no fixup when writing a node' applied:

Move the free space fixup on mount to before the calls to
ubifs_recover_inl_heads() and ubifs_write_master(). This results in no
assertions with the previously mentioned patch applied.

Artem: tweaked the patch a bit

Signed-off-by: Ben Gardiner <bengardiner@nanometrics>
Reviewed-by: Matthew L. Creech <mlcreech@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 6d357fd..b5aeb5a 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1282,13 +1282,13 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_master;
 
+	init_constants_master(c);
+
 	if ((c->mst_node->flags & cpu_to_le32(UBIFS_MST_DIRTY)) != 0) {
 		ubifs_msg("recovery needed");
 		c->need_recovery = 1;
 	}
 
-	init_constants_master(c);
-
 	if (c->need_recovery && !c->ro_mount) {
 		err = ubifs_recover_inl_heads(c, c->sbuf);
 		if (err)
@@ -1299,6 +1299,12 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_master;
 
+	if (!c->ro_mount && c->space_fixup) {
+		err = ubifs_fixup_free_space(c);
+		if (err)
+			goto out_master;
+	}
+
 	if (!c->ro_mount) {
 		/*
 		 * Set the "dirty" flag so that if we reboot uncleanly we
@@ -1402,12 +1408,6 @@ static int mount_ubifs(struct ubifs_info *c)
 	} else
 		ubifs_assert(c->lst.taken_empty_lebs > 0);
 
-	if (!c->ro_mount && c->space_fixup) {
-		err = ubifs_fixup_free_space(c);
-		if (err)
-			goto out_infos;
-	}
-
 	err = dbg_check_filesystem(c);
 	if (err)
 		goto out_infos;
-- 
1.7.2.3
