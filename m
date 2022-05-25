Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BB8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 21:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fuke6tUZPSymvYf2DL5aBHTi55AlljT42q1cXaeCRRs=; b=zSVtCy55Q2hhjT
	6riiyWK5xEWw8EJr+w/vTRmUPrEvT2IZHL+0EcpzH1Md+LaEZ+6G2xpkmvvbUeSZ8qDkoVG8K2KuF
	9U83tArHfxrzZDAUWwLf8944hco+ZR70NO3/VYpvd54n/uz4fCdsAFZgGaoMtkGgYmw9nhhiysl3s
	N729o4iAxAqmN/LbYrBZ/57YDYy64U54GrPnlH+jT23ImVIlCR7OwW7iWF9HpY3hhNbML+f4E9Y8Q
	+ptMqBmHTFu8rRu2tOlRa3yUEvWo2nRb0EoYdyQeQmVkV+gupnvY9RRhCpHEPVCtB7QLwODjhlnMy
	nfPNzD9g29HmI0BikEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nty6F-00Ci4C-KR; Wed, 25 May 2022 20:59:23 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nty6C-00Ci3f-S4
	for linux-mtd@lists.infradead.org; Wed, 25 May 2022 20:59:22 +0000
Received: by mail-ot1-f52.google.com with SMTP id p12-20020a9d4e0c000000b00606b40860a3so15089445otf.11
        for <linux-mtd@lists.infradead.org>; Wed, 25 May 2022 13:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1m2s22XtmxEczOaH6Nvd5Gv9iJMhl6MqiC51IH1U9jc=;
        b=yWYMJPQS2iA6u6j0Dn6BOGbBfDM8cdRpBCGQiiyH+gGqVPm5y4AGNwZIpM3kfgWNWy
         VKiSsPjkanO6e/i6JfkIDfl/4zgAotRgPwlBzLSdySCux0TMpKHabB9pGnDoGat4pT7N
         +q4+QF+SsCN8b3Ij3hi1tWeqTRFK9a6gtF+clRsRzVcstOlbkMmORgvBmVnV3dC2ozGT
         7T61NhoYG35H9kGCrGmnb8p4nWpT7NZuSLdOM7wOSPiX0QXogRO6gPYfgVF2CCHJ7ZkU
         hMySJXlJV11fpVve9vlDjpUWmEeQlujFVpVSbpCLWWhKs369aTPZvwkjtockKfChkZ2w
         BCwQ==
X-Gm-Message-State: AOAM5334k0oOwS+GTksi01j1CEkFU3xoh5/JAhhHfvmAKHj4rw0ROwfN
	SaG7jUDw+12JyieHPD7uhA==
X-Google-Smtp-Source: ABdhPJweDY0pMYyERhPPRmIRG2kB92PgCy9mt/HQ7tcYvBieKTd/XAk2Cowz8xfLpjWerh2SdE4Kbg==
X-Received: by 2002:a9d:69:0:b0:60a:f535:f54e with SMTP id 96-20020a9d0069000000b0060af535f54emr10364616ota.215.1653512359028;
        Wed, 25 May 2022 13:59:19 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id n24-20020a4ae758000000b0035eb4e5a6b1sm7058090oov.7.2022.05.25.13.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 13:59:18 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: spi-nand: Add spi-peripheral-props.yaml reference
Date: Wed, 25 May 2022 15:59:08 -0500
Message-Id: <20220525205909.2486153-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_135920_940319_7093E26A 
X-CRM114-Status: UNSURE (   8.20  )
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

SPI peripheral device bindings need to reference spi-peripheral-props.yaml
in order to use various SPI controller specific properties. Otherwise,
the unevaluatedProperties check will reject any controller specific
properties.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/spi-nand.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.yaml b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
index 431faac518a4..dd3cd1d53009 100644
--- a/Documentation/devicetree/bindings/mtd/spi-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: "nand-chip.yaml#"
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
