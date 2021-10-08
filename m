Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED70C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:00:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 541046101B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 541046101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJo8ngfyjsfJJ5xRH2x1lft4WkhiQeOT+m/URxZkCc4=; b=bMoKmw85C4mFSe
	jVdcOxiHOuv3LlpbAjjod+gcZooyPYp6ZXQ15p/b96slXE5krAieCaf0m0PX8LYd5v+b3tlD/Py9T
	u2HgJ+NrkL7U2E7bFjLYExO6+iFKFp9MpQOx0W1+2K4Ju7UMb8MYehwn9paX61k05Lq6tolYJNB+2
	xzpFnf9Q1xONIT/E7N6OaLjGGp7p0oCpOtzu3JXFVUt/dHddHap/d29MIr+BKlWozXn+CDS87+9hx
	6mXbzp7nuaPiH/L6yHYVTi6kO4otCAk+9NTqZr223yjrBtO2/CeLQJjtQx3W0ggtkWmNw8u6FSTPh
	2BzJX7JJuQiwd7iThlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNNU-00GKgI-Fe; Thu, 07 Oct 2021 06:59:40 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNN9-00GKZz-4E
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 06:59:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id x8so3247322plv.8
 for <linux-mtd@lists.infradead.org>; Wed, 06 Oct 2021 23:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/yR4tv/3roNZnetTuH4RfLmYsSUbS549FSDUiBFB+i4=;
 b=VMSAiQyIuoiORfwwnQUw90nwzV5QKc+fKvsn3ze40fz+nqM5gQjoD4O7nF+RkIp/eF
 WXvofZ7DWIIAlZ9F0ReVfivB3hCa3Fi5BMJZchsL4O9lXDf9dwYobz644r9WnR3Jhdoh
 1Hwgt2WgQUpWTQYe+6gbaUhphje+tyd/iHblqLUET1rmkSbT1AvY3lc+fYiL5dG9UQVs
 AThxVa85rOoANwNSCmwasiIIyzNtJa5pFgMghdJtuZEAMWouk1tR5E/fZ3e7CgbMf/wS
 GSvz0fDTs/T+4/JL9cqPe0SOVP2rHldIwLa7+wcsBD5DpK8m1f+yHntsVw/CapTgbQvF
 pvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/yR4tv/3roNZnetTuH4RfLmYsSUbS549FSDUiBFB+i4=;
 b=FhDumcN+YGEL5h5ScboiDCOi9Kp+YJB2mxnEsaGyQe64FLfkjzAM4Fxm0oKZO6mN+d
 bxh5X5CiQ5KDGvamI6Zyg2Sx1R133uzdoOdHuaELqGJM46OMHPSjlxxF6SiKt0+DNfTV
 Pq1ZKqzGCtiz8O3/fmuRF6D2KEzuT+QRemIZ4y/mIKHESjoE9iefWFmFKzSWGniaHvpr
 9xFNy7E42J/6MiwV41RIGDTuc22fo0i/oHYmrhwLQEraxw/Bqtu46KPKPQOmjlQNShcH
 ktzlHGg0+RkJSNBU4EXZ6r5XH/vDr53BYqSeyckEaqT/NJl0/+MLRxeIaOMMbdCEuMX0
 iWyA==
X-Gm-Message-State: AOAM530+ctBvklz/Kc2G/UAS49WaumkwjOWn89v5wzthcNEiqC75dVed
 iO5WBxBR29fdAn3YRN+4FSzGOPpk1+jf7/0S
X-Google-Smtp-Source: ABdhPJz90R0kzTOQiYQXmYCUOQUC5lD4AtO+XwfFU9W0t91vuv/8vLMWT16inIVN7pDnHjB6pzI8og==
X-Received: by 2002:a17:903:2c2:b029:101:9c88:d928 with SMTP id
 s2-20020a17090302c2b02901019c88d928mr2322125plk.62.1633589956028; 
 Wed, 06 Oct 2021 23:59:16 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.googlemail.com with ESMTPSA id u12sm7137844pjr.2.2021.10.06.23.59.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Oct 2021 23:59:15 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH 1/4] mtd: spinand: Add support continuous read mode
Date: Fri,  8 Oct 2021 14:57:56 +0800
Message-Id: <1633676279-29708-2-git-send-email-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633676279-29708-1-git-send-email-zhengxunli.mxic@gmail.com>
References: <1633676279-29708-1-git-send-email-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_235919_196125_3B8ED8C3 
X-CRM114-Status: GOOD (  13.26  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch supports setting the "CONT" bit of the configuration
register and adding a continuous read mode flag for identification.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 17 +++++++++++++++++
 include/linux/mtd/spinand.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 2c8685f..bcdd438 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -193,6 +193,23 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
 
+static int spinand_continuous_read_enable(struct spinand_device *spinand)
+{
+	if (!(spinand->flags & SPINAND_HAS_CONT_READ_BIT))
+		return 0;
+
+	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE,
+			       CFG_CONT_READ_ENABLE);
+}
+
+static int spinand_continuous_read_disable(struct spinand_device *spinand)
+{
+	if (!(spinand->flags & SPINAND_HAS_CONT_READ_BIT))
+		return 0;
+
+	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE, 0);
+}
+
 static int spinand_ecc_enable(struct spinand_device *spinand,
 			      bool enable)
 {
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6988956..04be10e 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -154,6 +154,7 @@
 #define REG_CFG			0xb0
 #define CFG_OTP_ENABLE		BIT(6)
 #define CFG_ECC_ENABLE		BIT(4)
+#define CFG_CONT_READ_ENABLE	BIT(2)
 #define CFG_QUAD_ENABLE		BIT(0)
 
 /* status register */
@@ -307,6 +308,7 @@ struct spinand_ecc_info {
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
+#define SPINAND_HAS_CONT_READ_BIT	BIT(2)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
