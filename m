Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B432C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:42:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E1A764FA8
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E1A764FA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k6O6ta3vUVZTF63X1OIasjUkd14JpWLvNINGyyT5XKo=; b=UTTg7sieltZkZKZt6E8gmHc2s
	d/eDCcogDYzFWHVn3OwsFG5RqNAM/pVgvluHz60QnFaLSfNSizLi3yseRskqXvTzMmi6b9hSVBfqa
	GcjnQBE3NaeT5Wr2hL2njupFPnFT9Wyo8hoGTQQ9DlafD8xm68CXDK1CgZcLsBxCG+1aEVILBNuw0
	bkuUTcwXTGH5A+9qbdEVDAHFIJHzenHsQS/K7ujHIDnmzD0YxCiGSD9iyPjVyGwwJwvIjTzYSoFAu
	SFgOhx2XjbGZCW4ifL8KPAa+3FQbTwkNP+cLMhHjRaSKdte82TYNjai/9SXo60WuAHRTMzgj9AiRA
	4TnR3ASBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKeJL-00B3O8-RA; Fri, 12 Mar 2021 09:42:23 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKeJH-00B3NP-7k
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 09:42:22 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso10800615pjb.4
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MpYMosbhX8AZZf+PAzJjI2oMmJW1XVa649SOJll1Xgw=;
 b=XQZmuFTaVoYOJbIpzW0GPWS0bhEUNkkhBWC6Pa/scl1e5f845O+1sROtCnoPwXhX7r
 L9rxzeEOVKNafNdpBKToegblJ+uwrsaZqLTiGzyfnAx8u1OnFldutIRehmKYKlWHP1R8
 jqKjXW7c4iFNwm7s6nHBPOxBClhBkywL0TMYK6ht+1jVznMYFUHPiYlbgF1MWQpTcxuB
 GHkWMvbwDatUVPwNUfMDMdX+4QI9jCPWy3K6rHNiWobfiKR+4Ic8Rh5d4v0cwRMXeadn
 +kQ8rbIbovWJTGFJOD8+F3crJap1WL2bC/hohwmlvKP51G1od6Bx10Dwp2h/PRat6ieY
 N5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MpYMosbhX8AZZf+PAzJjI2oMmJW1XVa649SOJll1Xgw=;
 b=iydVdWUrYSG8UfsigbrBrTs1ePScLL09orfsqKhvqgkMA266UC1KQEXJZ1GGlxQA7b
 Gnfdg4aVHIaCf/Ujwnui78aO1O1XJc1p2YOS0suemNGS0bsglH6TJS7tVVcBYfcnFNw4
 IP8k8EUefpM/ieRU2GrrGM+4K7GnHQbFPzSCaSHxyaU8nqPKCLz0PgLx47rle84t7Vcg
 ipvnQz2aJQfLDaOq6mgxkwuhCFV66y1CfcCeDcISoy3zPodsn6OnQxiGIu+7sdp5cfQx
 QHpi25/vI9hgv3ZrLKrzZIwxo90wMKlW2s7H7QQp3ad6ftDbKxmTaesYzJFuioUQ2y8T
 7a3w==
X-Gm-Message-State: AOAM531LVE3KwZRStF/bQHxIdL/O5nAnIJ/Nri/+2iyCTgrZEy4ex5Lm
 V/0xdcPZPN5JkUHAmYsZ+Mvsam2XNT/6ag==
X-Google-Smtp-Source: ABdhPJwbuS8V+9y60fZbTOHQPHuAtUvJxra/sgayUPbU+BUsRSAc9HHp4x+rJWc2BMqaYwkUrQWTNg==
X-Received: by 2002:a17:90a:d3d8:: with SMTP id
 d24mr12941020pjw.166.1615542137565; 
 Fri, 12 Mar 2021 01:42:17 -0800 (PST)
Received: from ISCNPF1JZGWX.tyo.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id f2sm3768331pfq.129.2021.03.12.01.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:42:17 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Yaliang.Wang@windriver.com,
 tkuw584924@gmail.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 1/6] mtd: spi-nor: core: Add the ->ready() hook
Date: Fri, 12 Mar 2021 18:41:55 +0900
Message-Id: <b6227e01b33da93908066ce14f950d7a0ad8f116.1615523176.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_094220_204497_8FE050A9 
X-CRM114-Status: GOOD (  14.48  )
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

This hook can be used for SPI NOR flashes that do not support legacy
status read method.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v3:
  - New in v3
    The purpose is same as the patch introduced by Yaliang Wang.
    https://patchwork.ozlabs.org/project/linux-mtd/patch/20210301142844.1089385-1-yaliang.wang@windriver.com/  

 drivers/mtd/spi-nor/core.c | 3 ++-
 drivers/mtd/spi-nor/core.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0522304f52fa..c8a7f246ab7d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -826,7 +826,7 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 		if (time_after_eq(jiffies, deadline))
 			timeout = 1;
 
-		ret = spi_nor_ready(nor);
+		ret = nor->params->ready(nor);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -2920,6 +2920,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
 	params->setup = spi_nor_default_setup;
+	params->ready = spi_nor_ready;
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
