Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAuSM-0007Gq-9Q
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 08:37:21 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/6] ubifs: Don't try to encrypt special files
Date: Wed, 17 May 2017 10:36:44 +0200
Message-Id: <20170517083649.25135-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fscrypt can only operate on files, directories and symlinks.

Fixes: d475a507457b5cafa428871a473d0dcc828c5f68
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 566079d9b402..70b26221f2e7 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -142,6 +142,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 	case S_IFIFO:
 	case S_IFBLK:
 	case S_IFCHR:
+		encrypted = false;
 		inode->i_op  = &ubifs_file_inode_operations;
 		break;
 	default:
-- 
2.12.0
