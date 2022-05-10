Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33A0C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fk8XHGclEMaclsU+Tj3SMtBht0yHVPH37kQW6PgnSLU=; b=CNO14y+Wx7AlIf
	p7HoKmn9deSf4WMYFDMxTBAXEZS3FbfXe6+tnxllC6ammvovLYcSu/sG33R7cEJnVWZVqxoklOIYH
	mI1RVuvhzlFE3l6pxPNd9972wNBbhXcfoEJIBoXbS+Lcw+p7trwck3FB6Agtl9aASKebUq03s3w7X
	bh4EuuSUFGXU9rjlZffpC2nNI0pcJFNBaf6lGzoGd1nVJKSOEO9jSu6TR2GubpsLCV0nOU1RSIJv0
	OTghkjLLRB1Hemk/h17uiuEkL6iYQGaAMgcRSU9lV0YGjqh2R44dm74ymi6McQFOFH9JRVIQhxr1s
	sohkUPkooE5UpQbEGV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSeu-0033JI-DJ; Tue, 10 May 2022 16:24:24 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSep-0033DV-Vv
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 16:24:21 +0000
Received: by mail-lj1-x231.google.com with SMTP id g16so21509753lja.3
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2022 09:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z+YkSbV6bjoznxMCuUfht3UUoaizx6Wbg5BycQIS6zs=;
 b=A05ZxnXVAWmmDDGxBx9E47mbX7S0Lb5kx3BXIz0LE4ucreSY1X5yTdw7uft1fPn42/
 aSTUlBrV3mgtTEgdylYx+nll563rrNB3yLv3YfpwcocKTTB2nJlHQuPPZGDOFo9FkApv
 /nt7jSKjA7VUx7/6XV8T/FD/6BPbfx5kbcMXuaFE9qU1KY5ooZyFiGQsQQjAxe8SV26L
 n4CchBQ/O/UQcRId+lmCaDgNha4pS/0skcAe5ggQpZbwwC2dvFNIifmWQZeGdp+Mn/9X
 3IfuPe7QNMlHO9mJiWu7xumyVo9xH3sYL1B7a3UvEOfhiosc9MogVya8LuVtSls1mevH
 u79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+YkSbV6bjoznxMCuUfht3UUoaizx6Wbg5BycQIS6zs=;
 b=VGu1dqVE2x/VDVYtoizma9F4iXZW7zR6H/ULBIMK4dsDUdPVBwhur7G/FAlTyj3tCf
 7lPSsYKkeex1yFmxd6fiP72DWFBGTY2r1gAvlTuhRKz5wxWs/LRJEQzC8dCT4hJXQvGd
 eiXWrheIrPJxyU2u5rOOYB9SBEP3kyMkNPO5OWKhUjtU3ggxgPvc5ejpZE5fm3nokFqi
 8fB0mP627aBGNtflez3HflryEV0lB11JoKh4o6vU/DLNDKIm40LeBKUWWfTLYFVUpTFC
 Zz2H09C/fDzuUyN89Sy8oQGnKtNrt7O4InzlLh8ijnzquBsjRx3Xys6DYRjloUspVZr1
 0wKQ==
X-Gm-Message-State: AOAM532+KuQOLHb8sDOTq7qYsdwG8JFGymKi1k+V/9urawPa0AxWIUSZ
 3GloLh3jaC8/rB4J1ZPEtwI=
X-Google-Smtp-Source: ABdhPJyJMk2lXCJXghy02HIfIaweFY01KpQ6Pmd5e5ocPKNv1uom8v6aOVxqjQNPks87LU5Q4KIkog==
X-Received: by 2002:a2e:a30a:0:b0:24f:cf6:11ab with SMTP id
 l10-20020a2ea30a000000b0024f0cf611abmr14027237lje.461.1652199855528; 
 Tue, 10 May 2022 09:24:15 -0700 (PDT)
Received: from vmu1804.lan ([2a06:a003:501a:a7ce::887])
 by smtp.googlemail.com with ESMTPSA id
 r12-20020a19ac4c000000b0047255d2111fsm2338420lfc.78.2022.05.10.09.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 09:24:15 -0700 (PDT)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, Mikhail Zhilkin <csharper2005@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/3] dt-bindings: mtd: partitions: Extend fixed-partitions
 binding
Date: Tue, 10 May 2022 16:24:03 +0000
Message-Id: <20220510162403.20861-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510161641.20655-1-csharper2005@gmail.com>
References: <20220510161641.20655-1-csharper2005@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_092420_059713_1024FCCA 
X-CRM114-Status: GOOD (  13.52  )
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

Extend fixed-partitions binding for support of Sercomm partition parser
(add "sercomm,sc-partitions" compatible).

Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../mtd/partitions/fixed-partitions.yaml      | 55 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index ea4cace6a955..ad3ccd250802 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -19,7 +19,11 @@ maintainers:
 
 properties:
   compatible:
-    const: fixed-partitions
+    oneOf:
+      - const: fixed-partitions
+      - items:
+          - const: sercomm,sc-partitions
+          - const: fixed-partitions
 
   "#address-cells": true
 
@@ -27,7 +31,24 @@ properties:
 
 patternProperties:
   "@[0-9a-f]+$":
-    $ref: "partition.yaml#"
+    allOf:
+      - $ref: "partition.yaml#"
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: sercomm,sc-partitions
+        then:
+          properties:
+            sercomm,scpart-id:
+              description: Partition id in Sercomm partition map. Mtd
+                parser uses this id to find a record in the partition map
+                containing offset and size of the current partition. The
+                values from partition map overrides partition offset and
+                size defined in reg property of the dts. Frequently these
+                values are the same, but may differ if device has bad
+                eraseblocks on a flash.
+              $ref: /schemas/types.yaml#/definitions/uint32
 
 required:
   - "#address-cells"
@@ -52,6 +73,7 @@ examples:
             reg = <0x0100000 0x200000>;
         };
     };
+
   - |
     partitions {
         compatible = "fixed-partitions";
@@ -64,6 +86,7 @@ examples:
             reg = <0x00000000 0x1 0x00000000>;
         };
     };
+
   - |
     partitions {
         compatible = "fixed-partitions";
@@ -82,6 +105,7 @@ examples:
             reg = <0x2 0x00000000 0x1 0x00000000>;
         };
     };
+
   - |
     partitions {
         compatible = "fixed-partitions";
@@ -119,3 +143,30 @@ examples:
             };
         };
     };
+
+  - |
+    partitions {
+        compatible = "sercomm,sc-partitions", "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+            label = "u-boot";
+            reg = <0x0 0x100000>;
+            sercomm,scpart-id = <0>;
+            read-only;
+        };
+
+        partition@100000 {
+            label = "dynamic partition map";
+            reg = <0x100000 0x100000>;
+            sercomm,scpart-id = <1>;
+        };
+
+        partition@200000 {
+            label = "Factory";
+            reg = <0x200000 0x100000>;
+            sercomm,scpart-id = <2>;
+            read-only;
+        };
+    };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
