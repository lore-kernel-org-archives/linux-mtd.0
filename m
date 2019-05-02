Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38205C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3F00205F4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:33:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MzL1jv9D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L+nSl7RF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3F00205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rBU1vGRAUZYTEBBtYS9DLKUKvPfIfleTGMHfLtAbBs=; b=MzL1jv9Dg5SzvH
	kWNS2hroG9Bm/gxFG+hhDyzNEVEPMxz2oHHkW4C1gBWZK7QUaa0wXJI7gsbf1Hqwbn6Y72L+5BDe8
	BfhvtRYjl+y9TSvkkxgM/3J19eq/fUFeIrb2sU+fpLCrEg+Yvc9qQbi9cHSKPhSVwcIQfeLv/veor
	UKTRJi1SbBNtZNkz5G0sdZuPcMOTMs1muhaYrjToHSZgyi5zj/p/C1DQ0nTzMdh/+bYZq3FHwtm4l
	yeKlgL3LvXFAirbUTpfuOIhMosR3KVvVkE6I+EKC3AAvXpgO4EK26yd2qFI5RmK0SLuG682U4N1RS
	LzUbgwZBMXULJpugnwHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMCls-00012i-RM; Thu, 02 May 2019 14:33:12 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMClk-0000rH-Kl
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 14:33:06 +0000
Received: by mail-lj1-x244.google.com with SMTP id k8so2376177lja.8
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VX3ZJ4+LsHQk247sTXsicTDtr9mvWdG7A6UkuCw4jPw=;
 b=L+nSl7RFy44G1FlxiXKj1rC6UFS0r2OPhUyReuGg6Wc+iiQC8N41qVc6z4miXL2o21
 nay7m/GMk9cMHfMyaDOhtAIRA0Tf5ByvsCWuy2Nq4ORubn2c1P+xyZAOVO8AGq84a+on
 U4h8nqqUx4hpr/RHQuB17V4S24P9/o78EC0ZFA5PeUeCKCwF1pUCG0T7KkVf1rMMJ3P9
 USt7QUBIh7McDmdpL9QiHU9JzOdokH167Nnq5+QyfWkjRTc/C9ZF5Ms6+hO5Wo9sdAu5
 HU52GEArBkHoMITO9WJZs96UD3aQ0JjlC7Z2qFB8aWzvYXqHAuPZBViuKVcTdk34WNJc
 AQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VX3ZJ4+LsHQk247sTXsicTDtr9mvWdG7A6UkuCw4jPw=;
 b=mqI0VLbEYnpY/ZIsttIIvn0YV2iqQPLVRQQzlREDyXw86mzYXtBAYoDoKqc3x6c5Ec
 IC2IyT5zwkDknTCDSilzf7UPzrDw/Ax/TGSbAELuLeh0hniW2+cWYzLF0PQ7R06hQHMk
 DVX9yIELImnpx6zVZzpcuujxUrJc/JljIBOyONarelcuHgTgmzfq8lSWD9a31vXixCyb
 oZ24eQhnOMWrXExrcRjyJ8cKwjpr/F6bdqsf/xDjB5XYTZ/kRFE8QZPBXbnwoE88ArL6
 AUYVFkCzFEHWjNnZu1UcEXxvEFPLfJPcCwOPtqnd3DEOc7PnwQAOexA2EQg1DQimtPUP
 Le4A==
X-Gm-Message-State: APjAAAWxtCsOc31doXGgKH54hk2IKtE06f+c/8zTznsKCPg1TvrNWJBI
 XtuQArUie1DGq12HYW8IiOWmdw==
X-Google-Smtp-Source: APXvYqwY2DYVJQzlTnhWooL+lkS4ihwd94VchgjIG5vs2Z0D8eU7AKRVa2szJSDKzpLoXEhvMKPLbg==
X-Received: by 2002:a2e:8953:: with SMTP id b19mr2124811ljk.139.1556807582656; 
 Thu, 02 May 2019 07:33:02 -0700 (PDT)
Received: from localhost.localdomain
 (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
 by smtp.gmail.com with ESMTPSA id l79sm9430625lfe.92.2019.05.02.07.33.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 07:33:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 2/9 RESEND 2] mtd: partitions: Add AFS partitions DT bindings
Date: Thu,  2 May 2019 16:30:27 +0200
Message-Id: <20190502143034.16781-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502143034.16781-1-linus.walleij@linaro.org>
References: <20190502143034.16781-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_073304_679540_1F1151CB 
X-CRM114-Status: GOOD (  13.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds device tree bindings for ARM Firmware Suite
flash partitioning used in NOR flashes on ARM reference
designs.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../mtd/partitions/arm,arm-firmware-suite.txt   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt

diff --git a/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt b/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
new file mode 100644
index 000000000000..d5c5616f6db5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
@@ -0,0 +1,17 @@
+ARM AFS - ARM Firmware Suite Partitions
+=======================================
+
+The ARM Firmware Suite is a flash partitioning system found on the
+ARM reference designs: Integrator AP, Integrator CP, Versatile AB,
+Versatile PB, the RealView family, Versatile Express and Juno.
+
+Required properties:
+- compatible : (required) must be "arm,arm-firmware-suite"
+
+Example:
+
+flash@0 {
+	partitions {
+		compatible = "arm,arm-firmware-suite";
+	};
+};
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
