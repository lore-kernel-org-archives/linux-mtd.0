Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XkHIS-0004PF-Rz
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 18:51:42 +0000
From: Ben Shelton <ben.shelton@ni.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] UBIFS: add ubifs_err() to print error reason
Date: Fri, 31 Oct 2014 13:50:31 -0500
Message-Id: <1414781431-2911-5-git-send-email-ben.shelton@ni.com>
In-Reply-To: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
References: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
Cc: Subodh Nijsure <snijsure@grid-net.com>, dedekind1@gmail.com,
 Ben Shelton <ben.shelton@ni.com>, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Marc Kleine-Budde <mkl@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Subodh Nijsure <snijsure@grid-net.com>

This patch adds ubifs_err() output to some error paths to tell the user
what's going on.

Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Acked-by: Brad Mouring <brad.mouring@ni.com>
Acked-by: Terry Wilcox <terry.wilcox@ni.com>
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
---
 fs/ubifs/xattr.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index f844841..2b99e49 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -100,24 +100,32 @@ static const struct file_operations empty_fops;
 static int create_xattr(struct ubifs_info *c, struct inode *host,
 			const struct qstr *nm, const void *value, int size)
 {
-	int err;
+	int err, xattr_name_list_size;
 	struct inode *inode;
 	struct ubifs_inode *ui, *host_ui = ubifs_inode(host);
 	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1,
 				.new_ino_d = ALIGN(size, 8), .dirtied_ino = 1,
 				.dirtied_ino_d = ALIGN(host_ui->data_len, 8) };
 
-	if (host_ui->xattr_cnt >= MAX_XATTRS_PER_INODE)
+	if (host_ui->xattr_cnt >= MAX_XATTRS_PER_INODE) {
+		ubifs_err("ubifs xattr_cnt %d exceeds MAX_XATTR_PER_NODE (%d)",
+			  host_ui->xattr_cnt, MAX_XATTRS_PER_INODE);
 		return -ENOSPC;
+	}
 	/*
 	 * Linux limits the maximum size of the extended attribute names list
 	 * to %XATTR_LIST_MAX. This means we should not allow creating more
 	 * extended attributes if the name list becomes larger. This limitation
 	 * is artificial for UBIFS, though.
 	 */
-	if (host_ui->xattr_names + host_ui->xattr_cnt +
-					nm->len + 1 > XATTR_LIST_MAX)
+	xattr_name_list_size = host_ui->xattr_names + host_ui->xattr_cnt +
+					nm->len + 1;
+
+	if (xattr_name_list_size > XATTR_LIST_MAX) {
+		ubifs_err("xattr name list too large %d > %d",
+			  xattr_name_list_size, XATTR_LIST_MAX);
 		return -ENOSPC;
+	}
 
 	err = ubifs_budget_space(c, &req);
 	if (err)
@@ -652,5 +660,9 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
 					   &ubifs_initxattrs, 0);
 	mutex_unlock(&inode->i_mutex);
 
+	if (err)
+		ubifs_err("cannot initialize extended attribute, error %d",
+			  err);
+
 	return err;
 }
-- 
2.1.1
