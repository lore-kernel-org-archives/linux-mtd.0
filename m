Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmEt-0002kO-NK
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:24 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 09/39] fs: char_dev: introduce lookup_cdev to get cdev by
 pathname
Date: Tue, 15 Sep 2015 17:02:04 +0800
Message-ID: <1442307754-13233-10-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Function lookup_cdev works similarly with lookup_bdev, we can get
a cdev instance by lookup_cdev with a parameter of dev name.

This function will be used in quotactl to get a cdev by a dev name.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Reviewed-by: Jan Kara <jack@suse.com>
---
 fs/char_dev.c      | 13 +++++++++++++
 include/linux/fs.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/fs/char_dev.c b/fs/char_dev.c
index e818faa..12c1bd5 100644
--- a/fs/char_dev.c
+++ b/fs/char_dev.c
@@ -474,6 +474,18 @@ out:
 	return cdev;
 }
 
+struct cdev *lookup_cdev(const char *pathname)
+{
+	struct cdev *cdev;
+	int error;
+
+	error = __lookup_dev(pathname, &cdev, NULL);
+	if (error)
+		return ERR_PTR(error);
+
+	return cdev;
+}
+
 /**
  * cdev_add() - add a char device to the system
  * @p: the cdev structure for the device
@@ -596,6 +608,7 @@ void __init chrdev_init(void)
 EXPORT_SYMBOL(register_chrdev_region);
 EXPORT_SYMBOL(unregister_chrdev_region);
 EXPORT_SYMBOL(alloc_chrdev_region);
+EXPORT_SYMBOL(lookup_cdev);
 EXPORT_SYMBOL(cdev_init);
 EXPORT_SYMBOL(cdev_alloc);
 EXPORT_SYMBOL(cdev_del);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 2c1c122..6f0c614 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2346,6 +2346,8 @@ extern void __unregister_chrdev(unsigned int major, unsigned int baseminor,
 				unsigned int count, const char *name);
 extern void unregister_chrdev_region(dev_t, unsigned);
 extern void chrdev_show(struct seq_file *,off_t);
+extern struct cdev *lookup_cdev(const char *);
+
 
 static inline int register_chrdev(unsigned int major, const char *name,
 				  const struct file_operations *fops)
-- 
1.8.4.2
