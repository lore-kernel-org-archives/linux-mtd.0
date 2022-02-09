Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F401C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 13:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbQD2NDD4reXMUD/KL6LhEIl7/tGz/Iy+BqF+esb6Ck=; b=q8i88OSrc0Jol1
	CXQjM/dFQJL/nH9LxtJ1h0lyonSPW2kZ7VgFdJETduEhsrxsRZR6tte1JehpvD3gran4c1g86IXRo
	RqmCqFCnnhzAm41OUX2dICJ+SiYFktSQ+SVT5aSFKGLK6vQznAB31bSJahcs+hLp0NiYJOyMsGQGh
	MnJOLbvmi2Kx9DJniQmD7Dfbh+6tD3J3qlqMFD+2XMcgfrhbqVQDBp7ZqWtPZxe3Iv1f+iBByk57u
	mBneQ8eV59YzymTjWNRYsRsVLtlxVdwg/qnzFvVD59tVCFdhgsho+ecURFkrx5Vb2+mzhj85Z99bS
	RIn/UqdNx6K1TxVXGbLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHnAH-000B5Z-S7; Wed, 09 Feb 2022 13:37:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHn9r-000B0B-ED
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 13:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644413839; x=1675949839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nsTTGEHEMLT+hG0N17ACM28ae/UOHeO88gwXFA2N3WI=;
 b=MouiQg3cynp8pgvspHvbiAr4b8biceWtmARNDrIx5Azrpuc9eXR1LSTY
 vuMMrTx6YSYBJNC4i+1EKAiK2mgBk8UtKdEbxa07smUPjLkOFYogqadwZ
 gz4mCJRUQxStzO5dInMGdIm/LH22hIc7Y0i1cQX57xNm8xCeGkQvFJip6
 9FxMQyzuci+nSEjzXGaPLws5VD41wElkV7evUax2ZzMJ8RkiFcAj0DWu6
 zzJVEPLy66xgKDQEYwTjJNpCc/YrxSAlWy4LvKDXpYNBO0cilFUBuCITY
 EmgVZ2irPgia+aBjY6h6rHU96plSqOG57zTXSYfJctopyVkzG8C4MnxDs g==;
IronPort-SDR: AK/UwFO4PzbP0AtYFKVyw9EN/IHhm09P19SPCG6BR6p6cw1gUSiQxcPShOEyLFAdiNYWY2oFTK
 /CGNpSE0YENYC9jKPcqcdA1SduLy9+tcf4KFekUA7Jr2RzCGSN2QR6FvUAHeWeowUyUqBRGb7Z
 WBrkK7/sl4/KrY0PBiJdjC97uSnQktfwGrZAoJo7IPk7OuL5re/cZyj2eY3PDN6r7yOy/HNAiS
 KDEUdmWbWPZLdcK6hDQ6yFsVA9zxt9xeFF4bJGBdOBRzLtrvPNkKFga3Pog0Wo+oCz0/WziXCo
 M1LN596SxwhAXtmmw4dVaxs5
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="145394818"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 06:37:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 06:37:18 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 06:37:14 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v6 3/7] mtd: spi-nor: core: Use auto-detection only once
Date: Wed, 9 Feb 2022 15:36:52 +0200
Message-ID: <20220209133656.374903-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209133656.374903-1-tudor.ambarus@microchip.com>
References: <20220209133656.374903-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_053719_563052_E4EC0270 
X-CRM114-Status: GOOD (  12.12  )
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

In case spi_nor_match_name() returned NULL, the auto detection was
issued twice. There's no reason to try to detect the same chip twice,
do the auto detection only once.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 335170fc2438..9b740f77174e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3127,13 +3127,15 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
 static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 						       const char *name)
 {
-	const struct flash_info *info = NULL;
+	const struct flash_info *info = NULL, *detected_info = NULL;
 
 	if (name)
 		info = spi_nor_match_name(nor, name);
 	/* Try to auto-detect if chip name wasn't specified or not found */
-	if (!info)
-		info = spi_nor_read_id(nor);
+	if (!info) {
+		detected_info = spi_nor_read_id(nor);
+		info = detected_info;
+	}
 	if (IS_ERR_OR_NULL(info))
 		return ERR_PTR(-ENOENT);
 
@@ -3141,7 +3143,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	 * If caller has specified name of flash model that can normally be
 	 * detected using JEDEC, let's verify it.
 	 */
-	if (name && info->id_len) {
+	if (name && !detected_info && info->id_len) {
 		const struct flash_info *jinfo;
 
 		jinfo = spi_nor_read_id(nor);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
