Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BFDC11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:43:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5961613FB
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5961613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eghNBmmPR03aotwFJ7sH6qq4QBoqttXHvLbITrK6elM=; b=aYID6LAh/WPpDb
	UzFiVOxAf+BYiQ/In1PLLrHrFmORu2Mx0xbNZHzjywJRSaS5F0hV56Pcb9XSI89BaMjTvFA0BBOBb
	Hr3md8pq01RT6gS4gqP8j+fXwrmM6emwvnDwj7xAvST+t+1KbAcXW43FlZVOph1WgcV+SOhsvGdH3
	qLkIU6i53iapbL7OT27336ndDTbg8TtdxjcfKSD/F/Qn4dkOau4qHUE0VWJOm0DZO+kFmc1m0Ao/L
	o0EOvT6NtN7zblp3Ut1/9wM5aYberI6eTGWDjNBMxf4ekFRt7L52M358J1cloh7gNdJgqAPlGmeIa
	O6r6AjUnSF5hPZm570RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKN9-003Hma-Mz; Fri, 02 Jul 2021 14:42:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKMK-003HZW-Ly
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 14:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625236896; x=1656772896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eqTU3Jz/C7GI76tyocrX+Y71mG+HdvIsC1seTpPkvFE=;
 b=M9offk1wlg7Yjx5QDtTdVpIKqdYlohWKvDUBtbbz4lbQzfND5ySNKFBg
 eY/2kneq1clD7FPmRRPrxVyFS00d/DlwcIdfOhtYDxQi2wcA1c2FPg/Y/
 WA/VICpO98sa2r8MFpfFlmdWGWObK8IZQp4qupzqyk7ckOlcKSLt9Pmsy
 WC33mfIxq5MjweIWq9h077YOE2FybmS7a5xIXABBwGhqIxbZw5NGiLth7
 ElQytUrs5RiFjAdzdxSq6KClP0unZ7uES1+6dPmY0oJ6CIsOXAVBxZHhu
 wpwSh/0Cf/z9/eqOyUWIyK5jYyTwEE756YwdmTo3IgH4a7wGO+H3r8qH7 g==;
IronPort-SDR: YdFkSN3iq7nL/h/+Vzmy4ClvVJQRkJNmAdkC08JcRlvdOXOsdA3YGG0qfiozU8KzV89V3ZcncK
 j9QDvNWSbY6ncnhZxekNJr1915RldkuGNBTcd65zeFr+DYJkdS4aKLKP07oxlzzxwJNNnrr+mr
 6AKqSkMqAiHeNuZ02fg2K3+xWJnSezK0q8F19tMKFwMzv8pEXK7JE8HEvCLoVqBIWfGhcgDMEv
 V26AcPg1GJvV+GJjPdW/8Eb7pPtP5sH81/Xvqyt6ANDLMMwJUMq/bzZ7dDImffWWis/i/DrKEe
 F4E=
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="127485999"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2021 07:41:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 07:41:35 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Jul 2021 07:41:31 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>
CC: <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 4/7] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
Date: Fri, 2 Jul 2021 17:41:07 +0300
Message-ID: <20210702144110.250481-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702144110.250481-1-tudor.ambarus@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_074136_765488_F1FE5DFC 
X-CRM114-Status: GOOD (  12.32  )
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

MX25L12835F define SFDP, while MX25L12805D does not.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/macronix.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 83a097708949..38701347bf04 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,26 @@
 
 #include "core.h"
 
+static const char *mx25l12835f = "mx25l12835f";
+
+static int mx25l12835f_post_bfpt_fixups(struct spi_nor *nor,
+				const struct sfdp_parameter_header *bfpt_header,
+				const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * Macronix has a bad habit of reusing flash IDs: MX25L12835F collides
+	 * with MX25L12805D. MX25L12835F defines SFDP tables, while the older
+	 * variant does not.
+	 */
+	nor->name = mx25l12835f;
+
+	return 0;
+}
+
+static struct spi_nor_fixups mx25l12835f_fixups = {
+	.post_bfpt = mx25l12835f_post_bfpt_fixups,
+};
+
 static const char *mx25l3233f = "mx25l3233f";
 
 static int mx25l3233f_post_bfpt_fixups(struct spi_nor *nor,
@@ -71,8 +91,9 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
+	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
+			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
+		.fixups = &mx25l12835f_fixups },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
