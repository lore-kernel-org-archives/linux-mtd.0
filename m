Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAxFz-0007z0-L4
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 11:36:45 +0000
From: David Gstir <david@sigma-star.at>
To: richard@nod.at,
	dedekind1@gmail.com,
	adrian.hunter@intel.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Gstir <david@sigma-star.at>, stable@vger.kernel.org
Subject: [PATCH] ubifs: Don't encrypt special files on creation
Date: Wed, 17 May 2017 13:36:16 +0200
Message-Id: <20170517113616.61499-1-david@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When a new inode is created, we check if the containing folder has a encryption
policy set and inherit that. This should however only be done for regular
files, links and subdirectories. Not for sockes fifos etc.

Fixes: d475a507457b ("ubifs: Add skeleton for fscrypto")
Cc: stable@vger.kernel.org
Signed-off-by: David Gstir <david@sigma-star.at>
---
 fs/ubifs/dir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 566079d9b402..c67f6a3a606c 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -143,6 +143,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 	case S_IFBLK:
 	case S_IFCHR:
 		inode->i_op  = &ubifs_file_inode_operations;
+		encrypted = false;
 		break;
 	default:
 		BUG();
-- 
2.12.0
