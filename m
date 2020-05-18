Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC47C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 20:33:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E96920829
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 20:33:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o/E6Gnb2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Z9kyWJ0b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E96920829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZrMB3WtRzZLRVHPmyX3XTEuDXTZyKvnYByI1gssrrY=; b=o/E6Gnb2l6rj0K
	AAH0uOr3iNk/rCxEqiFr7LxV4fS8EB88MweNXzwkt7C5MhCl0p827qcIxh6vC+NF+8vcLgU4yuIsR
	TGTLShwjLwzHn8OpMVbubMImJHN2DbTxLDz39KCIg3FtXybLnvOMpTUIU/T87c7myNdfRUdIQMcCM
	mqJgwhyZ3HZShyiwtadIhOweSDSvD0xjwm9OgwQt2s3PmPrQz/OIgCYSqqbYw9CXjZ+BedmFI7bCk
	zjcf4REU0HweSYbcUbH9OEzN9qnF4HeT523gVoar6Z9PLW1djk5r7KsVK+zMpe3Wd3R59CfTXjJuW
	GuZUVj2W02oYXSwQnlIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jamRv-0006rV-Pk; Mon, 18 May 2020 20:33:23 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jamRr-0006qZ-06
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 20:33:22 +0000
Received: by mail-lj1-x244.google.com with SMTP id b6so11336491ljj.1
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2020 13:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=liHKqxPDfHVVAMe49jNM18y8LkLl/eTVodLyOf08iew=;
 b=Z9kyWJ0bCSMgkNVQNprs0p9ElBUZMWunXXKovi1gCeePt63EGFWNOTIXJNiK7RxICM
 pYnXnqFK6CCyk7o8AgTlQr2X866t+Cb6InifE37VtBOmN9CWjjJ1uAfEiveCErasJyXc
 KDlmX2WTwI0FXaadpDBfy/v759Oo/Ya2xcUs34N/Nj84R/zYQFXEP/bwJAiL4Qwt82gL
 rFjKt6XPCaYRb5LR8Ng1T5c4uEsKgxbl/5Au5rHAwQGt5CBhJOpM+tg2FE+cshWVl3/R
 WdVSSHY4q4XwdCnIr2VVD1aXsfqS+CZcEqPCRXISnKU0ojZH6QRH/YALN6/9kVZfM/RB
 D4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=liHKqxPDfHVVAMe49jNM18y8LkLl/eTVodLyOf08iew=;
 b=cVfIS+P3XGMp+nzbna50m3A0A9UiFD29s6Lmb6vgQq6JTmGSoZeOXrwdiCl65RkMcT
 +xTYB1/bLxlSKYtp2st0ikAd7/T5UYHg3f+VwS1RNaWlMxvHf4IhEC92KymgBaQ7QVaY
 /EV49iGL74CJ07ZudJ8qetR1gr+5+IwTmbj5+dStj7O6y6GkvkSkYWMOcAsKJWDgyaqy
 /UGJGhuLhYJlp+jHgS0OfXqsB+MhJwGpOgJNKNOwihEY3JoMmJNGFYESpjU85jYG4eyj
 Jb+IMhPPyyAEhoJPsdD6iPqRTT8lpxffsObeQgeZAOSR403Oarcsn/7+DFZdkpXIpV5h
 qSVg==
X-Gm-Message-State: AOAM532gOvACL5TnDG1Gl0rSNht16WbDP3wzuJTOf+6p0Lcrmbx98xQE
 Lk57czFGkEULhXiTDtpjHh42R8bjNGQ=
X-Google-Smtp-Source: ABdhPJygyemdqFQlq/o6Y01iMbh3GsruajVNklcTckAaeWeAzQSjVCpFhoglBRdLyzrg1ftL9kUoEQ==
X-Received: by 2002:a2e:1451:: with SMTP id 17mr10680226lju.30.1589833996859; 
 Mon, 18 May 2020 13:33:16 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4650:c10:49f1:792f:a411:29a7])
 by smtp.gmail.com with ESMTPSA id d8sm7514470lfl.51.2020.05.18.13.33.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 13:33:16 -0700 (PDT)
Subject: [PATCH v3 1/2] dt-bindings: memory: document Renesas RPC-IF bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <26faf5e8-26eb-cceb-a500-f0fd64609737@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <f998fe6c-c586-17cb-9343-30460ce0bf9d@cogentembedded.com>
Date: Mon, 18 May 2020 23:33:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <26faf5e8-26eb-cceb-a500-f0fd64609737@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_133319_042330_6BC0D6F4 
X-CRM114-Status: GOOD (  15.97  )
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
Cc: Chris Brandt <chris.brandt@renesas.com>,
 Mason Yang <masonccyang@mxic.com.tw>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Renesas Reduced Pin Count Interface (RPC-IF) allows a SPI flash or
HyperFlash connected to the SoC to be accessed via the external address
space read mode or the manual mode.

Document the device tree bindings for the Renesas RPC-IF found in the R-Car
gen3 SoCs.

Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 3:
- fixed up the whitespace and added hyphens in the "compatible" prop text, also
  removed the comments;
- specified the subnode name as "flash", and used "enum" in the subnode text; 
- fixed up the SPDX-License-Identifier: tag.

Changes in version 2:
- rewrote the bindings in YAML.

 Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |   88 ++++++++++
 1 file changed, 88 insertions(+)

Index: linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
===================================================================
--- /dev/null
+++ linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/renesas,rpc-if.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Reduced Pin Count Interface (RPC-IF)
+
+maintainers:
+  - Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
+
+description: |
+  Renesas RPC-IF allows a SPI flash or HyperFlash connected to the SoC to
+  be accessed via the external address space read mode or the manual mode.
+
+  The flash chip itself should be represented by a subnode of the RPC-IF node.
+  The flash interface is selected based on the "compatible" property of this
+  subnode:
+  - if it contains "jedec,spi-nor", then SPI is used;
+  - if it contains "cfi-flash", then HyperFlash is used.
+
+allOf:
+  - $ref: "/schemas/spi/spi-controller.yaml#"
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - renesas,r8a77980-rpc-if
+        - renesas,r8a77995-rpc-if
+      - enum:
+        - renesas,rcar-gen3-rpc-if # a generic R-Car gen3 device
+
+  reg:
+    items:
+      - description: RPC-IF registers
+      - description: direct mapping read mode area
+      - description: write buffer area
+
+  reg-names:
+    items:
+      - const: regs
+      - const: dirmap
+      - const: wbuf
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  "flash@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        - enum:
+          - cfi-flash
+          - jedec,spi-nor
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+    #include <dt-bindings/power/r8a77995-sysc.h>
+
+    spi@ee200000 {
+      compatible = "renesas,r8a77995-rpc-if", "renesas,rcar-gen3-rpc-if";
+      reg = <0 0xee200000 0 0x200>,
+            <0 0x08000000 0 0x4000000>,
+            <0 0xee208000 0 0x100>;
+      reg-names = "regs", "dirmap", "wbuf";
+      clocks = <&cpg CPG_MOD 917>;
+      power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+      resets = <&cpg 917>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      flash@0 {
+        compatible = "jedec,spi-nor";
+        reg = <0>;
+        spi-max-frequency = <40000000>;
+        spi-tx-bus-width = <1>;
+        spi-rx-bus-width = <1>;
+      };
+    };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
