Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oop6R-0004it-2T
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 02:55:40 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L7S003DJISMQKE0@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 11:55:34 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L7S00HVEISMID@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 11:55:34 +0900 (KST)
Date: Fri, 27 Aug 2010 11:55:29 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH 1/3] MTD: OneNAND: Remove unused cmd_map at s5pc110
To: linux-mtd@lists.infradead.org
Message-id: <20100827025529.GA10692@july>
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

S5PC110 OneNAND controller use the generic functions provided from onenand_base.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/samsung.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index cb443af..05329ba 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -761,7 +761,6 @@ static void s3c_onenand_setup(struct mtd_info *mtd)
 		onenand->cmd_map = s5pc1xx_cmd_map;
 	} else if (onenand->type == TYPE_S5PC110) {
 		/* Use generic onenand functions */
-		onenand->cmd_map = s5pc1xx_cmd_map;
 		this->read_bufferram = s5pc110_read_bufferram;
 		this->chip_probe = s5pc110_chip_probe;
 		return;
-- 
1.5.3.3
