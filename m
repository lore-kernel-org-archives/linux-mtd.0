Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DF7C7EE25
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4fg0288qbMs9hoBLuHdd2eeBB1cuDHt/mVzwRo1eYM=; b=kJT+Fp7LGGAGQw
	WdizzgxB9AESWFUnto7+Px+JtsL12UKzngbuIRdwcAb1fvqw2+PyT8TuQtWXUfmwPQZzbwJA4cGfY
	C9u9EB3edh1MjVGAXvHgxZqADri3Kkrl7LCySP2+iOHxf80wxQDbjcKJlr74+1tJcRLf5XP2sohct
	2QPCKBCywgyUPPSVeyljBqfbxTHdS+1q1f75riM7N0+VQt+Bw1PaHaBZAxNAoDfMeDXSukn7V34SL
	nHccsNam4lAinicEy3VsO/fNnwHK55FPQTHa0GraV/oGxE4m3vsn0L7rksWohhQiw/w7ZeI2HRvhn
	a1+B0EwHRYmLMcjptnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6uZm-006JYQ-3A;
	Wed, 07 Jun 2023 14:55:54 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6uZa-006JQy-0Y;
	Wed, 07 Jun 2023 14:55:47 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id DB3E95FD6F;
	Wed,  7 Jun 2023 17:55:34 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686149734;
	bh=rYTGCAplnRx/Dki6x4xZvyofri8ryJP0w/zMyn2mG9Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bAY84eRzKe8qtQzKu8mPTth0pmPT05Zhwk5cK5fGc36EFk8FXXylD4Q4H/tbLQ2Qx
	 e3fRfQ3Va9HCYbRCfuOsplfadTHCKX56CqY3YNM5UZ4U+OZC4NybXbwvc2fiA1qFuI
	 g1kmb32YRw8sm32ElgjJ2ibSUWoa5REjrHx4NP/MTd0JNtNWHTlI8wTZFXf2/K0HVk
	 2nIpunovUWxjbAfVpzB1mqgS82MDZXv/G781zbr7gBN0pWBE1DKXhXdmpdIw6bIXNs
	 cDSJNaWvNYPuhSswzIF60nVxZrCkCQ93zEVPcZj1RxEfn1U0YlS09pyn6JW5ixvYay
	 XfpiiZKCbMDzQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 17:55:34 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] mtd: rawnand: meson: waiting w/o wired ready/busy pin
Date: Wed, 7 Jun 2023 17:50:25 +0300
Message-ID: <20230607145026.2899547-3-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230607145026.2899547-1-AVKrasnov@sberdevices.ru>
References: <20230607145026.2899547-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 09:39:00 #21450961
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_075542_734373_786F43A3 
X-CRM114-Status: GOOD (  19.95  )
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

If there is no wired ready/busy pin, classic way to wait for command
completion is to use function 'nand_soft_waitrdy()'. Meson NAND has
special command which allows to wait for NAND_STATUS_READY bit without
reading status in a software loop (as 'nand_soft_waitrdy()' does). To
use it send this command along with NAND_CMD_STATUS, then wait for an
interrupt, and after interrupt send NAND_CMD_READ0. So this feature
allows to use interrupt driven waiting without wired ready/busy pin.

Suggested-by: Liang Yang <liang.yang@amlogic.com>
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 82 +++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 074e14225c06..935de8e4934d 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -38,6 +38,7 @@
 #define NFC_CMD_SCRAMBLER_DISABLE	0
 #define NFC_CMD_SHORTMODE_DISABLE	0
 #define NFC_CMD_RB_INT		BIT(14)
+#define NFC_CMD_RB_INT_NO_PIN	((0xb << 10) | BIT(18) | BIT(16))
 
 #define NFC_CMD_GET_SIZE(x)	(((x) >> 22) & GENMASK(4, 0))
 
@@ -179,6 +180,7 @@ struct meson_nfc {
 	u32 info_bytes;
 
 	unsigned long assigned_cs;
+	bool no_rb_pin;
 };
 
 enum {
@@ -392,7 +394,42 @@ static void meson_nfc_set_data_oob(struct nand_chip *nand,
 	}
 }
 
-static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
+static int meson_nfc_wait_no_rb_pin(struct meson_nfc *nfc, int timeout_ms,
+				    bool need_cmd_read0)
+{
+	u32 cmd, cfg;
+
+	meson_nfc_cmd_idle(nfc, nfc->timing.twb);
+	meson_nfc_drain_cmd(nfc);
+	meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
+
+	cfg = readl(nfc->reg_base + NFC_REG_CFG);
+	cfg |= NFC_RB_IRQ_EN;
+	writel(cfg, nfc->reg_base + NFC_REG_CFG);
+
+	reinit_completion(&nfc->completion);
+	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_STATUS;
+	writel(cmd, nfc->reg_base + NFC_REG_CMD);
+
+	/* use the max erase time as the maximum clock for waiting R/B */
+	cmd = NFC_CMD_RB | NFC_CMD_RB_INT_NO_PIN | nfc->timing.tbers_max;
+	writel(cmd, nfc->reg_base + NFC_REG_CMD);
+
+	if (!wait_for_completion_timeout(&nfc->completion,
+					 msecs_to_jiffies(timeout_ms)))
+		return -ETIMEDOUT;
+
+	if (need_cmd_read0) {
+		cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_READ0;
+		writel(cmd, nfc->reg_base + NFC_REG_CMD);
+		meson_nfc_drain_cmd(nfc);
+		meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
+	}
+
+	return 0;
+}
+
+static int meson_nfc_wait_rb_pin(struct meson_nfc *nfc, int timeout_ms)
 {
 	u32 cmd, cfg;
 	int ret = 0;
@@ -420,6 +457,27 @@ static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
 	return ret;
 }
 
+static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms,
+			      bool need_cmd_read0)
+{
+	if (nfc->no_rb_pin) {
+		/* This mode is used when there is no wired R/B pin.
+		 * It works like 'nand_soft_waitrdy()', but instead of
+		 * polling NAND_CMD_STATUS bit in the software loop,
+		 * it will wait for interrupt - controllers checks IO
+		 * bus and when it detects NAND_CMD_STATUS on it, it
+		 * raises interrupt. After interrupt, NAND_CMD_READ0 is
+		 * sent as terminator of the ready waiting procedure if
+		 * needed (for all cases except page programming - this
+		 * is reason of 'need_cmd_read0' flag).
+		 */
+		return meson_nfc_wait_no_rb_pin(nfc, timeout_ms,
+						need_cmd_read0);
+	} else {
+		return meson_nfc_wait_rb_pin(nfc, timeout_ms);
+	}
+}
+
 static void meson_nfc_set_user_byte(struct nand_chip *nand, u8 *oob_buf)
 {
 	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
@@ -623,7 +681,7 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 	if (in) {
 		nfc->cmdfifo.rw.cmd1 = cs | NFC_CMD_CLE | NAND_CMD_READSTART;
 		writel(nfc->cmdfifo.rw.cmd1, nfc->reg_base + NFC_REG_CMD);
-		meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tR_max));
+		meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tR_max), true);
 	} else {
 		meson_nfc_cmd_idle(nfc, nfc->timing.tadl);
 	}
@@ -669,7 +727,7 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
 
 	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_PAGEPROG;
 	writel(cmd, nfc->reg_base + NFC_REG_CMD);
-	meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tPROG_max));
+	meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tPROG_max), false);
 
 	meson_nfc_dma_buffer_release(nand, data_len, info_len, DMA_TO_DEVICE);
 
@@ -952,7 +1010,8 @@ static int meson_nfc_exec_op(struct nand_chip *nand,
 			break;
 
 		case NAND_OP_WAITRDY_INSTR:
-			meson_nfc_queue_rb(nfc, instr->ctx.waitrdy.timeout_ms);
+			meson_nfc_queue_rb(nfc, instr->ctx.waitrdy.timeout_ms,
+					   true);
 			if (instr->delay_ns)
 				meson_nfc_cmd_idle(nfc, delay_idle);
 			break;
@@ -1248,6 +1307,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 	struct mtd_info *mtd;
 	int ret, i;
 	u32 tmp, nsels;
+	u32 nand_rb_val;
 
 	nsels = of_property_count_elems_of_size(np, "reg", sizeof(u32));
 	if (!nsels || nsels > MAX_CE_NUM) {
@@ -1287,6 +1347,20 @@ meson_nfc_nand_chip_init(struct device *dev,
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
 
+	ret = of_property_read_u32(np, "nand-rb", &nand_rb_val);
+	if (ret) {
+		/* If property was not found, don't use rb pin. */
+		if (ret == -EINVAL)
+			nfc->no_rb_pin = true;
+		else
+			return -EINVAL;
+	} else {
+		if (nand_rb_val)
+			return -EINVAL;
+
+		nfc->no_rb_pin = false;
+	}
+
 	ret = nand_scan(nand, nsels);
 	if (ret)
 		return ret;
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
