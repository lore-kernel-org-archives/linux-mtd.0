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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531D5C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:58:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 248DB20692
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:58:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gO6UBpbO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U292Rre6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 248DB20692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lb+QpNNt1aYRKwSTitP4qD3Aq5pBEZCB7VTRmJKAQ9Y=; b=gO6UBpbOWlj8X4edEvRLG6TgsC
	SP1g4reiLkqNvse3+0F2QHYqvc4gYxzJHr4NANNs+iSuYSukjMa987jaz6jlfg1/dYw6ihIZlBHi5
	SvVlNuQ+mS7QnhLQgZG53VeNIPpwhMQ3Nz4Lgdh1TfDNhN65REAe4PEu9Wgcpw41glA4n3NnzVrra
	M1UTKejk01dIc6G3klYGXXBbMEJTMtJipPcz+9AGsYmPnXhJYmFAuI79/bCxrkuzFyUsKUHyIIwk9
	Y1fsJIk8lUl5mQoO2PaOMf+cmYnYGr4qCmtv4/eO6LY9ntVTMB86ZlJYdtw9kkGBM07xT/Ff7M1sY
	NLQ+BUNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipIOo-0002Qq-I2; Wed, 08 Jan 2020 20:57:54 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipIKy-0006QV-Ny; Wed, 08 Jan 2020 20:53:58 +0000
Received: by mail-wr1-x443.google.com with SMTP id q10so4887612wrm.11;
 Wed, 08 Jan 2020 12:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Vmr2fEFzigW7NnBmDNTwUzT4ArM8axMJAbkHVc4Ns/0=;
 b=U292Rre680z7wDSQHsQUS9uJRrA1Pr2tLM4NbXE/OrgCGOwMP5BmFcfZwtt7vl2TMF
 utIikDp5Fgy62sWQ0YgW4GrQv6ESGNQ4McMWmvGuDUnitKop7SNvajhSom44f/2UxpHi
 Nvh6iZtGbshUg+6hOO70D0QiCe7+aNjSB1qmEhRmTgZDfDqUoP247THopMK6wWT91uWw
 y3VclLEwrBuv1+eiYcVn5jngCkqsLi65cdzganyu3GlUGRLU7i42mMua93ISNYfbA+sg
 q7rh8GvGdX/pQwTApk6JetyqPLHQ5LhdCt46uOj1EZvEBA+aQwmrVKIVIeVe77uTAh+8
 dIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Vmr2fEFzigW7NnBmDNTwUzT4ArM8axMJAbkHVc4Ns/0=;
 b=a6wPdWRqSdDUS/Tndq4xKjwlKmJMXpbpt/teyPFFJ1BdFm6GrR3kd6Bn4hcz8ugNn4
 CLpdmpKuDXrCj/4eOJHKB8GY+n7+jsrkjSbuAtoagn4Wp6/4QGrPC9fkedmk9o7mvbSq
 v/KRadzPgjdFd9vBdizSrvYAJQMx1EqBGM7fqnFPZwqRHant+5DV8rKkVdZ0CETdeZdu
 LIN4qKzHa6SkgKWB3GEcOo7n0bIJ2R0vHUQuIm3aHFGIBuDRUMa3FV6xi5/LTzblMNQZ
 7NXOrks9VExeaKB+wJ6OCtXXw0Kt1q3AavXXZixdQZY+MX/bnrhnzaPuRlyjy8L5339E
 dpLA==
X-Gm-Message-State: APjAAAX9nAf4mjQaiODhv7Vak2hUn25ulapi6r3f/ssqLJwJP6o7MJFB
 Bh1poChiWXxSXsu7RSgcFMQ=
X-Google-Smtp-Source: APXvYqzp9b6RWmOcElE6RzuN+ZS1z6743gaRIYOSvn+KxRtvbtfKLCOwJAdUYr8HSfaxwgfx2X3Rdw==
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr7021876wrp.182.1578516835000; 
 Wed, 08 Jan 2020 12:53:55 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c5sm311835wmd.42.2020.01.08.12.53.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 12:53:54 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v1 08/10] arm64: dts: rockchip: add nandc node for rk3308
Date: Wed,  8 Jan 2020 21:53:36 +0100
Message-Id: <20200108205338.11369-9-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200108205338.11369-1-jbx6244@gmail.com>
References: <20200108205338.11369-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_125357_017370_BF3EE4B8 
X-CRM114-Status: GOOD (  11.42  )
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

From: Dingqiang Lin <jon.lin@rock-chips.com>

Add nandc node for rk3308.

Signed-off-by: Dingqiang Lin <jon.lin@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 8bdc66c62..62df531d1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -627,6 +627,17 @@
 		status = "disabled";
 	};
 
+	nandc: nand-controller@ff4b0000 {
+		compatible = "rockchip,nandc-v6";
+		reg = <0x0 0xff4b0000 0x0 0x4000>;
+		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_NANDC>, <&cru HCLK_NANDC>;
+		clock-names = "clk_nandc", "hclk_nandc";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	cru: clock-controller@ff500000 {
 		compatible = "rockchip,rk3308-cru";
 		reg = <0x0 0xff500000 0x0 0x1000>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
