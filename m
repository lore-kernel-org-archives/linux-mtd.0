Return-Path: <SRS0=5cNT=72=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6005CC433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jun 2020 18:41:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FE0F207BC
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jun 2020 18:41:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EAISMreW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="AiRqStl6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FE0F207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rb9iXiMCtLPZVZecjzt0OLabY5R3JgDMUQefJbNa8Og=; b=EAISMreWB9Ybej
	Un5iHD9kImNjM6MDm6KTVTqQNXqwLAiwdNJ2d9ZriDmBmiKaz1ijyfUKEncEMrX8duKYAy1s8IsFB
	RpCgsNvt3ttDaVHgAkuI4xkO4WcZW5iGb5Dx64DH4tU5AR9PF5Bb0/B7DhjykQ2ov16uu6PrAjS8p
	Cp/n6VvKwtI8/CwILhez2Phpdz+S0nELAjsB+h/YMWZA+HomGlZSdxprSU5YPAuSHMVTqX3mBkTUt
	8DCSsJ2b7mtEG3dkThUTqbgX0sVbSuk/7ZU9lmykvZ7JkD2C1px3YtSQX4POHDCUM6meMoRDCglAU
	dNhYqO5e6Nt3c8RcmiCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkB5K-0002Zo-Qd; Sat, 13 Jun 2020 18:40:54 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkB5I-0002ZU-60
 for linux-mtd@lists.infradead.org; Sat, 13 Jun 2020 18:40:53 +0000
Received: by mail-lf1-x136.google.com with SMTP id c21so7268771lfb.3
 for <linux-mtd@lists.infradead.org>; Sat, 13 Jun 2020 11:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2ioFOqkA4a9a6fr9aGiz3zoxmx46SUsrv5GXgVDo4ss=;
 b=AiRqStl64KJspJSsGdLeJ+CRipTU5MqMyxGmA7ZYRDsduWAhyz+K4Mp12yzYrW3h2Z
 kQrrSw8F36967ah7xyOErSO7C0FOe86MFfKr60ZjRX6s5EGEWBlZXQ79EY7fmj49DZ8b
 sFuWyeA+ajOyXWhp+dnjgLWr1Jwd4XFfk7VcTnfJt4yvSpMVXhNMdc7vzElaNQcHuFfF
 Yt0Jku2WBGZhPCOBWTmn7IgzLEWLn0VHKHj63Kmm0EhNDv+aFR9wyuPPBweXP5d2Riuv
 Oh1caPbdYCe5vJ1SQuUfzgGCTeC89Lr+0VZdhFc+KKf5sgqNsZZTK/V3alHABWFs5HZ/
 k/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2ioFOqkA4a9a6fr9aGiz3zoxmx46SUsrv5GXgVDo4ss=;
 b=XJmQVUD3bEnreeV24wKyjbfwg5Y+5QK1XRkgfhA9mXrMg8da8KJ4xtDwaQTqZQv0hL
 HQlCjV982bmRqOFFC0WVjBuTw96P+HPpV3QtQW9WpQ0SSLUwsJpIMJp0Xb8I9mBfhA1s
 XQeT2WULNFheuUxAPG6AO04iShip7kZ0Z0QWKb7E4Nw3+i+Hhpy7epM0fFzgQS4QPKps
 IqOvR7GNRG7zbulHi7+IBGUeU1UTlw9HZcIjY+uI/RKHq9i7aFsFDRufsN2P5u/XjBJW
 FwxJxsc4pmUJjzCnjaPRNdgL+mGqAcjuvrxSJ9+89zvD2TUmIi0KMNmOJCRm3/z/aB4H
 zSxQ==
X-Gm-Message-State: AOAM533bKcxe1tonmqDHqdeCmBfsLBTB2IrXHuj98GmXgILH3iKuzHcd
 AMzfqmr7O2KbVgqGhEOhQNZEBw==
X-Google-Smtp-Source: ABdhPJyrG3RYdz2pYb8REdSpMtdT/bq1MHQ9n1xyhXYwIOLmAlDW70L8HixuJJw72laZSgiJcU939g==
X-Received: by 2002:ac2:511d:: with SMTP id q29mr9755341lfb.24.1592073650300; 
 Sat, 13 Jun 2020 11:40:50 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:2e2:84d1:c335:1451:e577:e115])
 by smtp.gmail.com with ESMTPSA id v23sm2763684ljg.122.2020.06.13.11.40.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Jun 2020 11:40:49 -0700 (PDT)
Subject: [PATCH v4 1/2] dt-bindings: memory: document Renesas RPC-IF bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <721e5306-6dc5-4a3a-2bbb-459be6261357@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <4becbd3b-c9b9-070a-5771-48cade6651e5@cogentembedded.com>
Date: Sat, 13 Jun 2020 21:40:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <721e5306-6dc5-4a3a-2bbb-459be6261357@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200613_114052_224083_E66D7DFC 
X-CRM114-Status: GOOD (  14.29  )
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
Cc: linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
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

 Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |   87 ++++++++++
 1 file changed, 87 insertions(+)

Index: linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
===================================================================
--- /dev/null
+++ linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -0,0 +1,87 @@
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
