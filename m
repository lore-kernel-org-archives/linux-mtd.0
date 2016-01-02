Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aFUOg-0001iB-Oo
 for linux-mtd@lists.infradead.org; Sat, 02 Jan 2016 22:11:39 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Cc: adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org
Subject: [PATCH] ubifs: Fix error codes in ubifs_iget()
Date: Sat,  2 Jan 2016 23:11:06 +0100
Message-Id: <1451772666-2139-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We cannot use positive error codes in ERR_PTR().
IS_ERR() won't catch them.

Cc: stable@vger.kernel.org
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/super.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 1fd90c0..c7d8230 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -173,7 +173,7 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 			memcpy(ui->data, ino->data, ui->data_len);
 			((char *)ui->data)[ui->data_len] = '\0';
 		} else if (ui->data_len != 0) {
-			err = 10;
+			err = -EINVAL;
 			goto out_invalid;
 		}
 		break;
@@ -181,14 +181,14 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 		inode->i_op  = &ubifs_dir_inode_operations;
 		inode->i_fop = &ubifs_dir_operations;
 		if (ui->data_len != 0) {
-			err = 11;
+			err = -EINVAL;
 			goto out_invalid;
 		}
 		break;
 	case S_IFLNK:
 		inode->i_op = &ubifs_symlink_inode_operations;
 		if (ui->data_len <= 0 || ui->data_len > UBIFS_MAX_INO_DATA) {
-			err = 12;
+			err = -EINVAL;
 			goto out_invalid;
 		}
 		ui->data = kmalloc(ui->data_len + 1, GFP_NOFS);
@@ -218,7 +218,7 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 		else if (ui->data_len == sizeof(dev->huge))
 			rdev = huge_decode_dev(le64_to_cpu(dev->huge));
 		else {
-			err = 13;
+			err = -EINVAL;
 			goto out_invalid;
 		}
 		memcpy(ui->data, ino->data, ui->data_len);
@@ -231,12 +231,12 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 		inode->i_op = &ubifs_file_inode_operations;
 		init_special_inode(inode, inode->i_mode, 0);
 		if (ui->data_len != 0) {
-			err = 14;
+			err = -EINVAL;
 			goto out_invalid;
 		}
 		break;
 	default:
-		err = 15;
+		err = -EINVAL;
 		goto out_invalid;
 	}
 
-- 
2.5.0
