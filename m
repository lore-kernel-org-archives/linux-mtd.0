Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5C6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 11:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUxBXklnovH7wVHiK5uG95PMDojvD6UToqskfTonas8=; b=Td78qFscZOvsUv
	Y4Q6rOZ9xoucOgT0ig6y8gUMp5BQwpLVzE/ezp1y2KXStHebZsxilHRX6BYvLYrADf+Ge1mx8syew
	QlsOru3W3GvWTbfrQHhfO9A45hCBhzQS8/SGfBCrS3H0BWhl4YuVr5dEK/rYVoE8KEc7qn0Lbj4sk
	YURoQxqxTbMCt9alOTAnTvhyIuXwcFWCaCG7PI/+mZPQPCuNmE7AIafeDIO+wDGWUbxdKGKnvRpeI
	Wam9j0S45AN54uIEdYH7uh6jpP6kTbWHKWY4Pn8AMAw31BtDFAi+RO+Zp5NLWUSQ4Yt0BsBVLYh9T
	4THYMgQJaxujH9eSZA9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Q2b-00Ed7Z-Kw; Mon, 17 Jan 2022 11:19:13 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Q21-00EcvN-MO
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 11:18:39 +0000
Received: by mail-ed1-x532.google.com with SMTP id 15so30877256edx.9
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2022 03:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iq4FM2PRLAcot9iAnDMYHV6yAJ0nWXkPdknU80um0hk=;
 b=IB+KjWd8cHfC4D1zKJykFmFfRmcOLwb4vXLkbsk9WocfSgH8I5Zsn7Q+ReAXfRq4tI
 dgQzZE03Y58DdmDRXhZYG8Z1dqsocUfJLE9StlBfkTwhCilKOfJFi1teHXEhCe1mWArK
 n6fxSeoQ62y8Jjc5gCCy3wM37psn7FkhoDwa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iq4FM2PRLAcot9iAnDMYHV6yAJ0nWXkPdknU80um0hk=;
 b=opv7gcYQzQNyY4BrdEyu8TvG1JLeBXVb4IQWSsXcBL2Xsoetz9k/WgmM9zbJ1LqkYA
 CNv953q+V/vXXFugtk3P7IgLcLIuAr+ZTokXLdCbBixy5wRz83gBckTCmVWs4UM/8YBY
 AqvfrmJucl36A5ctMFa+QgmfmAWZktEpk2dPxaZkmAqcznotxiV2467/qO4iBS4t1XZN
 wo1NY6fCGh6fpVSdZL//sC5y9SB10S/tAT2fPrHSb51oKQFifMwO49AfxKzxQfXqju8H
 SsHU2qmIpnbYbH274M65ZZKD9y6VhUIwzfoaDAyofL/qALtma+EsNjuUxD2y9EZXN71B
 0jzA==
X-Gm-Message-State: AOAM531aR5WSFJUeCYqD6DtdrxWOsyGkHjQIgm651lRCLmCd6r1lsOZ5
 YqqPr+8Ug6PNNU0ckZOT9KXtpA==
X-Google-Smtp-Source: ABdhPJz17OYx8Igx0F5Esesia6peK+Jesr70iLxwxSwJi0kzRAjt0Ua+ypjgQwM6s3j3r35pU8cc2g==
X-Received: by 2002:a17:907:3da4:: with SMTP id
 he36mr1872514ejc.707.1642418316340; 
 Mon, 17 Jan 2022 03:18:36 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id f11sm5142713edv.67.2022.01.17.03.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 03:18:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [RFC PATCH v2 2/5] mtd: rawnand: gpmi: fix controller timings setting
Date: Mon, 17 Jan 2022 12:18:26 +0100
Message-Id: <20220117111829.1811997-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
References: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_031837_781191_178FCF32 
X-CRM114-Status: GOOD (  13.92  )
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

Set the controller registers according to the real clock rate. The
controller registers configuration (setup, hold, timeout, ... cycles)
depends on the clock rate of the GPMI. Using the real rate instead of
the ideal one, avoids that this inaccuracy (required_rate - real_rate)
affects the registers setting.

This patch has been tested on two custom boards with i.MX28 and i.MX6
SOCs:
- i.MX28:
  required rate 100MHz, real rate 99.3MHz
- i.MX6
  required rate 100MHz, real rate 99MHz

Fixes: b1206122069a ("mtd: rawnand: gpmi: use core timings instead of an empirical derivation")
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Improve the commit description.
- give examples of frequencies on my setup.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 1b64c5a5140d..73c3bf59b55e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -648,6 +648,7 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 				     const struct nand_sdr_timings *sdr)
 {
 	struct gpmi_nfc_hardware_timing *hw = &this->hw;
+	struct resources *r = &this->resources;
 	unsigned int dll_threshold_ps = this->devdata->max_chain_delay;
 	unsigned int period_ps, reference_period_ps;
 	unsigned int data_setup_cycles, data_hold_cycles, addr_setup_cycles;
@@ -671,6 +672,8 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
 	}
 
+	hw->clk_rate = clk_round_rate(r->clock[0], hw->clk_rate);
+
 	/* SDR core timings are given in picoseconds */
 	period_ps = div_u64((u64)NSEC_PER_SEC * 1000, hw->clk_rate);
 
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
