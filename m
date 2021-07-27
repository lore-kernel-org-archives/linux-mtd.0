Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E96BC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:19:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9F2F610A1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9F2F610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7FSy8RDWq465AWDa1iOPAkJaupteGfWfozThGW79mc=; b=0Wu+WVZXocu1Ul
	jmOw4+4Se+MU8cAq5Y+FWiMF2mR0RmgL81ET9zeU1m5P4/H07fPwYtsgL1F9PqpAKafPvYWc45lG8
	lg7fncV6Dnmh64gw5iqDno4iqQgfvPABM/3foQ8PTTg0y8L39ngEv7pyG9PYoYVyg+paN9BALY/tk
	p+26F7ANtHPecQFVHznpXlVW2+yh9jHgJr+ZLZTsKQIpFJEmbO8kv2wfb/tSoYShuNatO5O1ujLco
	+ooup1/PmieLt1nabnxZG334c5g51HPq5uV7VAhxa8oG36Uo+QRnSPG7JG7LPUWJrL3akjWFbVGPO
	Fsb6sw4djG1hUad+gJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8FUX-00DOpu-4A; Tue, 27 Jul 2021 05:18:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F5r-00DHYa-Cu; Tue, 27 Jul 2021 04:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361607; x=1658897607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sFFvbSCxDwFI/4WJvZ1kPyfQ0F55eHoZjShgBNhGvdw=;
 b=CPynRzntlrMBegiOmM8BYo9Dj2EDB6J8iYDbwZIoluAxdrr7pnp8LI57
 xomMo1IuKW22C3sj7EFfyuUbgZoAloLc/Du2ld/JBM++FgxjtDdumOmEa
 bDfDb7OVhjY2y+hCX+EDHEmvHKmDpO6DqSQA8jhMlr3Pzrnx5XXS8sZda
 oZLVoEX5pn4S2JaxOhS3RC8ip+xdntgvcMI0AUy8CYI/2eKC8y0Iyj9IJ
 2aRSrk4wSNfkXrO5PsWNWaKJLacXraAUDNI77M72mNHIO+yClK2gNFgCT
 26MjkYXQvSUwAHStdQhso9cC4jPzwepj40t4xU95r2w3zolGi1SbhAb03 A==;
IronPort-SDR: U3da8gcLfM9MG9doUZBcWS2As/NVaWIK0tIzYu/TNK+Q5nbXN3rD3XototM/adk8K1RYpGM0bJ
 6P4N5XRWyBzlS9IZqHmcs2sBUfLCVVArSiaHYh4omQereAcnYEf8+IT4NgXSnI0sYJkNGU/fKd
 SYAkNa0xEF+WSvsMy/EzkBvmkqfnjisbrxmaPUvhPPfnGGDOB4fjI8Udz9pLWMzTc4TSfzqMrQ
 tJg1iQpMsmzcc9B21mZ2W+TrE8Ao8ACEJQwtzWHY3rqeH9+dBF5z8ks0oDEM5IpoWhGsNWAeK2
 eAI6HotkyfLRiNzvpWfByK6M
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="137653964"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:25 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:53:21 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 11/35] mtd: spi-nor: winbond: Use manufacturer late_init()
 for OTP ops
Date: Tue, 27 Jul 2021 07:51:58 +0300
Message-ID: <20210727045222.905056-12-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215327_522222_B90FC720 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

OTP info is not yet discoverable via SFDP, use late_init() to init
the OTP ops.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/winbond.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 96573f61caf5..6be45d2291c6 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -147,17 +147,22 @@ static const struct spi_nor_otp_ops winbond_otp_ops = {
 static void winbond_default_init(struct spi_nor *nor)
 {
 	nor->params->set_4byte_addr_mode = winbond_set_4byte_addr_mode;
-	if (nor->params->otp.org->n_regions)
-		nor->params->otp.ops = &winbond_otp_ops;
 }
 
 static const struct spi_nor_fixups winbond_fixups = {
 	.default_init = winbond_default_init,
 };
 
+static void winbond_late_init(struct spi_nor *nor)
+{
+	if (nor->params->otp.org->n_regions)
+		nor->params->otp.ops = &winbond_otp_ops;
+}
+
 const struct spi_nor_manufacturer spi_nor_winbond = {
 	.name = "winbond",
 	.parts = winbond_parts,
 	.nparts = ARRAY_SIZE(winbond_parts),
 	.fixups = &winbond_fixups,
+	.late_init = winbond_late_init,
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
