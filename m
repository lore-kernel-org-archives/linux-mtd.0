Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5351EC7EE2A
	for <linux-mtd@archiver.kernel.org>; Mon, 15 May 2023 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=luFCBI7SHOpVSSBEI9Verp/Schf+/ueSU3tC2Nt6tHA=; b=TsJByIl42yeTVX
	9qYWbLidsfrlBLTFjJDFjtaWOpgjXjpg3cSj300E499WHP9+a7ugtFOoo65gc4OoHk3wYO44Ib829
	tLzmRcvBYOEmSTvBbwKD7n/4u+sPzTnINr3v8uZqgRb3a9FUK5aN59QJmEMpp+PsAAwA0raVUThrM
	59Wmx2SOjC7pZrZ8DTMa4CsUYWVw6Lj8qdUx91gn6WGJ23yDyBa2RvozDKu1N7RxD2nS7xr+KisVL
	uXj5R2cb0ZaSPVeLoFJGIYObi4XTc+/dM/FyAOOysuGOMxCtPLyrIfqaBfkai0JDjG5zQREEqMtKU
	yfqr7tfxz9M6hEZ2stvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyUqH-001cuB-2h;
	Mon, 15 May 2023 09:50:09 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyUpy-001cgz-0n;
	Mon, 15 May 2023 09:49:54 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 915EE5FD16;
	Mon, 15 May 2023 12:49:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1684144181;
	bh=Dmj6MVlJqsj8zojvHjdvVHURJoWIYhagZNM7JaN5Dds=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Uf/IsyLUdE2c+v5zkfr9jL/h4IMMipF+j4vKH5XLB675lh5wbPAcDL2sN8H3UJLtp
	 xlpIzpPQTpsqwkFr7iVB2tU8JB6Bm3v6gTiF2Emg1kI27sWm+or+dg2kOie66s6sSM
	 nrMUu76TljNs6mZocS7M/ybbzUAqeJ+DqVdk8F7GDKmK+H3MpPO2676qvGwO6U0wF+
	 kBaCR6iRUe98WX1HlfeDgMKl6NckIRQzd9yLp8zXmym2w8Bdz6zFcXqk8TaGgt+mr2
	 KX51MxCd7d/0UQY8C8zC8EkLWsJ7AxpQTZm0Mtl+sH1rOyVuH1UYyphQSd3KhzuaZ8
	 /GaTuToSVdESg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 15 May 2023 12:49:41 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Yixun Lan
	<yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/5] mtd: rawnand: meson: fix command sequence for read/write
Date: Mon, 15 May 2023 12:44:35 +0300
Message-ID: <20230515094440.3552094-2-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/15 04:03:00 #21308474
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_024950_984402_AC453C93 
X-CRM114-Status: GOOD (  14.79  )
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

This fixes read/write functionality by:
1) Changing NFC_CMD_RB_INT bit value.
2) Adding extra NAND_CMD_STATUS command on each r/w request.
3) Adding extra idle commands during r/w request.
4) Adding extra NAND_CMD_READ0 on each read request.

Without this patch driver works unstable, for example there are a lot
of ECC errors.

Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Suggested-by: Liang Yang <liang.yang@amlogic.com>
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 074e14225c06..2f4d8c84186b 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -37,7 +37,7 @@
 #define NFC_CMD_SCRAMBLER_ENABLE	BIT(19)
 #define NFC_CMD_SCRAMBLER_DISABLE	0
 #define NFC_CMD_SHORTMODE_DISABLE	0
-#define NFC_CMD_RB_INT		BIT(14)
+#define NFC_CMD_RB_INT ((0xb << 10) | BIT(18) | BIT(16))
 
 #define NFC_CMD_GET_SIZE(x)	(((x) >> 22) & GENMASK(4, 0))
 
@@ -392,7 +392,7 @@ static void meson_nfc_set_data_oob(struct nand_chip *nand,
 	}
 }
 
-static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
+static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms, int cmd_read0)
 {
 	u32 cmd, cfg;
 	int ret = 0;
@@ -407,17 +407,29 @@ static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
 
 	reinit_completion(&nfc->completion);
 
+	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_STATUS;
+	writel(cmd, nfc->reg_base + NFC_REG_CMD);
+	meson_nfc_cmd_idle(nfc, 5);
+
 	/* use the max erase time as the maximum clock for waiting R/B */
-	cmd = NFC_CMD_RB | NFC_CMD_RB_INT
-		| nfc->param.chip_select | nfc->timing.tbers_max;
+	cmd = NFC_CMD_RB | NFC_CMD_RB_INT | nfc->timing.tbers_max;
 	writel(cmd, nfc->reg_base + NFC_REG_CMD);
+	meson_nfc_cmd_idle(nfc, 2);
 
 	ret = wait_for_completion_timeout(&nfc->completion,
 					  msecs_to_jiffies(timeout_ms));
 	if (ret == 0)
-		ret = -1;
+		return -1;
 
-	return ret;
+	if (!cmd_read0)
+		return 0;
+
+	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_READ0;
+	writel(cmd, nfc->reg_base + NFC_REG_CMD);
+	meson_nfc_drain_cmd(nfc);
+	meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
+
+	return 0;
 }
 
 static void meson_nfc_set_user_byte(struct nand_chip *nand, u8 *oob_buf)
@@ -623,7 +635,7 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 	if (in) {
 		nfc->cmdfifo.rw.cmd1 = cs | NFC_CMD_CLE | NAND_CMD_READSTART;
 		writel(nfc->cmdfifo.rw.cmd1, nfc->reg_base + NFC_REG_CMD);
-		meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tR_max));
+		meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tR_max), 1);
 	} else {
 		meson_nfc_cmd_idle(nfc, nfc->timing.tadl);
 	}
@@ -669,7 +681,7 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
 
 	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_PAGEPROG;
 	writel(cmd, nfc->reg_base + NFC_REG_CMD);
-	meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tPROG_max));
+	meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tPROG_max), 0);
 
 	meson_nfc_dma_buffer_release(nand, data_len, info_len, DMA_TO_DEVICE);
 
@@ -952,7 +964,7 @@ static int meson_nfc_exec_op(struct nand_chip *nand,
 			break;
 
 		case NAND_OP_WAITRDY_INSTR:
-			meson_nfc_queue_rb(nfc, instr->ctx.waitrdy.timeout_ms);
+			meson_nfc_queue_rb(nfc, instr->ctx.waitrdy.timeout_ms, 1);
 			if (instr->delay_ns)
 				meson_nfc_cmd_idle(nfc, delay_idle);
 			break;
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
