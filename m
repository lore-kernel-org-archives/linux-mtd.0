Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQl-0003dL-IZ
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:35 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTkN011097
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 20/20] UBIFS: fix-up free space on mount if flag is set
Date: Mon, 16 May 2011 10:44:39 +0300
Message-Id: <1305531879-19311-21-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
References: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matthew L. Creech <mlcreech@gmail.com>

If a UBIFS filesystem is being mounted read-write, or is being remounted
from read-only to read-write, check for the "space_fixup" flag and fix
all LEBs containing empty space if necessary.

Artem: tweaked the patch a bit

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 575ea83..6db0bdaa 100644
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
@@ -1686,6 +1692,13 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		 */
 		err = dbg_check_space_info(c);
 	}
+
+	if (c->space_fixup) {
+		err = ubifs_fixup_free_space(c);
+		if (err)
+			goto out;
+	}
+
 	mutex_unlock(&c->umount_mutex);
 	return err;
 
-- 
1.7.2.3
