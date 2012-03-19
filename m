Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9l2F-0007T7-Jh
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 22:26:40 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: add documentation about locking context of MTD API
Date: Mon, 19 Mar 2012 23:26:25 +0100
Message-Id: <1332195985-21043-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a comment to mtd header for MTD drivers writters, so that they
know that each function in the MTD API, ie. in the mtd_info
structure, is called in a sleeping context.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 include/linux/mtd/mtd.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cf5ea8c..4a417e7 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -176,6 +176,11 @@ struct mtd_info {
 	/*
 	 * Do not call via these pointers, use corresponding mtd_*()
 	 * wrappers instead.
+	 *
+	 * All the following functions are called in a sleeping context, ie. it
+	 * can be safely assumed in mtd drivers that :
+	 *  - might_sleep() == 1
+	 *  - msleep(), mutex_lock() and co are authorized
 	 */
 	int (*_erase) (struct mtd_info *mtd, struct erase_info *instr);
 	int (*_point) (struct mtd_info *mtd, loff_t from, size_t len,
-- 
1.7.5.4
