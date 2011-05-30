Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QR7dX-0002uF-Sb
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 18:56:25 +0000
Received: by mail-gw0-f53.google.com with SMTP id 20so2155770gwj.40
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 May 2011 11:56:22 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 3/3] UBIFS: fix-up free space earlier
Date: Mon, 30 May 2011 14:56:16 -0400
Message-Id: <546eb16b8aedc7708774ae66bffd6c1175331b49.1306780983.git.bengardiner@nanometrics.ca>
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

The free space fixup is currently initiated during mount after the call to
ubifs_write_master() which results in a write to PEBs; this has been observed
with the patch 'assert no fixup when writing a node' applied:

Move the free space fixup on mount to before the calls to
ubifs_recover_inl_heads() and ubifs_write_master(). This results in no
assertions with the previously mentioned patch applied.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics>
CC: Matthew L. Creech <mlcreech@gmail.com>

---
 fs/ubifs/super.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 89c8d33..531b9b7 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1285,6 +1285,12 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_lpt;
 
+	if (!c->ro_mount && c->space_fixup) {
+		err = ubifs_fixup_free_space(c);
+		if (err)
+			goto out_infos;
+	}
+
 	if ((c->mst_node->flags & cpu_to_le32(UBIFS_MST_DIRTY)) != 0) {
 		ubifs_msg("recovery needed");
 		c->need_recovery = 1;
@@ -1396,12 +1402,6 @@ static int mount_ubifs(struct ubifs_info *c)
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
1.7.4.1
