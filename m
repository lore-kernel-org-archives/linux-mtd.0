Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5ZUz-00014N-Tf
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 10:23:34 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC 1/5] UBIFS: xattr: protect ui_size and data_len by ui_mutex
Date: Wed, 13 Feb 2013 11:23:14 +0100
Message-Id: <1360750998-15191-2-git-send-email-mkl@pengutronix.de>
In-Reply-To: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
References: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
Cc: artem.bityutskiy@linux.intel.com, linux-security-module@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch moves the modification of ui->ui_size and ui->data_len in the
create_xattr() and change_xattr() functions, so that they are protected by the
ui_mutex as stated in the documenation of the the struct ubifs_inode.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 fs/ubifs/xattr.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 0f7139b..1395307 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -143,10 +143,10 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 		err = -ENOMEM;
 		goto out_free;
 	}
-	inode->i_size = ui->ui_size = size;
-	ui->data_len = size;
 
 	mutex_lock(&host_ui->ui_mutex);
+	inode->i_size = ui->ui_size = size;
+	ui->data_len = size;
 	host->i_ctime = ubifs_current_time(host);
 	host_ui->xattr_cnt += 1;
 	host_ui->xattr_size += CALC_DENT_SIZE(nm->len);
@@ -208,10 +208,10 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 		err = -ENOMEM;
 		goto out_free;
 	}
-	inode->i_size = ui->ui_size = size;
-	ui->data_len = size;
 
 	mutex_lock(&host_ui->ui_mutex);
+	inode->i_size = ui->ui_size = size;
+	ui->data_len = size;
 	host->i_ctime = ubifs_current_time(host);
 	host_ui->xattr_size -= CALC_XATTR_BYTES(ui->data_len);
 	host_ui->xattr_size += CALC_XATTR_BYTES(size);
-- 
1.7.10.4
