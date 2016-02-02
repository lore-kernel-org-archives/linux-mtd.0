Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm5-0002YE-SY
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:05 +0000
Received: by mail-pa0-x241.google.com with SMTP id yy13so7894734pab.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:41 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 07/17] fs:ubifs:add bakvol function define in ubifs layer
Date: Tue,  2 Feb 2016 02:30:42 +0000
Message-Id: <1454380252-16170-8-git-send-email-jackyard88@gmail.com>
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bean Huo <beanhuo@micron.com>

This file patch is to add bakvol function define that
will be called in ubifs layer.
Here has two functions will be called:
	init_bakvol() disable or enable bakvol module.
	ubi_corrupted_data_recovery() recover corrupted page data.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 fs/ubifs/ubifs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index de75902..92bebaa 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1479,6 +1479,8 @@ extern const struct inode_operations ubifs_dir_inode_operations;
 extern const struct inode_operations ubifs_symlink_inode_operations;
 extern struct backing_dev_info ubifs_backing_dev_info;
 extern struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
+extern void init_bakvol(struct ubi_volume_desc *desc, uint8_t choice);
+extern int ubi_corrupted_data_recovery(struct ubi_volume_desc *desc);
 
 /* io.c */
 void ubifs_ro_mode(struct ubifs_info *c, int err);
-- 
1.9.1
