Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I2W4d-00028K-Bj
	for linux-mtd@lists.infradead.org; Sun, 24 Jun 2007 13:40:32 -0400
Subject: [PATCH] Prevent JFFS2 from OOPS:ing due to missing error checks.
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Sun, 24 Jun 2007 19:33:02 +0200
Message-Id: <1182706382.7852.7.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 474425d656766b6c6229312771be5f3e8d0a839f Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Sun, 24 Jun 2007 19:22:29 +0200
Subject: [PATCH] Prevent JFFS2 from OOPS:ing due to missing error checks.


Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---

This will prevent the errors I am seeing(see earlier mails)
to OOPS.
Should go into 2.6.22.

 Jocke

 fs/jffs2/write.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index c9fe0ab..1406f2c 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -173,6 +173,12 @@ struct jffs2_full_dnode *jffs2_write_dnode(struct jffs2_sb_info *c, struct jffs2
 		flash_ofs |= REF_NORMAL;
 	}
 	fn->raw = jffs2_add_physical_node_ref(c, flash_ofs, PAD(sizeof(*ri)+datalen), f->inocache);
+	if (IS_ERR(fn->raw)) {
+		void *hold_err = fn->raw;
+		/* Release the full_dnode which is now useless, and return */
+		jffs2_free_full_dnode(fn);
+		return ERR_PTR(PTR_ERR(hold_err));
+	}
 	fn->ofs = je32_to_cpu(ri->offset);
 	fn->size = je32_to_cpu(ri->dsize);
 	fn->frags = 0;
@@ -291,6 +297,12 @@ struct jffs2_full_dirent *jffs2_write_dirent(struct jffs2_sb_info *c, struct jff
 	}
 	/* Mark the space used */
 	fd->raw = jffs2_add_physical_node_ref(c, flash_ofs | REF_PRISTINE, PAD(sizeof(*rd)+namelen), f->inocache);
+	if (IS_ERR(fd->raw)) {
+		void *hold_err = fd->raw;
+		/* Release the full_dirent which is now useless, and return */
+		jffs2_free_full_dirent(fd);
+		return ERR_PTR(PTR_ERR(hold_err));
+	}
 
 	if (retried) {
 		jffs2_dbg_acct_sanity_check(c,NULL);
-- 
1.5.2.2
