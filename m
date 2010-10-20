Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8U4p-0008TZ-8H
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 08:31:16 +0000
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0LAK00D5XYC09X60@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 17:31:12 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0LAK006V3YC06O@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 17:31:12 +0900 (KST)
Date: Wed, 20 Oct 2010 17:31:02 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] mtd: OneNAND: S5PC110: Fix double call suspend & resume
	function
To: linux-mtd@lists.infradead.org
Message-id: <20101020083102.GA30414@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: Artem.Bityutskiy@nokia.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

The suspend & resume called from mtd core. So no need to call at driver.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 214ed1e..0de7a05 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -1098,7 +1098,7 @@ static int s3c_pm_ops_suspend(struct device *dev)
 	struct onenand_chip *this = mtd->priv;
 
 	this->wait(mtd, FL_PM_SUSPENDED);
-	return mtd->suspend(mtd);
+	return 0;
 }
 
 static  int s3c_pm_ops_resume(struct device *dev)
@@ -1107,7 +1107,6 @@ static  int s3c_pm_ops_resume(struct device *dev)
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
 	struct onenand_chip *this = mtd->priv;
 
-	mtd->resume(mtd);
 	this->unlock_all(mtd);
 	return 0;
 }
