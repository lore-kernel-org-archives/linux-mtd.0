Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QILkx-00089I-1J
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:11:48 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p46EBiFj000678
	for <linux-mtd@lists.infradead.org>; Fri, 6 May 2011 17:11:45 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/7] UBIFS: fix debugging message
Date: Fri,  6 May 2011 17:15:13 +0300
Message-Id: <1304691317-32214-3-git-send-email-dedekind1@gmail.com>
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

When recovering the inode size, one of the debugging messages was printed
incorrecly, this patches fixes it.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index d28db1e..596dede 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1496,7 +1496,7 @@ int ubifs_recover_size(struct ubifs_info *c)
 				if (inode->i_size < e->d_size) {
 					dbg_rcvry("ino %lu size %lld -> %lld",
 						  (unsigned long)e->inum,
-						  e->d_size, inode->i_size);
+						  inode->i_size, e->d_size);
 					inode->i_size = e->d_size;
 					ubifs_inode(inode)->ui_size = e->d_size;
 					e->inode = inode;
-- 
1.7.2.3
