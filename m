Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D896ECD6E55
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 02:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1zB24MNZIaPyLC6FtdzdmEvhLhV+ZZSLM6hypmhf4fw=; b=dRkCCeJvrBub5/
	rMtixcPlget4ioHxglGwb/EAZMMVmEi7INIaXy3PLuwYCZHC1uKHEhhhVKylA9dVZXd8VkEjlC5kp
	/A2JCGwK+TMMgVXCWbSObctwJpvEU9dZ3xk+XgtP91x6qCYpkALIWUQdBT45FG4jwP5PiBU4x1ZzW
	xY9QC42L1A+ZDXZJmCGxY9Td3DYYMNNZi+uSp3gQpPxcTvGT3X51pJKgkSoZCtI8L7g3bM2sVuYnz
	PCyKsztW3iaUGTOo/2Mx9vbZB8PwXnNewK1ORuEQJaBCwHmgfkXwXvDzrt9z1nX8U5SBzMgBDaZLT
	+PdfMj4k2E8hrxcZUKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUEXi-0000000CAgW-1E7u;
	Tue, 02 Jun 2026 02:07:46 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUEXf-0000000CAg8-1f43
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 02:07:44 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c0b9328c4aso15778925ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jun 2026 19:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780366062; x=1780970862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gdm98kg5p3iWmcx/bJBpelRCoxJqA608wE9mubIJEMk=;
        b=QaCB6Vs8AtsZso2VjfVX3gA6ixss6nevV8TcpxYM0bx1NhKVZx3c3vKNV6jRcOSlpa
         1ZdvVhW8e1s5qEMJsS6ufe98t6N3+mKC8UesggbukMGC4nTgzVeJZFA1VPvtYuO/HA2U
         1nceRuhXBDHtJxPFv2sjG/64R4wK0FhyN2KEvwek0i9KKjy89umJnmRs07ggUnCIUN9M
         CdU9ZxrOPxcLGFyP1wDRcFs+d6tnG4fK6TW7+Lb0Spd5LS7jkMQoLT+IWu9Ah07qhS8i
         w2zC7u9UqcWdaQi7n6wz9jVDNKG+gTub2rRKmP8xrMenpI0alPHg3pW+eboo8UUJ4HpL
         R+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780366062; x=1780970862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdm98kg5p3iWmcx/bJBpelRCoxJqA608wE9mubIJEMk=;
        b=rVRrVa3TnLF7h309aUpMKRjB3h6ywLDa5P0QHNNNNv+B7SCpvKO1LEUbd1HgqnuXSx
         FC9x67Kmqu0Osrfw9eUsn63tPSCnkT04mblMNW8wTixZAkHrCKHn96YRkdh+V/np1uUo
         +FeJlcdOPcgukJXx9FXVoBOcLk3mm0UmKfd0MCvJWdGVD+tgXoeJ+wxBryqE+5hcvKvx
         +dTPFQdDthsKGd3QpFDEm4IQ/9N+QndGFqAZbZH3lS51/ryGcHcuNcoGgVb6NLVJiHFH
         cDirjw+7nLpKlxWowCE5iA8aP4ndcxdYEEdTuz+l/WF4eTyXDRzoqx/9qd+JKAULXPu9
         Okdg==
X-Gm-Message-State: AOJu0YytT1WbEUNcc2c61En/+Cms/4sR5MpGCugwSG5DwPTHtzWXHXA2
	tFEiEnKHgGVLMUT0oCT041DPmV81cQ6kgRp1Vh7EHlw58Aen1GBBW8XvmqybyQ==
X-Gm-Gg: Acq92OF26EX2rYAbhPvWSVA3qwENqgw1ZPc05oDDNc1XMj8yFn73TllaTIOt+eJQ+we
	VCp7ktHqul91TgYEcFHXCGNGQiTw/MLlj2NOxMm1BauB8a0XhNGS6ihecRUz+D4jL+hL2YTGeBx
	fB5WXgfgjgpUtQncweMPSziX4eoXblh5qoVehLi9eEXf7AD7LxjDoyY67AFXxhg+gptk//hRNgO
	KKlFNw/CYdYscqXt8Vp985BEl/LfcvYFgPAGj3QL1bV0sgZVs/W+mlWljx1RSv6MXO6HUGUgMk1
	3vQkKUhwqkyCRAD0jb/mfyBG9CrgBRJ1X5IlTs4QEn1NEUBLKZP1nO0jlcrLdUFa4yySo1E96qO
	ZRtO3YSvNvshHbkaB3wk7A3PyMlN7O59toUSnUWIJnVummiEIhJb9/CwJWbdl9UyW8kbbogpskJ
	buS1S8e4gAxz9jyRqf8xoQPuC+T7W6QZMEaxTY8RkpssFsnI11LhogchWFDFgdAEqVC4W5sWHup
	6HdDPOpbLQ9yns/H5KlMZk4oU3Ph7/vLvWFOMiibsgXHM/sHPtmg1bR
X-Received: by 2002:a17:903:94e:b0:2bf:379b:53f5 with SMTP id d9443c01a7336-2bf379b5638mr128637885ad.23.1780366061809;
        Mon, 01 Jun 2026 19:07:41 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c1e46asm115215045ad.61.2026.06.01.19.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 19:07:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	chleroy@kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: ndfc: use ioread32be/iowrite32be and allow COMPILE_TEST
Date: Mon,  1 Jun 2026 19:07:23 -0700
Message-ID: <20260602020723.533971-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_190743_443932_FF4EE77D 
X-CRM114-Status: GOOD (  17.41  )
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

Replace ppc4xx-specific in_be32/out_be32 with generic ioread32be/
iowrite32be to make the driver portable. Add COMPILE_TEST dependency
to get build coverage on non-ppc4xx architectures.

While at it, replace 4xx with 44x. The latter was removed a while ago
and is only kept for compatibility.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/Kconfig |  2 +-
 drivers/mtd/nand/raw/ndfc.c  | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index d488213b631f..64b8b99a3a68 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -71,7 +71,7 @@ config MTD_NAND_AU1550
 
 config MTD_NAND_NDFC
 	tristate "IBM/MCC 4xx NAND controller"
-	depends on 4xx
+	depends on 44x || COMPILE_TEST
 	select MTD_NAND_ECC_SW_HAMMING
 	select MTD_NAND_ECC_SW_HAMMING_SMC
 	help
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index 7ad8bc04be1a..a937ca3eeff5 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -44,13 +44,13 @@ static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 	uint32_t ccr;
 	struct ndfc_controller *ndfc = nand_get_controller_data(nchip);
 
-	ccr = in_be32(ndfc->ndfcbase + NDFC_CCR);
+	ccr = ioread32be(ndfc->ndfcbase + NDFC_CCR);
 	if (chip >= 0) {
 		ccr &= ~NDFC_CCR_BS_MASK;
 		ccr |= NDFC_CCR_BS(chip + ndfc->chip_select);
 	} else
 		ccr |= NDFC_CCR_RESET_CE;
-	out_be32(ndfc->ndfcbase + NDFC_CCR, ccr);
+	iowrite32be(ccr, ndfc->ndfcbase + NDFC_CCR);
 }
 
 static void ndfc_hwcontrol(struct nand_chip *chip, int cmd, unsigned int ctrl)
@@ -70,7 +70,7 @@ static int ndfc_ready(struct nand_chip *chip)
 {
 	struct ndfc_controller *ndfc = nand_get_controller_data(chip);
 
-	return in_be32(ndfc->ndfcbase + NDFC_STAT) & NDFC_STAT_IS_READY;
+	return ioread32be(ndfc->ndfcbase + NDFC_STAT) & NDFC_STAT_IS_READY;
 }
 
 static void ndfc_enable_hwecc(struct nand_chip *chip, int mode)
@@ -78,9 +78,9 @@ static void ndfc_enable_hwecc(struct nand_chip *chip, int mode)
 	uint32_t ccr;
 	struct ndfc_controller *ndfc = nand_get_controller_data(chip);
 
-	ccr = in_be32(ndfc->ndfcbase + NDFC_CCR);
+	ccr = ioread32be(ndfc->ndfcbase + NDFC_CCR);
 	ccr |= NDFC_CCR_RESET_ECC;
-	out_be32(ndfc->ndfcbase + NDFC_CCR, ccr);
+	iowrite32be(ccr, ndfc->ndfcbase + NDFC_CCR);
 	wmb();
 }
 
@@ -92,7 +92,7 @@ static int ndfc_calculate_ecc(struct nand_chip *chip,
 	uint8_t *p = (uint8_t *)&ecc;
 
 	wmb();
-	ecc = in_be32(ndfc->ndfcbase + NDFC_ECC);
+	ecc = ioread32be(ndfc->ndfcbase + NDFC_ECC);
 	/* The NDFC uses Smart Media (SMC) bytes order */
 	ecc_code[0] = p[1];
 	ecc_code[1] = p[2];
@@ -114,7 +114,7 @@ static void ndfc_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
 	uint32_t *p = (uint32_t *) buf;
 
 	for(;len > 0; len -= 4)
-		*p++ = in_be32(ndfc->ndfcbase + NDFC_DATA);
+		*p++ = ioread32be(ndfc->ndfcbase + NDFC_DATA);
 }
 
 static void ndfc_write_buf(struct nand_chip *chip, const uint8_t *buf, int len)
@@ -123,7 +123,7 @@ static void ndfc_write_buf(struct nand_chip *chip, const uint8_t *buf, int len)
 	uint32_t *p = (uint32_t *) buf;
 
 	for(;len > 0; len -= 4)
-		out_be32(ndfc->ndfcbase + NDFC_DATA, *p++);
+		iowrite32be(*p++, ndfc->ndfcbase + NDFC_DATA);
 }
 
 /*
@@ -223,13 +223,13 @@ static int ndfc_probe(struct platform_device *ofdev)
 	if (reg)
 		ccr |= be32_to_cpup(reg);
 
-	out_be32(ndfc->ndfcbase + NDFC_CCR, ccr);
+	iowrite32be(ccr, ndfc->ndfcbase + NDFC_CCR);
 
 	/* Set the bank settings if given */
 	reg = of_get_property(ofdev->dev.of_node, "bank-settings", NULL);
 	if (reg) {
 		int offset = NDFC_BCFG0 + (ndfc->chip_select << 2);
-		out_be32(ndfc->ndfcbase + offset, be32_to_cpup(reg));
+		iowrite32be(be32_to_cpup(reg), ndfc->ndfcbase + offset);
 	}
 
 	err = ndfc_chip_init(ndfc, ofdev->dev.of_node);
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
