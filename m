Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6C5D3C930
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Oct 2024 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PzV2XvPHJmqaHMNlSvExbNnPXG2TXNuG3ieDrY8NYo=; b=c6Not95pOqyOHo
	mWcEBHwI/X+1oh29HoN3XxB7/qnA5/NR85pcDFzs6hLUFi2f821dhEOdSr5KDRGT2JsoBcYtxO51U
	x6tDueCB3WMceACKLTfikj8HVm/sE1G+obe8BxAvKMlgj6v/P3iTqRS6Mp+uplZ7rICG2SzDsjYfX
	n/iobZc6g3DM8P6P2LJ08oBr3d8UtzSXc9epQpzjcLU6AUMgoX9l21L/eXfkKater36cRD0Mw/ARn
	2NxNd5oOm1aD2YrMrVpkZiWVA3jQNojL3tjH3Lam7O2QFiCsKdOz+q93Mq9b326hjP8PMj294oDNW
	rHN98A/DthSmVCBf2PkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2W18-00000004vvH-0is2;
	Sun, 20 Oct 2024 13:30:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Vye-00000004vXG-1pRu;
	Sun, 20 Oct 2024 13:28:14 +0000
X-UUID: 24d01e588ee711ef82ff63e91e7eb18c-20241020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4GWSP202kE1ugZwHMnGXy7L1M5++8SvxO/XWigtfn0E=;
	b=RHerWdWA9uXm4hrWuoj4mZUIJoqV+ZgLLiIUbmXXIKQ5kDUxBKu2t6XlQG09vuCpLVdVhDxNjE6IWNB+NwHMJF+O/ZNk2kBjqxdrxCsBCSOWEtR9wDP8gan4BcPL/D1Ge/JwcbFUAlFnTTTcCO+iMjRXCh9pzye5Mu4ylOOrorw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:f4786091-faa8-4c1a-b5f0-fa47ed707694,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:9e498941-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 24d01e588ee711ef82ff63e91e7eb18c-20241020
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1090033545; Sun, 20 Oct 2024 06:28:07 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 20 Oct 2024 21:28:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 20 Oct 2024 21:28:04 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle
	<daniel@makrotopia.org>, Chia-Lin Kao <acelan.kao@canonical.com>, "Mika
 Westerberg" <mika.westerberg@linux.intel.com>, Cheng Ming Lin
	<chengminglin@mxic.com.tw>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky.Huang
	<skylake.huang@mediatek.com>
Subject: [RFC PATCH nand/next 1/4] mtd: nand: Create param.c to do CRC check and bitwise majority for Parameter & CASN page
Date: Sun, 20 Oct 2024 21:27:19 +0800
Message-ID: <20241020132722.20565-2-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.493500-8.000000
X-TMASE-MatchedRID: dY/STlX7LWI0Z9sXcK7F6V3oTRqVXDv5sXPI9D4Uri5aW2Ktn+I8/v5Q
	PMcorVJC8AyWk2NFMNZM8qdoCvOVvj13WcdbGR6Qtw+xHnsmQjPDHSNFHFxB801KG1YrOQW/Oqn
	cbTLK4XiFuNbf28fb6PCUhGX/S6sVNngTMoCUVRTkKCFOKwAEzO3+iQEtoSj401IIGqgAbw3Z6K
	rkcB2NwXa9QqC2Cxib3BTxUdcaKkIfE8yM4pjsD23U7j2vVURrxEHRux+uk8hfNjF5BHUO+5hdg
	toyVDGsvXehZr+2YIXDWemDa0iNuN+SRkUpHtt1peNVPeL5BOo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.493500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 893E3C62F29F17B06B98F8A0F5729048C8707D38DE12E4F30D58DAF9AF2EB93C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_062812_512689_B713C826 
X-CRM114-Status: GOOD (  21.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: "Sky.Huang" <skylake.huang@mediatek.com>

Create drivers/mtd/nand/param.c so ONFI parameter page & CASN page
can both use nanddev_crc16() and nanddev_bit_wise_majority() directly
like this:
* For ONFI Parameter page:
onfi_crc16() -> nanddev_crc16()
* For CASN page: nanddev_crc16()

nanddev_bit_wise_majority() is same as nand_bit_wise_majority().
nanddev_crc16() is same as onfi_crc16(). But there are lots of
onfi_crc16() call, so keep onfi_crc16() there and hook it to
nanddev_crc16().

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
 drivers/mtd/nand/Makefile        |  2 +-
 drivers/mtd/nand/param.c         | 52 ++++++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/nand_onfi.c | 43 ++------------------------
 include/linux/mtd/param.h        | 20 ++++++++++++
 4 files changed, 76 insertions(+), 41 deletions(-)
 create mode 100644 drivers/mtd/nand/param.c
 create mode 100644 include/linux/mtd/param.h

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 19e1291ac4d5..790bde0148d1 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-nandcore-objs := core.o bbt.o
+nandcore-objs := core.o bbt.o param.o
 obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
 obj-$(CONFIG_MTD_NAND_ECC_MEDIATEK) += ecc-mtk.o
 
diff --git a/drivers/mtd/nand/param.c b/drivers/mtd/nand/param.c
new file mode 100644
index 000000000000..f67b9fe633d9
--- /dev/null
+++ b/drivers/mtd/nand/param.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 - Mediatek
+ *
+ * Author: Sky Huang <SkyLake.Huang@mediatek.com>
+ */
+
+#include <linux/mtd/param.h>
+
+u16 nanddev_crc16(u16 crc, u8 const *p, size_t len)
+{
+	int i;
+
+	while (len--) {
+		crc ^= *p++ << 8;
+		for (i = 0; i < 8; i++)
+			crc = (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
+	}
+
+	return crc;
+}
+
+/*
+ * Recover data with bit-wise majority
+ */
+void nanddev_bit_wise_majority(const void **srcbufs,
+				   unsigned int nsrcbufs,
+				   void *dstbuf,
+				   unsigned int bufsize)
+{
+	int i, j, k;
+
+	for (i = 0; i < bufsize; i++) {
+		u8 val = 0;
+
+		for (j = 0; j < 8; j++) {
+			unsigned int cnt = 0;
+
+			for (k = 0; k < nsrcbufs; k++) {
+				const u8 *srcbuf = srcbufs[k];
+
+				if (srcbuf[i] & BIT(j))
+					cnt++;
+			}
+
+			if (cnt > nsrcbufs / 2)
+				val |= BIT(j);
+		}
+
+		((u8 *)dstbuf)[i] = val;
+	}
+}
diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 861975e44b55..5d330dd53e8f 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -12,6 +12,7 @@
  * This file contains all ONFI helpers.
  */
 
+#include <linux/mtd/param.h>
 #include <linux/slab.h>
 
 #include "internals.h"
@@ -20,14 +21,7 @@
 
 u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
 {
-	int i;
-	while (len--) {
-		crc ^= *p++ << 8;
-		for (i = 0; i < 8; i++)
-			crc = (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
-	}
-
-	return crc;
+	return nanddev_crc16(crc, p, len);
 }
 
 /* Parse the Extended Parameter Page. */
@@ -107,37 +101,6 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 	return ret;
 }
 
-/*
- * Recover data with bit-wise majority
- */
-static void nand_bit_wise_majority(const void **srcbufs,
-				   unsigned int nsrcbufs,
-				   void *dstbuf,
-				   unsigned int bufsize)
-{
-	int i, j, k;
-
-	for (i = 0; i < bufsize; i++) {
-		u8 val = 0;
-
-		for (j = 0; j < 8; j++) {
-			unsigned int cnt = 0;
-
-			for (k = 0; k < nsrcbufs; k++) {
-				const u8 *srcbuf = srcbufs[k];
-
-				if (srcbuf[i] & BIT(j))
-					cnt++;
-			}
-
-			if (cnt > nsrcbufs / 2)
-				val |= BIT(j);
-		}
-
-		((u8 *)dstbuf)[i] = val;
-	}
-}
-
 /*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
  */
@@ -200,7 +163,7 @@ int nand_onfi_detect(struct nand_chip *chip)
 			srcbufs[j] = pbuf + j;
 
 		pr_warn("Could not find a valid ONFI parameter page, trying bit-wise majority to recover it\n");
-		nand_bit_wise_majority(srcbufs, ONFI_PARAM_PAGES, pbuf,
+		nanddev_bit_wise_majority(srcbufs, ONFI_PARAM_PAGES, pbuf,
 				       sizeof(*pbuf));
 
 		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)pbuf, 254);
diff --git a/include/linux/mtd/param.h b/include/linux/mtd/param.h
new file mode 100644
index 000000000000..39636f66f1b4
--- /dev/null
+++ b/include/linux/mtd/param.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 - Mediatek
+ *
+ * Author: Sky Huang <SkyLake.Huang@mediatek.com>
+ */
+
+#ifndef __LINUX_NAND_PARAM
+#define __LINUX_NAND_PARAM
+
+#include <linux/io.h>
+
+u16 nanddev_crc16(u16 crc, u8 const *p, size_t len);
+void nanddev_bit_wise_majority(const void **srcbufs,
+				   unsigned int nsrcbufs,
+				   void *dstbuf,
+				   unsigned int bufsize);
+
+#endif /* __LINUX_NAND_PARAM */
+
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
