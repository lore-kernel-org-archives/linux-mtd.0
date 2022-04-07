Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC0CC43219
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8RZMwZ4NXsbhxSas6MpjHcaKNctckR1S6AdWFlbvSC8=; b=MoL9eZgTua3bdF
	EQmd4/j38DIhQckbJf2lttwDmWfdYpinnTndblIcmbpTEBo4Vzv6rpx5tnWpAzXXzWHwLoBkcQrS2
	XxMVVjFUYMTbvbkq20VhJbec6YtnpqFkuS6Gjn3pkL2eS6JprX8uZD6BussWxwpxDsiZmEiosdV2z
	ooRRBwBohUNW12kn8478Xht5kRz4s/nKDnmXUu2AUAZyo7bov0yyzEmTo2bv8GfKKgB25KIybE6Ok
	IrhNe2zO4q+bFkZ/sC+h92DZw71WBQ16Wzqi08m9Skj1Zw8g7RW4lpu+h0zGuzMjRukzA1AMQmTHH
	vQHzz8Hp4jqxgkgTNZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncTFh-00CQP1-Pi; Thu, 07 Apr 2022 14:36:50 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTDA-00CP8s-9M
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2022 14:34:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a6so11382706ejk.0
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2022 07:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZMc3AfG5H7Eoze1riLsoKQySy0boPTnHcGifTlbw67U=;
 b=ACt2wLpnHluTK801WClxUNjv0T9X0tOd4oKiCIIrZ9eNjavRSu/0d5x723ScrD6OQJ
 4ycrRvTpZwenEIWc5szrw7Xy7HZlT+y1tGmDJX1OMZr31b6onPuNIXxnElG8KwNEHG8v
 7cO8koLd+3k74YrxsfvbF4gSaFYQmeSEhO1sAvwcmL/frMNgxZdh5zphOLrEI0Sir9er
 DC9hAsYxXq9WhYZGMdDJ0rR2BpvJwQH5Utv5DyHXDBxGVwcgUk5UG0UAy1cblo+jn8md
 HomLK/kqgRoT+SxkiPmU1UQqoCsxtMxO6f0uP0EAexdHFKupYpNvhem6YnmogCUO6aYv
 /jyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZMc3AfG5H7Eoze1riLsoKQySy0boPTnHcGifTlbw67U=;
 b=7Kl2S253OBgpJa+1ItXUdvh/EkKmHSTWrYa9GbDeNMFjwVMaJVUqk7822dGWw47X93
 6DJWBvxaK0YxHXnfOxB+BsG1Bct474MXDXm/iyCug/Jxxg/Y4cvJYcAqQ7yKs+1gdyZv
 yORGsTD00G59u+BrhVsvUEwJUm+tHsKAViXRGJBncFTqbGnIvx3kiMoF6JypbyO9NE/o
 OrqLqR8a5rg9t9h6lvFwz5Os56UeeJNarM04kT6+kKBXSfpbdgUYXSPaIwyzUC/bqwu7
 njVo++BBHSPgGfNgLIHOLVzgL3tbWOZYbs2xcRhq062SQ5llpWm2TlCXlEnVNmaWm6nP
 Qr/g==
X-Gm-Message-State: AOAM530drSh5mAgBSjJTsev9gelW8eena+CsxMuSaK1V+CoK8IOQBwYa
 I+791ufHhu0s99xlqsY6YBnlAQ==
X-Google-Smtp-Source: ABdhPJwXyL4FeMCVoeo0dwl9+9FIwF5PtSlfyv2y65g/77g1GH8eFdummy9lPfT8/0+oXckSp7xQIw==
X-Received: by 2002:a17:906:9c8e:b0:6df:f6bf:7902 with SMTP id
 fj14-20020a1709069c8e00b006dff6bf7902mr13552991ejc.191.1649342050635; 
 Thu, 07 Apr 2022 07:34:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05640251d200b0041d1600ab09sm107835edd.54.2022.04.07.07.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 07:34:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: align SPI NOR node name with dtschema
Date: Thu,  7 Apr 2022 16:34:05 +0200
Message-Id: <20220407143405.295907-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_073412_409836_CD76D24A 
X-CRM114-Status: GOOD (  11.26  )
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

The node names should be generic and SPI NOR dtschema expects "flash".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt | 2 +-
 Documentation/devicetree/bindings/spi/spi-davinci.txt           | 2 +-
 Documentation/devicetree/bindings/spi/spi-pl022.yaml            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt b/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
index 74981520d6dd..a99de13c7ccd 100644
--- a/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
@@ -17,7 +17,7 @@ spi-nor-controller@10000000 {
 	reg = <0x10000000 0x1000>, <0x14000000 0x1000000>;
 	reg-names = "control", "memory";
 	clocks = <&clock HI3519_FMC_CLK>;
-	spi-nor@0 {
+	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 	};
diff --git a/Documentation/devicetree/bindings/spi/spi-davinci.txt b/Documentation/devicetree/bindings/spi/spi-davinci.txt
index 200c7fc7b089..f012888656ec 100644
--- a/Documentation/devicetree/bindings/spi/spi-davinci.txt
+++ b/Documentation/devicetree/bindings/spi/spi-davinci.txt
@@ -78,7 +78,7 @@ spi0:spi@20bf0000 {
 	interrupts			= <338>;
 	clocks				= <&clkspi>;
 
-	flash: n25q032@0 {
+	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "st,m25p32";
diff --git a/Documentation/devicetree/bindings/spi/spi-pl022.yaml b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
index bda45ff3d294..0e382119c64f 100644
--- a/Documentation/devicetree/bindings/spi/spi-pl022.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
@@ -143,7 +143,7 @@ examples:
         <&dma_controller 24 0>;
       dma-names = "rx", "tx";
 
-      m25p80@1 {
+      flash@1 {
         compatible = "st,m25p80";
         reg = <1>;
         spi-max-frequency = <12000000>;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
