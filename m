Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C75C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jan 2022 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hg1ghBZ5W5xVAAfCvJqW6jUs678DLSbxB68mOGjacVY=; b=KOMEKm4lvDuaMi
	fkTm4ol8SEblD6dW9ggpOBTHtK4GUVehb+5wwb+bISHotyvuQrqsLOaEwq5srEBcEbqPDeEwjbjoD
	1ChT4Ox7PSrZIA/GKdf4huIaRxosk/JWP/U/UW745Zk9vonVfMvxkK3PwRx90pEC4yCDfe9nbCwmx
	BBW1i+gUmTifmzmG4frSq/9LrNbl0VJ4MQuXdzb3PuADAvKQX6xaHD1e9jarqhyGnwtWvxBRpQ6k9
	c+2cbNJ24QrqmIwFDyMGNtLoG/89FHoLHcjp2yLoxn2FvpR/tiy/BuNfohGb9lMKtE0ww6D5a8av7
	oZLotk0OYC1adSXoNrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9lDV-0010Oh-Py; Tue, 18 Jan 2022 09:55:53 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9lCo-00109Q-OI
 for linux-mtd@lists.infradead.org; Tue, 18 Jan 2022 09:55:12 +0000
Received: by mail-ed1-x530.google.com with SMTP id c71so76964229edf.6
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jan 2022 01:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xehe2GRXgQYN/+dRP8wnpXRUBfEHFaQIKrZHmlK7Gkc=;
 b=NMnFrZh7b8z20cbVj3sAC5udzo0Oe3RiHbKJ4a7YROrEsX9NWwDvwnCQauIsX7znwX
 vfO8jWzwD6YjeImeo1BVOO6VmJcl/7gO8SyZKMwLtURaGByFHq4k1jzlGCGqkWaTP8qP
 7BpUqTWIqmaj5zYmvIzm/tj+dQtEMK8YpLQqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xehe2GRXgQYN/+dRP8wnpXRUBfEHFaQIKrZHmlK7Gkc=;
 b=CUbGyVyJt6HZKIDLfuCoPDS2mTl66mF3HVgweLl35vdDL7TTMTG84cvoY5K4gZh+dW
 q9ld7hr9pJ7kG/8Za7p2/i/aNsvZbO4v11bmhGj6yMy/3WMx4kV7BWaAw2EzuivxgQNF
 OK1W2w8xTkeRVnODgxk2F784kk+P6ugUl95WWwB9zg7dk4a6pe4EDYHDuuSgvDsn9veK
 cv4WrWqqDoe3z9J5m4X4TfPy3TB89z7PhpdHcJ37GoysZmgXkDO2QLePi47+XGX5fcJG
 /39es3BkTD/YLiix0UJgoVWKVxriqnJi12NyBAH4iHp587nu50c7g6iMR6Jbj/KoQ7uC
 sYVg==
X-Gm-Message-State: AOAM531QrpIx/75IhR+ZMXU4TJcG8k+ti7S6RE3cLtWtBTtoQCQsw3lh
 NvHZlHRoScpcnAVXeH9vd7QguQ==
X-Google-Smtp-Source: ABdhPJwWEKhNqf1JZzX3FA0R0DGU3cjYeegcCormXg5HGMlO+9TulADkuk8ct4HcDBxgzuptFuLYHg==
X-Received: by 2002:a17:906:4983:: with SMTP id
 p3mr20017289eju.589.1642499709124; 
 Tue, 18 Jan 2022 01:55:09 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id w3sm5173520eji.134.2022.01.18.01.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 01:55:08 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <bbrezillon@kernel.org>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] mtd: rawnand: gpmi: fix controller timings setting
Date: Tue, 18 Jan 2022 10:54:32 +0100
Message-Id: <20220118095434.35081-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220118095434.35081-1-dario.binacchi@amarulasolutions.com>
References: <20220118095434.35081-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_015510_836986_AE3DDEB7 
X-CRM114-Status: GOOD (  13.85  )
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
Tested-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
---

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
