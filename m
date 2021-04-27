Return-Path: <SRS0=EgaJ=JY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B6DC43460
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:10:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 392A1610FB
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 392A1610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=32O2CfJSAXvoXihqnKTcVWC58p0AKx4WamwPzV3/5Kw=; b=rdD/uaKlB9Nv5Vk1sSKU4TDEt
	wdv6anc9mX/M+fPNs2gzb5hbqgTd+sCffaFsChIyqw/VA03cIgumgtNntjA9QSt8G+xxmiNIq45LC
	aC6RyO93N07C/yhIrKqCJV4Y8u8V5vIz4iAb0c7WXP2PD/CtLRK5oe4eeCbSGTj5a5dkheZ4lJP/D
	1BfDqzNmSVpCOzt7yEvL5cyUoaLhnBmLRmpQIjPTgvEwCVzuq19ZEgcEu48cGtUynoKCaXn0t85hk
	dM8NOCp7FOIF/OkxPGUjLvf36+7LkUtMRnsMnAxlNbOBJaJ5SODLVghQnBpUn2ana5G1GCeB8vfmW
	pEjS/0oZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbHr6-000vXr-5i; Tue, 27 Apr 2021 07:10:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqW-000vS4-LR
 for linux-mtd@desiato.infradead.org; Tue, 27 Apr 2021 07:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eR9z+Ji8NDSOLpqPFMExAd+c9AwErHtHJlGp3w2UMv8=; b=2N94Gc75pR9tHbQsc2i5LfuVdu
 uM4myXbR988M6V8ltD7qO/PA0vUZkwWWKsJAPDlxGu5wE+9/LvS7HC79U11X9WW2ApXwaqlNF4v5V
 Cq9Th07NalvHZYvmJsIIWoEPCuW1J7u6Pn3QG+b52sVIZsAdU03LN5rOdS/J0lMF/p7QsMvktpopg
 3KfG/Ye07vHae1ePFZd+kS7uoqnyxDQEOjCxreHmdNMc1b4ZrmarNCtI5oxC/8DxCHXeIsBo6gREp
 b25lwjUWgqQI0Sm8SRIkCWUp6T3D3tzUgwoPnTNcpol8jdW8R6Jewz1Ry1c/gnNYQTYjQ2pnxKciT
 EYGMMb1w==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqT-00GUfO-UT
 for linux-mtd@lists.infradead.org; Tue, 27 Apr 2021 07:09:23 +0000
Received: by mail-pj1-x1032.google.com with SMTP id lr7so12241267pjb.2
 for <linux-mtd@lists.infradead.org>; Tue, 27 Apr 2021 00:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eR9z+Ji8NDSOLpqPFMExAd+c9AwErHtHJlGp3w2UMv8=;
 b=I134BzO4cu123xe1y5RAeHCG9NWLDjpZtxsGMImlCLIZuuPPvH0Z+sILlaW5Dz9/av
 Gr5lL7XSr8i0wxPPwRvUsplWiYTAn/u0iCtGGof50KdBIqd9jHgn3XS5QyxKAz2kYQ75
 ZEBL+OFDt+D9Jlde+EwsIIuVBoClOP9UgQcYF0VnNGB0TJRuzg3bX5FmfrqIvKV9VVd7
 LqOVSHi4uuJc8PQeMAMlYMt5x6Jnbj8S/cIHVBgSslItoNMYWBXnxh4GG+4kCHwpi3aA
 7SRig9R7t6enFvmkSAZYu9YyB7DfecgM/XwvENbqj84RQHMYTGK7hR2JM1ZtqRPW8XET
 yUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eR9z+Ji8NDSOLpqPFMExAd+c9AwErHtHJlGp3w2UMv8=;
 b=V3lG3QDefvRB0cTVXMPOmD43P3Jesrmmc5U+1u210abzOw+t4WD6Noqu8OEDiqDs4d
 VhViMKAIpeUtJgIetxXAKitxDh9c85PP8+Pid8rQntyjBLDVXL4bMQJ8CI9l31Gxydde
 ATVQQWtQWfv3O6ohMVYYAL0ojgtvB6DmbErb4Gd2h0XexFH/n+et6OmB2jAxso8GgLLO
 TFqofc9FEuF+JeNZisbra7WQkLDT1cekWmhT32p9RsIMLeeYsb6msXA9e8FeHVyQ0SkX
 FYL+1qML1UVn2bsw1SjREozjIymeJIwfETUNS3PRWdZ2CO82SnVkGd2c6i5bZhiqie0F
 5kqw==
X-Gm-Message-State: AOAM532puvtjS/v6ylAiHOumJCf5XAZcX3gZ/UT+1uXXMaC+1I5b1fRZ
 OJOUPEgqKSUC2L5t+1gpxt50uFUsfng=
X-Google-Smtp-Source: ABdhPJxLZZTZhDhMLsx/FqjVoXfvkqTrWrCBjSKF7zVQLHNPYQtJtzXrDjEzrB1ViwI9YozgID+izQ==
X-Received: by 2002:a17:90a:1d44:: with SMTP id
 u4mr3468085pju.46.1619507360696; 
 Tue, 27 Apr 2021 00:09:20 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id u189sm1589803pfb.151.2021.04.27.00.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 00:09:20 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v5 1/6] mtd: spi-nor: core: Add the ->ready() hook
Date: Tue, 27 Apr 2021 16:08:56 +0900
Message-Id: <46d97ad6665f72d9c491fae836fa1dc5e55c12b8.1619504535.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
References: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_000922_005298_28711FD3 
X-CRM114-Status: GOOD (  17.27  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

This hook can be used for SPI NOR flashes that do not support default
status read method.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
Changes in v5:
  - No change

Changes in v4:
  - Reword 'legacy' to 'default' in commit description
  - Rename spi_nor_read() to spi_nor_default_ready() 
  
Changes in v3:
  - New in v3
    The purpose is same as the patch introduced by Yaliang Wang.
    https://patchwork.ozlabs.org/project/linux-mtd/patch/20210301142844.1089385-1-yaliang.wang@windriver.com/  

 drivers/mtd/spi-nor/core.c | 8 +++++---
 drivers/mtd/spi-nor/core.h | 2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0522304f52fa..5de72322ae32 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -785,12 +785,13 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_ready() - Query the flash to see if it is ready for new commands.
+ * spi_nor_default_ready() - Query the flash to see if it is ready for new
+ * commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
  * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
-static int spi_nor_ready(struct spi_nor *nor)
+static int spi_nor_default_ready(struct spi_nor *nor)
 {
 	int sr, fsr;
 
@@ -826,7 +827,7 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 		if (time_after_eq(jiffies, deadline))
 			timeout = 1;
 
-		ret = spi_nor_ready(nor);
+		ret = nor->params->ready(nor);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -2920,6 +2921,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
 	params->setup = spi_nor_default_setup;
+	params->ready = spi_nor_default_ready;
 	/* Default to 16-bit Write Status (01h) Command */
 	nor->flags |= SNOR_F_HAS_16BIT_SR;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4a3f7f150b5d..4d06c27630fe 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -218,6 +218,7 @@ struct spi_nor_locking_ops {
  *                      flashes that have peculiarities to the SPI NOR standard
  *                      e.g. different opcodes, specific address calculation,
  *                      page size, etc.
+ * @ready:		checks if the SPI NOR flash is ready.
  * @locking_ops:	SPI NOR locking methods.
  */
 struct spi_nor_flash_parameter {
@@ -238,6 +239,7 @@ struct spi_nor_flash_parameter {
 	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
 	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
 	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
+	int (*ready)(struct spi_nor *nor);
 
 	const struct spi_nor_locking_ops *locking_ops;
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
