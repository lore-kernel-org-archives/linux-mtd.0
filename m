Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B503FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AO7OULf/GUOsCN8nTwtPghhIunYWypE5SbCECl8qAoE=; b=pgQyxWGIQIEasj
	fk5A0ZKjshVtw9pjY50typrMLqzgaREPqYqkdIQcK2Z/2qmNY+jL+NkXXdOyneSxPajUWzC2jvpIX
	pgJ1fqVViJVHq3qh7wii7id90qK9idfpCvEZsrJ7OXA+hVCnrsbumBLDDRUVNQurX9KBq4msFL9gI
	jhD4cH6wdRxpnZAl0YOPVN24lW2uYW0W7oIQvKjef+Hpr+ztpWSIY2aAVvjzhfqRNe02wQfZ3mpXq
	feOz0rgsyAj3ybiezIPRZA1XmqZO+hli1dU1xWhLaQ5a40eACchBQVkqML3YZKS0GVbP0t6b/Y8Cp
	7HI1q1KaspQSNnMh5lZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Q2q-00EdCh-M0; Mon, 17 Jan 2022 11:19:28 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Q22-00EcwB-P2
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 11:18:40 +0000
Received: by mail-ed1-x52b.google.com with SMTP id q25so64136020edb.2
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2022 03:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gk6v+zkr/8Bz9MIGt4fGPVyLyGj2QkozkhBTdVX/PUo=;
 b=VIXTBpMjhqZKt4rQ3FtVXzMnmqezrKxs8k1eSDAutK1Jfyt7mC1LZ7DYG5m4sXOeYE
 K94/xRWf2H3fKlAcYXE4wuT6fRf8oiALFqZaYyy3N5mNLpqL9tX+SAmcHQHkhIFd2EZm
 3CkbiYwRHinLAv3PxmapAgT73USBoOxYY/nb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gk6v+zkr/8Bz9MIGt4fGPVyLyGj2QkozkhBTdVX/PUo=;
 b=uZzqS1oxjpRw9Z6Nv9oYBkqt9euZqg9/RUTM1MHzMYxK0bpIHXy6P5DuYpHRbMZV6m
 E1qKKcdXgn08D1llbH25C8baZpNzb3a7zpbXMv8q1B59yhTNuD/bnvkaWs7FKIU+O6FG
 lQYVCLhKnvPdPl9iuaNH28rqPPR2wFr/vPSALZIg1Xmu+UU79/7gHnlgnAT1cmKmeQ8z
 BbSrThWy6u5Vgm2kP0DdyU4/Xj8w0OVeMU47WmCCxpCAb9rJWdSMyj6NjJ4qn2Cv22Lr
 byGfQPZVtkazEAbHh+9OMZISAEPvmzc2/AppS+L8S2AWIOfugnqBbN9QIueg0Mam5NMo
 QpGg==
X-Gm-Message-State: AOAM532RgyqnQnCdzHSVWw+V382ID6oXXKoxu/tw+GIynZASmW+e4E0D
 A7DujsWaqgpd/Znp+9/VXmq9Mw==
X-Google-Smtp-Source: ABdhPJzfcTUuKvzsSykyLHp6DawCurAnU7xOZb2fKrRxwC5e0xT0BSoq7Nb96brhwacD7RdAXwP73A==
X-Received: by 2002:a17:906:49c4:: with SMTP id
 w4mr16071378ejv.745.1642418317529; 
 Mon, 17 Jan 2022 03:18:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id f11sm5142713edv.67.2022.01.17.03.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 03:18:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [RFC PATCH v2 3/5] mtd: rawnand: gpmi: use a table to get EDO mode
 setup
Date: Mon, 17 Jan 2022 12:18:27 +0100
Message-Id: <20220117111829.1811997-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
References: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_031838_849362_D4E2F689 
X-CRM114-Status: GOOD (  15.89  )
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

This is a preparation patch for the upcoming validation of the
GPMI controller clock rate.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Add the patch to the series.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 43 +++++++++++++++-------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 73c3bf59b55e..4ac695aa5131 100644
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
@@ -657,22 +678,18 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 	int sample_delay_ps, sample_delay_factor;
 	u16 busy_timeout_cycles;
 	u8 wrn_dly_sel;
+	int i, emode = ARRAY_SIZE(edo_modes) - 1;
 
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
 	}
 
-	hw->clk_rate = clk_round_rate(r->clock[0], hw->clk_rate);
+	hw->clk_rate = clk_round_rate(r->clock[0], edo_modes[emode].clk_rate);
+	wrn_dly_sel = edo_modes[emode].wrn_dly_sel;
 
 	/* SDR core timings are given in picoseconds */
 	period_ps = div_u64((u64)NSEC_PER_SEC * 1000, hw->clk_rate);
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
