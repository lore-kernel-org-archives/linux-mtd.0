Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yakvy-00025G-Uo
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 13:01:27 +0000
Message-ID: <5512B161.4090709@huawei.com>
Date: Wed, 25 Mar 2015 21:00:17 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard.weinberger@gmail.com>
Subject: [PATCH RFC] ubifs: introduce an ioctl to get UBIFS files compressed
 size
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Andreas Dilger <adilger@dilger.ca>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, David Sterba <dsterba@suse.cz>,
 "markus.heininger@online.de" <markus.heininger@online.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As discussed in last mail, I don't think record compressed size in
*ubifs_ino_inode* could suffer power cut easily, rebuild the records
of each file may increase the mount time and we may need to write
more meta data to keep the consistency of compressed size. And I
don't think *fiemap* is a good interface either, because it is can't
report compressed size at present.

http://lists.infradead.org/pipermail/linux-mtd/2015-February/057978.html

So I tried another way, introduce a new ioctl which scan the tnc_tree
to get the compressed size in each *ubifs_data_node* of the request
file.

Similar with:
https://patchwork.kernel.org/patch/117782/

But This isn't a good solution in performance side. Just want to show
my code to push the achievement of this feature.

Any test or any advisement is welcomed.

Thanks everyone~!

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/ioctl.c |   61 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h |    2 +
 2 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 648b143..a148e32 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -144,6 +144,62 @@ out_unlock:
 	return err;
 }

+static long ubifs_ioctl_compsize(struct file *file, void __user *arg)
+{
+	struct inode *inode = file_inode(file);
+	struct ubifs_inode *ui = ubifs_inode(inode);
+	struct ubifs_info *c = inode->i_sb->s_fs_info;
+	loff_t compsize = 0;
+	loff_t synced_i_size;
+	unsigned int block, beyond, dlen;
+	struct ubifs_data_node *dn;
+	union ubifs_key key;
+	int err = 0;
+
+	if (S_ISDIR(inode->i_mode))
+		return -EISDIR;
+
+	dn = kmalloc(UBIFS_MAX_DATA_NODE_SZ, GFP_NOFS);
+	if (!dn)
+		return -ENOMEM;
+
+	filemap_write_and_wait(inode->i_mapping);
+
+	mutex_lock(&ui->ui_mutex);
+
+	spin_lock(&ui->ui_lock);
+	synced_i_size = ui->synced_i_size;
+	spin_unlock(&ui->ui_lock);
+
+	block = 0;
+	beyond = (synced_i_size + UBIFS_BLOCK_SIZE - 1) >> UBIFS_BLOCK_SHIFT;
+
+	while (block < beyond) {
+		data_key_init(c, &key, inode->i_ino, block);
+		err = ubifs_tnc_lookup(c, &key, dn);
+		if (err) {
+			if (err != -ENOENT) {
+				mutex_unlock(&ui->ui_mutex);
+				goto out;
+			}
+		} else {
+			dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
+			compsize += dlen;
+		}
+		block += 1;
+	}
+
+	mutex_unlock(&ui->ui_mutex);
+
+	err = 0;
+	if (copy_to_user(arg, &compsize, sizeof(compsize)))
+		err = -EFAULT;
+
+out:
+	kfree(dn);
+	return err;
+}
+
 long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	int flags, err;
@@ -182,6 +238,9 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return err;
 	}

+	case UBIFS_IOC_COMPR_SIZE:
+		return ubifs_ioctl_compsize(file, (void __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
@@ -197,6 +256,8 @@ long ubifs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case FS_IOC32_SETFLAGS:
 		cmd = FS_IOC_SETFLAGS;
 		break;
+	case UBIFS_IOC_COMPR_SIZE:
+		return ubifs_ioctl_compsize(file, (void __user *)arg);
 	default:
 		return -ENOIOCTLCMD;
 	}
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 2911d2d..9000be8 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -169,6 +169,8 @@
 /* Maximum number of data nodes to bulk-read */
 #define UBIFS_MAX_BULK_READ 32

+#define UBIFS_IOC_COMPR_SIZE _IOR('O', 0, loff_t)
+
 /*
  * Lockdep classes for UBIFS inode @ui_mutex.
  */
-- 
1.6.0.2
