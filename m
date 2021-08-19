Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77936C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:00:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F74601FD
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45F74601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLlqK65/O0OGIYYyhLUfxizJOBnkBcUfalEME2gSSz4=; b=IkAoK0jbYYJ+M+
	KUkEl1s9KFR+WP2T2LWGGn0pPba+e/qQBTwFX0W+Orl+PmeM2AF13vcshqonsm1RkPTdH5lYOWiap
	ZlqMF6hDgal9CrYNYA45UVkeO21nPP5Rp4nfL6rOTmHNBRZUWRr0pHt/g1ry6Szzwd2MnADbkEl2Z
	jLVYebUY9XRV8m7mXJJaFiTCU/p8m4cNDSGsnR3/PI7V5h18uIy10/dU9tGWOcTUKQg/VzO2g7yuD
	pVkBqrcQAtDf3XEZtAvIh4KfRUJDTu+4j5ZkdyLQr0du3z/mwTQoG7NhZc7xQchGtwA7VYxHTNQX5
	NrmS5NaUT+1flfezFC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlOr-0091Ug-Cn; Thu, 19 Aug 2021 17:00:17 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlO0-0091Ai-Cq
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 16:59:32 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id DC54C411FC
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 16:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629392359;
 bh=eulTWffz2zcY1QHzF3VctUTdQdyWBbuhcOokJb1Arrg=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=rhtOTdmthNu2ThG+hY3/LzKIqTR9Droed/Mx6QU+buHVClI6aO8E1z/DNARz7IaN2
 jVfYLBpBMy3r69LYb2H2O/n06OrkCLcnR9O3eVho/70XSv94RNGDA8ahrQrLCzOsPX
 5/W3xF8adtdheZeSDKMdlMrYGdmSKjxuOpsdfi6XFTjI0kRpjd9O75ZEIwNj2ceaTC
 WJdzp6wfpCoeGsp/hXs1PsKcsTixkSQMSdhy/TorPrd9wO8QaJAgD2aBHJD3U3tSdF
 gzTis6ckblOOf8X/Ux1GyYrbTgE6X8u2hZ6XOH3gxP5lUFWvOK/V0kZR9OWHeCAtob
 gE2zoJYQL+bYg==
Received: by mail-ej1-f71.google.com with SMTP id
 v19-20020a170906b013b02905b2f1bbf8f3so2489364ejy.6
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 09:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eulTWffz2zcY1QHzF3VctUTdQdyWBbuhcOokJb1Arrg=;
 b=ctCKkzBxP9F+JnbZWUs/LyuI2grDwrpMUal8NQeqvo0GtccqMBZJdCngOUj3IjVJOI
 715PNau+FycOYVG0NIhOfEK0GGlmTi8yxEYwbQjDzteH4uztQHojmghdm+1wtv9ZhrZe
 HCHxmWN3hHf0pcTTaHRfz5h95zwvQLuLqrIBLUeeFu7W52zMYycJx2zRXr6L1wfemZNT
 2yefXjCGnQiIzMf1SLS088EBYWv+EqC6Tv9/aPPZdi5q9xObXWX/sB5lYEylNU+RqVey
 XMD57mWo1Lqq65xllyda3esjPRLrDdtO+DMS3r3RI5THE0X/RbBqV7QXIFz9ZRDaqsf6
 E8EQ==
X-Gm-Message-State: AOAM5301MV4aash/CW6aIv8d4rYZOrFCKWBzLNNTfvHmv4Ibl9CeYfKe
 Y/WmvpeZhetG3eqRdk5/8+y7i50szMEpK8Fr04tLscFOe57FhbazispF7VnxsdPPWZuCJmEl4np
 JT+gCIjoOBWsaMG+wnwbn3D2Lx+Vv1zk38/yhTX+yJS0=
X-Received: by 2002:a05:6402:781:: with SMTP id
 d1mr17839063edy.32.1629392358805; 
 Thu, 19 Aug 2021 09:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww4UtUY6h9OU4l9uS3kIuoYiIOm0VucV6SoXDn0iXyU7Cxho1WRMomPQZIfagqOlV+lXh0nw==
X-Received: by 2002:a05:6402:781:: with SMTP id
 d1mr17839040edy.32.1629392358686; 
 Thu, 19 Aug 2021 09:59:18 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id h8sm2023418edv.30.2021.08.19.09.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:59:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/5] riscv: dts: sifive: fix Unleashed board compatible
Date: Thu, 19 Aug 2021 18:59:05 +0200
Message-Id: <20210819165908.135591-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
References: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_095924_656121_0DD3EEA9 
X-CRM114-Status: GOOD (  12.95  )
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

Add missing sifive,fu540 compatible to fix dtbs_check warnings:

  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml: /: compatible: 'oneOf' conditional failed, one must be fixed:
  ['sifive,hifive-unleashed-a00', 'sifive,fu540-c000'] is too short
  'sifive,hifive-unleashed-a00' is not one of ['sifive,hifive-unmatched-a00']
  'sifive,fu740-c000' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 60846e88ae4b..c960e19cfa70 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -11,7 +11,8 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 	model = "SiFive HiFive Unleashed A00";
-	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000";
+	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000",
+		     "sifive,fu540";
 
 	chosen {
 		stdout-path = "serial0";
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
