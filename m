Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cX4iv-0008EG-5p
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2017 11:29:47 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5 2014))
 with ESMTP id <0OKF02SNNRWYR420@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 27 Jan 2017 20:29:22 +0900 (KST)
From: Shailendra Verma <shailendra.v@samsung.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.shailesh@samsung.com,
 ashish.kalra@samsung.com, Shailendra Verma <shailendra.v@samsung.com>,
 Shailendra Verma <shailendra.capricorn@gmail.com>
Subject: [PATCH] Mtd: nand - Fix possible NULL derefrence.
Date: Fri, 27 Jan 2017 16:59:13 +0530
Message-id: <1485516553-4438-1-git-send-email-shailendra.v@samsung.com>
References: <CGME20170127112921epcas1p45999b22222202e8d98b6aecfc3cbeb39@epcas1p4.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

of_match_device could return NULL, and so can cause a NULL
pointer dereference later.

Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
---
 drivers/mtd/nand/mxc_nand.c  |    4 ++++
 drivers/mtd/nand/vf610_nfc.c |    4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index d7f724b..ca1b8ad 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1596,6 +1596,10 @@ static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
 	if (!np)
 		return 1;
 
+	if (!of_id) {
+		dev_err(host->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
 	host->devtype_data = of_id->data;
 
 	return 0;
diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 3ad514c..0e09c11 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -674,6 +674,10 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	}
 
 	of_id = of_match_device(vf610_nfc_dt_ids, &pdev->dev);
+	if (!of_id) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
 	nfc->variant = (enum vf610_nfc_variant)of_id->data;
 
 	for_each_available_child_of_node(nfc->dev->of_node, child) {
-- 
1.7.9.5
