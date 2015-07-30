Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnc-0006Ib-AB
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:37 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 12/35] ubi: introduce a interface to get cdev in ubi_volume
Date: Thu, 30 Jul 2015 13:48:08 +0800
Message-ID: <1438235311-23788-13-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We want to fill the sb->s_cdev in ubifs_fill_super(),
so, we need to add a interface in ubi to get the cdev
of an ubi_volume.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 drivers/mtd/ubi/kapi.c  | 6 ++++++
 include/linux/mtd/ubi.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index e844887..d3d1982 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -862,3 +862,9 @@ int ubi_unregister_volume_notifier(struct notifier_block *nb)
 	return blocking_notifier_chain_unregister(&ubi_notifiers, nb);
 }
 EXPORT_SYMBOL_GPL(ubi_unregister_volume_notifier);
+
+inline struct cdev *ubi_get_volume_cdev(struct ubi_volume_desc *desc)
+{
+	return &(desc->vol->cdev);
+}
+EXPORT_SYMBOL_GPL(ubi_get_volume_cdev);
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 1e271cb..301c6e9 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -261,6 +261,7 @@ int ubi_leb_map(struct ubi_volume_desc *desc, int lnum);
 int ubi_is_mapped(struct ubi_volume_desc *desc, int lnum);
 int ubi_sync(int ubi_num);
 int ubi_flush(int ubi_num, int vol_id, int lnum);
+struct cdev *ubi_get_volume_cdev(struct ubi_volume_desc *desc);
 
 /*
  * This function is the same as the 'ubi_leb_read()' function, but it does not
-- 
1.8.4.2
