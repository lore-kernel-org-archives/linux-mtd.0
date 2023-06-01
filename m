Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EBFC7EE29
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 06:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIJOArU0aYPBmH6c2352qY6WpKO8t55nLm1bdyODxeY=; b=tiI7caW/PmdOwG
	DMM9Mlr84y7DavwtSbrNPL2se8wn9WqOv6phu5NQtnNYTEPlfCR4dtOUJbT6rDYyBP4mZfHEAyy8z
	NN/LH1ltjpv7Ig4cjENT2mVvqnP4lHBItE3MscEmssKjVXDYlozzHQGXeugbYVwjuQ8MIMplLBkCq
	+eyxqCFvJ0M6UFu+cvvPsAukCFIXbulXcBuGKfl5U6URWyXjinMAFTE9okVWws1N0zfXK0HgWIw7P
	scXhLatFnzwQKnXqazUKsYDweijSkC7MvlWE9s5YpOeqXxaEZShPqSh1ccs2vT6AtSO9ahJwC8BPT
	APzjq/OVN2KCJrTDUvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4bjA-002Akp-1t;
	Thu, 01 Jun 2023 06:24:04 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4bj0-002Ad3-15;
	Thu, 01 Jun 2023 06:23:56 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 975415FD70;
	Thu,  1 Jun 2023 09:23:49 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685600629;
	bh=Q8CW0l91q7Th3XcNDlwzoNWNnWO9BZjhfFIJhYfFY5Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=n6h/JboeFGivZeMmfptLF1Yojq836TdKOmTDWUGHvktQGtmoNpS46uAFA8lda+VXm
	 M5k2YrIXjos5DVNRJZiVR40THbMQ3ndT5YZuxtlxcennsjGvCmFt/kF4b6SgC2fB4Y
	 r6kS5nWRosna4QicZH2S02vxk+QkAvfFFUvdu0FmFZwXjljNfll3AmxN++GwcWFwrg
	 scEETeunJ0nieXS+r0kHROmElgHP2GpK9AhrxcZueRl7G4mOJe0XqACJZsiu014NTA
	 1Tw2Np1un1jNbgaPt4G0jdERNyD63dXF4fC56ev7GG2MdMjRl5sl3m5NlWpqq92u3z
	 ftlY+PG0ucqGA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  1 Jun 2023 09:23:49 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v5 2/6] mtd: rawnand: meson: wait for command in polling mode
Date: Thu, 1 Jun 2023 09:18:45 +0300
Message-ID: <20230601061850.3907800-3-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/01 03:13:00 #21393813
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_232354_921870_155C5B1D 
X-CRM114-Status: GOOD (  16.36  )
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

This adds support of waiting for command completion in sofyware polling
mode. It is needed when ready/busy pin is not implemented in hardware.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 53 ++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 9dd4a676497b..82a629025adc 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -179,6 +179,7 @@ struct meson_nfc {
 	u32 info_bytes;
 
 	unsigned long assigned_cs;
+	bool use_polling;
 };
 
 enum {
@@ -392,32 +393,38 @@ static void meson_nfc_set_data_oob(struct nand_chip *nand,
 	}
 }
 
-static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
+static int meson_nfc_queue_rb(struct nand_chip *nand, int timeout_ms)
 {
-	u32 cmd, cfg;
-	int ret = 0;
+	struct meson_nfc *nfc = nand_get_controller_data(nand);
 
-	meson_nfc_cmd_idle(nfc, nfc->timing.twb);
-	meson_nfc_drain_cmd(nfc);
-	meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
+	if (nfc->use_polling) {
+		return nand_soft_waitrdy(nand, timeout_ms);
+	} else {
+		u32 cmd, cfg;
+		int ret = 0;
 
-	cfg = readl(nfc->reg_base + NFC_REG_CFG);
-	cfg |= NFC_RB_IRQ_EN;
-	writel(cfg, nfc->reg_base + NFC_REG_CFG);
+		meson_nfc_cmd_idle(nfc, nfc->timing.twb);
+		meson_nfc_drain_cmd(nfc);
+		meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
 
-	reinit_completion(&nfc->completion);
+		cfg = readl(nfc->reg_base + NFC_REG_CFG);
+		cfg |= NFC_RB_IRQ_EN;
+		writel(cfg, nfc->reg_base + NFC_REG_CFG);
 
-	/* use the max erase time as the maximum clock for waiting R/B */
-	cmd = NFC_CMD_RB | NFC_CMD_RB_INT
-		| nfc->param.chip_select | nfc->timing.tbers_max;
-	writel(cmd, nfc->reg_base + NFC_REG_CMD);
+		reinit_completion(&nfc->completion);
 
-	ret = wait_for_completion_timeout(&nfc->completion,
-					  msecs_to_jiffies(timeout_ms));
-	if (ret == 0)
-		ret = -1;
+		/* use the max erase time as the maximum clock for waiting R/B */
+		cmd = NFC_CMD_RB | NFC_CMD_RB_INT
+			| nfc->param.chip_select | nfc->timing.tbers_max;
+		writel(cmd, nfc->reg_base + NFC_REG_CMD);
 
-	return ret;
+		ret = wait_for_completion_timeout(&nfc->completion,
+						  msecs_to_jiffies(timeout_ms));
+		if (ret == 0)
+			return -ETIMEDOUT;
+
+		return 0;
+	}
 }
 
 static void meson_nfc_set_user_byte(struct nand_chip *nand, u8 *oob_buf)
@@ -623,7 +630,7 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 	if (in) {
 		nfc->cmdfifo.rw.cmd1 = cs | NFC_CMD_CLE | NAND_CMD_READSTART;
 		writel(nfc->cmdfifo.rw.cmd1, nfc->reg_base + NFC_REG_CMD);
-		meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tR_max));
+		meson_nfc_queue_rb(nand, PSEC_TO_MSEC(sdr->tR_max));
 	} else {
 		meson_nfc_cmd_idle(nfc, nfc->timing.tadl);
 	}
@@ -669,7 +676,7 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
 
 	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_PAGEPROG;
 	writel(cmd, nfc->reg_base + NFC_REG_CMD);
-	meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tPROG_max));
+	meson_nfc_queue_rb(nand, PSEC_TO_MSEC(sdr->tPROG_max));
 
 	meson_nfc_dma_buffer_release(nand, data_len, info_len, DMA_TO_DEVICE);
 
@@ -952,7 +959,7 @@ static int meson_nfc_exec_op(struct nand_chip *nand,
 			break;
 
 		case NAND_OP_WAITRDY_INSTR:
-			meson_nfc_queue_rb(nfc, instr->ctx.waitrdy.timeout_ms);
+			meson_nfc_queue_rb(nand, instr->ctx.waitrdy.timeout_ms);
 			if (instr->delay_ns)
 				meson_nfc_cmd_idle(nfc, delay_idle);
 			break;
@@ -1412,6 +1419,8 @@ static int meson_nfc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	nfc->use_polling = of_property_read_bool(dev->of_node, "polling");
+
 	writel(0, nfc->reg_base + NFC_REG_CFG);
 	ret = devm_request_irq(dev, irq, meson_nfc_irq, 0, dev_name(dev), nfc);
 	if (ret) {
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
