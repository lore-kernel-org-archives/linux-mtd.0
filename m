Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150BBCCD187
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxZwDc9snptKzb47B5OtdKCU2eY/O75rwMjyUIHAyTI=; b=ZGDRzv1NJF4SfB
	uH9hnhKdpc6cAVe8hZosR0MfxGjxIOC1sJuXM/pyJuDKT/2iZ9izSBbSKVSDGXJEaDYSL+bgHYUtU
	yHz6oyBhUT7TSfpRuWgMPAHkF2o4qmGoMu1M4ZP1cQacIn4rTn1KP04gJ3bAESHY2o5rxqlwnIfvJ
	krR/F7pJjwWiObBIuyAmg2Z6Om5nZn3FAYt4FyfTll5IdXT705U/M4+KlFGT3rjGGxpc7+IRrx2ea
	dan39OHQwuNXzdH3ko7E2X5f3SUVtKma7mKkM6ZRIrg6yaYQ1pHoCeeVjueZVG94GUSaQfGX0BMkl
	KjpXV103RzGCdncrQWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78h0-000000081Lz-0l3i;
	Fri, 10 Oct 2025 08:41:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78gw-000000081KU-2jLM;
	Fri, 10 Oct 2025 08:41:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 79FD41A127B;
	Fri, 10 Oct 2025 08:41:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F4FB60667;
	Fri, 10 Oct 2025 08:41:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 755F7102F2209;
	Fri, 10 Oct 2025 10:41:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085689; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Tz6sO687jYJvFjSGzi40jW5mXg89go39qIQP/ZY/9eU=;
	b=dA7qSXPr3VO1LBX9C4BFa+KRCB0w28b3tqz76DVgpL4xMVKUsiUcNDf/zvSCnw+FL3jZB4
	pJSx6IqqOv/kQ2FeVbTwxZalDWG1tX5gjTC2+XeoDmTMkFTgb4q1RgpVdcIZWAKXh3dPD/
	Sz6QsvviyN2nglOQiAmih0EDLg+oQd7xke0187o7QuU3RBYqpfCF9zaP552Xk0oZWdO1DF
	eK10tV1NqVeAPD3cXz7wr/xanU5WelK5m1GiWHCIYeecCvhLCkXitomLDWJ2nUjycaIKd5
	LKF4KbV+biW8BWgfHVCTRcQ8Tmwtip/G5NI47+9nZxpqTRFpSa6LaIdBzO9H5g==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 01/15] mtd: rawnand: sunxi: Remove superfluous register readings
Date: Fri, 10 Oct 2025 10:40:28 +0200
Message-ID: <20251010084042.341224-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010084042.341224-1-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_014134_818993_F11BC2AE 
X-CRM114-Status: UNSURE (   9.39  )
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

The register NFC_REG_ECC_CTL was read twice and the result was not used,
then a third time with a mask applied.
Removing those calls didn't change the behavior.

Tested on H616 SoC, scrambling enabled.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 162cd5f4f234..10a48e0d361f 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -623,13 +623,12 @@ static void sunxi_nfc_randomizer_config(struct nand_chip *nand, int page,
 					bool ecc)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	u32 ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL);
+	u32 ecc_ctl;
 	u16 state;
 
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
 		return;
 
-	ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL);
 	state = sunxi_nfc_randomizer_state(nand, page, ecc);
 	ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL) & ~NFC_RANDOM_SEED_MSK;
 	writel(ecc_ctl | NFC_RANDOM_SEED(state), nfc->regs + NFC_REG_ECC_CTL);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
