Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD086C19F2B
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jul 2022 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c5rMLu/jd3Tw8ai4tf1NIFSRAwcT8X8ltqkRbWGfPXQ=; b=W/3qXJV9XaVOZN
	souWejTXyDB/7QOF71WYGUXH390qXXVOrQpDqjwED5qA7k/Dp/8bj/03zMAeA7yGlTpuVctzgHx/Y
	+kdl3AnzHI+E3mIhxLxq6LgBXXxlugphVMoPK/UvsrdonSXknTOjwdK1QT+ZsirG44Pul0Fg751DX
	aPBqWtQ792k9a8KwlR1k2HnDpy7S4RaNSay/laZphSaKphc7vCpEd34J6rhneO+xU3bjtlkJufgpg
	BxV4Z9YItPE9Q5NCDxF8dL4LzXfMd+2hO664NrQQDx9Rame9fVgwIBhpoqSEJZwxxOzcXUsrFXJfc
	KAdvvo0fhqEnm/aXihZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGk6h-00Ffn5-2r; Wed, 27 Jul 2022 16:41:59 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGk6e-00Ffjt-2f
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2022 16:41:57 +0000
Received: by mail-lf1-x129.google.com with SMTP id bf9so27823593lfb.13
        for <linux-mtd@lists.infradead.org>; Wed, 27 Jul 2022 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HLLpAzhNV/l0ttpD0m4mlf6L5UXu2Cn5/3KpjyhDTBY=;
        b=uPUaQqLTpWBsddAvwhB8kXR3XZqpK0bsfMJYxtl6vmn0LIxzSjWbEkXM+1GyWv4q3K
         0lXRAxsqbWIDmTHN9W9otGvZnmtq6Gi31EciPJxgE8fjh2qUREoJtZEh1xQiYckDq06b
         RsAcgGnVa7t22jloyDww1FlcS+NSMIoxuplRVXowLQCO7zd4UqWHIJTdos7ONZAPMoQO
         X8GTSCn5qBzEmzNsHgudvTRUKqbh5UBpG8+/KsiBX1774UKZHSPq9SrIQvAY2SyBGYum
         lrUgOkkjGsHBhfhQR0ZmWQvSkCw8rH2kUtWhMyPFl6EyINP0S5yN50siJJonzjzCBX5j
         aA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HLLpAzhNV/l0ttpD0m4mlf6L5UXu2Cn5/3KpjyhDTBY=;
        b=JZn4eu+KVzkbkmjHrkK8LE1sK1YUNg5+8bCiXO7DcbF1YsgcrOlqPY9MRgBszVT0XN
         z+FbnPvlEIMgsDD68qXjW+gKYYVJsKoTOu6clWc15rkIIy5/wT9v+65s0Eih/nREIcNE
         BcbUvjqd0Kf8XKeGP6eNQVps7fksAOTyVetN5fOaPh3x3xWosducqQAk1lHJysOYFdRU
         KsQ+S+02yt7W+8O24AnEI2yvxlJTTgGwuojp7HYS9xuhzAY3Z1AItdpYtxOpJUd4963B
         tbTJvgmOBEwiqlZztRJAtfHQ0AQmyWaiBmxD2K+jWx1slKZa5It8UYDcvF0p0IOoQ1xR
         If7g==
X-Gm-Message-State: AJIora/6jqtQa6eiYBSUFxWVKGA5094fs1n/tatKJHeYhYG9w7cfrVko
	RTRbsO/49TT+N8lmQJgZLbfi+g==
X-Google-Smtp-Source: AGRyM1uF0dw37mu6pVrn0amas3Oc/3y1uf9T6DdFSISA35nOH4HUEzm1LE/4X3+zt0Kb9+FISznkdw==
X-Received: by 2002:ac2:4f0a:0:b0:48a:839c:2fe with SMTP id k10-20020ac24f0a000000b0048a839c02femr6823774lfr.40.1658940111411;
        Wed, 27 Jul 2022 09:41:51 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id z19-20020a056512371300b0048a73a75908sm784409lfr.302.2022.07.27.09.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 09:41:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Schocher <hs@denx.de>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: mtd: microchip,mchp48l640: use spi-peripheral-props.yaml
Date: Wed, 27 Jul 2022 18:41:48 +0200
Message-Id: <20220727164148.385476-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_094156_178384_48BC59F6 
X-CRM114-Status: GOOD (  11.28  )
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

Instead of listing directly properties typical for SPI peripherals,
reference the spi-peripheral-props.yaml schema.  This allows using all
properties typical for SPI-connected devices, even these which device
bindings author did not tried yet.

Remove the spi-* properties which now come via spi-peripheral-props.yaml
schema, except for the cases when device schema adds some constraints
like maximum frequency.

While changing additionalProperties->unevaluatedProperties, put it in
typical place, just before example DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Technically, this depends on [1] merged to SPI tree, if we want to
preserve existing behavior of not allowing SPI CPHA and CPOL in each of
schemas in this patch.

If this patch comes independently via different tree, the SPI CPHA and
CPOL will be allowed for brief period of time, before [1] is merged.
This will not have negative impact, just DT schema checks will be
loosened for that period.

[1] https://lore.kernel.org/all/20220722191539.90641-2-krzysztof.kozlowski@linaro.org/
---
 .../devicetree/bindings/mtd/microchip,mchp48l640.yaml      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
index 2cdf6bf3dc4a..8cc2a7ceb5fb 100644
--- a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
+++ b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
@@ -22,13 +22,14 @@ properties:
   reg:
     maxItems: 1
 
-  spi-max-frequency: true
-
 required:
   - compatible
   - reg
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
