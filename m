Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1A9C47DDB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 03:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ma1PeZXGQ/J8yTLBSao+/Y0rtFgpQp50C9Q2sfEMBwM=; b=vEecN1brliLw7x
	7IsDbcLgf7jCm/QE7NHBg4kc9PyRbw6IGEOkQJiZ0RP67zLcZULCra1cBBoZSlGazVPCH9t4W4xhm
	3fq0LnOK4NKDE/mXVv88JYpDVbnBoPIxK3RjhVfMLnqA4D6fkAUa4X7M7pLwS5NQM8kMNmIFwYqRj
	QwpqxxQGnSrsLeyVMdgk3/3+JJRgZ3Bq1kIOprRSOIO9OFxGKCHDf4ems0ruAJ33G3+WOGQ1SAoua
	4oCP0d4JyxbXzEtWNiFDZ2zpYzLLyBWucH7jd6FjfSCLU5NDN+W8I7r2PnfTCpsX5Aj8bf/l+dITg
	8mf1edFVMTr2+u01P1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTbV-001FsE-1T;
	Wed, 24 Jan 2024 03:07:05 +0000
Received: from mail-ot1-f100.google.com ([209.85.210.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTb5-001FbD-0z
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 03:06:41 +0000
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-6dbcebaf9a9so2865051a34.3
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 19:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706065539; x=1706670339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwegdSybI33Nmb+F9DKKGVukdHc03A/AUPX3yW5tWW0=;
        b=XlyxqYxlx6H5ukLy7LP6z6adClytm8OTqVP35rxoTFy0VpXsvmjRQvG8QPNG7FS+JQ
         7vvP/2j5Y4cxbKKv6U2gDEgG4AbnqWD1Kn39pNozMG6t9bi29s4FzOX5uLOdVcue3Mog
         GJfiTFerl3RUm1RJAICIhK8NDN7tkG5cVNxLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706065539; x=1706670339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwegdSybI33Nmb+F9DKKGVukdHc03A/AUPX3yW5tWW0=;
        b=NMBF2Iy4xCLJp6OzaK/FcEBUxBVtwynsq3MQIOUK+HAS+VIgydlD0ZeNL31trSHKeN
         q/CgNBKkM9vGmUQxvKO23ulXU86aUFD4aOG7Culr6WBsA6rwnUrz8DCEO/v67YQdvvtK
         evPBQ4hRQHfAqH+aoDMVc4eXjGLZ8MpCUGNgCbAj05LVVJZmdJ6r4qYCzy+Ew3sVvouX
         3CsBGeFtr68BAeAw+bPWvng4o1r0YDXpesux6ZCnC5dSpKMVmTDZCcrzY4ZxlfR7Cozq
         yjrv09WcyAEWDnFjkkX24zTopqrReuEwxZIPvPxyUeBOY4Zrqeppx2UbFBPgXMxbckQw
         pSzg==
X-Gm-Message-State: AOJu0Yx35bY3Xrzjl9QqEPTuXWBQtKEoU2/75sDRIV9oSbMKctspg7FA
	k4wsz4/rwP8tsdzn0JULIIJlTdH1zqvmc1ZdQo0wYQa1cE3XSHyltUz7A0+FinM9/84GOxt7eK8
	I0h5AtOlxTw1Cx3nF0XhJ/fHRDQrbAA==
X-Google-Smtp-Source: AGHT+IFVKxA8y/gg9xufz6NOdEljs2B3vozRSVt/ENRpavZMC/Sj/xdFXZbx377gJMdUwpQqG0oqZkroTdnV
X-Received: by 2002:a05:6830:22f8:b0:6db:ffb0:7a4d with SMTP id t24-20020a05683022f800b006dbffb07a4dmr958490otc.45.1706065538813;
        Tue, 23 Jan 2024 19:05:38 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id c22-20020a056830349600b006dc7502beabsm455320otu.3.2024.01.23.19.05.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 19:05:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
From: David Regan <dregan@broadcom.com>
To: dregan@broadcom.com,
	dregan@mail.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	computersforpeace@gmail.com,
	kdasu.kdev@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joel.peshkin@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	kursad.oney@broadcom.com,
	florian.fainelli@broadcom.com,
	rafal@milecki.pl,
	bcm-kernel-feedback-list@broadcom.com,
	andre.przywara@arm.com,
	baruch@tkos.co.il,
	linux-arm-kernel@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: [PATCH v3 05/10] mtd: rawnand: brcmnand: Add BCMBCA read data bus interface
Date: Tue, 23 Jan 2024 19:04:53 -0800
Message-Id: <20240124030458.98408-6-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240124030458.98408-1-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_190639_354803_7B183798 
X-CRM114-Status: GOOD (  21.72  )
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

From: William Zhang <william.zhang@broadcom.com>

The BCMBCA broadband SoC integrates the NAND controller differently than
STB, iProc and other SoCs.  It has different endianness for NAND cache
data.

Add a SoC read data bus shim for BCMBCA to meet the specific SoC need
and performance improvement using the optimized memcpy function on NAND
cache memory.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: David Regan <dregan@broadcom.com>
---
Changes in v3:
- Updated bcmbca_read_data_bus comment
---
Changes in v2:
- Drop the is_param argument to the read data bus function now that we
have the exec_op API to read the parameter page and ONFI data
- Remove be32_to_cpu from brcmnand_read_data_bus
---
 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c | 27 +++++++++++++++++++++
 drivers/mtd/nand/raw/brcmnand/brcmnand.c    | 20 ++++++++++++---
 drivers/mtd/nand/raw/brcmnand/brcmnand.h    |  2 ++
 3 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
index 3e2f3b79788d..7ad3e7a98f97 100644
--- a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
@@ -26,6 +26,18 @@ enum {
 	BCMBCA_CTLRDY		= BIT(4),
 };
 
+#if defined(CONFIG_ARM64)
+#define ALIGN_REQ		8
+#else
+#define ALIGN_REQ		4
+#endif
+
+static inline bool bcmbca_nand_is_buf_aligned(void *flash_cache,  void *buffer)
+{
+	return IS_ALIGNED((uintptr_t)buffer, ALIGN_REQ) &&
+				IS_ALIGNED((uintptr_t)flash_cache, ALIGN_REQ);
+}
+
 static bool bcmbca_nand_intc_ack(struct brcmnand_soc *soc)
 {
 	struct bcmbca_nand_soc *priv =
@@ -56,6 +68,20 @@ static void bcmbca_nand_intc_set(struct brcmnand_soc *soc, bool en)
 	brcmnand_writel(val, mmio);
 }
 
+static void bcmbca_read_data_bus(struct brcmnand_soc *soc,
+				 void __iomem *flash_cache,  u32 *buffer, int fc_words)
+{
+	/*
+	 * memcpy can do unaligned aligned access depending on source
+	 * and dest address, which is incompatible with nand cache. Fallback
+	 * to the memcpy_fromio in such case
+	 */
+	if (bcmbca_nand_is_buf_aligned((void *)flash_cache, buffer))
+		memcpy((void *)buffer, (void *)flash_cache, fc_words * 4);
+	else
+		memcpy_fromio((void *)buffer, flash_cache, fc_words * 4);
+}
+
 static int bcmbca_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -73,6 +99,7 @@ static int bcmbca_nand_probe(struct platform_device *pdev)
 
 	soc->ctlrdy_ack = bcmbca_nand_intc_ack;
 	soc->ctlrdy_set_enabled = bcmbca_nand_intc_set;
+	soc->read_data_bus = bcmbca_read_data_bus;
 
 	return brcmnand_probe(pdev, soc);
 }
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 8faca43ae1ff..73fdf7ce21aa 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -851,6 +851,20 @@ static inline u32 edu_readl(struct brcmnand_controller *ctrl,
 	return brcmnand_readl(ctrl->edu_base + offs);
 }
 
+static inline void brcmnand_read_data_bus(struct brcmnand_controller *ctrl,
+					  void __iomem *flash_cache, u32 *buffer, int fc_words)
+{
+	struct brcmnand_soc *soc = ctrl->soc;
+	int i;
+
+	if (soc->read_data_bus) {
+		soc->read_data_bus(soc, flash_cache, buffer, fc_words);
+	} else {
+		for (i = 0; i < fc_words; i++)
+			buffer[i] = brcmnand_read_fc(ctrl, i);
+	}
+}
+
 static void brcmnand_clear_ecc_addr(struct brcmnand_controller *ctrl)
 {
 
@@ -1975,7 +1989,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 {
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_controller *ctrl = host->ctrl;
-	int i, j, ret = 0;
+	int i, ret = 0;
 
 	brcmnand_clear_ecc_addr(ctrl);
 
@@ -1988,8 +2002,8 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 		if (likely(buf)) {
 			brcmnand_soc_data_bus_prepare(ctrl->soc, false);
 
-			for (j = 0; j < FC_WORDS; j++, buf++)
-				*buf = brcmnand_read_fc(ctrl, j);
+			brcmnand_read_data_bus(ctrl, ctrl->nand_fc, buf, FC_WORDS);
+			buf += FC_WORDS;
 
 			brcmnand_soc_data_bus_unprepare(ctrl->soc, false);
 		}
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.h b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
index 928114c0be5e..7261a69989fe 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.h
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
@@ -24,6 +24,8 @@ struct brcmnand_soc {
 	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
 	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare,
 				 bool is_param);
+	void (*read_data_bus)(struct brcmnand_soc *soc, void __iomem *flash_cache,
+				  u32 *buffer, int fc_words);
 	const struct brcmnand_io_ops *ops;
 };
 
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
