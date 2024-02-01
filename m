Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4823AC48291
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4d3GjdfoYlFxVj43dshcaa42kNJqCybee2LPhygrr9U=; b=sGsh3nWka9etIV
	+XQpmcOjGrUfuPkgcCmNf0ON2DB3aMOirF77lJIgKbnuAQDh/hOobY4hUYu0qF4j/Z8Lkr/HfGCD/
	cNT5WWtJ10wQCxdTv3qDqbGwecedo1aydNzZoJJQOwFIwqkY68H6U0bp7JqI74U5pBwq9cfBLwR3K
	11yBgjsz2HlH/S2rBRv8Wiu0PWn30ghdxHnDIO1UT/IvWRdFJ5kVUdQFZKnXItK2aqyAdA3rcqaAe
	4mkojLsEz6mqiZ7yXCeLLeYWKw+hWexMgl5TMxC4jUtU3si5g2B+tavZKuIdngUmox4n8wsap4wqo
	D2+hanYH/TYsnl0DIhKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTcB-00000007K7o-0Vne;
	Thu, 01 Feb 2024 09:44:11 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTc5-00000007K3z-02We
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 09:44:06 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2906773c7e9so483350a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 01 Feb 2024 01:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706780643; x=1707385443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9p1hqFhpwmyezDAylCyO9ijrtnaGApEBAjXs9d1j9j8=;
        b=ORKWEL2lbsjnqNwc6f/1gYOSrl+x47Ob5+fECWFjXa4ElQ96gTtbEuaNKjJE2ujJXB
         d0h2aNvrS2zxC1f7Bxnuxx9nMmBrlyRpmkflQGIw6rD9twwJdfBXMO9SfvQ744lahbiT
         L7K00qozT8qG1hrBMDVT0jcqGWR7mLOSL5V1wO3NoBQ/lyscw0axRMcg4iGTngw4jWTK
         NvqqMAdzaJ98VcFErdDrOcbGYgRnY3GH8RGPUm5aFKxNBrg1OOpUR74MG7powJHwXY53
         JKqtvYJg3X2adHUgiFPFTDCmBNXd4fcKzOkxUj7IkKEjiePHpo7aKTKyPZTZ1yHyt2nO
         S4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706780643; x=1707385443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9p1hqFhpwmyezDAylCyO9ijrtnaGApEBAjXs9d1j9j8=;
        b=QCL6XZcYd9muL3vME4yyIh6Ekv4MJ6IfGI3a9jmUE9h0Z4Sk65tfKaz/1tjE5mfHCo
         HNI4Ds0LP9iBEcMfjnCGglC7duZj1ntwikVXPKurPE8gIDtOz+Lj0Sc6YsiPIjY3gACP
         byKc8z7q9xVpmQnBBmLrZCAEhnePeOitPEz6xleWdmYBNas3vdpmDYoNMgdhNAr6AuuO
         I0uthgOf3Aodb9keq1IWOtl74VjpRDYDY+1rLASEVEStU1pu7mQLBwCrD2AIvTBJfY0u
         oJdaYscXTLxjnraljiyqF+qtURckQcmyWC/hiyFcPjcgMA3KnQtcuH0VhX4CA6roRDLj
         UZsg==
X-Gm-Message-State: AOJu0YxZDTxBf3T3Uo6qM07RU2XaxXEg6qMogIvlOg8UFv8o6r4kLsW+
	2L+keiSOjJn3xDAwlQh3x3ZIg7VgMdpJpo2zMXSSyAvScsQ72/fR
X-Google-Smtp-Source: AGHT+IGkrMaMhQS/A714VNYlAynO4jYO03jHC3tGb8cTJ2r0pDDba8IGNFekpVwIQnrGhOIWSd6V9A==
X-Received: by 2002:a17:90b:68e:b0:295:64de:c443 with SMTP id m14-20020a17090b068e00b0029564dec443mr4255154pjz.21.1706780643225;
        Thu, 01 Feb 2024 01:44:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUsYGDwlXy9duJgSAxMCr3nDRpSKgvWccWjfQUhpuI2Id3cYTuFapX/Y8TexuBGPV7gz6wEJ0JEOXfd/IkwG2vdQUAQUtuJ2ea06tcwlQLkqbuqp7lw2ZaqQgM2jn4aX4FFoUZ1OzfV3j+ewlvXsI3Bb/bsV4UWKB8o6q3k7A7X586WfJEA9ZipdiWIUPPkMtm+U+2JbjQ0l5YaflOQyedMvblqWzr8MNDCRwERXVVwGGpzNaG6F5WCVAeY0ndPTeLFXx9yt7HNwehlKndzfCrZWyWlRJ9xFHmq1O4d/hDAtLcW9KEKiTCKf6c0B2w0OCjWHA==
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a17090b004600b00295c3bb9318sm3181376pjt.54.2024.02.01.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:44:02 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 19C7080DF8;
	Thu,  1 Feb 2024 17:50:03 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v8 5/9] spi: mxic: Add support for swapping byte
Date: Thu,  1 Feb 2024 17:43:49 +0800
Message-Id: <20240201094353.33281-6-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_014405_083364_BB2DEFFD 
X-CRM114-Status: GOOD (  15.14  )
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

Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/spi/spi-mxic.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 60c9f3048ac9..8ac302e48c9f 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -294,7 +294,8 @@ static void mxic_spi_hw_init(struct mxic_spi *mxic)
 	       mxic->regs + HC_CFG);
 }
 
-static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags)
+static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags,
+				bool swap16)
 {
 	int nio = 1;
 
@@ -305,6 +306,11 @@ static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags)
 	else if (spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
 		nio = 2;
 
+	if (!swap16)
+		flags |= HC_CFG_DATA_PASS;
+	else
+		flags &= ~HC_CFG_DATA_PASS;
+
 	return flags | HC_CFG_NIO(nio) |
 	       HC_CFG_TYPE(spi_get_chipselect(spi, 0), HC_CFG_TYPE_SPI_NOR) |
 	       HC_CFG_SLV_ACT(spi_get_chipselect(spi, 0)) | HC_CFG_IDLE_SIO_LVL(1);
@@ -397,7 +403,8 @@ static ssize_t mxic_spi_mem_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
 		return -EINVAL;
 
-	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
+	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0, desc->info.op_tmpl.data.swap16),
+	       mxic->regs + HC_CFG);
 
 	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
 	       mxic->regs + LRD_CFG);
@@ -441,7 +448,8 @@ static ssize_t mxic_spi_mem_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
 		return -EINVAL;
 
-	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
+	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0, desc->info.op_tmpl.data.swap16),
+	       mxic->regs + HC_CFG);
 
 	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
 	       mxic->regs + LWR_CFG);
@@ -518,7 +526,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	if (ret)
 		return ret;
 
-	writel(mxic_spi_prep_hc_cfg(mem->spi, HC_CFG_MAN_CS_EN),
+	writel(mxic_spi_prep_hc_cfg(mem->spi, HC_CFG_MAN_CS_EN, op->data.swap16),
 	       mxic->regs + HC_CFG);
 
 	writel(HC_EN_BIT, mxic->regs + HC_EN);
@@ -572,6 +580,7 @@ static const struct spi_controller_mem_ops mxic_spi_mem_ops = {
 
 static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
 	.dtr = true,
+	.swap16 = true,
 	.ecc = true,
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
