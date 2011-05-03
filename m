Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHOUp-000493-Jy
	for linux-mtd@lists.infradead.org; Tue, 03 May 2011 22:55:12 +0000
Received: by mail-vx0-f177.google.com with SMTP id 2so681073vxd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 May 2011 15:55:11 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 3 May 2011 18:55:11 -0400
Message-ID: <BANLkTikj0LU_mifnsaqhYCd1cvOV2RiLxg@mail.gmail.com>
Subject: [PATCH 3/3] ubifs: fixup LEBs on mount if "leb_fixup" flag set
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
from read-only to read-write, check for the "leb_fixup" flag and fix all
partially empty LEBs if necessary.

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 fs/ubifs/super.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index c75f613..6ed5ab4 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1396,6 +1396,12 @@ static int mount_ubifs(struct ubifs_info *c)
 	} else
 		ubifs_assert(c->lst.taken_empty_lebs > 0);

+	if (!c->ro_mount && c->leb_fixup) {
+		err = ubifs_mount_fixup_lebs(c);
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

+	if (c->leb_fixup) {
+		err = ubifs_mount_fixup_lebs(c);
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
