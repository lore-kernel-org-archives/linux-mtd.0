Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0B0C-0005zB-GL
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 10:32:10 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9E00KZ2ILGGU60@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 19:32:04 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9E00134ILE6E@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 19:32:04 +0900 (KST)
Date: Mon, 27 Sep 2010 16:02:03 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: [PATCH v3 1/2] mtd: Define MLC Flash as a different flash type
To: dedekind1@gmail.com
Message-id: <002701cb5e2f$3aed3890$b0c7a9b0$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-language: en-us
Content-transfer-encoding: 7BIT
Cc: v.dalal@samsung.com, gupta.raghav@samsung.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MLC NAND Flash has a different cell structure and differs in
functioning than the SLC NAND Flash. Hence we are considering it as
a different Flash type.

Signed-off-by: Rohit H.S <rohit.hs@samsung.com>
Signed-off-by: Raghav Gupta <gupta.raghav@samsung.com>
---
 include/mtd/mtd-abi.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 4debb45..8d8161c 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -52,6 +52,7 @@ struct mtd_oob_buf64 {
 #define MTD_NANDFLASH		4
 #define MTD_DATAFLASH		6
 #define MTD_UBIVOLUME		7
+#define MTD_MLCNANDFLASH	8
 
 #define MTD_WRITEABLE		0x400	/* Device is writeable */
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
-- 
1.6.6.1
