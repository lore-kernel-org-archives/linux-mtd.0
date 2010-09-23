Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OykPg-0004YH-Tj
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 11:56:34 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L97000BA7U7IZ30@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 20:56:31 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9700K4T7U6HY@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 20:56:32 +0900 (KST)
Date: Thu, 23 Sep 2010 17:26:29 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: [PATCH 2/2][MTD]MLC device check in OneNAND driver
To: dedekind1@gmail.com
Message-id: <000201cb5b16$5cf17fd0$16d47f70$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
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

Hi Artem,


Adding MLC flash type.




Signed-off-by: Rohit HS <rohit.hs@samsung.com>
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


Regards,
Rohit.H.S
