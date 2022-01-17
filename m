Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE0FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxp27PmgAN6HOe9YTIm4oMm/akbpiwXlobU78EUXdbs=; b=g6OB0fqGg8LdWk
	5+vTG13PNoc7nTnTmTdGZczwGkLduupeRJJkSRO3dF+ab7yaYNUQ527UfKUedaU+KEWd6/e98VVrB
	hsxseMhfVk9b34rxqlF0Qy6s/GUuHR/AUfDnPAJIu8pcOtIKFY75pIdFdkZD3nNA+V90WUQkt4VfL
	s7oK49rtVWV2Fun2iszG1BoBEk0PiDMl83vl43p/R5cWgQ11KoEW7n5u1rRXLEB0lcarU4pHaRYBX
	1NUHKE36CJckmkU/zad6tufjTFNOuelNcNBapRyfaeNDZSYkA1dqVW20ojMyiLzGAz0XMrOIZQ9yg
	e27pahRXiNeIoqf3Idqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Q3C-00EdLw-PS; Mon, 17 Jan 2022 11:19:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Q23-00Ecwv-UU
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 11:18:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 15so30877730edx.9
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2022 03:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rYAxWnkHpq4eLp+nj5R4UJZTq/38ciAyZxzk+5L5YEQ=;
 b=eWWQ7Eq1ASjSoU3wXNkl4+S5loKAQAt6PHa0+A+R68n6ZX5g1AtMr+BiZZZpZ6Z5AE
 iEGu53zcXhZOap7+ZljQcAbLB0ltF7on2EyRPjGk+LstprLVfHsXl2msjJAmSNkx9ypG
 DhmZeYUTj77qcJfSepUEXPuy5/JX+JrviPo3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rYAxWnkHpq4eLp+nj5R4UJZTq/38ciAyZxzk+5L5YEQ=;
 b=njUwVUd2EalV061i5dce9xZQLTf5rswNwm6gpNTKlPvj/8Ti+dEZ6pYm3/et/sAEq2
 hd4Gpn7ZFz3xTarnBLPUpir2XjklKVem1xHVqbiWFkbiQSZf49wy+0avEmm3D1Y43CTR
 eqB6MY8kJMFmCkF+65rr25MImja1NgbUTDt/BX6Vlo4JhXPxBc3ANN7KhJS7jAY/EVGH
 B36hTzDnTupnHTLBqVSlHWnTprl+PrN5P6ydyAxsKrvw8gP5HFj5f5Mhr7hbQ8RDyAKK
 nAoUdeEdtQwwgJZlTKMkP0JpEk5F5Cy3EKVr/5aXFT7ooiWaUwbXm5dik4x5Ym69WH0k
 Y7+w==
X-Gm-Message-State: AOAM531Sq1X+5l/XQL8dnl9q1w4Powm8EIT2ShytinkoXtWS0tVTlR+J
 Q5cca/pOTN9YlKW1YuDAHCG+Dw==
X-Google-Smtp-Source: ABdhPJyKn6QCfHVFoBCjZsxSClHN31Hb+zRcpoNFpkT5JrofnLdT2dc7CAPh354e/9IyUsaWWHYUIw==
X-Received: by 2002:aa7:c945:: with SMTP id h5mr20209214edt.187.1642418318723; 
 Mon, 17 Jan 2022 03:18:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id f11sm5142713edv.67.2022.01.17.03.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 03:18:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [RFC PATCH v2 4/5] mtd: rawnand: gpmi: validate controller clock rate
Date: Mon, 17 Jan 2022 12:18:28 +0100
Message-Id: <20220117111829.1811997-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
References: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_031840_061987_BD97381C 
X-CRM114-Status: GOOD (  22.83  )
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

What to do when the real rate of the gpmi clock is not equal to the
required one? The solutions proposed in [1] did not lead to a conclusion
on how to validate the clock rate, so, inspired by the document [2], I
consider the rate correct only if not lower or equal to the rate of the
previous edo mode. In fact, in chapter 4.16.2 (NV-DDR) of the document [2],
it is written that "If the host selects timing mode n, then its clock
period shall be faster than the clock period of timing mode n-1 and
slower than or equal to the clock period of timing mode n.". I thought
that it could therefore also be used in this case, without therefore
having to define the valid rate ranges empirically.

For example, suppose that gpmi_nfc_compute_timings() is called for edo
mode 5 configuration (100MHz, from the `edo_modes' table) but the rate
returned by clk_round_rate() is 80MHz (edo mode 4 from the `edo_modes'
table). In this case gpmi_nfc_compute_timings() will return error, and
will be called again for edo mode 4 configuration, which this time will
be successful.

[1] https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org
[2] http://www.onfi.org/-/media/client/onfi/specs/onfi_3_0_gold.pdf?la=en

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Fix commit description.
- Add an example to the commit description to better understand the
  problem solved by the patch.
- Split the patch.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4ac695aa5131..7ae7a37775a3 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -665,8 +665,8 @@ static const struct edo_mode edo_modes[] = {
  *         RDN_DELAY = -----------------------     {3}
  *                           RP
  */
-static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
-				     const struct nand_sdr_timings *sdr)
+static int gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
+				    const struct nand_sdr_timings *sdr)
 {
 	struct gpmi_nfc_hardware_timing *hw = &this->hw;
 	struct resources *r = &this->resources;
@@ -679,6 +679,7 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 	u16 busy_timeout_cycles;
 	u8 wrn_dly_sel;
 	int i, emode = ARRAY_SIZE(edo_modes) - 1;
+	long clk_rate;
 
 	/* Search the required EDO mode */
 	for (i = 0; i < ARRAY_SIZE(edo_modes); i++) {
@@ -688,7 +689,18 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 		}
 	}
 
-	hw->clk_rate = clk_round_rate(r->clock[0], edo_modes[emode].clk_rate);
+	clk_rate = clk_round_rate(r->clock[0], edo_modes[emode].clk_rate);
+	if (emode > 0 && !(clk_rate <= edo_modes[emode].clk_rate &&
+			   clk_rate > edo_modes[emode - 1].clk_rate)) {
+		dev_err(this->dev,
+			"edo mode %d clock setting: expected %ld, got %ld\n",
+			emode, edo_modes[emode].clk_rate, clk_rate);
+		return -ENOTSUPP;
+	}
+
+	dev_dbg(this->dev, "edo mode %d @ %ld Hz\n", emode, clk_rate);
+
+	hw->clk_rate = clk_rate;
 	wrn_dly_sel = edo_modes[emode].wrn_dly_sel;
 
 	/* SDR core timings are given in picoseconds */
@@ -731,6 +743,7 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 		hw->ctrl1n |= BF_GPMI_CTRL1_RDN_DELAY(sample_delay_factor) |
 			      BM_GPMI_CTRL1_DLL_ENABLE |
 			      (use_half_period ? BM_GPMI_CTRL1_HALF_PERIOD : 0);
+	return 0;
 }
 
 static int gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
@@ -786,6 +799,7 @@ static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
 {
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	const struct nand_sdr_timings *sdr;
+	int ret;
 
 	/* Retrieve required NAND timings */
 	sdr = nand_get_sdr_timings(conf);
@@ -801,7 +815,9 @@ static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
 		return 0;
 
 	/* Do the actual derivation of the controller timings */
-	gpmi_nfc_compute_timings(this, sdr);
+	ret = gpmi_nfc_compute_timings(this, sdr);
+	if (ret)
+		return ret;
 
 	this->hw.must_apply_timings = true;
 
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
