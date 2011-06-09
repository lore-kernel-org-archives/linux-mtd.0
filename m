Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6u-0002SQ-HN
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:07 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wE7028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:02 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/30] UBIFS: remove unnecessary brackets
Date: Thu,  9 Jun 2011 12:04:47 +0300
Message-Id: <1307610310-28691-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Remove unnecessary brackets in "inode->i_flags |= (S_NOCMTIME)" statement to
make the code not look silly.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/dir.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index ef5abd3..c6cbdd0 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -102,7 +102,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 	 * UBIFS has to fully control "clean <-> dirty" transitions of inodes
 	 * to make budgeting work.
 	 */
-	inode->i_flags |= (S_NOCMTIME);
+	inode->i_flags |= S_NOCMTIME;
 
 	inode_init_owner(inode, dir, mode);
 	inode->i_mtime = inode->i_atime = inode->i_ctime =
-- 
1.7.2.3
