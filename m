Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C3AC282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:55:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E904320656
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bzmRbmh7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzEFBmTw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E904320656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6JGmvjPefCu6aBDtOFrHPX/0ieN5JMHrcD4vW+a+XoY=; b=bzmRbmh7yQCwhLtNeNdnUaQRuf
	NHREhOY8e7NXIIoL6OrAvDoUJDKJ67z4tb6MLus7IH/Tnb9Q3iss8NqlXxqZXB9INnkGdJCYJqqaz
	0h6I0bglTtC9p9IAEBUJZHxmbziX0l/QTkzY+evxitlRdV8kU42yaaUT3SmjVFnFARN1KihJz2i3e
	18aHy51zts0oWTIimqEvTG5LNMXLHBaUZO0aOzlCeQjMdnu+ljgwvMQPN2HV4vMUFAOTpvQsK8X1s
	kkN82E5otH26i2SzsBPoVWqARxO2uQkSYQSiKOI5rGeAAKnc98qhXoCcc/KFN3uVCDwMzHxsTENsv
	b75hXZjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipIMG-0000IV-Ok; Wed, 08 Jan 2020 20:55:16 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipIKt-0006MA-47; Wed, 08 Jan 2020 20:53:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id c14so4914271wrn.7;
 Wed, 08 Jan 2020 12:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z5HJGRQJ2/f2kJUQoCeIFnI3hwMtLOLQy/CYHk2/+co=;
 b=NzEFBmTw/MkuVz5mPbP3iuI9K7JbjF/4gA3ZSAEoJ2JoIY4O3CU11F950od9NnqL5p
 ZK7/1X7C64V0PeKlQ/aros7Yl1Rx1u/ImZnvL4Hz4b9S0DLJ2bQE6t7chelRxG1JZ4UO
 oLTVQDNDrC0MUR1pw2Xb7rB90EZG4hEI0q2sW9QsT5WQLZCN3d8P8s4Z7Hu1TwBb65FL
 ZQUx5+MNfsgJ/Hux8ohu2XmkyLuLPq0oFZwCWQlMgSiAlGcb4lpAkQQuC0MacU6pCdf+
 boF6qMr7xQzqAWqHSa1JJ3f7F6a2qlS4dEfSYaG3Xu8Mk9bsmcXkn3oATl0yt0dlwsvr
 YLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z5HJGRQJ2/f2kJUQoCeIFnI3hwMtLOLQy/CYHk2/+co=;
 b=bFpvjPlLNTdr9R1r9qZqIsK2pyZrBzO+0iBDeO2mFaeDybeh2/MpBFln6cUBrFjhVl
 KS/eCRr7cr5ZUZOegkO4UaVVZ+bozokBV0k9OJcV2/n6Fn30WDG6AOvSXVT8V+MmnuKZ
 UcisQchK5NoT8a+TMFgIJgRlwMzRPEmR/SP4xuZ4lSj6Cb97BOvCHaOWGh1wZHk3lcEg
 9EbsMx+zLf68YUtJjte4DrEVmzeyu7hGI7qYawphz1n+DH6uucfKr5eo3GbMIKCNAXLq
 vSs2/Cx7r+USSrE+qLSi/GdisXgLGFP0exLtopOZkxZzpaDn+26MmMRWJ7yr6cQ96N/q
 srsw==
X-Gm-Message-State: APjAAAV0QiZDUbloQitOichCvbzmADk/sYsWQ8IVnGKasH4FgJdu2pik
 S+5Nu+3WCi4UYJ8nxVFX5X4=
X-Google-Smtp-Source: APXvYqztpcAxKuxj+Aok9yVC+U1ZAFgB2+pDeKfb/4QaCGmSSDWhXBw5M0MhKZ4pGGLFPjk83KIEIQ==
X-Received: by 2002:adf:f850:: with SMTP id d16mr6884005wrq.161.1578516829937; 
 Wed, 08 Jan 2020 12:53:49 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c5sm311835wmd.42.2020.01.08.12.53.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 12:53:49 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v1 03/10] ARM: dts: rockchip: add nandc node for
 rk3066a/rk3188
Date: Wed,  8 Jan 2020 21:53:31 +0100
Message-Id: <20200108205338.11369-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200108205338.11369-1-jbx6244@gmail.com>
References: <20200108205338.11369-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_125351_219474_FB1A4B26 
X-CRM114-Status: GOOD (  11.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Chris Zhong <zyw@rock-chips.com>

Add nandc node for rk3066a/rk3188.

Signed-off-by: Chris Zhong <zyw@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3xxx.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 97307a405..416b0d272 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -273,6 +273,17 @@
 		status = "disabled";
 	};
 
+	nandc: nand-controller@10500000 {
+		compatible = "rockchip,nandc-v6";
+		reg = <0x10500000 0x4000>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_NANDC0>;
+		clock-names = "hclk_nandc";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	pmu: pmu@20004000 {
 		compatible = "rockchip,rk3066-pmu", "syscon", "simple-mfd";
 		reg = <0x20004000 0x100>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
