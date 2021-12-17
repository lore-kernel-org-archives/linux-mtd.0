Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8082C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mi2yP9WIit4NgH+mNtgVB3jzSqXA8Aq3bYvBpLTKLeg=; b=YOW4ZQTKGNltv6
	qLKkVkzs1DhMGuxrYwsnxqLlUR2gn3dDb00FT80Cz/7mqxnjiKXZvRlC/LigRa/vEx/mJvEWA/nYk
	qipAICz4cdO5Z06t3j3hiv3TPB01JAwQjHZhBpwOrX8hURsjDpyrqJ9td1DI+nU42U4XBqm2fKTtJ
	oQyQD2NtUgst4OjXDgfHIiyC0xse+6Irxi64EGqw/0cH6jQRkOM4m1MVITQ2mrzDWHabaSzSFafK1
	bGIybQ6h4YDEkWgLyxaKlEw8Vyhbslh+0Y8TvWmDBI33bIJgIhHw6t5BuRpSxcebWl3Oesek89ZGw
	ttZ+k55HoMF1FFiyOC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myG7S-00BAes-Pd; Fri, 17 Dec 2021 16:30:06 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFaJ-00B1Uf-Q6
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 15:55:54 +0000
Received: by mail-ed1-x531.google.com with SMTP id b7so9507300edd.6
 for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2021 07:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M2WbEnBbDQgsL2Z6AiQ6BSUsHGfqd+FRDLIjDGY984c=;
 b=XpLaJNf7l0burOcMud+Y/VNOXEkyFXWUEHIk8Y7s5tKNFIHAjMfOcaCWrx41B+Kc0m
 mvcNEknsWkwTV7KeKr7rfN5L/Le/BnZMTuNzUrRGAC00oA6BK3Zv3JW1YsEyyUvU3ILk
 Q/3JEnlteQoPxIYMBDHuhvjjDbOM29L3iJOOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M2WbEnBbDQgsL2Z6AiQ6BSUsHGfqd+FRDLIjDGY984c=;
 b=JBKJL+JrHon8GffeyLGRULxbVig7i+nXabliJ8Ryq62wCFgvoDy0TSeMb+SQyKcyOG
 YQLg597N1UiUjRbhbLGWGGzGIDjfTpe5eOZlFHeSPkGiJthsYPHUOv5RCHCETBEVhJig
 zFP1jlnSq7iAnfjZipUtk6dz8xSp7OXjZoFwj/9h71t2WO3JCR/NiGuKaYicfY1VaweQ
 Yj8zbO7RDQ5GdM/oWHg8T/3LYJB4oqLgS1pdMBoZJqie6H/o+fHkwGCb/fRyffKKmPvZ
 xCalqQjOlhw4rcTZOuX/ZYsv5CghkeOZEPsRElwZ+/ILQweK0T5sFDiODvbqPA21jNRf
 uiUg==
X-Gm-Message-State: AOAM531Qzub3O0KhXgnzJCQmfz8UJajIKmTTkSV8RXFRmwE/gz0EsSf+
 5K0Lhqqsj2JJSsqOBjcW0fMPkA==
X-Google-Smtp-Source: ABdhPJzcYU0Q7QsepmRT6KYkMrmqU1jUmvusl/ehkTaW1AoUEGp3p/Eox5oq238UDGwWXE0qaV/eiQ==
X-Received: by 2002:a17:906:3586:: with SMTP id
 o6mr3065886ejb.186.1639756550286; 
 Fri, 17 Dec 2021 07:55:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-79-56-50-241.retail.telecomitalia.it. [79.56.50.241])
 by smtp.gmail.com with ESMTPSA id i6sm772158edx.46.2021.12.17.07.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:55:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [RFC PATCH 4/4] mtd: rawnand: gpmi: validate controller clock rate
Date: Fri, 17 Dec 2021 16:55:12 +0100
Message-Id: <20211217155512.1877408-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
References: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_075551_891350_80A695BB 
X-CRM114-Status: GOOD (  21.57  )
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
consider the rate correct only if not greater than the rate of the
previous edo. In fact, in chapter 4.16.2 (NV-DDR) of the document [2],
it is written that "If the host selects timing mode n, then its clock
period shall be faster than the clock period of timing mode n-1 and
slower than or equal to the clock period of timing mode n.". I thought
that it could therefore also be used in this case, without therefore
having to define the valid rate ranges empirically.

[1] https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org
[2] http://www.onfi.org/-/media/client/onfi/specs/onfi_3_0_gold.pdf?la=en

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>

---

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 70 +++++++++++++++++-----
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 0517b81bb24c..3d37cd49abd5 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -570,6 +570,27 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 	return ret;
 }
 
+struct edo_mode {
+	u32 tRC_min;
+	long clk_rate;
+	u8 wrn_dly_sel;
+};
+
+static const struct edo_mode edo_modes[] = {
+	{.tRC_min = 30000, .clk_rate = 22000000,
+	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
+	{.tRC_min = 30000, .clk_rate = 22000000,
+	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
+	{.tRC_min = 30000, .clk_rate = 22000000,
+	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
+	{.tRC_min = 30000, .clk_rate = 22000000,
+	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
+	{.tRC_min = 25000, .clk_rate = 80000000,
+	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY},
+	{.tRC_min = 20000, .clk_rate = 100000000,
+	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY},
+};
+
 /*
  * <1> Firstly, we should know what's the GPMI-clock means.
  *     The GPMI-clock is the internal clock in the gpmi nand controller.
@@ -644,8 +665,8 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
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
@@ -657,22 +678,35 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 	int sample_delay_ps, sample_delay_factor;
 	u16 busy_timeout_cycles;
 	u8 wrn_dly_sel;
+	long clk_rate;
+	int i, emode = -1;
 
-	if (sdr->tRC_min >= 30000) {
-		/* ONFI non-EDO modes [0-3] */
-		hw->clk_rate = 22000000;
-		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
-	} else if (sdr->tRC_min >= 25000) {
-		/* ONFI EDO mode 4 */
-		hw->clk_rate = 80000000;
-		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
-	} else {
-		/* ONFI EDO mode 5 */
-		hw->clk_rate = 100000000;
-		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
+	/* Search the required EDO mode */
+	for (i = 0; i < ARRAY_SIZE(edo_modes); i++) {
+		if (sdr->tRC_min >= edo_modes[i].tRC_min) {
+			emode = i;
+			break;
+		}
+	}
+
+	if (emode < 0) {
+		dev_err(this->dev, "tRC_min %d not supported\n", sdr->tRC_min);
+		return -ENOTSUPP;
+	}
+
+	clk_rate = clk_round_rate(r->clock[0], edo_modes[emode].clk_rate);
+	if (emode > 0 && !(clk_rate <= edo_modes[emode].clk_rate &&
+			   clk_rate > edo_modes[emode - 1].clk_rate)) {
+		dev_err(this->dev,
+			"edo mode %d clock setting: expected %ld, got %ld\n",
+			emode, edo_modes[emode].clk_rate, clk_rate);
+		return -ENOTSUPP;
 	}
 
-	hw->clk_rate = clk_round_rate(r->clock[0], hw->clk_rate);
+	dev_dbg(this->dev, "edo mode %d @ %ld Hz\n", emode, clk_rate);
+
+	hw->clk_rate = clk_rate;
+	wrn_dly_sel = edo_modes[emode].wrn_dly_sel;
 
 	/* SDR core timings are given in picoseconds */
 	period_ps = div_u64((u64)NSEC_PER_SEC * 1000, hw->clk_rate);
@@ -714,6 +748,7 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 		hw->ctrl1n |= BF_GPMI_CTRL1_RDN_DELAY(sample_delay_factor) |
 			      BM_GPMI_CTRL1_DLL_ENABLE |
 			      (use_half_period ? BM_GPMI_CTRL1_HALF_PERIOD : 0);
+	return 0;
 }
 
 static int gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
@@ -769,6 +804,7 @@ static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
 {
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	const struct nand_sdr_timings *sdr;
+	int ret;
 
 	/* Retrieve required NAND timings */
 	sdr = nand_get_sdr_timings(conf);
@@ -784,7 +820,9 @@ static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
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
