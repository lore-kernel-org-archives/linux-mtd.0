Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZFoE-0000g4-UM
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 05:17:03 +0000
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built
	Sep 7
	2010)) with ESMTP id <0LN600IHHEO7XOH0@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 14:16:56 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0LN600AHHEO8L6@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 14:16:56 +0900 (KST)
Date: Wed, 22 Jun 2011 14:16:49 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH v2] mtd: OneNAND: Detect the correct NOP when 4KiB pagesize
To: linux-mtd@lists.infradead.org, roman.tereshonkov@nokia.com
Message-id: <20110622051649.GA19948@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: m.szyprowski@samsung.com, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

There are two different 4KiB pagesize chips
KFM4G16Q4M series have NOP 4 with version ID 0x0131
But KFM4G16Q5M has NOP 1 with versoin ID 0x013e

Note that Q5M means that it has NOP 1.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index ac9e959..51800a7 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3429,6 +3429,19 @@ static void onenand_check_features(struct mtd_info *mtd)
 		else if (numbufs == 1) {
 			this->options |= ONENAND_HAS_4KB_PAGE;
 			this->options |= ONENAND_HAS_CACHE_PROGRAM;
+			/*
+			 * There are two different 4KiB pagesize chips
+			 * and no way to detect it by H/W config values.
+			 *
+			 * To detect the correct NOP for each chips,
+			 * It should check the version ID as workaround.
+			 *
+			 * Now it has as following
+			 * KFM4G16Q4M has NOP 4 with version ID 0x0131
+			 * KFM4G16Q5M has NOP 1 with versoin ID 0x013e
+			 */
+			if ((this->version_id & 0xf) == 0xe)
+				this->options |= ONENAND_HAS_NOP_1;
 		}
 
 	case ONENAND_DEVICE_DENSITY_2Gb:
@@ -4054,6 +4067,8 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 			this->ecclayout = &onenand_oob_128;
 			mtd->subpage_sft = 2;
 		}
+		if (ONENAND_IS_NOP_1(this))
+			mtd->subpage_sft = 0;
 		break;
 	case 64:
 		this->ecclayout = &onenand_oob_64;
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 52b6f18..4596503 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -184,6 +184,9 @@ struct onenand_chip {
 #define ONENAND_IS_CACHE_PROGRAM(this)					\
 	(this->options & ONENAND_HAS_CACHE_PROGRAM)
 
+#define ONENAND_IS_NOP_1(this)						\
+	(this->options & ONENAND_HAS_NOP_1)
+
 /* Check byte access in OneNAND */
 #define ONENAND_CHECK_BYTE_ACCESS(addr)		(addr & 0x1)
 
@@ -195,6 +198,7 @@ struct onenand_chip {
 #define ONENAND_HAS_2PLANE		(0x0004)
 #define ONENAND_HAS_4KB_PAGE		(0x0008)
 #define ONENAND_HAS_CACHE_PROGRAM	(0x0010)
+#define ONENAND_HAS_NOP_1		(0x0020)
 #define ONENAND_SKIP_UNLOCK_CHECK	(0x0100)
 #define ONENAND_PAGEBUF_ALLOC		(0x1000)
 #define ONENAND_OOBBUF_ALLOC		(0x2000)
