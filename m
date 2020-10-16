Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E0FC433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 19:28:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0035A20829
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 19:28:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Gj3V9WZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnI/CNRI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0035A20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uoSzSjSTmk+0dJ3gvFDmIe8tTnU7CpvliM/dhL5fMOc=; b=1Gj3V9WZ8BFG/YrNv4Se+/MXa5
	bI56tjN+iLKZ6Zm3yX26nyP/rVQdBbfFJTqle95yQLw7e9VMP2PQr+igsaQCVBchaWn4tzaCFEBhy
	07hCRb6N/ITy7lTWPaF4tP3gWx2qcXnZCfbQt85IbExvmcC35l4CT/qrTbk7/PSJNTgQrI898SWfP
	coW7l/5NuaAs5tMhjkP98g+zyMHr2mBS4UXGIFj8LvPMx0FMLJptLL9zc3MbAt/MnPQxT92TJJynS
	gNpbQh6VFaWIf6J+j8sfNaXAFjk9DDQD5PxSDgz7/6TdARB58cTuZ4b2y0A/kRQT4MmMNW6zlvoSa
	dTbf2Jsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTVNJ-0005zQ-Oj; Fri, 16 Oct 2020 19:26:49 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTVNH-0005yv-PF
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 19:26:48 +0000
Received: by mail-qv1-xf42.google.com with SMTP id ev17so1560322qvb.3
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nLLyTlksowsCeA8TefeeTX1o+o2maxW4p1VgfLLjR9I=;
 b=dnI/CNRImFXKD68JrPyWUtJb73yAW0lOHNvii2GSoldIuY5kir3aoQNmXeFXJR2KWV
 vW/xmBToV2n+4wS2mqwYzjnbBxAiCjnzYw4lEYMXkpIaZpYwCz8FR6EqkmAUVBNXSl24
 vg4gDBJRefNrcTjweWgat3TTk7eTWb2xQxu4L5yn8iBAC+xEic863K+90e77wal+/qyT
 sq5l4KTd+kdfajPHav/v1ZFDe6sHkavRLpb5SqTmu/YdZoTAyzNkaaZyF+JLTBPl+yFt
 Pxog0N2A7Aro6R15i91OwAUCovigmyyPCMHyvsRxZx7i6DC7htX92fDWqBf17WifDQ1P
 qhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nLLyTlksowsCeA8TefeeTX1o+o2maxW4p1VgfLLjR9I=;
 b=b3OSrc52I4Jb/HxXTcNZJjF4krzbaHh6nJV/GLk3vP/axaSn1NsR33J+VK7HacuGcu
 MwmKXiEl0HgN1JPm36Jo8WQALRkeX/p83GjjXMhrijC09ifi87MnVSbvR/gPpOaBzgSV
 CgMKd5NT0r2ddeP+5GBeUuRKfPkjf/iyfNmb+1Bl/aM2XAx/L9c4WkPRYpIEwGxcp2pm
 FZzRbU1/ptaKxcba9savIPqiMXeObP1pMkn0KRNtODApnHd+QbHX+Evxj/ectF3U+2P/
 lwdXIGMQPTc8fYUSy+bPTTLnw0qYvY881z5Qfxg7tEeOCrCUrCJButA0dNzzApsHrm/V
 VLTg==
X-Gm-Message-State: AOAM533O9M861WjfkKdCvwAhCvox61D+ypj5mHXBdbJJM0kJAtyifN+D
 twCGMeG9ucScTpU82ff/5b4=
X-Google-Smtp-Source: ABdhPJwq85QV0GsgFB/eVh9ASF3v/64Ua+6YEL0xj+XZ7eVGbi8Tq3rM/ldnkI9Q09JdAfCRo9ga/g==
X-Received: by 2002:a0c:c985:: with SMTP id b5mr5797071qvk.10.1602876404236;
 Fri, 16 Oct 2020 12:26:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:997:843a:71ae:df40:2826])
 by smtp.gmail.com with ESMTPSA id
 t140sm1266838qke.100.2020.10.16.12.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 12:26:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH v2] mtd: rawnand: mxc: Move the ECC engine initialization to
 the right place
Date: Fri, 16 Oct 2020 16:26:20 -0300
Message-Id: <20201016192620.19067-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_152647_821801_F481C7D6 
X-CRM114-Status: GOOD (  15.47  )
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
Cc: vigneshr@ti.com, richard@nod.at, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, han.xu@nxp.com,
 Fabio Estevam <festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

No ECC initialization should happen during the host controller probe.

In fact, we need the probe function to call nand_scan() in order to:
- identify the device, its capabilities and constraints (nand_scan_ident())
- configure the ECC engine accordingly (->attach_chip())
- scan its content and prepare the core (nand_scan_tail())

Moving these lines to mxcnd_attach_chip() fixes a regression caused by
a previous commit supposed to clarify these steps.

When moving the ECC initialization from probe() to attach(), it is
no longer possible to access pdata since it is not initialized.

Retrieve the "nand-ecc-mode" information from devicetree to decide
the engine type.

Reported-by: Fabio Estevam <festevam@gmail.com>
Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Change since v1:

- Do not access pdata in attach(), since it is not initialized.

 drivers/mtd/nand/raw/mxc_nand.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index d4200eb2ad32..b9e4de5ec8f8 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1680,6 +1680,21 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct mxc_nand_host *host = nand_get_controller_data(chip);
 	struct device *dev = mtd->dev.parent;
+	struct device_node *np = dev->of_node;
+	const char *ecc_mode;
+
+	chip->ecc.bytes = host->devtype_data->eccbytes;
+	host->eccsize = host->devtype_data->eccsize;
+	chip->ecc.size = 512;
+	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
+
+	of_property_read_string(np, "nand-ecc-mode", &ecc_mode);
+	if (!strcasecmp(ecc_mode, "hw")) {
+		chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
+	} else {
+		chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+	}
 
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
@@ -1836,19 +1851,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	if (host->devtype_data->axi_offset)
 		host->regs_axi = host->base + host->devtype_data->axi_offset;
 
-	this->ecc.bytes = host->devtype_data->eccbytes;
-	host->eccsize = host->devtype_data->eccsize;
-
 	this->legacy.select_chip = host->devtype_data->select_chip;
-	this->ecc.size = 512;
-	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
-
-	if (host->pdata.hw_ecc) {
-		this->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	} else {
-		this->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-		this->ecc.algo = NAND_ECC_ALGO_HAMMING;
-	}
 
 	/* NAND bus width determines access functions used by upper layer */
 	if (host->pdata.width == 2)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
