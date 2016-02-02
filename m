Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQmC-0002Yq-DW
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:11 +0000
Received: by mail-pa0-x243.google.com with SMTP id pv5so7920814pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:48 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 15/17] fs:ubifs:enable bakvol module and recover operation
Date: Tue,  2 Feb 2016 02:30:50 +0000
Message-Id: <1454380252-16170-16-git-send-email-jackyard88@gmail.com>
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

Before mounting, bakvol will do recovery operaion according to
master node flag(clearly unmount or not). If corrupted page damaged by
power loss exists, bakvol will reocover it through its backup page data.
bakvol module will be enable after ubifs mount successfully.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 fs/ubifs/super.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 9547a278..0aaeafa 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1270,6 +1270,11 @@ static int mount_ubifs(struct ubifs_info *c)
 		c->need_recovery = 1;
 	}
 
+#ifdef CONFIG_MTD_UBI_MLC_NAND_BAKVOL
+	if (c->need_recovery)
+		ubi_corrupted_data_recovery(c->ubi);
+#endif
+
 	if (c->need_recovery && !c->ro_mount) {
 		err = ubifs_recover_inl_heads(c, c->sbuf);
 		if (err)
@@ -1463,6 +1468,8 @@ static int mount_ubifs(struct ubifs_info *c)
 	dbg_gen("max. seq. number:    %llu", c->max_sqnum);
 	dbg_gen("commit number:       %llu", c->cmt_no);
 
+	init_bakvol(c->ubi, 1);
+
 	return 0;
 
 out_infos:
@@ -1774,6 +1781,10 @@ static void ubifs_put_super(struct super_block *sb)
 	 * the mutex is locked.
 	 */
 	mutex_lock(&c->umount_mutex);
+
+	/* Disable ubi MLC power loss backup function */
+	init_bakvol(c->ubi, 0);
+
 	if (!c->ro_mount) {
 		/*
 		 * First of all kill the background thread to make sure it does
-- 
1.9.1
