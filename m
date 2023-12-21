Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F51FC4706C
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V61gb12h+Y7UYMdlWYdH90EfDhSNYIobwCheXjvbfGY=; b=uKxoH+50HwW4dE
	28pftx13L9Qd0tIuw6VSBC9SX121uBmg0OEC+c3pGFUdGSoG2xPYX+pkjZus1WWrnsHP0l6RiG4y4
	kOFPCt6dNYtUqNhTgrHv0Wpv0d1qKAawrQ8yhuJetNgR2N1CJzinbtohLFPP8TvjXVqo4Gb5q3gxd
	Pi5Vvf9yqAdintXTqufANZioCYy0w1w0BxL5HCYKYwnHHXGiH5T1WTx3QrjokoQI+aCl3ykJQAA12
	EDIUrsEDm3QBidCadJyPWbP8gAsQPVuS0g4JCtreV5C8ibU+tUQw5FlIWOeQf/Y84XCOFena0LDPd
	sdgo8FwJgLvZX6WS+IgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGF1g-002B0w-1H;
	Thu, 21 Dec 2023 09:07:32 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGF1a-002AuQ-1C
	for linux-mtd@lists.infradead.org;
	Thu, 21 Dec 2023 09:07:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d40eec5e12so741905ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 01:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703149644; x=1703754444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBiA1ptgmn9lWkMbQ7GSe/GdzNY4x0t8DSW8lQBcT7o=;
        b=gEsj4grx0t3kkc3SxXvCkG32HoEEMx93kh/7hB3vSupfkvED1GrthJZ0GHabTt/reH
         pCWBydTBCkKxSjl2jwDD/A5hsRyAyPDYsY59l+eIpW5+WHNruVyhRA8zko5oO3YGV06n
         ITJyBV0+E7OW+0woMnIE+OzANydgFkU5OUUTtd2xo3/NCdCraH4v3mKRnlobJ6e0q6qk
         YtYpAr3Dk4sbRL3XXbBOIvV3oCJsKV9azNF350I4bV4IAtoeFKq1/y/oVAq7D0vxNsCB
         CC/qPhzKhaINZaRiGZzEYwKCmKzIOk8Yt3Q+h4W1SHGXaCn2XCcr/G4wbBK8uSPDdsAm
         /01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703149644; x=1703754444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBiA1ptgmn9lWkMbQ7GSe/GdzNY4x0t8DSW8lQBcT7o=;
        b=NUOH7sWT3I6AdxeYGzJh9cznA53SgkkS92etTysialD+CF5M6hsY9zg/sDEdH03VyQ
         ZDwaAT7wCwusw6E/wHHOGL+wxaIEQk9NaTJohCFhMhxMLLsepMHGR2K5A/l+G/maCT5f
         GJn/Q9QKVLqyCSwELJjPwxNLa/9xz2pRI7SPOx7lAPI2ZrM47KmFACVoPRueDO4zFC8P
         ksROQljT6VgSw6GnuUt9cBTGcVDs03AyiZOR3BTDBJv2vB3zEQoN3uyccxrbQkKxp0z8
         DwuBRDUCkxw7ODYD0+rgIJC3WT7l/tk4PeTLK1e6RWrITZ4gypVsUnC+nY9DN/XW2Cy5
         49XA==
X-Gm-Message-State: AOJu0Yz5o3fhvFyt0OlKRbuoPQduG8oOHMVQy09qaHJ/kcSrCOzjgDai
	T063nQtozj8pPbXx+EXxdNlCrhuXe0Y=
X-Google-Smtp-Source: AGHT+IHSb2dbaLd/cuBSqvOXzMJOObiypX+Tt1YRTrTtWH+dcTXOH4eLnVXnWdWp0PZX9Es6Ql+uww==
X-Received: by 2002:a17:902:a383:b0:1d0:8dc3:9149 with SMTP id x3-20020a170902a38300b001d08dc39149mr18437867pla.72.1703149643777;
        Thu, 21 Dec 2023 01:07:23 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id u13-20020a17090341cd00b001d3ea8ad878sm1112902ple.290.2023.12.21.01.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:07:21 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 83ACC80649;
	Thu, 21 Dec 2023 17:11:31 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v7 5/7] spi: mxic: Add support for swapping byte
Date: Thu, 21 Dec 2023 17:07:00 +0800
Message-Id: <20231221090702.103027-6-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_010726_421710_D50E6160 
X-CRM114-Status: GOOD (  15.29  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Some SPI-NOR flash swap the bytes on a 16-bit boundary when
configured in Octal DTR mode. It means data format D0 D1 D2 D3
would be swapped to D1 D0 D3 D2. So that whether controller
support swapping bytes should be checked before enable Octal
DTR mode. Add swap byte support on a 16-bit boundary when
configured in Octal DTR mode for Macronix xSPI host controller
dirver.

According dtr_swab in operation to enable/disable Macronix
xSPI host controller swap byte feature.

To make sure swap byte feature is working well, program data in
1S-1S-1S mode then read back and compare read data in 8D-8D-8D
mode.

This feature have been validated on byte-swap flash and
non-byte-swap flash.

Macronix xSPI host controller bit "HC_CFG_DATA_PASS" determine
the byte swap feature disabled/enabled and swap byte feature is
working on 8D-8D-8D mode only.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/spi/spi-mxic.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 60c9f3048ac9..8dc83adaaa88 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -294,7 +294,8 @@ static void mxic_spi_hw_init(struct mxic_spi *mxic)
 	       mxic->regs + HC_CFG);
 }
 
-static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags)
+static u32 mxic_spi_prep_hc_cfg(const struct spi_mem_op *op,
+				struct spi_device *spi, u32 flags)
 {
 	int nio = 1;
 
@@ -305,6 +306,13 @@ static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags)
 	else if (spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
 		nio = 2;
 
+	if (op->data.dtr) {
+		if (op->data.dtr_swab16)
+			flags &= ~HC_CFG_DATA_PASS;
+		else
+			flags |= HC_CFG_DATA_PASS;
+	}
+
 	return flags | HC_CFG_NIO(nio) |
 	       HC_CFG_TYPE(spi_get_chipselect(spi, 0), HC_CFG_TYPE_SPI_NOR) |
 	       HC_CFG_SLV_ACT(spi_get_chipselect(spi, 0)) | HC_CFG_IDLE_SIO_LVL(1);
@@ -397,7 +405,8 @@ static ssize_t mxic_spi_mem_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
 		return -EINVAL;
 
-	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
+	writel(mxic_spi_prep_hc_cfg(&desc->info.op_tmpl,
+				    desc->mem->spi, 0), mxic->regs + HC_CFG);
 
 	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
 	       mxic->regs + LRD_CFG);
@@ -441,7 +450,8 @@ static ssize_t mxic_spi_mem_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
 		return -EINVAL;
 
-	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
+	writel(mxic_spi_prep_hc_cfg(&desc->info.op_tmpl,
+				    desc->mem->spi, 0), mxic->regs + HC_CFG);
 
 	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
 	       mxic->regs + LWR_CFG);
@@ -518,7 +528,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	if (ret)
 		return ret;
 
-	writel(mxic_spi_prep_hc_cfg(mem->spi, HC_CFG_MAN_CS_EN),
+	writel(mxic_spi_prep_hc_cfg(op, mem->spi, HC_CFG_MAN_CS_EN),
 	       mxic->regs + HC_CFG);
 
 	writel(HC_EN_BIT, mxic->regs + HC_EN);
@@ -572,6 +582,7 @@ static const struct spi_controller_mem_ops mxic_spi_mem_ops = {
 
 static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
 	.dtr = true,
+	.dtr_swab16 = true,
 	.ecc = true,
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
