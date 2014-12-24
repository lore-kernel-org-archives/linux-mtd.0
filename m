Received: from mx5.zte.com.cn ([63.217.80.70])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3avX-0002p8-8i
 for linux-mtd@lists.infradead.org; Wed, 24 Dec 2014 01:39:52 +0000
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
 by Websense Email Security Gateway with ESMTPS id 0C8E63BFBF070
 for <linux-mtd@lists.infradead.org>; Wed, 24 Dec 2014 09:39:25 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse01.zte.com.cn with ESMTP id sBO1cRSE029272
 for <linux-mtd@lists.infradead.org>; Wed, 24 Dec 2014 09:38:36 +0800 (GMT-8)
 (envelope-from liu.song11@zte.com.cn)
Subject: fix spelling mistake in ubifs.h
Cc: linux-mtd@lists.infradead.org
Message-ID: <OFC9D6133D.097A1410-ON48257DB8.0008AFFC-48257DB8.0008ED1F@zte.com.cn>
From: liu.song11@zte.com.cn
Date: Wed, 24 Dec 2014 09:38:46 +0800
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


maybe there is a spelling mistake.fix it or ignore it seems both ok, lol.
---
 fs/ubifs/ubifs.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index a06e8d7..fe53006 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -157,7 +157,7 @@
 #define WORST_COMPR_FACTOR 2

 /*
- * How much memory is needed for a buffer where we comress a data node.
+ * How much memory is needed for a buffer where we compress a data node.
  */
 #define COMPRESSED_DATA_NODE_BUF_SZ \
 	(UBIFS_DATA_NODE_SZ + UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR)
--

--------------------------------------------------------
ZTE Information Security Notice: The information contained in this mail (and any attachment transmitted herewith) is privileged and confidential and is intended for the exclusive use of the addressee(s).  If you are not an intended recipient, any disclosure, reproduction, distribution or other dissemination or use of the information contained is strictly prohibited.  If you have received this mail in error, please delete it and notify us immediately.
