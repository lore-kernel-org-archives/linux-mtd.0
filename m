Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DD3C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 10:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tcqj2wvJnZQwXkaDRt2tUm4JAiNvljJHEOl4xAkLpso=; b=NbVcsBjBn9AvDS
	qqUeHKgIprwIP0ze4c5ZJw0jczN+j5Ty9TtjKZy65h7si3jx67xlKWJPqjgP4SnsBDFJGjlUos5fl
	84xqKCFcrFYPxo4DUklRX3fqGv/bNA+kiRwCTz1zmky1QaP9pnnzCMcCLYKfLcF9InD3Jq+Y2ReoM
	UceoDkl0nb0iJpro+5J2xegTdb8SB8Rl+jhjSBJvPjlquwVfxw4zdZ9Qkkf8Ji9Hfrz5ExlZAm4Vz
	twlQVuHqHwj+hDNeADeErXTwc8QKD6EP4fIf4h2TLWqjKgjrzFPYfMXmllz4nHiL4klQale0XlVqN
	acZUgGIbUGzgUI0Y1L5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TpX-0019v8-32;
	Tue, 06 Jun 2023 10:22:23 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TpS-0019s6-02;
	Tue, 06 Jun 2023 10:22:20 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id CF6835FD1B;
	Tue,  6 Jun 2023 13:22:07 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686046927;
	bh=DTBB8jOO77vAsxmiB/i7I8AL4Y5HWSjjJbkLXHcxMxY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IWy/fUlAKarZIURZ2S8lVHBjPYVcItMkVqJahSnQb8MZcKSTbqACk4UPLrXx7FLzK
	 J0p9mFLwW2hBU0f6GZtZVCdFtjHg828gCqRRoirrS+t0QYzxSRpci5x7JCfVKjuzHA
	 So1aAl8dxz3LeFi1zf+uG1htVtaH//OLvWj0Rey8YY10jyeuZbVawWeShdRFEmEWMp
	 X8enaFbnsAvtOSwXflXLqPlqEL22+y5reYcffxPIU0JcXYOJQkN/cxviSV5sW97+ou
	 3ItNT1+TMqwFXNxHvA8050B5bWXpIR5LKaBatPFLF4RRR7kkDHuBUmecooP4/OxRyh
	 s/WEctiWRU/ow==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 13:22:06 +0300 (MSK)
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
Subject: [PATCH v2] mtd: rawnand: meson: check buffer length
Date: Tue, 6 Jun 2023 13:16:43 +0300
Message-ID: <20230606101644.3297859-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/06 07:40:00 #21442908
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_032218_746296_C649DDF8 
X-CRM114-Status: GOOD (  14.82  )
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

Meson NAND controller has limited buffer length, so check it before
command execution to avoid length trim. Also check MTD write size on
chip attach.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 47 +++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 23a73268421b..db6b18753071 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -111,6 +111,8 @@
 
 #define PER_INFO_BYTE		8
 
+#define NFC_CMD_RAW_LEN	GENMASK(13, 0)
+
 struct meson_nfc_nand_chip {
 	struct list_head node;
 	struct nand_chip nand;
@@ -284,7 +286,7 @@ static void meson_nfc_cmd_access(struct nand_chip *nand, int raw, bool dir,
 
 	if (raw) {
 		len = mtd->writesize + mtd->oobsize;
-		cmd = (len & GENMASK(13, 0)) | scrambler | DMA_DIR(dir);
+		cmd = len | scrambler | DMA_DIR(dir);
 		writel(cmd, nfc->reg_base + NFC_REG_CMD);
 		return;
 	}
@@ -573,7 +575,7 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 	if (ret)
 		goto out;
 
-	cmd = NFC_CMD_N2M | (len & GENMASK(13, 0));
+	cmd = NFC_CMD_N2M | len;
 	writel(cmd, nfc->reg_base + NFC_REG_CMD);
 
 	meson_nfc_drain_cmd(nfc);
@@ -597,7 +599,7 @@ static int meson_nfc_write_buf(struct nand_chip *nand, u8 *buf, int len)
 	if (ret)
 		return ret;
 
-	cmd = NFC_CMD_M2N | (len & GENMASK(13, 0));
+	cmd = NFC_CMD_M2N | len;
 	writel(cmd, nfc->reg_base + NFC_REG_CMD);
 
 	meson_nfc_drain_cmd(nfc);
@@ -1007,6 +1009,31 @@ meson_nand_op_put_dma_safe_output_buf(const struct nand_op_instr *instr,
 		kfree(buf);
 }
 
+static int meson_nfc_check_op(struct nand_chip *chip,
+			      const struct nand_operation *op)
+{
+	int op_id;
+
+	for (op_id = 0; op_id < op->ninstrs; op_id++) {
+		const struct nand_op_instr *instr;
+
+		instr = &op->instrs[op_id];
+
+		switch (instr->type) {
+		case NAND_OP_DATA_IN_INSTR:
+		case NAND_OP_DATA_OUT_INSTR:
+			if (instr->ctx.data.len > NFC_CMD_RAW_LEN)
+				return -ENOTSUPP;
+
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int meson_nfc_exec_op(struct nand_chip *nand,
 			     const struct nand_operation *op, bool check_only)
 {
@@ -1015,10 +1042,12 @@ static int meson_nfc_exec_op(struct nand_chip *nand,
 	const struct nand_op_instr *instr = NULL;
 	void *buf;
 	u32 op_id, delay_idle, cmd;
+	int err;
 	int i;
 
-	if (check_only)
-		return 0;
+	err = meson_nfc_check_op(nand, op);
+	if (err || check_only)
+		return err;
 
 	meson_nfc_select_chip(nand, op->cs);
 	for (op_id = 0; op_id < op->ninstrs; op_id++) {
@@ -1293,6 +1322,7 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
 	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	int nsectors = mtd->writesize / 1024;
+	int raw_writesize;
 	int ret;
 
 	if (!mtd->name) {
@@ -1304,6 +1334,13 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
 			return -ENOMEM;
 	}
 
+	raw_writesize = mtd->writesize + mtd->oobsize;
+	if (raw_writesize > NFC_CMD_RAW_LEN) {
+		dev_err(nfc->dev, "too big write size in raw mode: %d > %ld\n",
+			raw_writesize, NFC_CMD_RAW_LEN);
+		return -EINVAL;
+	}
+
 	if (nand->bbt_options & NAND_BBT_USE_FLASH)
 		nand->bbt_options |= NAND_BBT_NO_OOB;
 
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
