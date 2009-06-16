Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MGRcV-0003iq-MT
	for linux-mtd@lists.infradead.org; Tue, 16 Jun 2009 05:54:17 +0000
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KLB008WRHPT14@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 16 Jun 2009 14:53:54 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KLB00L7AHPR4N@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 16 Jun 2009 14:53:53 +0900 (KST)
Date: Tue, 16 Jun 2009 11:24:01 +0530
From: Amul Saha <amul.saha@samsung.com>
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <7C45F67946474303B9071EA1CF2F8807@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
	<9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
	<1244712906.5847.414.camel@localhost.localdomain>
	<2AF67696C6634054B7CFDF7A9C19865D@sisodomain.com>
	<1244803363.5847.446.camel@localhost.localdomain>
	<3E83C7DF574149B78FFE8D12094FAF6D@sisodomain.com>
	<1244808209.5847.447.camel@localhost.localdomain>
	<5156D5DBD34A4A5984AE3F3840C0452F@sisodomain.com>
	<1244813557.3511.1272.camel@macbook.infradead.org>
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

Signed-off-by: Amul Kumar Saha <amul.saha@samsung.com>
Signed-off-by: Vishak G <vishak.g@samsung.com>
---
 onenand_base.c |   28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 8d4c9c2..5efb25b 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -20,6 +20,7 @@

 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
@@ -34,6 +35,14 @@
 /* Default Flex-OneNAND boundary and lock respectively */
 static int flex_bdry[MAX_DIES * 2] = { -1, 0, -1, 0 };

+module_param_array(flex_bdry, int, NULL, 0400);
+MODULE_PARM_DESC(flex_bdry,	"SLC Boundary information for Flex-OneNAND"
+				"Syntax:flex_bdry=DIE_BDRY,LOCK,..."
+				"DIE_BDRY: SLC boundary of the die"
+				"LOCK: Locking information for SLC boundary"
+				"    : 0->Set boundary in unlocked status"
+				"    : 1->Set boundary in locked status");
+
 /**
  *  onenand_oob_128 - oob info for Flex-Onenand with 4KB page
  *  For now, we expose only 64 out of 80 ecc bytes
@@ -3255,25 +3264,6 @@ out:
 }

 /**
- * flexonenand_setup - 	capture Flex-OneNAND boundary and lock
- * 			values  passed as kernel parameters
- * @param s	kernel parameter string
- */
-static int flexonenand_setup(char *s)
-{
-	int ints[5], i;
-
-	s = get_options(s, 5, ints);
-
-	for (i = 0; i < ints[0]; i++)
-		flex_bdry[i] = ints[i + 1];
-
-	return 1;
-}
-
-__setup("onenand.bdry=", flexonenand_setup);
-
-/**
  * onenand_probe - [OneNAND Interface] Probe the OneNAND device
  * @param mtd		MTD device structure
  *
