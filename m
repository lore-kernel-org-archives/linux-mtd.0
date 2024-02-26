Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72B6C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7kjdxqobytg2CWelJDtKL5IDdRUByyZbJxcMCEaWJ54=; b=SYtrEqrIgBifcL
	MvPmRLJgVaLfV6kY0rbByLHIKJGD8nThGQCDqOtzn3tql4vXA2u9odT0rPagHQidUc5OcNRqbCdZn
	i2TWbw9gsyhq7p4BcRfcqGeXRNucDVogT10j7hyxRnNZ6VvTkJPDcT7N09FCP+hyCDbXVg0VxJPY6
	fLL9R/jhfJcesaoGcTJMg8VK+iYh5iqvIIJ2vEgxYYIOvZKQ86UeCFTcYPo8b1IFiF7ooEoGD7e6U
	MUqHBqeZJbUoARFRRPqDHFIjOp5YBwIkzKDRZdY+pcyVzBFOY0+R0tefh/nK7vKm+UskE6Ax72Yde
	k7+6c8gIFhZirfCuo3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rea3Z-00000000YxM-0Olf;
	Mon, 26 Feb 2024 12:26:05 +0000
Received: from mail.thorsis.com ([92.198.35.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rea3Q-00000000Yq6-3LkL;
	Mon, 26 Feb 2024 12:26:02 +0000
From: Alexander Dahl <ada@thorsis.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=default;
	t=1708950344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-transfer-encoding:content-transfer-encoding;
	bh=lI4ikcSlVF3UUdLk19htP1QoiLwNpscT9ljbxdrNkVo=;
	b=O7s4FlkVwvaM6fZGJCet6vxeso9C4vvLVz47WSNwAKRXBRLmVbRQOxfG4lzjPKxZ/lQmos
	tvB1Xs0VlKGGXtAsc8/MR86rmoyIXGGHzVt5GPSeMNFKlhHNfdN2tNYWl0ANYtF+BEC0Xb
	qWIan+y4738eD+0uyq69XDejl3RADeCiTXV0S5+Q/vEzOYUqqyjErNizUxLym9FECb8tP/
	1F/0zSh37rk/HFD4MHfTUUf0tmBxOpLiFgWe/A21YBpPJmo24mRXjOx7cmr/94l3qXry4L
	eAc4NJr0SMyJ/y0ur2ep4Dua5aPDE4LY59WoTgB2yu2JhXARmxk0/qjCJzAIzg==
To: linux-kernel@vger.kernel.org
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mtd: nand: raw: atmel: Fix comment in timings preparation
Date: Mon, 26 Feb 2024 13:25:37 +0100
Message-Id: <20240226122537.75097-1-ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_042557_275937_5CFF5673 
X-CRM114-Status: UNSURE (   9.28  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks like a copy'n'paste mistake introduced when initially adding the
dynamic timings feature with commit f9ce2eddf176 ("mtd: nand: atmel: Add
->setup_data_interface() hooks").  The context around this and
especially the code itself suggests 'read' is meant instead of write.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 4cb478bbee4a..dc75d50d52e8 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1370,23 +1370,23 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
 	 *
 	 * NRD_PULSE = tRP
 	 */
 	ncycles = DIV_ROUND_UP(conf->timings.sdr.tRP_min, mckperiodps);
 	totalcycles += ncycles;
 	ret = atmel_smc_cs_conf_set_pulse(smcconf, ATMEL_SMC_NRD_SHIFT,
 					  ncycles);
 	if (ret)
 		return ret;
 
 	/*
-	 * The write cycle timing is directly matching tWC, but is also
+	 * The read cycle timing is directly matching tRC, but is also
 	 * dependent on the setup and hold timings we calculated earlier,
 	 * which gives:
 	 *
 	 * NRD_CYCLE = max(tRC, NRD_PULSE + NRD_HOLD)
 	 *
 	 * NRD_SETUP is always 0.
 	 */
 	ncycles = DIV_ROUND_UP(conf->timings.sdr.tRC_min, mckperiodps);
 	ncycles = max(totalcycles, ncycles);
 	ret = atmel_smc_cs_conf_set_cycle(smcconf, ATMEL_SMC_NRD_SHIFT,
 					  ncycles);

base-commit: d206a76d7d2726f3b096037f2079ce0bd3ba329b
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
