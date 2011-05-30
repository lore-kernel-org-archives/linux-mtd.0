Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QR7dX-0002tw-KM
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 18:56:24 +0000
Received: by gwb15 with SMTP id 15so2178307gwb.13
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 May 2011 11:56:21 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 2/3] UBIFS: intialize the LPT earlier
Date: Mon, 30 May 2011 14:56:15 -0400
Message-Id: <e0fb2d40ab7314049654d85b86a4c27e9a1801ef.1306780983.git.bengardiner@nanometrics.ca>
In-Reply-To: <cover.1306780983.git.bengardiner@nanometrics.ca>
References: <cover.1306780983.git.bengardiner@nanometrics.ca>
In-Reply-To: <cover.1306780983.git.bengardiner@nanometrics.ca>
References: <cover.1306780983.git.bengardiner@nanometrics.ca>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current mount_ubifs() implementation does not initialize the LPT until the
check for recovery is completed and the dirty flag is written.

Move the LPT initializtion to before the check for recovery and dirty flag in
preparation for the next patch which will move the free-space-fixup check to
directly after this allocation.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

---
 fs/ubifs/super.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 6db0bdaa..89c8d33 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1281,13 +1281,17 @@ static int mount_ubifs(struct ubifs_info *c)
 
 	init_constants_master(c);
 
+	err = ubifs_lpt_init(c, 1, !c->ro_mount);
+	if (err)
+		goto out_lpt;
+
 	if ((c->mst_node->flags & cpu_to_le32(UBIFS_MST_DIRTY)) != 0) {
 		ubifs_msg("recovery needed");
 		c->need_recovery = 1;
 		if (!c->ro_mount) {
 			err = ubifs_recover_inl_heads(c, c->sbuf);
 			if (err)
-				goto out_master;
+				goto out_lpt;
 		}
 	} else if (!c->ro_mount) {
 		/*
@@ -1297,13 +1301,9 @@ static int mount_ubifs(struct ubifs_info *c)
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
1.7.4.1
