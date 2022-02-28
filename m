Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D089CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhcmTGuJgXIxV+yOWey6qLagdMPzqYKB2aeDWko9Qq0=; b=kHZTsSOqOChtMG
	C6dFbwuWh1UOq8mhPFf3gISpTldsqYCXcOSCjs8WD5i/Va3CQmJ2PEbhvrc4pb2T79nAX/39gH53+
	pN021pN0WR262co0xDlmkttkHTdJ+xoHSbwlL1M1jwMXbocYnj0uZ0bJL3+wFDV23IQnhKd+U98vp
	4qgt2WZn0Nuexr83YAA/TTuYn4U1CBRA/zldwP7oQXR9T5vz42d5hHVaRyrH3eNjguZOC6xiU5Z2d
	rI2e4P6Cfk1r2qkF0AeGozaS1FPYfU4eHbpzgF3qoM9GX1nQwrTCm/r+vmP/8WOduNCzH0FBr3OoV
	LzEvjVJswEGqedQEPqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOeK1-00BvB5-H6; Mon, 28 Feb 2022 11:36:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOe22-00Bn1x-EC
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 11:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646047054; x=1677583054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s9N00WUuaR+7M96AS0RHeuJkB2gYdo9QK+uWa+lBy+Q=;
 b=kHta7B+7f62d297MTEVUe5/qNVMfooBEsFGP3YiscmGYmZMkqP+gpfzZ
 rnUcM6aXcI0lfUeLkm6FFAQu7G4qX2vayODVfwuIKqRhiCStGaZ04wop6
 8DTB70gy815G4kdvoh2ho3GxD47dUXWlmAMZ6aH6MvwbWnrCCfiwDGyFk
 xnMI1UUsKGk03ObHehUk40X1GcvLrv+85USHuAB3k1HF3KtMA6UI9zlY6
 IkE0PREmI9NHOUY3HZux0wRGlFdXAtr0DO0H+3upqqCjpHeEQoZO+K7Iy
 RP1WhVYmuGY6Nl756Ysob9VnzwA3wNClDWz3JPPUgEaqDNo6P4YzBaw9X w==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="155099351"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 04:17:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 04:17:28 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 04:17:24 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2 3/8] mtd: spi-nor: core: Use auto-detection only once
Date: Mon, 28 Feb 2022 13:17:07 +0200
Message-ID: <20220228111712.111737-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228111712.111737-1-tudor.ambarus@microchip.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_031734_558943_5BBD62C4 
X-CRM114-Status: GOOD (  11.47  )
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
index f87cb7d3daab..b1d6fa65417d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2894,13 +2894,15 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
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
 
@@ -2908,7 +2910,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
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
