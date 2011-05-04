Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHkIe-00080C-KK
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 22:12:05 +0000
Received: by qyk32 with SMTP id 32so3545869qyk.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2011 15:12:03 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 4 May 2011 18:12:03 -0400
Message-ID: <BANLkTin+oM55=B8Ra2BPZhE4K=ApPoj45Q@mail.gmail.com>
Subject: [PATCH v2 3/3] ubifs: fix-up free space on mount if flag is set
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If a UBIFS filesystem is being mounted read-write, or is being remounted
from read-only to read-write, check for the "space_fixup" flag and fix all
LEBs containing empty space if necessary.

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 fs/ubifs/super.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index c75f613..f7f25a3 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1396,6 +1396,12 @@ static int mount_ubifs(struct ubifs_info *c)
 	} else
 		ubifs_assert(c->lst.taken_empty_lebs > 0);

+	if (!c->ro_mount && c->space_fixup) {
+		err = ubifs_fixup_free_space(c);
+		if (err)
+			goto out_infos;
+	}
+
 	err = dbg_check_filesystem(c);
 	if (err)
 		goto out_infos;
@@ -1676,6 +1682,12 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		ubifs_msg("deferred recovery completed");
 	}

+	if (c->space_fixup) {
+		err = ubifs_fixup_free_space(c);
+		if (err)
+			goto out;
+	}
+
 	dbg_gen("re-mounted read-write");
 	c->remounting_rw = 0;
 	err = dbg_check_space_info(c);
-- 
1.6.3.3


-- 
Matthew L. Creech
