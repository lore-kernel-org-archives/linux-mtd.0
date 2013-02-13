Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5ZV0-00014R-Pi
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 10:23:36 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC 2/5] UBIFS: fix couple bugs in UBIFS extended attribute
 length calculation
Date: Wed, 13 Feb 2013 11:23:15 +0100
Message-Id: <1360750998-15191-3-git-send-email-mkl@pengutronix.de>
In-Reply-To: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
References: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
Cc: Subodh Nijsure <snijsure@grid-net.com>, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de
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
---
 fs/ubifs/journal.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index afaad07..6981d7d 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -572,7 +572,12 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 
 	aligned_dlen = ALIGN(dlen, 8);
 	aligned_ilen = ALIGN(ilen, 8);
-	len = aligned_dlen + aligned_ilen + UBIFS_INO_NODE_SZ;
+	/*
+	 * Make sure to account for dir_ui+data_len in length
+	 * calculation in case there is extended attribute.
+	 */
+	len = aligned_dlen + aligned_ilen +
+	      UBIFS_INO_NODE_SZ + dir_ui->data_len;
 	dent = kmalloc(len, GFP_NOFS);
 	if (!dent)
 		return -ENOMEM;
@@ -649,7 +654,8 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 
 	ino_key_init(c, &ino_key, dir->i_ino);
 	ino_offs += aligned_ilen;
-	err = ubifs_tnc_add(c, &ino_key, lnum, ino_offs, UBIFS_INO_NODE_SZ);
+	err = ubifs_tnc_add(c, &ino_key, lnum, ino_offs,
+			    UBIFS_INO_NODE_SZ + dir_ui->data_len);
 	if (err)
 		goto out_ro;
 
-- 
1.7.10.4
