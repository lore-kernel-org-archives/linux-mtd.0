Received: from ti-out-0910.google.com ([209.85.142.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2mv0-0005Xr-1A
	for linux-mtd@lists.infradead.org; Wed, 19 Nov 2008 13:16:30 +0000
Received: by ti-out-0910.google.com with SMTP id a21so2271159tia.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Nov 2008 05:16:29 -0800 (PST)
From: Qinghuang Feng <qhfeng.kernel@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/4] drivers/mtd/nand/cmx270_nand.c: mark {__init|__exit} for
	{init|exit} functions
Date: Wed, 19 Nov 2008 21:16:22 +0800
Message-ID: <492411ac.0c486e0a.3215.0294@mx.google.com>
Cc: Mike, linux-kernel@vger.kernel.org, David, linux-mtd@lists.infradead.org,
	Mike Lavender <mike@steroidmicros.com>, Rapoport <mike@compulab.co.il>,
	Hinds <dahinds@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Qinghuang Feng <qhfeng.kernel@gmail.com>
---
diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index fa129c0..c429ea2 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -148,7 +148,7 @@ static int cmx270_device_ready(struct mtd_info *mtd)
 /*
  * Main initialization routine
  */
-static int cmx270_init(void)
+static int __init cmx270_init(void)
 {
 	struct nand_chip *this;
 	const char *part_type;
@@ -262,7 +262,7 @@ module_init(cmx270_init);
 /*
  * Clean up routine
  */
-static void cmx270_cleanup(void)
+static void __exit cmx270_cleanup(void)
 {
 	/* Release resources, unregister device */
 	nand_release(cmx270_nand_mtd);
