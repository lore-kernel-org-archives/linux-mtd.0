Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD7BC4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:02:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02C736101A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02C736101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADusmOojOXaLKYJ8/t1lktizXmKpuRS/N8PAcq9QRc8=; b=jeXkcMpDrnOzoT
	yiCByrk0D40dUwosxFwEuQji8xDz3FmBqs3EzCPA0kJW/WTp9D6sLv252R/TatAnr3WSRZwoYAj1+
	KgUQs+5pc/vyIHmC/IyccpLXcEvMldYk+KV4KX0LInyiR+9Q9NjKoIMZAsqesNNQ5kW+YTQFu+LR1
	bS80NhptP9n6/7PG1fQpuqf5wfrAEssYmMMchWhzMprR/4WLIDdWELuHfb+y/79zsDP7qWj82vyS2
	UhjAXY/VHm0BOYsMzdH4DbYj5QbMN/kr3nbitTCawfoHY+Q8I1BXTD0UvLNb+PDK3pS8Mhyrm4ZcB
	d+UNcdtnuNuyGB84O6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlQG-00922P-UF; Thu, 19 Aug 2021 17:01:45 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlO0-0091Aj-Gx
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 16:59:34 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id CC352411CE
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629392360;
 bh=Y4VjdAw6i2XAmKpVIHlCuxlv3sz5tzJooO2Kj1Zm5KY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=eDBA272Y2svg85DF9lw/MbX3WzKN4Xur5Wx2Pdx2BTgOOn4EESIj/hqlklcgYSM20
 gbzfUSfJQZdXEFEoaXQe4YoFWGZ9twXzmsXDvOMNL5SLG+sUdB3rpn9nHtom+DLikJ
 Am/wIIDUEGaP6hyzLR0axFiJflPXxiemdO7DysUHl9T4a7wvX4Nxkj1rOzCG3pm4nj
 MM5q25jHqSKMfMFBfZCW3cZPrqkwtAoTG+GcCYi+nLcy0jCENxN16H3e1RhXGC9by2
 7FegM4hKXRBkulA+BGeBUa1BPeBj202wbgsEASQGoL92xgoTt7/Ha6YfHHmyCjG+q+
 zqPC7zwCKmXxQ==
Received: by mail-ed1-f69.google.com with SMTP id
 e3-20020a50ec830000b02903be5be2fc73so3109075edr.16
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 09:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y4VjdAw6i2XAmKpVIHlCuxlv3sz5tzJooO2Kj1Zm5KY=;
 b=JgdQrkU9F8zNvdSbw7ZWlJTAZ8TVLyKqvsRa2IAi796zPxJ1r8ApTBQcyXtEUtSCCh
 qsE8de04jlin7BwbFRLgVdTs4GChIYrhVAU1OxBBUK7ngo36YimsFNP4yTulcTv6eNjV
 6faSOlafDXUca3mKXV+dvyqp5ZrcC700lzBGxNIvJgHPwdjW+YgvcDGeTnzSSVLqIW14
 dekCfwlJoI44Jq5kWFc6xLi5/2qtMPVxO9VPqJFWCVcMCQNSaCCXvGlispFbPL8qXPbN
 vV40hNFa2GZOcR5SKvLRXjJIuFSYgDlpq/0hVOywcfp6gXmxIIiIkhAZb2yDgWxeFpIu
 RvCw==
X-Gm-Message-State: AOAM5302E/GLkVKUeWQ0VBgC3OZKfl95B/wl83U5/VVqupBDNnwhb7C8
 nzyOAAjndwGvgpGQoogKIxZlTtRAOoe2rsCJ/6UbK+cwldCOBoWF6LnChBRXaXZYIkgTAGPPQkp
 Zyy7oW4tYDLoAuWT002LqvSji13trmSQPC4iEHc/0ydY=
X-Received: by 2002:a17:907:9844:: with SMTP id
 jj4mr11566650ejc.274.1629392360423; 
 Thu, 19 Aug 2021 09:59:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy43yi4cd7I0ui+CNEC5/97mRyJRHDDxkOUtMndNvJTXPpnkWSykdSV4XJEwgHTzH2mBfqKLQ==
X-Received: by 2002:a17:907:9844:: with SMTP id
 jj4mr11566632ejc.274.1629392360273; 
 Thu, 19 Aug 2021 09:59:20 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id h8sm2023418edv.30.2021.08.19.09.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:59:19 -0700 (PDT)
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
Subject: [PATCH 3/5] riscv: dts: sifive: drop duplicated nodes and properties
 in sifive
Date: Thu, 19 Aug 2021 18:59:06 +0200
Message-Id: <20210819165908.135591-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
References: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_095924_851435_5D44E1FB 
X-CRM114-Status: GOOD (  11.89  )
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

The DTSI file defines soc node and address/size cells, so there is no
point in duplicating it in DTS file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 5 -----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index c960e19cfa70..ed2c2429c6c2 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -8,8 +8,6 @@
 #define RTCCLK_FREQ		1000000
 
 / {
-	#address-cells = <2>;
-	#size-cells = <2>;
 	model = "SiFive HiFive Unleashed A00";
 	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000",
 		     "sifive,fu540";
@@ -27,9 +25,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x2 0x00000000>;
 	};
 
-	soc {
-	};
-
 	hfclk: hfclk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 2e4ea84f27e7..960d65ca5d4f 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -8,8 +8,6 @@
 #define RTCCLK_FREQ		1000000
 
 / {
-	#address-cells = <2>;
-	#size-cells = <2>;
 	model = "SiFive HiFive Unmatched A00";
 	compatible = "sifive,hifive-unmatched-a00", "sifive,fu740-c000",
 		     "sifive,fu740";
@@ -27,9 +25,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x4 0x00000000>;
 	};
 
-	soc {
-	};
-
 	hfclk: hfclk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
