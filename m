Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwbHo-0000HZ-MJ
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 20:47:03 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dedekind1@gmail.com, adrian.hunter@intel.com,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org
Subject: [PATCH] ubifs: Fix xattr_names length in exit paths
Date: Tue, 18 Oct 2016 22:46:30 +0200
Message-Id: <1476823591-6137-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the operation fails we also have to undo the changes
we made to ->xattr_names. Otherwise listxattr() will report
wrong lengths.

Cc: stable@vger.kernel.org
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/xattr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 6c2f4d41ed73..d9f9615bfd71 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -172,6 +172,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	host_ui->xattr_cnt -= 1;
 	host_ui->xattr_size -= CALC_DENT_SIZE(nm->len);
 	host_ui->xattr_size -= CALC_XATTR_BYTES(size);
+	host_ui->xattr_names -= nm->len;
 	mutex_unlock(&host_ui->ui_mutex);
 out_free:
 	make_bad_inode(inode);
@@ -478,6 +479,7 @@ static int remove_xattr(struct ubifs_info *c, struct inode *host,
 	host_ui->xattr_cnt += 1;
 	host_ui->xattr_size += CALC_DENT_SIZE(nm->len);
 	host_ui->xattr_size += CALC_XATTR_BYTES(ui->data_len);
+	host_ui->xattr_names += nm->len;
 	mutex_unlock(&host_ui->ui_mutex);
 	ubifs_release_budget(c, &req);
 	make_bad_inode(inode);
-- 
2.7.3
