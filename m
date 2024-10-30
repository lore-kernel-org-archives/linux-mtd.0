Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE978D6B6D0
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 19:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhJqUWk6oxoU1lLvK+YUC3PiaoaTtfTic/GFllXOcqM=; b=203jqnnC7qT0I7
	R9SJMbM65yk6Fcn2SZAq5zWqzcqHLh+Tn8Ke9KfTR0XB/yrjZRJX6Wla7kz0H3KetWSibnS7YBAS8
	RSybIVscUjRPpAmpPGke1MyLnYQsL/PmFp0Qvk7sYOVud024CmxAV6FVw3kLJ8LusdryadCMx4ivB
	4eREwpSP7MEypI40kpxUvgzzPqXtSxv59G/ImTUbYorhOHlZ0VTBiAIoLlGLizWTIONnRYum6nK6m
	bVbOOnJewIjjTNgG17cqNFYyrA/LuW3jPlAQI0wA+zoYiCEKea+7k0sB9y3ota37vEpZuFnJdS5V5
	fM598nfkQ0NmBvFUHcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6EhN-00000001Zkf-1dQD;
	Wed, 30 Oct 2024 19:49:45 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Eh5-00000001Zgh-0Zcv
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 19:49:29 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 293B42C028E;
	Thu, 31 Oct 2024 08:49:23 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730317763;
	bh=7MJwVJ1p1VHy6G2vJ9Kg5R9A/A6D8emFGXE0Dw5d1cE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jMxgmYMuTMfEiBbIIK/TrqFdlphXDGEy1pl1HVv/pVAmurNlIj2zNtaCCFi9/vDNk
	 n25VKOHi8YnV2C2WEQDCOuBaGpUOORltOM6R0+3PNgb+xJZ9YUkeF+BOjHTagzn8JD
	 cZdBWYMdEt5nZu9rJtCTWowHMVtct3KMhzvBdDXyXO9XgeN9bOFu6aLZU/io/bQ4+r
	 SN0D//5NynjIqtndTQdj2erlPdhLErSp594nfROYu3Uvz/PhWan3b5bYiohBsGei9i
	 qsaYGljEHTYZ3nw5hG8UFp+tVZVK2QZNg/Nr4GwXp4dPGBWt3iqFDesJWvvTs+blpO
	 VUdrUWE1AGOtQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67228dc20000>; Thu, 31 Oct 2024 08:49:22 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A86CE13ED7B;
	Thu, 31 Oct 2024 08:49:22 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id A224A280456; Thu, 31 Oct 2024 08:49:22 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: broonie@kernel.org,
	miquel.raynal@bootlin.com
Cc: linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2] spi: spi-mem: rtl-snand: Correctly handle DMA transfers
Date: Thu, 31 Oct 2024 08:49:20 +1300
Message-ID: <20241030194920.3202282-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <94ffb58b-3242-4ab4-b09a-686116ced781@alliedtelesis.co.nz>
References: <94ffb58b-3242-4ab4-b09a-686116ced781@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67228dc2 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=lLVWK1Xwrs9e9ZnuNuoA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_124927_679991_70D63AF2 
X-CRM114-Status: GOOD (  14.64  )
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
with this by splitting transfers into appropriately sized parts.

Fixes: 42d20a6a61b8 ("spi: spi-mem: Add Realtek SPI-NAND controller")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - Drop unecessary "also" change. data.in and data.out point to the same
      memory but the latter is marked as const which causes some compiler
      warnings when we're trying to get a dma mapping for it.

 drivers/spi/spi-realtek-rtl-snand.c | 46 +++++++++++++++++++----------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-realtek-rtl-snand.c b/drivers/spi/spi-realtek-rtl-snand.c
index 23c42c8469e4..cd0484041147 100644
--- a/drivers/spi/spi-realtek-rtl-snand.c
+++ b/drivers/spi/spi-realtek-rtl-snand.c
@@ -231,19 +231,22 @@ static int rtl_snand_xfer(struct rtl_snand *snand, int cs, const struct spi_mem_
 
 static int rtl_snand_dma_xfer(struct rtl_snand *snand, int cs, const struct spi_mem_op *op)
 {
+	unsigned int pos, nbytes;
 	int ret;
 	dma_addr_t buf_dma;
 	enum dma_data_direction dir;
-	u32 trig;
+	u32 trig, len, maxlen;
 
 	ret = rtl_snand_xfer_head(snand, cs, op);
 	if (ret)
 		goto out_deselect;
 
 	if (op->data.dir == SPI_MEM_DATA_IN) {
+		maxlen = 2080;
 		dir = DMA_FROM_DEVICE;
 		trig = 0;
 	} else if (op->data.dir == SPI_MEM_DATA_OUT) {
+		maxlen = 520;
 		dir = DMA_TO_DEVICE;
 		trig = 1;
 	} else {
@@ -264,26 +267,37 @@ static int rtl_snand_dma_xfer(struct rtl_snand *snand, int cs, const struct spi_
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
