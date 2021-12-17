Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2E2C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 16:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMYmVuo8TIvOEnFYBkNHAeNnos/01Cg9IbNc3EWD+ak=; b=dOlZmuYmtwF79r
	oeZu1G5xHSXFKEfXO9etFMrodKnFWaePXYu1AzvnUrn8vkVWeUvjnStslWyZlEX/TGKSCvDCcqgoG
	bQww5MH5HfLkv6WUm8spKlv19LHAE9RLjUbS5Z9mpViBlCM12xH85oEjNx3V3Gck4N8HTAf6fchoV
	uVeuxqcq/tPeUXZo4OJmFZknpkCV06SKZ4rXx/W91Swxke5Qos0IA03O2q+vrDQvS+fpG1tAVElJQ
	W5oLDM/19nC4RX7xrRF6UHBnwHqG2vWechF/DqSJ8ZGpwJT+q+BwuPj2VVt02kN9bVw75/QGg/O3w
	+wEzkP3CGqKa4NNypNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myG41-00BA17-SO; Fri, 17 Dec 2021 16:26:34 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFaI-00B1Tt-Gr
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 15:55:52 +0000
Received: by mail-ed1-x534.google.com with SMTP id y13so9359887edd.13
 for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2021 07:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPyuWnLPH8PFNFJh17BU4dw6g8DK6MUXDTmu7+hfLlY=;
 b=gFDRtlH3e1/Jlp1cAjp2QqkKroRvrg65fXs2p8TfqllBfCqoiogpYwTR2o5QbEEuD/
 OogD9ePzwhTd3y+dc4zEXuNYNse3FghP9+qtQXfNman3VDrKlL33nC10tLbMMRpOpJ+Q
 pj0s34n97SOV7qZy0zdvh0DyIOmt/GleRGk3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPyuWnLPH8PFNFJh17BU4dw6g8DK6MUXDTmu7+hfLlY=;
 b=4kKL2bYnG47S1lcJH0PLSkBlqXK91RodkK1nqDyuYNNoZSgQCnoYOnkvMPrcsJS1bC
 LhySIYyVMJZGyf9Gw9zer/rDLMu2aMTNXd1jKydNbux3qGx3W6wgaaYKcpWLhzxgu6mG
 qEdvbFvvNYbaAYjETEro+lc6WNu4V4wBDAtIxTde5+a6xzO9I/Ml6szhDIfDxb2o1QO+
 SQEQS9xC3vqPw8DQt0qqnzAA8ass/l1GefD1EnOSOog5zyTrFmY6LtBcWnGtbGpb2DNV
 81hw0KRr0vWB1FNxXDSGOl2PFWX5OlhHfvJg2ba1JCcTmxi3kfZJES8WyVqwEmyre1Up
 sjng==
X-Gm-Message-State: AOAM532G+HYjzD0moB6mMisFTHCT/I7QWaLMKxwcuV01SKs3uwrHrmzP
 0w5iGJMxL3NrEHvKFq0Tal2B6w==
X-Google-Smtp-Source: ABdhPJypWJce5q+VYVZqPNebWyJZp9GWchWxQ7EUMp01LDmMnu4A8AyP1ZlWihYdRXcrf843n+1caw==
X-Received: by 2002:aa7:c6c8:: with SMTP id b8mr3513024eds.164.1639756549196; 
 Fri, 17 Dec 2021 07:55:49 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-79-56-50-241.retail.telecomitalia.it. [79.56.50.241])
 by smtp.gmail.com with ESMTPSA id i6sm772158edx.46.2021.12.17.07.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:55:48 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [RFC PATCH 3/4] mtd: rawnand: gpmi: fix controller timings setting
Date: Fri, 17 Dec 2021 16:55:11 +0100
Message-Id: <20211217155512.1877408-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
References: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_075550_623646_D38106F1 
X-CRM114-Status: GOOD (  10.70  )
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

The controller registers are now set accordling to the real clock rate.

Fixes: b1206122069a ("mtd: rawnand: gpmi: use core timings instead of an empirical derivation")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
---

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index fd935e893daf..0517b81bb24c 100644
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
