Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QITyi-0004Dl-Cw
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 22:58:33 +0000
Received: by mail-iy0-f177.google.com with SMTP id 39so3801943iyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 15:58:32 -0700 (PDT)
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] UBIFS: fix-up free space on mount if flag is set
Date: Fri,  6 May 2011 18:58:23 -0400
Message-Id: <1304722703-7904-3-git-send-email-mlcreech@gmail.com>
In-Reply-To: <1304722703-7904-1-git-send-email-mlcreech@gmail.com>
References: <1304722703-7904-1-git-send-email-mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If a UBIFS filesystem is being mounted read-write, or is being remounted
from read-only to read-write, check for the "space_fixup" flag and fix
all LEBs containing empty space if necessary.

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 fs/ubifs/super.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 17b92af..59e8858 100644
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
@@ -1677,6 +1683,12 @@ static int ubifs_remount_rw(struct ubifs_info *c)
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
