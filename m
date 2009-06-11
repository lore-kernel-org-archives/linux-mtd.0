Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MEgVa-0006Vb-UE
	for linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 09:23:50 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KL200F3EI3G05@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 18:23:40 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KL20019VI3EKY@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 18:23:40 +0900 (KST)
Date: Thu, 11 Jun 2009 14:53:48 +0530
From: Amul Saha <amul.saha@samsung.com>
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
To: David Woodhouse <dwmw2@infradead.org>, dedekind@infradead.org
Message-id: <9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
Cc: kyungmin.park@samsung.com, vishak.g@samsung.com,
	linux-mtd@lists.infradead.org,
	apgmoorthy <moorthy.apg@samsung.com>, akpm@linux-foundation.org
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
 onenand_base.c |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 8d4c9c2..a91133b 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -20,6 +20,7 @@

 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
@@ -31,6 +32,18 @@

 #include <asm/io.h>

+#ifdef MODULE
+static char *flex_bdry_info;
+
+module_param(flex_bdry_info, charp, 0400);
+MODULE_PARM_DESC(flex_bdry_info, "SLC Boundary information for Flex-OneNAND"
+				 "Syntax:flex_bdry_info=DIE_BDRY,LOCK,..."
+				 "DIE_BDRY: SLC boundary of the die"
+				 "LOCK: Locking information for SLC boundary"
+				 "    : 0->Set boundary in unlocked status"
+				 "    : 1->Set boundary in locked status");
+#endif
+
 /* Default Flex-OneNAND boundary and lock respectively */
 static int flex_bdry[MAX_DIES * 2] = { -1, 0, -1, 0 };

@@ -3271,7 +3284,9 @@ static int flexonenand_setup(char *s)
 	return 1;
 }

+#ifndef MODULE
 __setup("onenand.bdry=", flexonenand_setup);
+#endif

 /**
  * onenand_probe - [OneNAND Interface] Probe the OneNAND device
@@ -3456,6 +3471,10 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	if (onenand_probe(mtd))
 		return -ENXIO;

+#ifdef MODULE
+	flexonenand_setup(flex_bdry_info);
+#endif
+
 	/* Set Sync. Burst Read after probing */
 	if (this->mmcontrol) {
 		printk(KERN_INFO "OneNAND Sync. Burst Read support\n");
