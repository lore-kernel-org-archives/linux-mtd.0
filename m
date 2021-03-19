Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27104C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:54:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFED064F62
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFED064F62
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iSLjm6TPTrdgL5J8ya9tSgBGfDdlLxHNLp+9WNTWi1s=; b=p/wqDZJE2r1ZcPd+NgFLMlpgg
	iMihKut0YIerYmTGW/nS7siBMLQlf47kaQLLhvA+BLSbnw6Cy8WeMQhgxPMlxy3PVxQo15FwguR6h
	HiKl+SD3CTWDgiDNwZItcmidqNiSAzkIgWPT1jCLOXCnW/3Fwr/Tj8K2LLwYQ4Ao7yzSG6FR7yWel
	9g1ovzfRzVuIgBtwWRtUkNAPAYq6Aga5VzMn9vgDRfaSTWl3y/8uiijnAci5soF5Erb8WxY3iMCZ1
	1w+cFReqeSeg0M6POS/Xg4Oy1r/TfuDKHI6o5BnQrigZfc9nK6UhDwUFlnOpKrTldOJ8LYi6OYrql
	zVZ0AwCpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN91U-006jam-Hv; Fri, 19 Mar 2021 06:54:16 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN91Q-006jZm-30
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 06:54:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so4370942pjg.5
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 23:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Yg/eGXImxTvnSrwDgFoFqHzX5c9qLEci19XioMhm7I=;
 b=pmJ18/5noSHZcAPcTuI0R8lA7xeC2qEAQToQTpLKdC3w8SYaQoGW8r5RXnSTbuYp/H
 BQP9sokM4pBbIb2YmDZLFoiIjqHOSqjNKItiThioisyvvOwpwk0xmjSeZPytUvlFPzBa
 1q6Ftd/L3NPgmr99NHcLBs8CBk2aqz2Ub6f8Onu7+TA0qc2lSptJV8PkCC/JkEr4eSG1
 7NAtF3K22wSYCfV171BCJ2B5bNOazf5JZi3uVtVlrByWR0PZDL+B3+skQicmQTcKOUxP
 U0Z7oVpOjRtnwfZctyerLae9nNYrhRdGVIbDNYl3n0XyuNoKoNDlNhnpFboajWFVvOOe
 TWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Yg/eGXImxTvnSrwDgFoFqHzX5c9qLEci19XioMhm7I=;
 b=OHCg9RjeIOpyfY5RCxaiPjlPj2Sqv5rgR68LKt5ZHzIvLHu29/i2fBoHbXS6NQx3bm
 UHCNTyjt+gczv6cgFO+8mUIzuRDbPkHzNWXmp3OZ4PS+cr9gmTte8Wn7Uk04yojDPDug
 9b9GJanzQUpFfZQT9IsCeTrk5WbTg/FV01HgxwQDywSEdQixUqlIP58hAbw/xX+93nAo
 qO6AGbHWMp4HmM6itIfC17xLIoiIWYohg+ornd4orrlQlMV4UwXDvhb9+4q3FXkTDZsW
 zBtUdP52py836MdKoH9d1mzD76IbKM9m2uhbibdK6Zv5G3z+eO3yb06msx5dh3jpVcQA
 xmXw==
X-Gm-Message-State: AOAM531zSjDWFh8wDWngEr4ztaTmas+PSJfEHT1s8y9+Y9OafIhETMR/
 i9XomRv7N06SoS1TvTNcjcmQa1i1PsGnDg==
X-Google-Smtp-Source: ABdhPJxsXJDWBZCvzvqZ6NOYMsw1vgYUvEWaRP5dCPwskvGR0v5GM72GRwvtJKdoaRVe10GFU2NXTg==
X-Received: by 2002:a17:902:eb11:b029:e4:a5c3:4328 with SMTP id
 l17-20020a170902eb11b02900e4a5c34328mr13427047plb.7.1616136850540; 
 Thu, 18 Mar 2021 23:54:10 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id m5sm4410901pfd.96.2021.03.18.23.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 23:54:10 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Yaliang.Wang@windriver.com,
 tkuw584924@gmail.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 1/6] mtd: spi-nor: core: Add the ->ready() hook
Date: Fri, 19 Mar 2021 15:53:46 +0900
Message-Id: <d4984d4270b280b350e6e09b1b101ab099f4c495.1616130675.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_065412_301908_7B0465A8 
X-CRM114-Status: GOOD (  16.73  )
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
