Return-Path: <SRS0=s2V4=OO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE47C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Sep 2021 13:42:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F83B61039
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Sep 2021 13:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F83B61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oIrIKLrCdBP6F4ZtT80ZZOUTOLwetnpgCLb+hq3e7co=; b=1jD5EbCQC6duUV
	UOABKdrPI/PApo7KZCKBT5lBzVN7Xh/DYATzaiIKxBEutGfkOaboeUybrqQnSQuM8eSfMZDyhkGk5
	UFDdt+oYSNF5KO+Ewwiyypg0F2lyOtT9Gg5ZCX3etagHF0AiTeylJ5Ol/asX7wirrESFw1zyr4Rgb
	3X98xxvDlW/I5x8U66QKgVbZ4QGNTus/s/NHDLIYlK2Vfd20Lp/fCo7oFcxMU/qK2w31axKTrT1nA
	9sMxZxpI/i6hCWtd3g8pwqkSc7hWxuWfZx/MoBy6nRcl+GGQFS+bsFQSeo0xHJJu1mnXM7pYXX3sv
	QFcdGDBrYYsso/lrUXnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTlRg-00EfDe-Jm; Fri, 24 Sep 2021 13:40:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTlJz-00EcC0-6j
 for linux-mtd@lists.infradead.org; Fri, 24 Sep 2021 13:33:00 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E5BD6402E1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Sep 2021 13:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632490377;
 bh=FL7LN+mY0sAFsfGJS3vJofU8rnqGhT82V24fURNA7ik=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=L9G8tsAVQLAsYQH70/lxIuYF1AbQLFfKQmd+jTxO3xEf3tAwFMbRe/jzgMiXXCoZB
 C0/AOj9BvoKvD6lMgrC6OttrgAxMDgKdVACv5FxXoZ4S1ESVcEAYx/irg/c0u1uKh3
 bW36yEQR6A1WJ0/BapkcUTihYPzIzfbgmtpPiXbup4kztnD5gptMW5GepxNS/yfZ68
 n+7y0UqXTR3zjfBLKIZj8jVfPfhQEbooMkuL+lDI7mIOYhbXNQZvTg6k/BPOH6GyE1
 mHOwgCeh2dYqF1IxZhZwGHsZUfdlemTM6sq55kkjbPDAJFhb/W7uM/hRDxR0WIjxIg
 54fonPEQ4tumQ==
Received: by mail-wr1-f70.google.com with SMTP id
 f7-20020a5d50c7000000b0015e288741a4so8097156wrt.9
 for <linux-mtd@lists.infradead.org>; Fri, 24 Sep 2021 06:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FL7LN+mY0sAFsfGJS3vJofU8rnqGhT82V24fURNA7ik=;
 b=5BLvpP2TmYbq1FpXPzD5QYcW2bqMdD0BEgJSKdpK2NO7iIHJit5BZgVhQjrLoYm5e9
 SWcaVexvXlqv99cGlctrWwkSwAwhZ3C31bNSfuyW16E+ewjfWVIcyjim9BQPyaoPDJQK
 as0LXbYeyFYO37G8/ntOUYwr43YvzDAvWa9GeYqvhxHVxEmIwYQJVTwiC8AykzrIlAnq
 SrCtxRPZgV8Sa8zxVEHdalVePc0KfcbyY/fvOVttfwkeNM1liZwnrmkaJiDgZDz9njC5
 YopnvJWRnc3aCh1+oaHPvAw1Oc5noTkETM5IWbgb/br10kjld5+nUDc4rFkpW4+0waL4
 rwbQ==
X-Gm-Message-State: AOAM5332np0xvdeQhX+kVp2+CLjGmfDQegwrQsC2gFb9tzn9gMDGtGMV
 01mMmwlnLpPcSp1gXj3/AO8PQDAUDSOICf+nTCTFZgtg0IWlk6cfdII8W4cTeDAoO268cpJnepL
 ZvI1tcaC8nO4uWCi+XtQwJTE5aVVRoHYSXHYKNnFzOAQ=
X-Received: by 2002:adf:f011:: with SMTP id j17mr11519330wro.320.1632490377450; 
 Fri, 24 Sep 2021 06:32:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtCm9RyYQOc1rQoJs64djwg6MaktARYE5Dwo4MkZ1BJhhhsyVf6I7Y3jYFIqesDDyEsd9yIA==
X-Received: by 2002:adf:f011:: with SMTP id j17mr11519306wro.320.1632490377305; 
 Fri, 24 Sep 2021 06:32:57 -0700 (PDT)
Received: from localhost.localdomain
 (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id i7sm1003094wrp.5.2021.09.24.06.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 06:32:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: onenand: samsung: drop Exynos4 and describe driver in
 KConfig
Date: Fri, 24 Sep 2021 15:32:23 +0200
Message-Id: <20210924133223.111930-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_063259_413042_CEB52446 
X-CRM114-Status: GOOD (  12.53  )
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

None of supported Samsung Exynos4 SoCs (Exynos4210, Exynos4412) seem to
use OneNAND driver so drop it.  Describe better which driver applies to
which SoC, to make configuring kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mtd/nand/onenand/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
index 1a0e65bc246e..34d9a7a82ad4 100644
--- a/drivers/mtd/nand/onenand/Kconfig
+++ b/drivers/mtd/nand/onenand/Kconfig
@@ -33,11 +33,12 @@ config MTD_ONENAND_OMAP2
 
 config MTD_ONENAND_SAMSUNG
 	tristate "OneNAND on Samsung SOC controller support"
-	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS4 || COMPILE_TEST
+	depends on ARCH_S3C64XX || ARCH_S5PV210 || COMPILE_TEST
 	help
-	  Support for a OneNAND flash device connected to an Samsung SOC.
-	  S3C64XX uses command mapping method.
-	  S5PC110/S5PC210 use generic OneNAND method.
+	  Support for a OneNAND flash device connected to Samsung S3C64XX
+	  (using command mapping method) and S5PC110/S5PC210 (using generic
+	  OneNAND method) SoCs.
+	  Choose Y here only if you build for such Samsung SoC.
 
 config MTD_ONENAND_OTP
 	bool "OneNAND OTP Support"
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
