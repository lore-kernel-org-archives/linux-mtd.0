Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYipI-0001VF-R7
	for linux-mtd@lists.infradead.org; Fri, 21 Sep 2007 09:45:51 -0400
Date: Fri, 21 Sep 2007 15:41:44 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] [MTD] Document erase interface.
Message-ID: <20070921134143.GH1692@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Document mtd erase interface.

Signed-off-by: Jörn Engel <joern@logfs.org>
---

 include/linux/mtd/mtd.h |    7 +++++++
 1 file changed, 7 insertions(+)

--- linux-2.6.21logfs/include/linux/mtd/mtd.h~mtd_erase_documentation	2007-05-31 13:41:41.000000000 +0200
+++ linux-2.6.21logfs/include/linux/mtd/mtd.h	2007-09-21 15:43:18.000000000 +0200
@@ -139,6 +139,13 @@ struct mtd_info {
 	/* This really shouldn't be here. It can go away in 2.5 */
 	u_int32_t bank_size;
 
+	/*
+	 * Erase is an asynchronous operation.  Device drivers are supposed
+	 * to call instr->callback() whenever the operation completes, even
+	 * if it completes with a failure.
+	 * Callers are supposed to pass a callback function and wait for it
+	 * to be called before writing to the block.
+	 */
 	int (*erase) (struct mtd_info *mtd, struct erase_info *instr);
 
 	/* This stuff for eXecute-In-Place */
