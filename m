Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46E0C43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 18:30:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73FBC2084F
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 18:30:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WKMyfnqH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="vQOMpl48"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73FBC2084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2d9aQeCVkoaPxE9lxfPsyN6TvtFOSu6QPpYO9e/Lwdc=; b=WKMyfnqHbFksQk
	pDuOuLk1y0qdsdpd9e3DPSqIAPIioX6ZwoMnf3zScHsaTOt+YZdjt/78j4wZ8EP7NdzoUxEfeW6J3
	P/25QA0wcTYhXg4Ua1vUl3EcWC+Y2ks2+Be/0KmGkP4bVG8/sjQd25U97gGVoiE4vbbJyvuVyt4Iu
	BLSp5TlFDWXMY+ZDh0aG0mUDi6hQ7G6/WrxMonK3FVABUhQXlMC0bcw/549IhUpkaHqNZf+oEuxNh
	G7SKgvWJ5VUbXAeW5OtYinafvIug9BHpqtkONjby0LY3as+7nDorH7WVMNzFQDD7xwppMua4gEgUm
	OBXnwaBCjCjFrC1HmCQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzmvh-0001ka-Oo; Fri, 01 Mar 2019 18:30:41 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzmuq-0007xD-OI; Fri, 01 Mar 2019 18:29:50 +0000
Received: by mail-wr1-x443.google.com with SMTP id w17so26892560wrn.12;
 Fri, 01 Mar 2019 10:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VoiS2lJlBEHuuMWaBCovLuZ9/iuTCEw6XlocJYIkVp0=;
 b=vQOMpl48cycMITNAtoaYVxREUoTYL11h/5BAfv0sN6rnHEJJZdCwLFM94UsiRAbPW3
 1FoPgSqb+zrk75RwzbnbcGBgcfXEYtNRizSH5F5cmqd9qzjq4CsS+D8r18651Ipt4ai6
 FC1J+e3ZO8kZDg6jCinbcyd5G0ZFrYBuL8M+DxB9C43/GB0ulBkmIND9SAQDOjspGr61
 VWHVXGkVGYrJyhjNRFznKxtd9intVHuU+xQ6i0uOQ2B8uX2hsqujh2HNQIR6n4e6PWaD
 ODgF/rlf4b/BImcF2LIMyIPnGTf81NZGm/8zq0n9M+pxMCC3PY0ppMLi28d7j7yYA0UZ
 Fl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VoiS2lJlBEHuuMWaBCovLuZ9/iuTCEw6XlocJYIkVp0=;
 b=nVTh75uW+vX5nA8/6FnNGii5232fDZzXbzzHZv1Nfhkzg8dpa/Jjn54siOtq0qVmzq
 5Y7T9EZSLsoC81aXShPa6qbXYBA+cfSjyX71SptIcAVHAxRDs1qwnznq0ths+0hlBekF
 5FlZnAzwhSCNfhJc96OpoPfuhkm9JFKHQcgu7lD9IaGmZaJb9BJmM+PrXh5809tw/Yd3
 aTnhpr1ioRdXcpr5GYBowMKyqtF/Xsk3dLNdqFNG3GDQaSM3pjzU7wZgWs7X2+hoAR4k
 v3n521hTax4yPPHVNMd8FXiOmSrlQ1ttV6/tgmTGFfgGFHHIsFp+ievO3IrIKNsbdtsK
 M7CQ==
X-Gm-Message-State: APjAAAUXh0WY2gz2PSOquTsBCFwFG4b2+qzhu7E7s5s3qzNMg3RGHKcj
 +2X9CRwVW6J+SMFI69DTknY=
X-Google-Smtp-Source: APXvYqws3jQuCRaHpU6X8NogFCaddWI2dD/HpZLR5HNqOoBek1I7yjmp4CuLOa23kHWUCTKlGYbSxg==
X-Received: by 2002:a5d:4f86:: with SMTP id d6mr4369574wru.89.1551464987124;
 Fri, 01 Mar 2019 10:29:47 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD7109200428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d710:9200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id l18sm21221367wrv.20.2019.03.01.10.29.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Mar 2019 10:29:46 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: liang.yang@amlogic.com
Subject: [RFC PATCH nand-next 2/2] mtd: rawnand: meson: support for older SoCs
 up to Meson8
Date: Fri,  1 Mar 2019 19:29:22 +0100
Message-Id: <20190301182922.8309-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_102948_808682_354001F1 
X-CRM114-Status: GOOD (  18.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds support for the following SoCs to the meson-nand driver:
- Meson8 (assuming Meson8m2 uses the same IP block revision)
- Meson8b
- GXBB

The clock setup is the only difference between GXL and the older SoCs.
Compared to GXL and AXG these older SoCs:
- have a dedicated NAND clock instead of one that's shared with
  sd_emmc_c
- use the same ECC capabilities as GXL (up to 60-bits ECC)

The "amlogic,mmc-syscon" property is not required on these older SoCs
because the NAND clock is not shared with the sd_emmc_c controller. The
syscon from that property is used to switch the clock output between the
NAND controller and the sd_emmc_c controller on the newer SoCs.

The "rx" and "tx" clocks also don't exist on the older SoCs which also
means that the phase cannot be controlled there. Obtain these clocks
using devm_clk_get_optional() which will return NULL if they were not
passed via device-tree. None of the "consumers" of the "rx" and "tx"
clocks (within the meson-nand driver) have to be adjusted because the
common clock framework is NULL-safe (meaning NULL-clocks can be passed,
clk_prepare_enable() and clk_disable_unprepare() are no-ops in that
case).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 46 ++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 38db4fd61459..2a5f9ce5db9b 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -128,6 +128,7 @@ struct meson_nand_ecc {
 
 struct meson_nfc_data {
 	const struct nand_ecc_caps *ecc_caps;
+	bool has_mmc_syscon;
 };
 
 struct meson_nfc_param {
@@ -209,7 +210,7 @@ static int meson_nand_calc_ecc_bytes(int step_size, int strength)
 	return ecc_bytes;
 }
 
-NAND_ECC_CAPS_SINGLE(meson_gxl_ecc_caps,
+NAND_ECC_CAPS_SINGLE(meson8_ecc_caps,
 		     meson_nand_calc_ecc_bytes, 1024, 8, 24, 30, 40, 50, 60);
 NAND_ECC_CAPS_SINGLE(meson_axg_ecc_caps,
 		     meson_nand_calc_ecc_bytes, 1024, 8);
@@ -999,21 +1000,22 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 		return PTR_ERR(nfc->device_clk);
 	}
 
-	nfc->phase_tx = devm_clk_get(nfc->dev, "tx");
+	nfc->phase_tx = devm_clk_get_optional(nfc->dev, "tx");
 	if (IS_ERR(nfc->phase_tx)) {
 		dev_err(nfc->dev, "failed to get TX clk\n");
 		return PTR_ERR(nfc->phase_tx);
 	}
 
-	nfc->phase_rx = devm_clk_get(nfc->dev, "rx");
+	nfc->phase_rx = devm_clk_get_optional(nfc->dev, "rx");
 	if (IS_ERR(nfc->phase_rx)) {
 		dev_err(nfc->dev, "failed to get RX clk\n");
 		return PTR_ERR(nfc->phase_rx);
 	}
 
-	/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
-	regmap_update_bits(nfc->reg_clk,
-			   0, CLK_SELECT_NAND, CLK_SELECT_NAND);
+	if (nfc->data->has_mmc_syscon)
+		/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
+		regmap_update_bits(nfc->reg_clk,
+				   0, CLK_SELECT_NAND, CLK_SELECT_NAND);
 
 	ret = clk_prepare_enable(nfc->core_clk);
 	if (ret) {
@@ -1345,16 +1347,32 @@ static irqreturn_t meson_nfc_irq(int irq, void *id)
 	return IRQ_HANDLED;
 }
 
+static const struct meson_nfc_data meson8_data = {
+	.ecc_caps = &meson8_ecc_caps,
+	.has_mmc_syscon = false,
+};
+
 static const struct meson_nfc_data meson_gxl_data = {
-	.ecc_caps = &meson_gxl_ecc_caps,
+	.ecc_caps = &meson8_ecc_caps,
+	.has_mmc_syscon = true,
 };
 
 static const struct meson_nfc_data meson_axg_data = {
 	.ecc_caps = &meson_axg_ecc_caps,
+	.has_mmc_syscon = true,
 };
 
 static const struct of_device_id meson_nfc_id_table[] = {
 	{
+		.compatible = "amlogic,meson8-nfc",
+		.data = &meson8_data,
+	}, {
+		.compatible = "amlogic,meson8b-nfc",
+		.data = &meson8_data,
+	}, {
+		.compatible = "amlogic,meson-gxbb-nfc",
+		.data = &meson8_data,
+	}, {
 		.compatible = "amlogic,meson-gxl-nfc",
 		.data = &meson_gxl_data,
 	}, {
@@ -1390,12 +1408,14 @@ static int meson_nfc_probe(struct platform_device *pdev)
 	if (IS_ERR(nfc->reg_base))
 		return PTR_ERR(nfc->reg_base);
 
-	nfc->reg_clk =
-		syscon_regmap_lookup_by_phandle(dev->of_node,
-						"amlogic,mmc-syscon");
-	if (IS_ERR(nfc->reg_clk)) {
-		dev_err(dev, "Failed to lookup clock base\n");
-		return PTR_ERR(nfc->reg_clk);
+	if (nfc->data->has_mmc_syscon) {
+		nfc->reg_clk =
+			syscon_regmap_lookup_by_phandle(dev->of_node,
+							"amlogic,mmc-syscon");
+		if (IS_ERR(nfc->reg_clk)) {
+			dev_err(dev, "Failed to lookup clock base\n");
+			return PTR_ERR(nfc->reg_clk);
+		}
 	}
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
