Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmEw-0002nf-OD
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:28 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 13/39] fs: introduce a get_qsize() to inode_operations
Date: Tue, 15 Sep 2015 17:02:08 +0800
Message-ID: <1442307754-13233-14-git-send-email-yangds.fnst@cn.fujitsu.com>
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

get_qsize() is used to allow inode to decide how much of the quota size
in itself. If file system implements the own get_qsize(), ioctl of
FIOQSIZe will call it to get quota size. If not implemented, get the
quota size in a generic way.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ioctl.c         | 31 ++++++++++++++++++++++++-------
 include/linux/fs.h |  1 +
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/fs/ioctl.c b/fs/ioctl.c
index 5d01d26..cc69560 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -545,6 +545,29 @@ static int ioctl_fsthaw(struct file *filp)
 	return thaw_super(sb);
 }
 
+static int ioctl_fioqsize(struct file *filp, int __user *argp)
+{
+	struct inode *inode = file_inode(filp);
+	loff_t res = 0;
+	int error = 0;
+
+	if (inode->i_op->get_qsize) {
+		res = inode->i_op->get_qsize(inode);
+		error = copy_to_user(argp, &res, sizeof(res)) ?
+				-EFAULT : 0;
+	} else {
+                if (S_ISDIR(inode->i_mode) || S_ISREG(inode->i_mode) ||
+                    S_ISLNK(inode->i_mode)) {
+                        res = inode_get_bytes(inode);
+                        error = copy_to_user(argp, &res, sizeof(res)) ?
+                                        -EFAULT : 0;
+                } else {
+                        error = -ENOTTY;
+		}
+	}
+	return error;
+}
+
 /*
  * When you add any new common ioctls to the switches above and below
  * please update compat_sys_ioctl() too.
@@ -577,13 +600,7 @@ int do_vfs_ioctl(struct file *filp, unsigned int fd, unsigned int cmd,
 		break;
 
 	case FIOQSIZE:
-		if (S_ISDIR(inode->i_mode) || S_ISREG(inode->i_mode) ||
-		    S_ISLNK(inode->i_mode)) {
-			loff_t res = inode_get_bytes(inode);
-			error = copy_to_user(argp, &res, sizeof(res)) ?
-					-EFAULT : 0;
-		} else
-			error = -ENOTTY;
+		error = ioctl_fioqsize(filp, argp);
 		break;
 
 	case FIFREEZE:
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 6f0c614..6d183d5 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1669,6 +1669,7 @@ struct inode_operations {
 			   umode_t create_mode, int *opened);
 	int (*tmpfile) (struct inode *, struct dentry *, umode_t);
 	int (*set_acl)(struct inode *, struct posix_acl *, int);
+	ssize_t (*get_qsize) (struct inode *);
 
 	/* WARNING: probably going away soon, do not use! */
 } ____cacheline_aligned;
-- 
1.8.4.2
