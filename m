Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8s7n-0006Rz-7V
	for linux-mtd@lists.infradead.org; Sat, 27 Aug 2005 00:17:06 -0400
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ILV00G905852Z@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 27 Aug 2005 13:16:53 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0ILV00A8Q58576@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 27 Aug 2005 13:16:53 +0900 (KST)
Date: Sat, 27 Aug 2005 13:16:53 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <0ILV00A8R58576@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Cc: tglx@linutronix.de
Subject: [PATCH] OneNAND: Remove experimental dependency
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The second patch removes the experimental dependency

Regards

Kyungmin Park

--

diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -2,8 +2,8 @@
 # linux/drivers/mtd/onenand/Kconfig
 #

-menu "OneNAND Flash Device Drivers (EXPERIMENTAL)"
-	depends on MTD != n && EXPERIMENTAL
+menu "OneNAND Flash Device Drivers"
+	depends on MTD != n

 config MTD_ONENAND
	tristate "OneNAND Device Support"
