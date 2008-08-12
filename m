Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KSrlN-0003Nh-GZ
	for linux-mtd@lists.infradead.org; Tue, 12 Aug 2008 11:10:05 +0000
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-mx03.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m7CB9lgi019052
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2008 14:10:03 +0300
Message-ID: <48A16FF6.1060802@nokia.com>
Date: Tue, 12 Aug 2008 14:11:50 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [JFFS2] Correct symlink name too long error code
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 fs/jffs2/dir.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index cd219ef..b1aaae8 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -311,7 +311,7 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	/* FIXME: If you care. We'd need to use frags for the target
 	   if it grows much more than this */
 	if (targetlen > 254)
-		return -EINVAL;
+		return -ENAMETOOLONG;
 
 	ri = jffs2_alloc_raw_inode();
 
-- 
1.5.4.3
