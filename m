Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnX-0006IZ-SS
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:33 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 07/35] fs: char_dev: introduce cd_acquire function to
 acquire cdev
Date: Thu, 30 Jul 2015 13:48:03 +0800
Message-ID: <1438235311-23788-8-git-send-email-yangds.fnst@cn.fujitsu.com>
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

cd_acquire() works like bd_acquire() to get cdev by an inode,
this commit is a preparation for lookup_cdev().

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/char_dev.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/fs/char_dev.c b/fs/char_dev.c
index ea06a3d..e818faa 100644
--- a/fs/char_dev.c
+++ b/fs/char_dev.c
@@ -439,6 +439,41 @@ static int exact_lock(dev_t dev, void *data)
 	return cdev_get(p) ? 0 : -1;
 }
 
+struct cdev *cd_acquire(struct inode *inode)
+{
+	struct cdev *cdev;
+	struct cdev *new = NULL;
+
+	spin_lock(&cdev_lock);
+	cdev = inode->i_cdev;
+	if (!cdev) {
+		struct kobject *kobj;
+		int idx;
+		spin_unlock(&cdev_lock);
+		kobj = kobj_lookup(cdev_map, inode->i_rdev, &idx);
+		if (!kobj) {
+			cdev = NULL;
+			goto out;
+		}
+		new = container_of(kobj, struct cdev, kobj);
+		spin_lock(&cdev_lock);
+		/* Check i_cdev again in case somebody beat us to it while
+		   we dropped the lock. */
+		cdev = inode->i_cdev;
+		if (!cdev) {
+			inode->i_cdev = cdev = new;
+			list_add(&inode->i_devices, &cdev->list);
+		}
+	}
+
+	if (!cdev_get(cdev))
+		cdev = NULL;
+	spin_unlock(&cdev_lock);
+
+out:
+	return cdev;
+}
+
 /**
  * cdev_add() - add a char device to the system
  * @p: the cdev structure for the device
-- 
1.8.4.2
