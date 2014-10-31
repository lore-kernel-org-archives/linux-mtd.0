Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XkHJU-0008Ph-Ib
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 18:52:45 +0000
From: Ben Shelton <ben.shelton@ni.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] UBIFS: fix a couple bugs in UBIFS xattr length calculation
Date: Fri, 31 Oct 2014 13:50:28 -0500
Message-Id: <1414781431-2911-2-git-send-email-ben.shelton@ni.com>
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

Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Acked-by: Brad Mouring <brad.mouring@ni.com>
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
---
 fs/ubifs/journal.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index fb166e2..7d90f13 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -571,7 +571,13 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 
 	aligned_dlen = ALIGN(dlen, 8);
 	aligned_ilen = ALIGN(ilen, 8);
-	len = aligned_dlen + aligned_ilen + UBIFS_INO_NODE_SZ;
+
+	/*
+	 * Make sure to account for dir_ui->data_len in the length calculation
+	 * in case there is an extended attribute.
+	 */
+	len = aligned_dlen + aligned_ilen +
+	      UBIFS_INO_NODE_SZ + dir_ui->data_len;
 	dent = kmalloc(len, GFP_NOFS);
 	if (!dent)
 		return -ENOMEM;
@@ -648,7 +654,8 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 
 	ino_key_init(c, &ino_key, dir->i_ino);
 	ino_offs += aligned_ilen;
-	err = ubifs_tnc_add(c, &ino_key, lnum, ino_offs, UBIFS_INO_NODE_SZ);
+	err = ubifs_tnc_add(c, &ino_key, lnum, ino_offs,
+			    UBIFS_INO_NODE_SZ + dir_ui->data_len);
 	if (err)
 		goto out_ro;
 
-- 
2.1.1
