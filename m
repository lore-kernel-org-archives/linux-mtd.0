Return-Path: <SRS0=Tm4b=6O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76FDC47247
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 20:47:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8FD920836
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 20:47:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="atVkREPM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="pt1YMpbi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8FD920836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2yHZREtfxVqx5GZxedz21zv09PCXu8M488CvchJ0T8=; b=atVkREPMeaWP0R
	bG8kEJ1oquZrAk+cov+pKHBsBZmI9qsjz5TbS0XGRXKuq1D1BGz31S2SqUtCXchD4/PMq6SYGm+5d
	EaSlOrG0GeU906XGsUkVpIM+S7zIJgtBYVtrpH2hrmUPouMPHInghmqBNAbHcX/TpP57mUoF/Ei2w
	7vZyehyEpAOSHhKZ3voJmfP9fSUPw1UaDO/U9cjLgXz2fo13M9veqXhkzkUN0Q8EHubRDH6pePVtI
	66lVZI2wUGUYaxTS36BTcmC2GPM20f50mioTxVrAc67wd6JXu2jo5PInjf/Kwio/bihM2gok9hgRk
	1JYM55UC+8KMbzpaS9rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUG5m-0001sl-24; Thu, 30 Apr 2020 20:47:34 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUG5i-0001rm-MX
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2020 20:47:32 +0000
Received: by mail-lj1-x233.google.com with SMTP id h4so758367ljg.12
 for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2020 13:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UjhaXYLb6et/pS+z2+6lWawVjIKe1ZbJB18SGIv2Zig=;
 b=pt1YMpbidL1Z1ozdpkX8BKrlWsJSeJ2uJkMUXSNQuVgDZkj/5an+ZHfkaziEH1iDPE
 hjhzvWNJNpVDFu2ZQPDqBu83kb7sI1yWqGNFc/55HZkT9E9zAHFclWy9bawyYUrBeb1T
 SMXxTcOjdRS8mMA5MOoEZnthPHvEQxZHQY+fx+Gtc7PKASP5GM41cFxI8kmwv3btzobj
 wJ9K68W93ldv1zA0IghkSmz9iSZ+UTBeKJugdDzn3/e0WnJ8b4GrP8+1VPXXDt35PetK
 nnF8eiCDr3vJWit5nbowIftHDRoSEbqtF+UcTOW3Ec2j+GGk5HqbZEOGrPTp50JHKUKH
 fApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UjhaXYLb6et/pS+z2+6lWawVjIKe1ZbJB18SGIv2Zig=;
 b=sfT+gx5Tji+Q9sYfNZHZsTXa0MfJmFJQOPYPo8SL6KxgbLRkdgCAIU1UgDa5/xtUOC
 5tT81xi9ETkTLerKNk8HPZTq7dS1JGk0JcOzyVkzZYW7hsD+jXuO7U6+oJQ9+oE+1XqM
 yrMzTB2Hv2ri/pIjox3P/ZSQ1NB0YWnL6T6Gsuq8/CrRbPi3kxfOygHFAr06iflERXzl
 WEteK5Utwt7+YsphZCn+3f1IguEFgIlw2AvWKLAljXKaR44ENKYX4ZT8Wn0+5oRHuT27
 7Xi2/n7EDCL9KukCRTMd4hhzvso50XCOjUNIfRKOCXPhO7sJeE6vN8XOu+FMxj6j6MT1
 OSkg==
X-Gm-Message-State: AGi0PuaPNfwOb6BH2IyvSlPZ/Uc2W/OPP3LGvNL5vBJSk3mJ3B0su2++
 9d4w0NNFzM5axf7bUO0iWSOPI1hrzuw=
X-Google-Smtp-Source: APiQypJCP49xxKtW5b689TlF/50skrJuIJ0JZ3e/wPMGDzIgLXa3cnRumRDSWkFcln5U2yB/3LulXw==
X-Received: by 2002:a2e:9785:: with SMTP id y5mr416401lji.66.1588279647576;
 Thu, 30 Apr 2020 13:47:27 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:880:89c5:86ed:91e3:4d28:af08])
 by smtp.gmail.com with ESMTPSA id t8sm640060lfe.25.2020.04.30.13.47.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Apr 2020 13:47:26 -0700 (PDT)
Subject: [PATCH v2 1/2] dt-bindings: memory: document Renesas RPC-IF bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <812e6e58-d13f-3f44-5f55-22266b690c57@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <116683d1-d402-4d7f-3357-1c8cde807076@cogentembedded.com>
Date: Thu, 30 Apr 2020 23:47:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <812e6e58-d13f-3f44-5f55-22266b690c57@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_134730_736379_B6DEC8F9 
X-CRM114-Status: GOOD (  15.70  )
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
 Mason Yang <masonccyang@mxic.com.tw>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
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
Changes in version 2:
- rewrote the bindings in YAML.

 Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |   88 ++++++++++
 1 file changed, 88 insertions(+)

Index: linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
===================================================================
--- /dev/null
+++ linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0)
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
+        renesas,r8a77980-rpc-if # device is a part of R8A77980 SoC
+	renesas,r8a77995-rpc-if # device is a part of R8A77995 SoC
+      - enum:
+        renesas,rcar-gen3-rpc-if # a generic R-Car gen3 device
+
+  reg:
+    items:
+       - description: RPC-IF registers
+       - description: direct mapping read mode area
+       - description: write buffer area
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
+  "^.*@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        oneOf:
+          - const: cfi-flash
+          - const: jedec,spi-nor
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
