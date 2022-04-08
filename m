Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F0EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Apr 2022 06:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p0KXQF6LFTeGOXArUy7u4XSuW9jTwNedTmN5oc5uSKE=; b=CxXpnomrOh4z7U
	WtnfWdaND/GexnXag97+2bfdVMGofmpzCoYM/0VWBWTxQPNQLYeQXInpa7Q8m/hW2YLIrm9nKWuuk
	Dy8KqBwouU9LQoMy4AGKXHIebPl53c5L861PLWiFcJNYwZ0S+UqS2JePDxzTDXVuqKsTZzFJ9D8O2
	Gw2fOemxdV2l8flcLgp/Xx1+2eBRm98hYkwU3PCzqlqaV9StwIGdPohVtANUL1XrRUcp1RYL+E+PQ
	7IdKyv8mo5wj6zbhQGCdj1DHsYNqwo7aUgyuaakF2G+jCRCjU7LLFgpWEhMqBZwlz32IS6SnSN8Td
	TECA2pv9HM7z1nsUhnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nciFR-00FKA1-U2; Fri, 08 Apr 2022 06:37:33 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nciFP-00FK7F-2K
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2022 06:37:32 +0000
Received: by mail-ej1-x635.google.com with SMTP id ot30so15224235ejb.12
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2022 23:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hbooFuUTQsLms6josv+xfBkuUKWCG8qBtv0jZriAQsE=;
 b=KUiGrzywkzIJieuqry4LzLftOUGd4CK09HkQZxMiCdN41F5MvltjUSmSUiJoSn8/Tv
 /4hf+9nkj+E5PaUY+g0FORT2PQIn5Bn4IXXhX0IwC5kbzKvBhUosYY3ZbkheRDxg8/M6
 u2QxcyO+KlJ30iCG0aizbUuB3XESflzEmrPbQW2+LnmVovj8cMAht94miIwUvSRbFQ2A
 q6z/JkazuuECcKj8yXUtiXdnwYgywiu54BLbkPPGhSmpUJRD9CWjx1IxuELC8cqnEzYx
 x9eSqbTp46UtX9Jojy6NFIDczxQy6klYRWGv9C6V5DwLN7n8g74x+C7L+yfdhdGDVRfn
 APrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hbooFuUTQsLms6josv+xfBkuUKWCG8qBtv0jZriAQsE=;
 b=jMsDgzZ78QgzizNCBug2r72naPrKHdKqTuXg/GRwa1Uf08MX4165deuSn7wX2aB7Ll
 ieZV8ycwfY9fIberWT+ynUWtMQdvNA6YTZa0jC81Id75lHPwLx7HhFUQJ/ai4bcu7jW3
 JVZWkde+ufipWem+dliCt+r5qj0IUskfMUCnO/20JUD32a7KsChdS2GxyB6KdrkKuwBO
 eABfdSZC2z0mDUZSl4vhOCjVM34dzFc/RrUH1wCGt48n8ZkI+w31dfS6C6vYOFG4MJEe
 bpf1XXPdRWWyD/ACnhY8nX1t9uxT/bes84oybxCsKMCcdFJm/h7X9GVnoz7+7u85odU1
 Bkvg==
X-Gm-Message-State: AOAM5300QJU/4Q28z5O8OiQGyJzJSf9twYtIaDqh1vacc6r0H5GZw2v9
 Qv4CC9EbO6DEA3f8YefD1iJNtA==
X-Google-Smtp-Source: ABdhPJxGgqOBfEFbjzp6nSVerXvXLKhjPaD3/BrgxDhHC+YAAie/Hv8OQJLm5NEQpFm+7M8v9mD0Ew==
X-Received: by 2002:a17:907:2d9f:b0:6e8:58d9:8c4 with SMTP id
 gt31-20020a1709072d9f00b006e858d908c4mr550595ejc.386.1649399845877; 
 Thu, 07 Apr 2022 23:37:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 t1-20020a170906178100b006e7edb2c0bdsm5705086eje.15.2022.04.07.23.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 23:37:25 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: mtd: jedec,
 spi-nor: remove unneeded properties
Date: Fri,  8 Apr 2022 08:37:20 +0200
Message-Id: <20220408063720.12826-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_233731_140013_AAA0F3AD 
X-CRM114-Status: UNSURE (   9.24  )
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
(SPI and MTD) and use unevaluatedProperties, few properties are
redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

---

Changes since v1:
1. Do not remove address/size cells (Rob).
2. Add Pratyush review.
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 4abfb4cfc157..7149784a36ac 100644
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
@@ -74,8 +70,6 @@ properties:
       be used on such systems, to denote the absence of a reliable reset
       mechanism.
 
-  label: true
-
   partitions:
     type: object
 
@@ -99,8 +93,6 @@ examples:
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
