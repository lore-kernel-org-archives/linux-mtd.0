Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P082o-0002dj-W4
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 07:22:39 +0000
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9E00HAL9TPQV90@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 16:22:37 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9E0058Q9TPQE@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 16:22:37 +0900 (KST)
Date: Mon, 27 Sep 2010 16:24:57 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH 1/4] MTD: OneNAND: Remove unused cmd_map at s5pc110
To: linux-mtd@lists.infradead.org
Message-id: <20100927072457.GA32082@july>
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
index a460f1b..7913a92 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -759,7 +759,6 @@ static void s3c_onenand_setup(struct mtd_info *mtd)
 		onenand->cmd_map = s5pc1xx_cmd_map;
 	} else if (onenand->type == TYPE_S5PC110) {
 		/* Use generic onenand functions */
-		onenand->cmd_map = s5pc1xx_cmd_map;
 		this->read_bufferram = s5pc110_read_bufferram;
 		this->chip_probe = s5pc110_chip_probe;
 		return;
-- 
1.5.3.3
