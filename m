Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79302C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:21:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B2E461992
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B2E461992
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sEJFqhSntTURtkOEquKiJ88A88BWHNeT+BHBOQ4EXfM=; b=mfTFiBzhrev7eRzVvIteqf18g
	0QoJv9Yqvm4kbIlXaLDaeZUnLD9ObflMn6mZVkEUimmm4QZg6yVDpZi39SWNRDlckVrdvxH6sPMon
	uN0MnCgYzsH63UW9bBO89AIJ519CYCjSWS4QijaPS6vpat6wPfiJsactTMMUJMTWPDqGyFqqnVImX
	9OZBIlCR8aOPhlJhaliStIrD6UfvAcA8euzKFl/bAWS7w8pGZWvjAcVnDH1ioqpBU+q1IE48TaAf7
	VlTZegFw+zmyzB8kJFDv6PvFGVL1mMNSGEWOvE6uZ9qHWaeMGCVMvhPxE1rd5zekKIU0oc8i4tabX
	6UZqgz7Tw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOPAg-00CEuS-5I; Mon, 22 Mar 2021 18:20:58 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOP9u-00CEie-HM
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 18:20:12 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DE73822253;
 Mon, 22 Mar 2021 19:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616437208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ly/ltM96HKL3LdgK2QYn3SH/X0EmhT5KbbgmWYv46uU=;
 b=hdYWOGTit3OOOvsID+aU6tkg3/qj3c+sb6BxHOVnDVAcoy9CqpWUT7Ra+DO/lHlmttxKfP
 h2td37iA9iLD6IiUedxWBXkZEuR2uDWz0VUtD7B1CGigtvPFg/qCMQZUdjZCNuSuN1yqRN
 ii/QzZwKcOhDKubbVvPfVL3KVemQyFg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Michael Walle <michael@walle.cc>
Subject: [RFC PATCH 3/4] dt-bindings: mtd: add OTP bindings
Date: Mon, 22 Mar 2021 19:19:48 +0100
Message-Id: <20210322181949.2805-4-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210322181949.2805-1-michael@walle.cc>
References: <20210322181949.2805-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_182011_243913_4A7BF766 
X-CRM114-Status: GOOD (  11.00  )
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

Flash devices can have one-time-programmable regions. Add a nvmem
binding so they can be used as a nvmem provider.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 .../devicetree/bindings/mtd/mtd.yaml          | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 321259aab0f6..2b852f91a6a9 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -21,6 +21,25 @@ properties:
       based name) in order to ease flash device identification and/or
       describe what they are used for.
 
+patternProperties:
+  "^otp(-[0-9]+)?":
+    type: object
+    $ref: ../nvmem/nvmem.yaml#
+
+    description: |
+      An OTP memory region. Some flashes provide a one-time-programmable
+      memory whose content can either be programmed by a user or is already
+      pre-programmed by the factory. Some flashes might provide both.
+
+    properties:
+      compatible:
+        enum:
+          - mtd-user-otp
+          - mtd-factory-otp
+
+    required:
+      - compatible
+
 additionalProperties: true
 
 examples:
@@ -36,4 +55,56 @@ examples:
         };
     };
 
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            reg = <0>;
+            compatible = "some,flash";
+
+            otp {
+                compatible = "mtd-user-otp";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                serial-number@0 {
+                    reg = <0 16>;
+                };
+            };
+        };
+    };
+
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            reg = <0>;
+            compatible = "some,flash";
+
+            otp-1 {
+                compatible = "mtd-factory-otp";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                electronic-serial-number@0 {
+                    reg = <0 8>;
+                };
+            };
+
+            otp-2 {
+                compatible = "mtd-user-otp";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                mac-address@0 {
+                    reg = <0 6>;
+                };
+            };
+        };
+    };
+
 ...
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
