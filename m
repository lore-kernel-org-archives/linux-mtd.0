Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P082u-0002mx-NH
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 07:22:45 +0000
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9E00JVG9TVAM80@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 16:22:43 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9E008WS9TWE7@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 16:22:44 +0900 (KST)
Date: Mon, 27 Sep 2010 16:25:04 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH 2/4] MTD: OneNAND: S5PC100: Only S5PC110 use the command	map
	method
To: linux-mtd@lists.infradead.org
Message-id: <20100927072504.GA32087@july>
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

After S5PC110 use the generic method for OneNAND.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/samsung.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 7913a92..234788e 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -58,7 +58,7 @@ enum soc_type {
 #define MAP_11				(0x3)
 
 #define S3C64XX_CMD_MAP_SHIFT		24
-#define S5PC1XX_CMD_MAP_SHIFT		26
+#define S5PC100_CMD_MAP_SHIFT		26
 
 #define S3C6400_FBA_SHIFT		10
 #define S3C6400_FPA_SHIFT		4
@@ -191,7 +191,7 @@ static unsigned int s3c64xx_cmd_map(unsigned type, unsigned val)
 
 static unsigned int s5pc1xx_cmd_map(unsigned type, unsigned val)
 {
-	return (type << S5PC1XX_CMD_MAP_SHIFT) | val;
+	return (type << S5PC100_CMD_MAP_SHIFT) | val;
 }
 
 static unsigned int s3c6400_mem_addr(int fba, int fpa, int fsa)
-- 
1.5.3.3
