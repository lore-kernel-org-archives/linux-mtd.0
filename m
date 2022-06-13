Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89654CCA480
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jun 2022 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pz6vNA7ZTNxcsYzPjTHMc9YdIlrK/f3t6QalsK8TmW4=; b=3sG6J3whph9ulK
	ykMqq09iWuVuf7OVtnNDDb93U1CuWPTmQGRxIBOVGDlGRoyhJD6/bUsyxoTzXG9CJc4r5sLnJNeV0
	jpi8ozT2ZMQwQJos8jukiDUJlycJWcuuBnIlP+9zra10NK6Hs6WcFTpBNiDGuIuYLNO7gVkI9NK5H
	Aae1eALZGMWHQF6LSNsUcx/cBm4vv7DD3H5tCs7LlBviXVI2UcWOwxq4h5jbbikdZ3b02Ps0UR0iR
	3MjIs2VLLKurwuFklzw9Pzl7LU16bh2kFEuLrzBRx4Zlr72Rdi8RRy6n2uo4NQveRLu4QABDRTFCb
	CDOqTPDcSyUVZMQ9OvDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0iHr-003FUN-1m; Mon, 13 Jun 2022 11:31:15 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0iHI-003FAJ-HI
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2022 11:30:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1o0iHB-0008PA-3P; Mon, 13 Jun 2022 13:30:33 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1o0iHA-000Hep-Hn; Mon, 13 Jun 2022 13:30:31 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1o0iH9-006o9i-7k; Mon, 13 Jun 2022 13:30:31 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel@pengutronix.de,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] mtd: rawnand: gpmi: Fix setting busy timeout setting
Date: Mon, 13 Jun 2022 13:30:30 +0200
Message-Id: <20220613113030.1622723-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_043040_638804_786E4F3D 
X-CRM114-Status: GOOD (  14.55  )
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

The DEVICE_BUSY_TIMEOUT value is described in the Reference Manual as:

| Timeout waiting for NAND Ready/Busy or ATA IRQ. Used in WAIT_FOR_READY
| mode. This value is the number of GPMI_CLK cycles multiplied by 4096.

So instead of multiplying the value in cycles with 4096, we have to
divide it by that value. Use DIV_ROUND_UP to make sure we are on the
safe side, especially when the calculated value in cycles is smaller
than 4096 as typically the case.

This bug likely never triggered because any timeout != 0 usually will
do. In my case the busy timeout in cycles was originally calculated as
2408, which multiplied with 4096 is 0x968000. The lower 16 bits were
taken for the 16 bit wide register field, so the register value was
0x8000. With 2970bf5a32f0 ("mtd: rawnand: gpmi: fix controller timings
setting") however the value in cycles became 2384, which multiplied
with 4096 is 0x950000. The lower 16 bit are 0x0 now resulting in an
intermediate timeout when reading from NAND.

Fixes: b1206122069aa ("mtd: rawnand: gpmi: use core timings instead of an empirical derivation")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 0b68d05846e18..889e403299568 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -890,7 +890,7 @@ static int gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 	hw->timing0 = BF_GPMI_TIMING0_ADDRESS_SETUP(addr_setup_cycles) |
 		      BF_GPMI_TIMING0_DATA_HOLD(data_hold_cycles) |
 		      BF_GPMI_TIMING0_DATA_SETUP(data_setup_cycles);
-	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(busy_timeout_cycles * 4096);
+	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(DIV_ROUND_UP(busy_timeout_cycles, 4096));
 
 	/*
 	 * Derive NFC ideal delay from {3}:
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
