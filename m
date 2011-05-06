Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QILkx-00089H-1A
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:11:48 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p46EBiFh000678
	for <linux-mtd@lists.infradead.org>; Fri, 6 May 2011 17:11:45 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/7] UBIFS: remove an unneeded check
Date: Fri,  6 May 2011 17:15:14 +0300
Message-Id: <1304691317-32214-4-git-send-email-dedekind1@gmail.com>
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

In 'ubifs_recover_size()' we have an "if (!e->inode && c->ro_mount)" statement.
But if 'c->ro_mount' is true, then '!e->inode' must always be true as well. So
we can remove the unnecessary '!e->inode' test and put an
'ubifs_assert(!e->inode)' instead.

This patch also removes an extra trailing white-space in a debugging print,
as well as adds few empty lines to 'ubifs_recover_size()' to make it a bit more
readable.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 596dede..d6c8ce3 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1436,7 +1436,7 @@ static int fix_size_in_place(struct ubifs_info *c, struct size_entry *e)
 	err = ubi_leb_change(c->ubi, lnum, c->sbuf, len, UBI_UNKNOWN);
 	if (err)
 		goto out;
-	dbg_rcvry("inode %lu at %d:%d size %lld -> %lld ",
+	dbg_rcvry("inode %lu at %d:%d size %lld -> %lld",
 		  (unsigned long)e->inum, lnum, offs, i_size, e->d_size);
 	return 0;
 
@@ -1485,11 +1485,14 @@ int ubifs_recover_size(struct ubifs_info *c)
 				e->i_size = le64_to_cpu(ino->size);
 			}
 		}
+
 		if (e->exists && e->i_size < e->d_size) {
-			if (!e->inode && c->ro_mount) {
+			if (c->ro_mount) {
 				/* Fix the inode size and pin it in memory */
 				struct inode *inode;
 
+				ubifs_assert(!e->inode);
+
 				inode = ubifs_iget(c->vfs_sb, e->inum);
 				if (IS_ERR(inode))
 					return PTR_ERR(inode);
@@ -1513,9 +1516,11 @@ int ubifs_recover_size(struct ubifs_info *c)
 					iput(e->inode);
 			}
 		}
+
 		this = rb_next(this);
 		rb_erase(&e->rb, &c->size_tree);
 		kfree(e);
 	}
+
 	return 0;
 }
-- 
1.7.2.3
