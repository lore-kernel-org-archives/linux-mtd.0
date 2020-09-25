Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAEDC4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 06:55:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 785762085B
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 06:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E7hEybFe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rxf2S/HR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 785762085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wpZ6Ud531PX2SSEIAzOlGJ1vBgHxxtChnlJd8fZZhMA=; b=E7hEybFeNXdkZsLqb40qeV+RG
	+LumHOWzkoW42LB9jwC4dK6SOI2utYRZ0ybxiuWmeF5C5lTbePmPeWyXWGsd+CGs+DKKdrq0FczM1
	ZssHR07YdZJF6ArGqcuUe4XPxpOvisAhquhU57Bix8OMyja9J9ZuyBwUDlJYuG2aKX73jg0LyjtwQ
	l4cN9wQQBB6+Loi3pkrFUdkq8Pq1q14s5/agD2w8mFmEJEuLwcxBIP6GJMCOZKhkWRXmmjfzgVtYq
	49EatjtHL+sXMjdYARLTc6ztAoaG+posMMwr4zJh5RuIcWDJkBPQWxIAKZeX6LIdKA3TEimQ7TK+O
	+DL1CyEKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLhdZ-0003hw-DF; Fri, 25 Sep 2020 06:55:21 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLhcr-0003R8-2e
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 06:54:41 +0000
Received: by mail-pg1-x542.google.com with SMTP id m34so1716357pgl.9
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2020 23:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nzcKjvh4JoY0QitgZl8v+rPty87BwMtZ3v0cSqAKG3I=;
 b=Rxf2S/HREm6VaApX0ixCEMuRvDtmyK902EC/jBtCqsg0+QIAQUFpuCw+3FcOZ64fG+
 miJR6LzvQ1KEBuFCLbETuKfsvQgXUEMaKjxffgtLyAZXFRY/68Xkcyg12WeatubDH9gS
 FD0E7XqaU1fZNwm4BaVOKXuTUPgQs3wAJmpUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nzcKjvh4JoY0QitgZl8v+rPty87BwMtZ3v0cSqAKG3I=;
 b=Gxe2lwOFFdTcfpUs7Kf5uxc10rkvbuiXHOiB0lMb+eyZMBpGZ6eylC21svr3jLjmY4
 JPNKB+ufs4SCwzsEBjAQ7/kIVC0bqhhNzXCVTRiirKFg9nG/fvFL/GfywunYvtZKBOT6
 zB1mCwtB1YSNZ0J32RwAalQfZgHl9fD8hzupvunbIcxLsE8XHmDS0zd3QTDzFylWD0zL
 aTYApvReeebEBkwTS9zg7bWfbM7oa2errWV5m/h+iy2/PTN/zO9oAgiuKu3W5vu5zk8Q
 QIIVTiJVeWqz/N4NHkvkrWRXTft8FCV/sOtCSKItFgQJEX072XEogLQg6jUswT0wGy5z
 tc5w==
X-Gm-Message-State: AOAM531uIg4Zam0YkjY3jhFL17BVnkXg1BEAJmrrmdMFq9cfVZnZ613u
 ZqXzZzFHBKgTpMwGSQb6quAWeQ==
X-Google-Smtp-Source: ABdhPJwfu5FpqZVVPhzaJh/cZWIo7V61gqtv5b9Tzw6224GwK/gb1kSsaD1AfFX7zvhQi7lgZOEYOA==
X-Received: by 2002:a63:3192:: with SMTP id x140mr2432715pgx.416.1601016875338; 
 Thu, 24 Sep 2020 23:54:35 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id x27sm1549612pfp.128.2020.09.24.23.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 23:54:34 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 3/6] spi: spi-mtk-nor: support 7 bytes transfer of generic
 spi
Date: Fri, 25 Sep 2020 14:54:14 +0800
Message-Id: <20200925145255.v3.3.I7a3fc5678a81654574e8852d920db94bcc4d3eb8@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200925065418.1077472-1-ikjn@chromium.org>
References: <20200925065418.1077472-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_025437_230655_E067C21B 
X-CRM114-Status: GOOD (  20.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When mtk-nor fallbacks to generic spi transfers, it can actually
transfer up to 7 bytes.

This patch fixes adjust_op_size() and supports_op() to explicitly
check 7 bytes range and also fixes possible under/overflow conditions
in register offsets calculation.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

(no changes since v1)

 drivers/spi/spi-mtk-nor.c | 102 ++++++++++++++++++++++++++++----------
 1 file changed, 76 insertions(+), 26 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 0f7d4ec68730..e7719d249095 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -79,7 +79,11 @@
 #define MTK_NOR_REG_DMA_DADR		0x720
 #define MTK_NOR_REG_DMA_END_DADR	0x724
 
+/* maximum bytes of TX in PRG mode */
 #define MTK_NOR_PRG_MAX_SIZE		6
+/* maximum bytes of TX + RX is 7, last 1 byte is always being sent as zero */
+#define MTK_NOR_PRG_MAX_CYCLES		7
+
 // Reading DMA src/dst addresses have to be 16-byte aligned
 #define MTK_NOR_DMA_ALIGN		16
 #define MTK_NOR_DMA_ALIGN_MASK		(MTK_NOR_DMA_ALIGN - 1)
@@ -167,6 +171,24 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
 	return false;
 }
 
+static bool mtk_nor_check_prg(const struct spi_mem_op *op)
+{
+	size_t len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
+
+	if (len > MTK_NOR_PRG_MAX_SIZE)
+		return false;
+
+	if (!op->data.nbytes)
+		return true;
+
+	if (op->data.dir == SPI_MEM_DATA_OUT)
+		return ((len + op->data.nbytes) <= MTK_NOR_PRG_MAX_SIZE);
+	else if (op->data.dir == SPI_MEM_DATA_IN)
+		return ((len + op->data.nbytes) <= MTK_NOR_PRG_MAX_CYCLES);
+	else
+		return true;
+}
+
 static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
 {
 	size_t len;
@@ -195,10 +217,22 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
 		}
 	}
 
-	len = MTK_NOR_PRG_MAX_SIZE - op->cmd.nbytes - op->addr.nbytes -
-	      op->dummy.nbytes;
-	if (op->data.nbytes > len)
-		op->data.nbytes = len;
+	if (mtk_nor_check_prg(op))
+		return 0;
+
+	len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
+
+	if (op->data.dir == SPI_MEM_DATA_OUT) {
+		if (len == MTK_NOR_PRG_MAX_SIZE)
+			return -EINVAL;
+		op->data.nbytes = min_t(unsigned int, op->data.nbytes,
+					MTK_NOR_PRG_MAX_SIZE - len);
+	} else  {
+		if (len == MTK_NOR_PRG_MAX_CYCLES)
+			return -EINVAL;
+		op->data.nbytes = min_t(unsigned int, op->data.nbytes,
+					MTK_NOR_PRG_MAX_CYCLES - len);
+	}
 
 	return 0;
 }
@@ -206,8 +240,6 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
 static bool mtk_nor_supports_op(struct spi_mem *mem,
 				const struct spi_mem_op *op)
 {
-	size_t len;
-
 	if (op->cmd.buswidth != 1)
 		return false;
 
@@ -223,12 +255,11 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
 			       (op->data.buswidth == 1);
 	}
 
-	len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
-	if ((len > MTK_NOR_PRG_MAX_SIZE) ||
-	    ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
+	/* fallback to generic spi xfer */
+	if (op->cmd.buswidth > 1 || op->addr.buswidth > 1 || op->data.buswidth > 1)
 		return false;
 
-	return true;
+	return mtk_nor_check_prg(op);
 }
 
 static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
@@ -459,22 +490,36 @@ static int mtk_nor_transfer_one_message(struct spi_controller *master,
 	int stat = 0;
 	int reg_offset = MTK_NOR_REG_PRGDATA_MAX;
 	void __iomem *reg;
-	const u8 *txbuf;
-	u8 *rxbuf;
-	int i;
+	int i, tx_len = 0, rx_len = 0;
 
 	list_for_each_entry(t, &m->transfers, transfer_list) {
-		txbuf = t->tx_buf;
-		for (i = 0; i < t->len; i++, reg_offset--) {
+		const u8 *txbuf = t->tx_buf;
+
+		if (!txbuf) {
+			rx_len += t->len;
+			continue;
+		}
+
+		if (rx_len) {
+			stat = -EPROTO;
+			goto msg_done;
+		}
+
+		for (i = 0; i < t->len && reg_offset >= 0; i++, reg_offset--) {
 			reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
-			if (txbuf)
-				writeb(txbuf[i], reg);
-			else
-				writeb(0, reg);
+			writeb(txbuf[i], reg);
+			tx_len++;
 		}
-		trx_len += t->len;
 	}
 
+	while (reg_offset >= 0) {
+		writeb(0, sp->base + MTK_NOR_REG_PRGDATA(reg_offset));
+		reg_offset--;
+	}
+
+	rx_len = min_t(unsigned long, MTK_NOR_PRG_MAX_CYCLES - tx_len, rx_len);
+	trx_len = tx_len + rx_len;
+
 	writel(trx_len * BITS_PER_BYTE, sp->base + MTK_NOR_REG_PRG_CNT);
 
 	stat = mtk_nor_cmd_exec(sp, MTK_NOR_CMD_PROGRAM,
@@ -482,13 +527,18 @@ static int mtk_nor_transfer_one_message(struct spi_controller *master,
 	if (stat < 0)
 		goto msg_done;
 
-	reg_offset = trx_len - 1;
-	list_for_each_entry(t, &m->transfers, transfer_list) {
-		rxbuf = t->rx_buf;
-		for (i = 0; i < t->len; i++, reg_offset--) {
-			reg = sp->base + MTK_NOR_REG_SHIFT(reg_offset);
-			if (rxbuf)
+	if (rx_len > 0) {
+		reg_offset = rx_len - 1;
+		list_for_each_entry(t, &m->transfers, transfer_list) {
+			u8 *rxbuf = t->rx_buf;
+
+			if (!rxbuf)
+				continue;
+
+			for (i = 0; i < t->len && reg_offset >= 0; i++, reg_offset--) {
+				reg = sp->base + MTK_NOR_REG_SHIFT(reg_offset);
 				rxbuf[i] = readb(reg);
+			}
 		}
 	}
 
-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
