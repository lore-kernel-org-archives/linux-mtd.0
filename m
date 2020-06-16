Return-Path: <SRS0=/ENy=75=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12DFC433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 20:01:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD8B2206F1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 20:01:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wpjpfx5R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="0odJg0aF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD8B2206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtZ2uYwCIfHvXf24GcM8x7O36Xi+bxx4lw00YJakvdE=; b=Wpjpfx5R5y7M+R
	e0IwlDvRL2ue4a4qXsCh6dkMGGACGsXmTK34VhO9psxdmDtajZWDa7JhkejVYoVaHB5bTz1b8Q15f
	2Kb5Uixr+adoy53Wgg4Rp7+YrFQUPcTlet+JJs0gPWm6ffIvEiV+i+PQ54sH4/2r9KB4bXrzXT8bM
	7pS5DiQHauS6RAm5OjuWs9CiYdMpMDdj9P38grv4NI3EPKtChXDzrya4NyCpxUFBfmxOSOdcsOIp8
	H6X+senCQNzHkELaz1y6uGVHfUOXadFtEsK0Dmml27pDMGGlrkouzSL4Pc1jp0k/9YnaE+wuNxh1Y
	kZABJw43RJnkh8/1XfgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlHmH-0004iF-Rs; Tue, 16 Jun 2020 20:01:49 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlHmE-0004e7-4i
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2020 20:01:47 +0000
Received: by mail-lj1-x243.google.com with SMTP id s1so66353ljo.0
 for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2020 13:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aWO75gel+iwtZbxOhkXHjiT9tTB+84KOocNtLqXpNQ8=;
 b=0odJg0aFPYkly8BVHsV/pucfb+OV+iXoQ4S6FYiXNwAUIjsCEE7NL+N7LLEq2vTcNM
 RMES5+lN+Vn56mO89sK4UIhOd+/y/qLN4J+tznb26HZDXi9g0D+QJEsSIvBjaiCxviSY
 7EGAcCROk8VDncv2OOd9fu5jo6MzW2cl71WFB5edtE5OeZhmGHozIkHydQ1I+EobWRh8
 1MVsQNi6z/6FMXTVSOz1FBmNMh9fg+s+tkFqYZZS+eiWoWUOemapUwduy/dmdVmZybnv
 ZzHCNhUQuZ4GMm5guFlNeen/d7nqPJ1LxFVcw/PFeQpI1GTynXNsvPnunS1G408A8KYX
 jG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aWO75gel+iwtZbxOhkXHjiT9tTB+84KOocNtLqXpNQ8=;
 b=F7+HDkJ3sFiGZfpOzUsm1a4UoUmO4kP+H+uTLNyALwxDu1Eyq72EEsWL9k3N6HiPHG
 I5Y7Q5cyy7Ms2NajzAzQGQWnUxAXvE88+nVZpyU7IgBjrwSXA2fgbgQp6lWENsuD3dVE
 aw9taCZc8dN2N3ar1tTGJPbjyqzn0TGstpwSwZUv2xvwHU3AfVbiou2XN8QmoqbgUhnz
 brs4E2D8LyMbea0+9GX1rrzPCEcwQ0YbCwUh+mPY8mNGgcQjp/0+VxlQcmv4N8RaaSvh
 hzqSq94gbFNFY8e6URMhetIakjfuxAKw3gu/miqX8Hhc1M7E/CEdZ31RjMqRzOUCHjT2
 8w4Q==
X-Gm-Message-State: AOAM53280XVT4RQMR6+APClnzgQprIAECi7ZQq4wMfX4SkOSnZYqXgil
 EUwe/J3s+HPVS57kUcPt4pW3ag==
X-Google-Smtp-Source: ABdhPJzwR1DflJ6w6nkK+bK+LJFVbeD5x6k2Orz5FH5F23/BmUG+q2M4FTudf5HeY1gJBbxLN6PQSA==
X-Received: by 2002:a2e:b6c2:: with SMTP id m2mr2470985ljo.63.1592337704322;
 Tue, 16 Jun 2020 13:01:44 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:44fe:a796:a57:d8fd:42a6:762c])
 by smtp.gmail.com with ESMTPSA id q14sm4598485ljj.110.2020.06.16.13.01.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 13:01:43 -0700 (PDT)
Subject: [PATCH v5 1/2] dt-bindings: memory: document Renesas RPC-IF bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <9969c8a1-e6be-38a9-ced5-ce8c5ff07046@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <54a84c75-fa17-9976-d9a6-a69ef67c418b@cogentembedded.com>
Date: Tue, 16 Jun 2020 23:01:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <9969c8a1-e6be-38a9-ced5-ce8c5ff07046@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_130146_185404_7F4301AF 
X-CRM114-Status: GOOD (  14.34  )
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
Cc: linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Mason Yang <masonccyang@mxic.com.tw>
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
Changes in version 5:
- added R8A77970 to the possible values for the "compatible" prop;
- switched to my private email in the "maintainers:" clause.

Changes in version 4:
- added the SoC name comments to the RPC-IF's "compatible" prop description;
- removed a hyphen before 'enum' in the subnode description;
- removed leading 0s in the "reg" prop in the example.

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
+  - Sergei Shtylyov <sergei.shtylyov@gmail.com>
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
+        - renesas,r8a77970-rpc-if       # R-Car V3M
+        - renesas,r8a77980-rpc-if       # R-Car V3H
+        - renesas,r8a77995-rpc-if       # R-Car D3
+      - const: renesas,rcar-gen3-rpc-if # a generic R-Car gen3 device
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
+        enum:
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
+      reg = <0xee200000 0x200>,
+            <0x08000000 0x4000000>,
+            <0xee208000 0x100>;
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
