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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88C9C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:57:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8789320692
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:57:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBoOpN8P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zzt9Pq8z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8789320692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EqVTboBxaMK/lLowTuEkvN4seHYw3rQ//3f9ZFhG2PM=; b=JBoOpN8Plz4/uTNcgjK2asq6+o
	QYowe6vZ/hBISgJOXSYBiCoQpNNWuEfjN2avYdzvJ2g3Y96eU1j14oF1QJtGaY1+HwO88j9kTna2d
	DAvzOKqJKJE6DjMvx/h3Y5PMhvVhQ0rGAzXSLXdq2Wz8u4P2Rf7EDFxlGQ2EC1tkJJQQh9fQISbst
	SU0xOkV+RtwveDuVTZpYWITCQ5YdNjITJBdOqqMJnFf9Meq1QvpBtWt2nBwCLiMPj8Wy5q+b1Xl77
	mkvGUPBGOP5/1EFbs5PVi82kupcs83gjFrA194TKrYrR+sd0HN9uxLTBYFVpxcvX9lCQ/+LMOc+ja
	Zgtve8jQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipIOY-0002DJ-Br; Wed, 08 Jan 2020 20:57:38 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipIKw-0006P4-Im; Wed, 08 Jan 2020 20:53:57 +0000
Received: by mail-wr1-x442.google.com with SMTP id z3so4947147wru.3;
 Wed, 08 Jan 2020 12:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C5fo2kz/QWgODg+pTRTkY/0WFd4gP4/o5NDNIjif8yU=;
 b=Zzt9Pq8z2X+9hwX1ST5OGPyVjrA4QVsYfsU5Wmyd3tl0c6equBtUPevbjEtiYvzq0V
 F4ZoiRMpeC1kWGUttJA/fkBaJH9ZbkCgpoVWHNF1yb/53vw00PaCsrZXs8eoBGeDohyj
 ak8k7t99ff5pwAliM9p+OyFpP9n2o+QGIWatkTwhaZQCkPSY+QMQPgkt5TvvZZl4AbRX
 Q4oPPhYByTA/wo0xeHiX6o1iWb0S50jScOoSDg0ZHHu1kw7/H2aK9fKdV1nVlWNZIy38
 rUDk8g4sQ9B1n0eCJLX4jloIxHW2SJoOPp8nvAoq6RdovfL4jjy4IGr+AvFLgkFwSRy8
 TiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C5fo2kz/QWgODg+pTRTkY/0WFd4gP4/o5NDNIjif8yU=;
 b=SOSWaY1FMadMACapsgKipMhP32tcgMtS5hDWDFQcNY/lMh00dKKqzCEEN6bhdkp7VY
 RwmtShUAQujAK/rqdtWvQFyb/yWyfDOLM/XsxPfm/04ZdmvpyqpC2vNIF36hOEXt4XmV
 prVq/+a5vdU+TgIq1gUrpXFFU0gwa8HGxBOlF3MPM/Xo43e31LUhWvryYuchJw/+safM
 r73ld2N8Ll0AYX6PS78SSmsvMD1ze3Cg5Of/+nuHkqGYDxVjhV/cmDUh0f9ofxpfnCnU
 pYa5qq50nZBYCY/DhYplkEMyT14A1Lw2LbX1z5vwgiOqedybyClq7dNfwDvpOIUXGN5p
 b3+Q==
X-Gm-Message-State: APjAAAVmpVJ1P0so77d7hDPk4yGycLBlRU0zUpUTiWvqv7dgbza9SZ6r
 Pg7SQgp0ytzaAGSk7pzEbk4=
X-Google-Smtp-Source: APXvYqxKzkRDBbLxFJJQrh3Cz/Joy5n0D+rLPkz5VnUoFXE6pFE8tWT1ElySl90OFe+0xb5oe68WBA==
X-Received: by 2002:a05:6000:1187:: with SMTP id
 g7mr7021758wrx.109.1578516833133; 
 Wed, 08 Jan 2020 12:53:53 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c5sm311835wmd.42.2020.01.08.12.53.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 12:53:52 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v1 06/10] ARM: dts: rockchip: add nandc node for rv1108
Date: Wed,  8 Jan 2020 21:53:34 +0100
Message-Id: <20200108205338.11369-7-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200108205338.11369-1-jbx6244@gmail.com>
References: <20200108205338.11369-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_125354_725134_5EA0B5DA 
X-CRM114-Status: GOOD (  11.14  )
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

From: Jon Lin <jon.lin@rock-chips.com>

Add nandc node for rv1108.

Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rv1108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 5876690ee..391073ada 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -456,6 +456,17 @@
 		#reset-cells = <1>;
 	};
 
+	nandc: nand-controller@30100000 {
+		compatible = "rockchip,nandc-v6";
+		reg = <0x30100000 0x1000>;
+		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_NANDC>, <&cru HCLK_NANDC>;
+		clock-names = "clk_nandc", "hclk_nandc";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	emmc: dwmmc@30110000 {
 		compatible = "rockchip,rv1108-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x30110000 0x4000>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
