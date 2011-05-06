Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QILkx-00089F-16
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:11:49 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p46EBiFd000678
	for <linux-mtd@lists.infradead.org>; Fri, 6 May 2011 17:11:45 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/7] UBIFS: fix inode size debugging check failure
Date: Fri,  6 May 2011 17:15:16 +0300
Message-Id: <1304691317-32214-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1304691317-32214-1-git-send-email-dedekind1@gmail.com>
References: <1304691317-32214-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch fixes a problem with the following symptoms:

UBIFS: deferred recovery completed
UBIFS error (pid 15676): dbg_check_synced_i_size: ui_size is 11481088, synced_i_size is 11459081, but inode is clean
UBIFS error (pid 15676): dbg_check_synced_i_size: i_ino 128, i_mode 0x81a4, i_size 11481088

It happens when additional debugging checks are enabled and we are recovering
from a power cut. When we fixup corrupted inode size during recovery, we change
them in-place and we change ui_size as well, but not synced_i_size, which
causes this failure. This patch makes sure we change both fields and fixes the
issue.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index d6c8ce3..3f41a0c 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1490,18 +1490,22 @@ int ubifs_recover_size(struct ubifs_info *c)
 			if (c->ro_mount) {
 				/* Fix the inode size and pin it in memory */
 				struct inode *inode;
+				struct ubifs_inode *ui;
 
 				ubifs_assert(!e->inode);
 
 				inode = ubifs_iget(c->vfs_sb, e->inum);
 				if (IS_ERR(inode))
 					return PTR_ERR(inode);
+
+				ui = ubifs_inode(inode);
 				if (inode->i_size < e->d_size) {
 					dbg_rcvry("ino %lu size %lld -> %lld",
 						  (unsigned long)e->inum,
 						  inode->i_size, e->d_size);
 					inode->i_size = e->d_size;
-					ubifs_inode(inode)->ui_size = e->d_size;
+					ui->ui_size = e->d_size;
+					ui->synced_i_size = e->d_size;
 					e->inode = inode;
 					this = rb_next(this);
 					continue;
-- 
1.7.2.3
