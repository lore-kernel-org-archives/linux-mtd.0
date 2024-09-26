Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9A8CDE00B
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H03aBYu8dkGZWeHALR6SSvd9tC4E0BOhQTs/Zk1nWH4=; b=yvC+qKWA8039yI
	mXq0o/PhUCsvcW9Iq0CuBeew/O4D3tWAP7/sq8NIvh3TOOUykMW0+c1+5kP3Yi2509IYG1PQ+ktxv
	ctthlHfbN0foYBnuYdC1ZdSDe1qmseGvyZLygAOEB4gK4fjRpxkGkszMSV8g7iM6iF26uG1UmsDa8
	Rxdtwn73FlK3eh5G9IZcSwWeqSY1nUDMWI6zrp2479k4/FrkE1MYD3tdjlzCIkAmYDqlW4F/OxDIM
	zRx7jOkAhQbaCTkowT+THMbljL7C4CX6Nz2bJPodFTtSOfMm37yKF3Htko6eyE7gGZIHP0sGmFN7M
	ui4gdqgE1n9fNmeyg0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQq-00000008aT7-1svp;
	Thu, 26 Sep 2024 14:25:24 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQl-00000008aP3-1jcb
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 14:25:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2059204f448so9548405ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360718; x=1727965518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaggZDdeca0MsYHdusDRGfZ6Se8lg/cciHsG3Hst56A=;
        b=WJT0eTcgkBvfYvo2U6oA0qE6zrjZNfItw0aFf1863I0PNQu9cVFuQNP5g7BAycjQdP
         QlDeVrlJFXaY5yHMvdQ5QnI7QUN4XzvPrxRVQJxQRZy7sBxWqA/OdqoCd7VmAJT65Rhn
         ZV6Zheer3RwiSTpSVjd5HhsezsMNjP4LLzsQt0DQDqkABd2G5aDS0RIFAWK6yEXFvMzG
         j73XuKDRzCIIwz6bVcasilykZwhINsDfzGm+w/Nql68udEThCmJ7nMGhWuw0SHeMPmS7
         M7G/PcR7WMxcV3fX/8T+1lg+vqzuSa8reSKZYaosajIKh7CTGpLNHrsoBdqMsHr2XRAX
         MCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360718; x=1727965518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaggZDdeca0MsYHdusDRGfZ6Se8lg/cciHsG3Hst56A=;
        b=XnYLsvoMED0V5oKi0p8lwFKQRxh8ie5cMvVcnH3LnFMsEDiDksfU8U2E+xfxqh4L2R
         o1i/5QhzuHFsjOEY/YMUQ3AK+F4a2fKZkxtjl3dEQbUZbL+xhkvNMY3VLn5ZnD1bn+UM
         0eKSS8+MasguCyWm09uwusZ85JFgJAC4hA7ifg1cwZOoIl6YAjYcyGNDbI/sGwO11tgd
         riaJ2705RfVWrw1a6b0+uf0uh0qXokTB8Rdk3/g4PqkP+sM5Kly5A7qX1s0mVcyLcMIz
         LNT+iCYML4O7pcwGSXWtWeTDSpHx+rqpt2pK5/CS1aaIjZNRFw45OF4vHzYgPiDCMzKu
         mLCg==
X-Gm-Message-State: AOJu0Ywhk03Ld8/L0kbnmAf0086VNx5C9XgJNBf/CG5I8BkCw5vZ2Z21
	O49rqtLmvZBEryPyQHIl+s9s+2UO3hcF4dUpMOM0iFUsrJtIPklXsX19yQ==
X-Google-Smtp-Source: AGHT+IFflt3eoiy3X+/8w5aFqI4rEO+u5APN62XJUblKYDy3GPC4kjSQk0j2eANYngkz5DwsNxMibg==
X-Received: by 2002:a17:902:ce02:b0:205:56e8:4a4b with SMTP id d9443c01a7336-20afc42ad4fmr88493905ad.2.1727360717974;
        Thu, 26 Sep 2024 07:25:17 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17e2db1sm39450795ad.178.2024.09.26.07.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:25:17 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 44A7A80529;
	Thu, 26 Sep 2024 22:33:05 +0800 (CST)
From: AlvinZhou <alvinzhou.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw,
	AlvinZhou <alvinzhou@mxic.com.tw>,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v10 5/6] spi: mxic: Add support for swapping byte
Date: Thu, 26 Sep 2024 22:19:55 +0800
Message-Id: <20240926141956.2386374-6-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_072519_566265_237F7DFE 
X-CRM114-Status: GOOD (  15.10  )
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

From: AlvinZhou <alvinzhou@mxic.com.tw>

Some SPI-NOR flash swap the bytes on a 16-bit boundary when
configured in Octal DTR mode. It means data format D0 D1 D2 D3
would be swapped to D1 D0 D3 D2. So that whether controller
support swapping bytes should be checked before enable Octal
DTR mode. Add swap byte support on a 16-bit boundary when
configured in Octal DTR mode for Macronix xSPI host controller
driver.

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
Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
Acked-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-mxic.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 6156d691630a..a669ffa27b65 100644
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
 
+	if (swap16)
+		flags &= ~HC_CFG_DATA_PASS;
+	else
+		flags |= HC_CFG_DATA_PASS;
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
@@ -573,6 +581,7 @@ static const struct spi_controller_mem_ops mxic_spi_mem_ops = {
 static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
 	.dtr = true,
 	.ecc = true,
+	.swap16 = true,
 };
 
 static void mxic_spi_set_cs(struct spi_device *spi, bool lvl)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
