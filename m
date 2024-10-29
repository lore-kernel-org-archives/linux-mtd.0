Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFED8D74941
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 21:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOgq2fv0CccKrVRlmvtcA4lEEMKKiOaUPMe2zPujRk4=; b=eMNYLLIIHIN4Dw
	mVh/vS7hsYlaaQ8VWIodvaCtUciOg3R31iUUsNruoS1Ssog+Fd3CQkjvlIQe0lf/Jk49t0QRE9Dxh
	PQ3JjVXDiMYtKuvvmaZwVeytCF1RjE0E8QrTdaykrDXZt97KLfL4snQh+JNonYvUL1PzE3EcbSOUW
	Nr2yuVOH7pQwbkKbS7DAtVY5WyAiTqx3kFJlnG3pARFCpRyd1QPm6KjLdJ5/3bBA674RDxTrrWk3o
	XkZ8k221LmUg/mdGC/0t+yPVCcmA+cu9hAx0lE7DDoA/i2SUperciwdFpi+JlhpRQ+/9L4jX5v0VQ
	a3iJYwiIEI3wxmMFKDIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5u8J-0000000FzMQ-0yAB;
	Tue, 29 Oct 2024 21:52:11 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5u8G-0000000FzLx-0NyK
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 21:52:09 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 957FE2C0213;
	Wed, 30 Oct 2024 10:52:03 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730238723;
	bh=nDPsNw+YIj8Y1uuBIamZoWAOiwuD09KOm6uHsEnflCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bxpHBSamVCHmxoD+QtuB0T5Y2ex2TRZhcYwbZ+GPlD/JSO6S37l6Bgu02WcNmWwwG
	 1e6DmLLI0NRith34zg+vkHlhFH0lKohPEyQJiDfXmEm/Gow/pJkln0OMu32dX4tpn6
	 +0kh7BRcO/jgRHKvzxsBeSfud+iUr7C5blNJ8heixO/UCXVL1yudGc50U1M6c3AQje
	 krsF+8mN512iiRVsU0j+Z3Yri8PW6fwch3l4clIDO5LvT2sPiq7zDdYgRApXfe5Mva
	 Syl92EZpYK9itumu42b+9vAkHpHCPadosL6z4i6FKbKP1C2/norK/Mgjv8QCDPfAJ3
	 sB1HRrY/AmAtw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B672159030000>; Wed, 30 Oct 2024 10:52:03 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3E7C613ED6B;
	Wed, 30 Oct 2024 10:52:03 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 3546E28092F; Wed, 30 Oct 2024 10:52:03 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: broonie@kernel.org,
	miquel.raynal@bootlin.com
Cc: linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] spi: spi-mem: rtl-snand: Correctly handle DMA transfers
Date: Wed, 30 Oct 2024 10:51:59 +1300
Message-ID: <20241029215159.1975844-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <94ffb58b-3242-4ab4-b09a-686116ced781@alliedtelesis.co.nz>
References: <94ffb58b-3242-4ab4-b09a-686116ced781@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67215903 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=e5I0b7u9wi4L-dRFP98A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_145208_632241_7B980588 
X-CRM114-Status: GOOD (  13.52  )
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

The RTL9300 has some limitations on the maximum DMA transfers possible.
For reads this is 2080 bytes (520*4) for writes this is 520 bytes. Deal
with this by splitting transfers into appropriately sized parts. Also
ensure that we are using the correct buffer when doing DMA writes.

Fixes: 42d20a6a61b8 ("spi: spi-mem: Add Realtek SPI-NAND controller")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/spi/spi-realtek-rtl-snand.c | 51 +++++++++++++++++++----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-realtek-rtl-snand.c b/drivers/spi/spi-realtek-rtl-snand.c
index 23c42c8469e4..50b3240641e8 100644
--- a/drivers/spi/spi-realtek-rtl-snand.c
+++ b/drivers/spi/spi-realtek-rtl-snand.c
@@ -231,19 +231,25 @@ static int rtl_snand_xfer(struct rtl_snand *snand, int cs, const struct spi_mem_
 
 static int rtl_snand_dma_xfer(struct rtl_snand *snand, int cs, const struct spi_mem_op *op)
 {
+	unsigned int pos, nbytes;
 	int ret;
 	dma_addr_t buf_dma;
 	enum dma_data_direction dir;
-	u32 trig;
+	u32 trig, len, maxlen;
+	void *buf;
 
 	ret = rtl_snand_xfer_head(snand, cs, op);
 	if (ret)
 		goto out_deselect;
 
 	if (op->data.dir == SPI_MEM_DATA_IN) {
+		maxlen = 2080;
+		buf = op->data.buf.in;
 		dir = DMA_FROM_DEVICE;
 		trig = 0;
 	} else if (op->data.dir == SPI_MEM_DATA_OUT) {
+		maxlen = 520;
+		buf = op->data.buf.out;
 		dir = DMA_TO_DEVICE;
 		trig = 1;
 	} else {
@@ -251,7 +257,7 @@ static int rtl_snand_dma_xfer(struct rtl_snand *snand, int cs, const struct spi_
 		goto out_deselect;
 	}
 
-	buf_dma = dma_map_single(snand->dev, op->data.buf.in, op->data.nbytes, dir);
+	buf_dma = dma_map_single(snand->dev, buf, op->data.nbytes, dir);
 	ret = dma_mapping_error(snand->dev, buf_dma);
 	if (ret)
 		goto out_deselect;
@@ -264,26 +270,37 @@ static int rtl_snand_dma_xfer(struct rtl_snand *snand, int cs, const struct spi_
 	if (ret)
 		goto out_unmap;
 
-	reinit_completion(&snand->comp);
+	pos = 0;
+	len = op->data.nbytes;
 
-	ret = regmap_write(snand->regmap, SNAFDRSAR, buf_dma);
-	if (ret)
-		goto out_disable_int;
+	while (pos < len) {
+		nbytes = len - pos;
+		if (nbytes > maxlen)
+			nbytes = maxlen;
 
-	ret = regmap_write(snand->regmap, SNAFDLR,
-			   CMR_WID(op->data.buswidth) | (op->data.nbytes & 0xffff));
-	if (ret)
-		goto out_disable_int;
+		reinit_completion(&snand->comp);
 
-	ret = regmap_write(snand->regmap, SNAFDTR, trig);
-	if (ret)
-		goto out_disable_int;
+		ret = regmap_write(snand->regmap, SNAFDRSAR, buf_dma + pos);
+		if (ret)
+			goto out_disable_int;
 
-	if (!wait_for_completion_timeout(&snand->comp, usecs_to_jiffies(20000)))
-		ret = -ETIMEDOUT;
+		pos += nbytes;
 
-	if (ret)
-		goto out_disable_int;
+		ret = regmap_write(snand->regmap, SNAFDLR,
+				CMR_WID(op->data.buswidth) | nbytes);
+		if (ret)
+			goto out_disable_int;
+
+		ret = regmap_write(snand->regmap, SNAFDTR, trig);
+		if (ret)
+			goto out_disable_int;
+
+		if (!wait_for_completion_timeout(&snand->comp, usecs_to_jiffies(20000)))
+			ret = -ETIMEDOUT;
+
+		if (ret)
+			goto out_disable_int;
+	}
 
 out_disable_int:
 	regmap_update_bits(snand->regmap, SNAFCFR, SNAFCFR_DMA_IE, 0);
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
