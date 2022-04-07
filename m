Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D57DC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ab4rEoSzsk3SYs+PvVtPY3mvYw5yGCyNMtTCdDIgKyE=; b=0dMshD9AjTbesq
	UvkLk+gu7aRzQrKbwptRlN6FY+3Q5fL88BiaPRGOPen3NdDEJW21XdrLk2BZxBAon9G3DXs9eOhm5
	wGac3pT221QxEHJU18+Y34FRp3mULlNwxPKcD80w68By9cWxteuGkOQO/w+GBDjeIS/uGkuuUC2/k
	FRtJvQZxJZ+MXiXZgvBlz2Pr+pogvwn+Y2mac3M+uy0GhYT/N8VtDLV0MVG94rfCrwZGai4mxhI6e
	mBceGFrvnp1U9q0S9juzqv0z52zip++akzLZUeo9LGw+ph9UBhLcKd8jxOnI90m0STA2GeohxtkmB
	Z8HRDvl5ZeDeonUrYihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncSzf-00CKSL-UP; Thu, 07 Apr 2022 14:20:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncSzb-00CKQf-Fg
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2022 14:20:13 +0000
Received: by mail-ed1-x52d.google.com with SMTP id x20so6558374edi.12
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2022 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8yiAtg3rQQsYQrz3HB5ABJGFof1KEIaqkT/i4ea96+g=;
 b=i+7pZ9/Nair/2xYhlI9bGgpJiP5BqE3ziFD/WqnsIpu2jvt84iP1oK+U2wYZqW1n70
 HjumBvZnYJ/Wm4eDrzj4CqPltjkoCmt5D2d44nl+l0Nrpj7tbIJbWXWi5DRbOqSyuBtd
 5B9ycEYP05uCBB2bHC/MRChDklzSw+81GkmmnKj9vkS6tnL5DeftHBkyDc8ZCynVgii2
 emGWXqGiNnT/5K8HSpLui38zySkSZ/SqAQUjZVGg+O6jZW6weetXZ/wi/FTtQfULiSbx
 bPk9oFmxDOuw8cbt6h/kKflta3iwlniNkPOV9ib8J7uaVlDq8S648DouwLwtl+F4lhsG
 5RZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8yiAtg3rQQsYQrz3HB5ABJGFof1KEIaqkT/i4ea96+g=;
 b=rzlKUEb7cD8/ofdomqFKoD3rQtuf5Z3+9Vu5orw0HHQfrUyflz5Ni/9bLLs6J6Q9km
 k6v5MgnsJ+60JDKLYcvzNFMNjGEddHl536Gcq7tzRKxhkbMemz3ZydH3GRSpQKNQDKJq
 5GiObVt4e/DT3F/8CZwwahwTO1L9rFzXpz+QH2COb1/sB7M8xV+liUx/GwsoOrd+3hp+
 Bc5m5eBNHt81TIgq2RMEp66BikCrSWReAd1psqPZ4xlVBAx5s6biF8f0TlnFiXBMRESX
 GJE+niLtXFPA3YpE40NS+u+eSaJj59zIG6+E9aMzfVzWqi0dSHlmHI3mrMjOuIo31/DM
 YXdA==
X-Gm-Message-State: AOAM533/3PYGgRmUG9g7OWB1UuJMmHCSGSWDWJP6dFOtYl1OwFDAL/cl
 zfTljrIYiC8MGw3UMkKo9BdcuQ==
X-Google-Smtp-Source: ABdhPJzyaOBLTEXENkXIMPbhz9LkdnGmd3J+mXWjFUZRe447oVTT7rG0hn9KUNzp9DqfPtB4nY3OSw==
X-Received: by 2002:a05:6402:368d:b0:419:31c4:4db8 with SMTP id
 ej13-20020a056402368d00b0041931c44db8mr14563757edb.93.1649341207567; 
 Thu, 07 Apr 2022 07:20:07 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 c1-20020a50cf01000000b0041cb7e02a5csm7416182edk.87.2022.04.07.07.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 07:20:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: mtd: jedec,spi-nor: remove unneeded properties
Date: Thu,  7 Apr 2022 16:20:04 +0200
Message-Id: <20220407142004.292782-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_072011_621351_014FDBEB 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

After conversion the jedec,spi-nor DT schema to reference other schemas
(SPI and MTD) and use unevaluatedProperties, several properties are
redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mtd/jedec,spi-nor.yaml        | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 4abfb4cfc157..708e7f88fd92 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -50,10 +50,6 @@ properties:
     minItems: 1
     maxItems: 2
 
-  spi-max-frequency: true
-  spi-rx-bus-width: true
-  spi-tx-bus-width: true
-
   m25p,fast-read:
     type: boolean
     description:
@@ -74,14 +70,9 @@ properties:
       be used on such systems, to denote the absence of a reliable reset
       mechanism.
 
-  label: true
-
   partitions:
     type: object
 
-  '#address-cells': true
-  '#size-cells': true
-
 patternProperties:
   # Note: use 'partitions' node for new users
   '^partition@':
@@ -99,8 +90,6 @@ examples:
         #size-cells = <0>;
 
         flash@0 {
-            #address-cells = <1>;
-            #size-cells = <1>;
             compatible = "spansion,m25p80", "jedec,spi-nor";
             reg = <0>;
             spi-max-frequency = <40000000>;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
