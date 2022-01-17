Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316A6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbNqinwRB1FsTu9S5Qh3kImU01YdeuVi+z4KwY4W1Mk=; b=QNRC438eboFZ/I
	jo3QgaVSBxW2GNSvunNKgLKy2RmYvjMtqU9+RpqnoFcDFO16koWD/gSoTl9Voos9ZnHf24BYmzg0D
	nMiMGJcYcvAfmD3tN5/lct/P4JnnCJLbD9kPtUIOiNhJRuPnyt64PnZCSFGEbqLfM8QcjJJZ1Txd5
	cJ18QnwtgbcBBPhLMvgzjjzhjN/UWYYTOdCf76HasPNQR8iyxG1Ts79eGToocND1nnVsZDpoLcyFT
	LtueL18MFrgxoOA/z54dTujJ031bvfV/R0CsBIFlxbxTIYm8yLYfnt58Idol51ir5Tq2VyQaMJoI/
	nl79LSoNFxnJhbN8jVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Uik-00FYc2-JK; Mon, 17 Jan 2022 16:19:02 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Uhz-00FYQR-BZ
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 16:18:17 +0000
Received: by mail-ed1-x52c.google.com with SMTP id f21so10675449eds.11
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2022 08:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gsZSLbMzMCUtYGaf0gWZ0uuBEAA6iy7oiMig3gzLyxY=;
 b=FpzqaeFutVXXlVAX0Ax8r9DmQxyuIHHNFxqePFvmcxbEx4Haz72Vhy6FU1st3+HVP3
 jMIiV5ELJK0BYq1ehNWYCo0MnY0OCqF0r1oWI8QRzSF8kdTlzlmV6UFaEPb/RldxT2yF
 fzNHwU8A8ZksP94/QG8AFrFC7VjeoEb+5cD2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gsZSLbMzMCUtYGaf0gWZ0uuBEAA6iy7oiMig3gzLyxY=;
 b=Y4ireaVnQ5kG5sVsXMq1HzJ6FM/MykaTbFj3KUdmw3FCGF8+icwn3SkE6Gyvgys/Gh
 lYS/JL8Sh4ynVIZN/euyrvVvJ02IgmIjTjONkJDo/wW5w29RMwm8I4xVyWUDKYXkCj62
 dnZWUqrlHT3UVBS2+e6KcNJZITeUYGanT9AKNJtZhq38mKoUErHfsOsPx0kVhNvP7rSg
 Etsc0rGsJUPc/wnAcH0umpKsSHrxCYlKgDOHUuv3Ct7PK08MFpWwc+JFGHtDbSTk403g
 k6dXpJ0XuGYfgPPF5DmCTiTPyai4Zgh86Em8wPGqScVQ29f4JDsLHDzDaeIalUl/Eibo
 cDqw==
X-Gm-Message-State: AOAM532fUfdu07Ek7mB8i7ka4Hn0Zi7HsrI6gRkxW7qvcl7ZyxvVvH65
 WgDl0mp6dMyYHvMrbVPFQNVtPg==
X-Google-Smtp-Source: ABdhPJyK72rzpHJ978ZqYIpz5Z3wLmpWDsmIwzBaJFJ7pygK2XoCLJisgeYMDOuN+6G2IawZhsxHiw==
X-Received: by 2002:a17:907:8a1a:: with SMTP id
 sc26mr17417046ejc.498.1642436294120; 
 Mon, 17 Jan 2022 08:18:14 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id s4sm4147652ejm.146.2022.01.17.08.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 08:18:13 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [RFC PATCH v3 3/4] mtd: rawnand: gpmi: validate controller clock rate
Date: Mon, 17 Jan 2022 17:17:54 +0100
Message-Id: <20220117161755.1863579-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117161755.1863579-1-dario.binacchi@amarulasolutions.com>
References: <20220117161755.1863579-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_081815_427978_DADF3D70 
X-CRM114-Status: GOOD (  22.76  )
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

For example, suppose that gpmi_nfc_compute_timings() is called to set
edo mode 5 (100MHz) but the rate returned by clk_round_rate() is 80MHz
(edo mode 4). In this case gpmi_nfc_compute_timings() will return error,
and will be called again to set edo mode 4, which this time will be
successful.

[1] https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org
[2] http://www.onfi.org/-/media/client/onfi/specs/onfi_3_0_gold.pdf?la=en

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Remove the "mtd: rawnand: gpmi: use a table to get EDO mode setup" patch.
- Simplify the validation logic (suggested by Sascha Hauer <sha@pengutronix.de>).

Changes in v2:
- Fix commit description.
- Add an example to the commit description to better understand the
  problem solved by the patch.
- Split the patch.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 73c3bf59b55e..cf35f4206030 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -644,8 +644,8 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
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
@@ -657,23 +657,33 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 	int sample_delay_ps, sample_delay_factor;
 	u16 busy_timeout_cycles;
 	u8 wrn_dly_sel;
+	unsigned long clk_rate, min_rate;
 
 	if (sdr->tRC_min >= 30000) {
 		/* ONFI non-EDO modes [0-3] */
 		hw->clk_rate = 22000000;
+		min_rate = 0;
 		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
 	} else if (sdr->tRC_min >= 25000) {
 		/* ONFI EDO mode 4 */
 		hw->clk_rate = 80000000;
+		min_rate = 22000000;
 		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
 	} else {
 		/* ONFI EDO mode 5 */
 		hw->clk_rate = 100000000;
+		min_rate = 80000000;
 		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
 	}
 
-	hw->clk_rate = clk_round_rate(r->clock[0], hw->clk_rate);
+	clk_rate = clk_round_rate(r->clock[0], hw->clk_rate);
+	if (clk_rate <= min_rate) {
+		dev_err(this->dev, "clock setting: expected %ld, got %ld\n",
+			hw->clk_rate, clk_rate);
+		return -ENOTSUPP;
+	}
 
+	hw->clk_rate = clk_rate;
 	/* SDR core timings are given in picoseconds */
 	period_ps = div_u64((u64)NSEC_PER_SEC * 1000, hw->clk_rate);
 
@@ -714,6 +724,7 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 		hw->ctrl1n |= BF_GPMI_CTRL1_RDN_DELAY(sample_delay_factor) |
 			      BM_GPMI_CTRL1_DLL_ENABLE |
 			      (use_half_period ? BM_GPMI_CTRL1_HALF_PERIOD : 0);
+	return 0;
 }
 
 static int gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
@@ -769,6 +780,7 @@ static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
 {
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	const struct nand_sdr_timings *sdr;
+	int ret;
 
 	/* Retrieve required NAND timings */
 	sdr = nand_get_sdr_timings(conf);
@@ -784,7 +796,9 @@ static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
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
