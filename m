Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74847C77B78
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Apr 2023 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9/mGtQNYl2j9SyPinju5CFUsFmVnMkV9XimJ8JDSLE=; b=LpELGNxuXdFKSg
	t9Ncq8w4trk90HAsCEEFimeHi2rBK2eIkImxkap8GpdVvyFoh1DG8hafN2s4TbvKzVTbBNDBe7z8n
	eq1rYpqpY8SIp65Ft4U8DI1bIL2+squlC9cHAA1sFVnqH0fkpg1CdmHgzNKeabWOT1JNvh/u7PaIX
	njg7xWD2riktHkKWI6ePj1pj+Hrz866GoLcufAP0bDXlm7/NJi8CB5pEeFfnhJumh+OGAKcPJG0Mu
	8CFNdxt8SgSDNB32yXQLmKxr4eGrC6pXdM6DY+d1thPtTyMqFGa80uV/F5ft+lhjSvzl0vKJVQfDS
	mxlJXJ+BQmOPhz9JLRjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prZmG-0033qr-2Q;
	Wed, 26 Apr 2023 07:41:24 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prZm4-0033kA-1N;
	Wed, 26 Apr 2023 07:41:14 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id EEF355FD6F;
	Wed, 26 Apr 2023 10:41:10 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682494871;
	bh=zhTqodYuLvcUlOf1+GxOKNwBEkLs8HrLOeubP1heQn0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YtHTrESds4DzLFoqftn8bYFJn3jbrHeaVxuCSokV6iQ3Ec5eKcP3foD2KGwc3mGnz
	 Vw94i/dH+EIE/RXkMA6ESWSBTLQq78GPDZZ7DczuhxX9Nb0lEthLNFCjv1/7yGxinD
	 gbTmFlKin7EiGHM8xh0TFemq9HGvVt79xUTidv6ZzyVhEBca/6ngldXvjF+JmAhmfd
	 bpXW+dDxkbn7ADzsWMXsu7oFTF9Xlh4uYJl+3xpzDTNRouQZ5gKNHRFW1ARflBs7ma
	 3QdhlEOf8yqGKWFyOyFImF7PYHSCVcKffABaPZvOdercjQu2idNdi0WxvC4RHIgFsi
	 9ZqBBELbMZRYg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 26 Apr 2023 10:41:10 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/5] mtd: rawnand: meson: fix NAND access for read/write
Date: Wed, 26 Apr 2023 10:36:27 +0300
Message-ID: <20230426073632.3905682-2-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230426073632.3905682-1-AVKrasnov@sberdevices.ru>
References: <20230426073632.3905682-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/26 04:45:00 #21166225
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_004112_816035_286E3AB2 
X-CRM114-Status: GOOD (  16.59  )
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

This fixes read/write functionality. New command sequences were ported
from old vendor's driver. Without this patch driver works unstable. This
change is tested with 'nanddump'/'nandwrite' utilities and mounting
JFFS2 filesystem on AXG family (A113X SoC).

Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 116 ++++++++++++++++++++++++++----
 1 file changed, 101 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 074e14225c06..e828ce3809a9 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -26,6 +26,7 @@
 #define NFC_CMD_IDLE		(0xc << 14)
 #define NFC_CMD_CLE		(0x5 << 14)
 #define NFC_CMD_ALE		(0x6 << 14)
+#define NFC_CMD_DRD		(0x8 << 14)
 #define NFC_CMD_ADL		((0 << 16) | (3 << 20))
 #define NFC_CMD_ADH		((1 << 16) | (3 << 20))
 #define NFC_CMD_AIL		((2 << 16) | (3 << 20))
@@ -84,6 +85,7 @@
 
 #define DMA_BUSY_TIMEOUT	0x100000
 #define CMD_FIFO_EMPTY_TIMEOUT	1000
+#define DEVICE_READY_TIMEOUT	1000
 
 #define MAX_CE_NUM		2
 
@@ -255,8 +257,26 @@ static void meson_nfc_select_chip(struct nand_chip *nand, int chip)
 	}
 }
 
+static int meson_nfc_wait_cmd_finish(struct meson_nfc *nfc,
+				     unsigned int timeout_ms)
+{
+	u32 cmd_size = 0;
+	int ret;
+
+	/* wait cmd fifo is empty */
+	ret = readl_relaxed_poll_timeout(nfc->reg_base + NFC_REG_CMD, cmd_size,
+					 !NFC_CMD_GET_SIZE(cmd_size),
+					 10, timeout_ms * USEC_PER_MSEC);
+	if (ret)
+		dev_err(nfc->dev, "wait for empty CMD FIFO timed out\n");
+
+	return ret;
+}
+
 static void meson_nfc_cmd_idle(struct meson_nfc *nfc, u32 time)
 {
+	meson_nfc_wait_cmd_finish(nfc, 0);
+
 	writel(nfc->param.chip_select | NFC_CMD_IDLE | (time & 0x3ff),
 	       nfc->reg_base + NFC_REG_CMD);
 }
@@ -308,23 +328,9 @@ static void meson_nfc_drain_cmd(struct meson_nfc *nfc)
 	 */
 	meson_nfc_cmd_idle(nfc, 0);
 	meson_nfc_cmd_idle(nfc, 0);
+	meson_nfc_wait_cmd_finish(nfc, 1 * MSEC_PER_SEC);
 }
 
-static int meson_nfc_wait_cmd_finish(struct meson_nfc *nfc,
-				     unsigned int timeout_ms)
-{
-	u32 cmd_size = 0;
-	int ret;
-
-	/* wait cmd fifo is empty */
-	ret = readl_relaxed_poll_timeout(nfc->reg_base + NFC_REG_CMD, cmd_size,
-					 !NFC_CMD_GET_SIZE(cmd_size),
-					 10, timeout_ms * 1000);
-	if (ret)
-		dev_err(nfc->dev, "wait for empty CMD FIFO time out\n");
-
-	return ret;
-}
 
 static int meson_nfc_wait_dma_finish(struct meson_nfc *nfc)
 {
@@ -631,6 +637,48 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 	return 0;
 }
 
+static uint8_t meson_nfc_read_byte(struct nand_chip *nand)
+{
+	struct meson_nfc *nfc = nand_get_controller_data(nand);
+
+	writel(NFC_CMD_DRD, nfc->reg_base + NFC_REG_CMD);
+	meson_nfc_cmd_idle(nfc, nfc->timing.twb);
+	meson_nfc_drain_cmd(nfc);
+
+	return readl(nfc->reg_base + NFC_REG_BUF);
+}
+
+static int meson_nfc_wait_dev_ready(struct nand_chip *nand)
+{
+	struct meson_nfc *nfc = nand_get_controller_data(nand);
+	u32 cs = nfc->param.chip_select;
+	unsigned long cnt = 0;
+
+	meson_nfc_drain_cmd(nfc);
+
+	writel(cs | NFC_CMD_CLE | NAND_CMD_STATUS, nfc->reg_base + NFC_REG_CMD);
+
+	/* 10 ms. */
+	while (cnt < DEVICE_READY_TIMEOUT) {
+		uint8_t status;
+
+		status = meson_nfc_read_byte(nand);
+
+		if (status & NAND_STATUS_READY)
+			break;
+
+		usleep_range(10, 11);
+		cnt++;
+	}
+
+	if (cnt == DEVICE_READY_TIMEOUT) {
+		dev_err(nfc->dev, "device ready timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static int meson_nfc_write_page_sub(struct nand_chip *nand,
 				    int page, int raw)
 {
@@ -643,6 +691,10 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
 	u32 cmd;
 	int ret;
 
+	ret = meson_nfc_wait_dev_ready(nand);
+	if (ret)
+		return ret;
+
 	meson_nfc_select_chip(nand, nand->cur_cs);
 
 	data_len =  mtd->writesize + mtd->oobsize;
@@ -667,12 +719,20 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
 				     NFC_CMD_SCRAMBLER_DISABLE);
 	}
 
+	ret = meson_nfc_wait_dma_finish(nfc);
+	if (ret)
+		return ret;
+
 	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_PAGEPROG;
 	writel(cmd, nfc->reg_base + NFC_REG_CMD);
 	meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tPROG_max));
 
 	meson_nfc_dma_buffer_release(nand, data_len, info_len, DMA_TO_DEVICE);
 
+	ret = meson_nfc_wait_dev_ready(nand);
+	if (ret)
+		return ret;
+
 	return ret;
 }
 
@@ -720,6 +780,21 @@ static void meson_nfc_check_ecc_pages_valid(struct meson_nfc *nfc,
 	} while (!ret);
 }
 
+static inline int meson_nfc_send_read(struct nand_chip *nand)
+{
+	struct meson_nfc *nfc = nand_get_controller_data(nand);
+	u32 cs = nfc->param.chip_select;
+	int ret;
+
+	ret = meson_nfc_wait_dev_ready(nand);
+	if (ret)
+		return ret;
+
+	writel(cs | NFC_CMD_CLE | NAND_CMD_READ0, nfc->reg_base + NFC_REG_CMD);
+
+	return 0;
+}
+
 static int meson_nfc_read_page_sub(struct nand_chip *nand,
 				   int page, int raw)
 {
@@ -734,10 +809,18 @@ static int meson_nfc_read_page_sub(struct nand_chip *nand,
 	data_len =  mtd->writesize + mtd->oobsize;
 	info_len = nand->ecc.steps * PER_INFO_BYTE;
 
+	ret = meson_nfc_wait_dev_ready(nand);
+	if (ret)
+		return ret;
+
 	ret = meson_nfc_rw_cmd_prepare_and_execute(nand, page, DIRREAD);
 	if (ret)
 		return ret;
 
+	ret = meson_nfc_send_read(nand);
+	if (ret)
+		return ret;
+
 	ret = meson_nfc_dma_buffer_setup(nand, meson_chip->data_buf,
 					 data_len, meson_chip->info_buf,
 					 info_len, DMA_FROM_DEVICE);
@@ -754,6 +837,9 @@ static int meson_nfc_read_page_sub(struct nand_chip *nand,
 	}
 
 	ret = meson_nfc_wait_dma_finish(nfc);
+	if (ret)
+		return ret;
+
 	meson_nfc_check_ecc_pages_valid(nfc, nand, raw);
 
 	meson_nfc_dma_buffer_release(nand, data_len, info_len, DMA_FROM_DEVICE);
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
