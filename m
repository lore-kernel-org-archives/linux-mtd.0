Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJIxM-0006LR-Cj
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 03:15:35 +0000
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KLQ00H9W3PNG0@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 12:15:23 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KLQ00GSO3PND9@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 12:15:23 +0900 (KST)
Date: Wed, 24 Jun 2009 12:03:51 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH][OneNAND] 4-bit ECC status macros
To: linux-mtd@lists.infradead.org
Message-id: <20090624030351.GA15076@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Define ECC status for 4-bit ECC status

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand_regs.h
index 0c6bbe2..b4cbd80 100644
--- a/include/linux/mtd/onenand_regs.h
+++ b/include/linux/mtd/onenand_regs.h
@@ -192,6 +192,9 @@
 #define ONENAND_ECC_1BIT_ALL		(0x5555)
 #define ONENAND_ECC_2BIT		(1 << 1)
 #define ONENAND_ECC_2BIT_ALL		(0xAAAA)
+#define ONENAND_ECC_3BIT		(1 << 2)
+#define ONENAND_ECC_4BIT		(1 << 3)
+#define ONENAND_ECC_4BIT_UNCORRECTABLE	(0x1010)
 
 /*
  * One-Time Programmable (OTP)
