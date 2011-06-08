Received: from mailout4.samsung.com ([203.254.224.34])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QU80b-0003mY-AJ
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 01:56:38 +0000
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built
	Sep 7
	2010)) with ESMTP id <0LMG00HE380XM670@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 10:56:30 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net
	(unknown [165.213.149.150])
	by mmp1.samsung.com (Oracle Communications Messaging Exchange Server
	7u4-19.01 64bit (built Sep 7 2010)) with ESMTPA id
	<0LMG0073U8251V90@mmp1.samsung.com>
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 10:56:29 +0900 (KST)
Date: Wed, 08 Jun 2011 10:56:25 +0900
From: Kyungmin Park <kmpark@infradead.org>
To: linux-mtd@lists.infradead.org, roman.tereshonkov@nokia.com
Subject: [PATCH] mtd: OneNAND: Detect the correct NOP when 4KiB pagesize
Message-id: <20110608015625.GA27537@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
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
index ac9e959..2adca63 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3429,6 +3429,13 @@ static void onenand_check_features(struct mtd_info *mtd)
 		else if (numbufs == 1) {
 			this->options |= ONENAND_HAS_4KB_PAGE;
 			this->options |= ONENAND_HAS_CACHE_PROGRAM;
+			/*
+			 * There are two different 4KiB pagesize chips
+			 * KFM4G16Q4M has NOP 4 with version ID 0x0131
+			 * KFM4G16Q5M has NOP 1 with versoin ID 0x013e
+			 */
+			if ((this->version_id & 0xf) == 0xe)
+				this->options |= ONENAND_HAS_NOP_1;
 		}
 
 	case ONENAND_DEVICE_DENSITY_2Gb:
@@ -4054,6 +4061,8 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
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
