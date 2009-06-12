Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MF45p-0005bW-LM
	for linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 10:34:48 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KL40033VG1QHP@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 19:34:38 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KL400JACG1NI2@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 19:34:38 +0900 (KST)
Date: Fri, 12 Jun 2009 15:56:12 +0530
From: Amul Saha <amul.saha@samsung.com>
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
To: dedekind@infradead.org
Message-id: <2AF67696C6634054B7CFDF7A9C19865D@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
	<9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
	<1244712906.5847.414.camel@localhost.localdomain>
Cc: vishak.g@samsung.com, apgmoorthy <moorthy.apg@samsung.com>,
	kyungmin.park@samsung.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch now adds support for Flex-OneNAND to be used as a module,
it also supports Boundary setting at module insertion time

Signed-off-by: Amul Kumar Saha <amul.saha at samsung.com>
Signed-off-by: Vishak G <vishak.g at samsung.com>
---
 onenand_base.c |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 8d4c9c2..6d2086f 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -20,6 +20,7 @@

 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
@@ -31,6 +32,16 @@

 #include <asm/io.h>

+static char *flex_bdry_info;
+
+module_param(flex_bdry_info, charp, 0400);
+MODULE_PARM_DESC(flex_bdry_info, "SLC Boundary information for Flex-OneNAND"
+				 "Syntax:flex_bdry_info=DIE_BDRY,LOCK,..."
+				 "DIE_BDRY: SLC boundary of the die"
+				 "LOCK: Locking information for SLC boundary"
+				 "    : 0->Set boundary in unlocked status"
+				 "    : 1->Set boundary in locked status");
+
 /* Default Flex-OneNAND boundary and lock respectively */
 static int flex_bdry[MAX_DIES * 2] = { -1, 0, -1, 0 };

@@ -3456,6 +3467,10 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	if (onenand_probe(mtd))
 		return -ENXIO;

+#ifdef MODULE
+	flexonenand_setup(flex_bdry_info);
+#endif
+
 	/* Set Sync. Burst Read after probing */
 	if (this->mmcontrol) {
 		printk(KERN_INFO "OneNAND Sync. Burst Read support\n");
