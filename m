Return-Path: <SRS0=fMXC=57=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF10C2BA19
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 13:49:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BD5F2076D
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 13:49:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJHTr+Dn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=8devices-com.20150623.gappssmtp.com header.i=@8devices-com.20150623.gappssmtp.com header.b="nyzDSt/5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BD5F2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=8devices.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=60xFcVMLDRu7GO+Os7fxMyCNDNbjRhXt3zowGXq7crI=; b=RJH
	Tr+Dnpx0WLuJd0leOBjAtbeCqjGOmGH2z3ctZCu0zYcgO9LTgzvKbmGd+1xj+CkVfvibQhW50L1Oz
	qcI82+bW48325l7sgzt/hAPZoCnXCdE3jko4St6EmI08eO+sHBx7bKipJcnuWlwIDmCnAoQxGao0m
	oIkfPKW7D9S7hXDRLEz2ILrRBwdHvAgSNR3x+PzJY7FzI6DJuN4d61JHenHCz0OVgt6/K3U7htQ6G
	If0GSgOQSddZXNXRYcvLIaRDMN4iwJw3Gca0Jms+HHeTkS4lSxgUkvku1bDoHRLJ9D3mu9lDEAKPw
	WOuCaeAf27oTxVq/OVM1XMQ/MyqrSzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOiQ0-0004AN-Vu; Wed, 15 Apr 2020 13:49:32 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOiPs-00049d-Tf
 for linux-mtd@lists.infradead.org; Wed, 15 Apr 2020 13:49:26 +0000
Received: by mail-lf1-x141.google.com with SMTP id j14so2666144lfg.9
 for <linux-mtd@lists.infradead.org>; Wed, 15 Apr 2020 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=8devices-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=sE91Gv5b7HPi1apWfCQWnbkDAelkJjwmmsZVbw0z8NU=;
 b=nyzDSt/5+WpZIK5FUC0Cty6v0cpjxPrIqGU3w9a1WWZI07/ZJEHj6c/8LbyL6qi0r5
 uK0VQ5tfTABv44c4lmSpzxhNwCisL+fUAZdO1kRbwJOOilL5saLeKDreA9PwNAQ6HfAG
 DW2lwyGo5/8IsU+1cS+Ey7/iIYZ2FZk+UAkl+eh1rPEYRNEfUNjm1qLlmRavHnLj74U5
 4++gqXaU0h0VB4T4fkYsZ3wcpqsYeQyGPTT4BIhvkt1K1sVivhF+XX3J3Se6y3i6gqQ/
 U1qTLI3h3YGZrs6sDaf9l70r+Ww+TDuVTdcwEI9oPAOge2Qm3WRxOPJKz1QibvcJ/1Bk
 WOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sE91Gv5b7HPi1apWfCQWnbkDAelkJjwmmsZVbw0z8NU=;
 b=gG4oF5KtvKdUrDEqwTQdhs1IO8zgvf4NvfIAkz3nrDZyJCJgNoh3ed20K36C4UusF/
 10LUZ0ux7aiMC19J74kZlpGV7D65tc0JMP5YUAZFW6REYAc66YXEszTl+3KS21X/CSvJ
 5kJ+UwX4jmrcj215e1wWjy/ISSb1NjZVdKMWIGN/CKpddgJTweNod45otuwk0AAXygb5
 XDgSbgv2PU3H2fOeE9qLbIBAjmNVHtPtMIxHKWZZ1ZzNDLsHcxPzPhsO2ZVTrzXkiBAx
 3+Xe/OCDEXx/5g66ii2nSWCN0uMokpJEZrximJeDGipjGGZWc/jOR9WZH39Pu+DgqLuN
 FGcA==
X-Gm-Message-State: AGi0PuYyX0jU9teMajvjudHOcE/6btdvYMQYKq0nb3foSCP+HdDeSEAr
 /AF1+3pExDhh8cyVZ4mKXqR1LUVPAMO0CQ==
X-Google-Smtp-Source: APiQypIDK0wYq77GeYh3+2wiVGLeLKO8u0xZSSMFDE+LJl5clya+lQzDKahUB75I5zfmIXd7DuoNgA==
X-Received: by 2002:a19:f70c:: with SMTP id z12mr3240621lfe.78.1586958562186; 
 Wed, 15 Apr 2020 06:49:22 -0700 (PDT)
Received: from localhost.localdomain ([85.254.96.73])
 by smtp.gmail.com with ESMTPSA id j22sm13221062lfg.96.2020.04.15.06.49.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 06:49:21 -0700 (PDT)
From: Mantas Pucka <mantas@8devices.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: fix 4-byte opcode support for w25q256
Date: Wed, 15 Apr 2020 16:48:30 +0300
Message-Id: <1586958510-24012-1-git-send-email-mantas@8devices.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_064924_980562_28E0387B 
X-CRM114-Status: GOOD (  12.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Mantas Pucka <mantas@8devices.com>,
 linux-kernel@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chuanhong Guo <gch981213@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There are 2 different chips (w25q256fv and w25q256jv) that share
the same JEDEC ID. Only w25q256jv fully supports 4-byte opcodes.
Use SFDP header version to differentiate between them.

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 drivers/mtd/spi-nor/sfdp.c    |  4 ----
 drivers/mtd/spi-nor/sfdp.h    |  6 ++++++
 drivers/mtd/spi-nor/winbond.c | 30 ++++++++++++++++++++++++++++--
 3 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index f6038d3..27838f6 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -21,10 +21,6 @@
 #define SFDP_4BAIT_ID		0xff84  /* 4-byte Address Instruction Table */
 
 #define SFDP_SIGNATURE		0x50444653U
-#define SFDP_JESD216_MAJOR	1
-#define SFDP_JESD216_MINOR	0
-#define SFDP_JESD216A_MINOR	5
-#define SFDP_JESD216B_MINOR	6
 
 struct sfdp_header {
 	u32		signature; /* Ox50444653U <=> "SFDP" */
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index e0a8ded..b84abd0 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -7,6 +7,12 @@
 #ifndef __LINUX_MTD_SFDP_H
 #define __LINUX_MTD_SFDP_H
 
+/* SFDP revisions */
+#define SFDP_JESD216_MAJOR	1
+#define SFDP_JESD216_MINOR	0
+#define SFDP_JESD216A_MINOR	5
+#define SFDP_JESD216B_MINOR	6
+
 /* Basic Flash Parameter Table */
 
 /*
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 17deaba..50b2478 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -8,6 +8,32 @@
 
 #include "core.h"
 
+static int
+w25q256_post_bfpt_fixups(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt,
+			 struct spi_nor_flash_parameter *params)
+{
+	/*
+	 * W25Q256JV supports 4B opcodes but W25Q256FV does not.
+	 * Unfortunately, Winbond has re-used the same JEDEC ID for both
+	 * variants which prevents us from defining a new entry in the parts
+	 * table.
+	 * To differentiate between W25Q256JV and W25Q256FV check SFDP header
+	 * version: only JV has JESD216A compliant structure (version 5)
+	 */
+
+	if (bfpt_header->major == SFDP_JESD216_MAJOR &&
+	    bfpt_header->minor == SFDP_JESD216A_MINOR)
+		nor->flags |= SNOR_F_4B_OPCODES;
+
+	return 0;
+}
+
+static struct spi_nor_fixups w25q256_fixups = {
+	.post_bfpt = w25q256_post_bfpt_fixups,
+};
+
 static const struct flash_info winbond_parts[] = {
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
 	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1,  SECT_4K) },
@@ -53,8 +79,8 @@ static const struct flash_info winbond_parts[] = {
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512,
-			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			  SPI_NOR_4B_OPCODES) },
+			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+			  .fixups = &w25q256_fixups },
 	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512,
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
