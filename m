Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E5CC3DA60
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 03:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6HIBEDD434IAv7oNDCgkGByUWSpLBu8M1xiqvOZgFY=; b=0tHuO1URox/iX/
	JBauYPPE+hmH95sjQDAVpWXWSB9LCpo90K4F4utFdOu8Il5Pg3KOV2VyUj0/l4pCIyma0Ds6OniAo
	ajSMwoRyuI9WjdVl4sAgmGHaJtTgkJnwaHw+cHnffxTt/4rSYWXAAZ18wtrhUfHJXCclRLMclrM/P
	fBQ7nbsPwQ2MJhUWkjTqo1Br9DEYf6iot7+Q7fsaFX1/NIiXDgaLNygjFzLX1YVlDwY4aBP7y/tnt
	QBJEvNVn+Fz5j1H8rBkLnrXhI3MWEUxkZUnzTLvZnxBU58mdzFaoUC2DBKR2aY6aMEG52mLLWm0Tv
	k5+pW28yjUf72jHhW+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7X-0000000FeXb-2pIP;
	Thu, 18 Jul 2024 03:47:55 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7R-0000000FeRl-2MD9
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 03:47:51 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-260e12aac26so208818fac.0
        for <linux-mtd@lists.infradead.org>; Wed, 17 Jul 2024 20:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721274468; x=1721879268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EhTny12E54Go3rv+a0bpkdQLZomTRFj3isNr2azzvc=;
        b=g0em3cZaplsCWbQoBgPgQpIpI1VvpgxQXhdusSnKuSmGQHL4Qy1rCWv4R7GN4wpOBV
         qHyfnmqAlve2aXYf3WHWAxPFDTVfmIL4cRVp8i9BbvbfpOlnaZ3UBp+ZIqTQWNk5lrmJ
         L4WqUY4ukritX9zcHfF6/6TV2hvah3v1782nu0Z77v1r1LhQ637k4kGw21fG2x/h/q6/
         7elGXAEO6NveVLzNr5SwUWlCdPd+oSTFGTJr6hl8xwWG+e4p0++LKkJi10duQMlD5Bxk
         9Z20JvAANLwViPYT/Yiol/f4V15L6oLiryzD8ORVXMo07R54GfbfRZEQmBm5DOIJt/Eo
         v52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721274468; x=1721879268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EhTny12E54Go3rv+a0bpkdQLZomTRFj3isNr2azzvc=;
        b=dgxzgyvLV+NTQb0QlhcOrrIez2pNPv3NPBtQJaguS0a0hOTmFDqHxArjXE4mljrdVZ
         lUTwaiFjJmNWbZ+zkNz8fji/r3QDhkXTw9m8AHGtv7FmPxKLRIR8j8JRKW9pEKdpdNXw
         Mg81HPZD1NIIfGaIwGYnbi5QLobi5mOfDNf0DnPFL6KjU923ONcgbBqiS2+BfF39juxG
         T2Z1IESvSx4wpazORxEYqAJEvsJmR66+NRx65kSMyDr7vks2rHZYIodMFw8lfVBVNyDQ
         EIbEtH/7n1R/cFJVvhZv/1CFa1ldE29yS4SWobJHdQQz0ZlLmJoHGu2YYV1erEFFdgFC
         Nijg==
X-Gm-Message-State: AOJu0Ywwixm8i3ZmBgxxdne2KZicrP2CtbA9fsfAG+Ehq5jfueRjCDsy
	/MzaQwraGsSmL9rSR6BpwoyYUWU4Z6jrGGW0geW3ISgA/pvGlPCw
X-Google-Smtp-Source: AGHT+IHjdPa9dL94vVwe22uz34q6kOz56dIpRCh5BR8NxoERYLhhAaF0RaRLuSjVEwoiIkL7YKkVuQ==
X-Received: by 2002:a05:6870:2312:b0:25e:d90:fe78 with SMTP id 586e51a60fabf-260d913efeemr3304888fac.8.1721274468237;
        Wed, 17 Jul 2024 20:47:48 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecd27f7sm8854360b3a.218.2024.07.17.20.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:47:47 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 1D11280B09;
	Thu, 18 Jul 2024 11:56:59 +0800 (CST)
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
Subject: [PATCH v9 5/6] spi: mxic: Add support for swapping byte
Date: Thu, 18 Jul 2024 11:46:13 +0800
Message-Id: <20240718034614.484018-6-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_204749_635286_13FF6DA9 
X-CRM114-Status: GOOD (  14.76  )
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
Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
---
 drivers/spi/spi-mxic.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 6156d691630a..f4e2f506bb2a 100644
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
