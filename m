Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxsSQ-0006Vg-Tk
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 09:51:34 +0000
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v2 2/3] fs: ubifs: update i_version on inode changes
Date: Tue, 11 Apr 2017 11:50:54 +0200
Message-Id: <20170411095055.26328-3-o.rempel@pengutronix.de>
In-Reply-To: <20170411095055.26328-1-o.rempel@pengutronix.de>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

increment i_version to notify security/IMA about changes
made in inode.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 fs/ubifs/file.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index d9ae86f96df7..29213724259b 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1104,6 +1104,8 @@ static void do_attr_changes(struct inode *inode, const struct iattr *attr)
 			mode &= ~S_ISGID;
 		inode->i_mode = mode;
 	}
+	if (IS_I_VERSION(inode))
+		inode_inc_iversion(inode);
 }
 
 /**
@@ -1401,6 +1403,9 @@ int ubifs_update_time(struct inode *inode, struct timespec *time,
 	if (!(inode->i_sb->s_flags & MS_LAZYTIME))
 		iflags |= I_DIRTY_SYNC;
 
+	if (IS_I_VERSION(inode))
+		inode_inc_iversion(inode);
+
 	release = ui->dirty;
 	__mark_inode_dirty(inode, iflags);
 	mutex_unlock(&ui->ui_mutex);
@@ -1435,6 +1440,8 @@ static int update_mctime(struct inode *inode)
 
 		mutex_lock(&ui->ui_mutex);
 		inode->i_mtime = inode->i_ctime = ubifs_current_time(inode);
+		if (IS_I_VERSION(inode))
+			inode_inc_iversion(inode);
 		release = ui->dirty;
 		mark_inode_dirty_sync(inode);
 		mutex_unlock(&ui->ui_mutex);
@@ -1580,6 +1587,8 @@ static int ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 
 		mutex_lock(&ui->ui_mutex);
 		inode->i_mtime = inode->i_ctime = ubifs_current_time(inode);
+		if (IS_I_VERSION(inode))
+			inode_inc_iversion(inode);
 		release = ui->dirty;
 		mark_inode_dirty_sync(inode);
 		mutex_unlock(&ui->ui_mutex);
-- 
2.11.0
