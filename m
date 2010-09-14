Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OvQX5-0003YX-WA
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2010 08:06:28 +0000
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L8Q00M3D96B5RB0@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 14 Sep 2010 17:06:11 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L8Q00KVH966XR@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 14 Sep 2010 17:06:11 +0900 (KST)
Date: Tue, 14 Sep 2010 13:36:10 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: [PATCH 2/2][MTD]MLC device check in OneNAND driver
To: dedekind1@gmail.com
Message-id: <000101cb53e3$b15d6280$14182780$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-language: en-us
Content-transfer-encoding: 7BIT
Cc: v.dalal@samsung.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

        Adding MLC device check Macro.


Signed-off-by: Rohit HS <rohit.hs@samsung.com>
---
 include/mtd/mtd-abi.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 4debb45..6c6465d 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -57,12 +57,14 @@ struct mtd_oob_buf64 {
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
 #define MTD_NO_ERASE		0x1000	/* No erase necessary */
 #define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */
+#define MTD_WRITABLE_ONCE	0x4000
 
 // Some common devices / combinations of capabilities
 #define MTD_CAP_ROM		0
 #define MTD_CAP_RAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
 #define MTD_CAP_NORFLASH	(MTD_WRITEABLE | MTD_BIT_WRITEABLE)
 #define MTD_CAP_NANDFLASH	(MTD_WRITEABLE)
+#define MTD_CAP_MLCNANDFLASH	(MTD_WRITEABLE | MTD_WRITABLE_ONCE)
 
 /* ECC byte placement */
 #define MTD_NANDECC_OFF		0	// Switch off ECC (Not recommended)
---



Regards,
Rohit.H.S
