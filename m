Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A567CC2BBCA
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2024 21:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FsP3OVQdseBtSZbTwgwsirO5ZeKRT2BgGe4NxRs3Dd4=; b=vi5BgeU2s9zKqH
	4TXP8Ak7wFwBkvG1hL36HkYRF9Dg6SsGdZUAL+3rWAeR5L/N69VUoqa4Jdh7krcAiOT7OWZ0Zpu0f
	o3UaPZjzfKpb6kzwKpEO6KogBY7Iyg5+hfwTEbJVsXb95jw5Dksj4+aJz8j4LL1aZ6t6FpI4UolMo
	pSZy2RkNSqSFWBCtauM0+qhGlTTKPAX0v4q73K5o45YOgW7tfDvQ+vBIHUzO8JJh4hF6nHBJolZSC
	9j2Xg2pTFjT6YvP+ma05omQR/kLB1Jgi6ku6IqNlFkP7aqkI7qfnIExVsq2PZc7ADu/R+Z96sspb7
	PE2qDIzOBlXci7lUIUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sME99-00000004dOh-2T3G;
	Tue, 25 Jun 2024 21:56:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sME96-00000004dMk-1Bgu
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jun 2024 21:56:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D1B261786;
	Tue, 25 Jun 2024 21:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2FEC32781;
	Tue, 25 Jun 2024 21:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719352571;
	bh=K11oj0mpuiJIpnSwm951vDCz0rxmDAGitZS/Kht8+BI=;
	h=From:To:Cc:Subject:Date:From;
	b=qa1EKwMJcV/aUJojPxmYqAbh2FsUSFrsVTAGePBLcNRsVgU6LOmgyD4/sUPB0nXX/
	 kSVZAQTdoZlRL7O0SOSayMt+FYQXENyZABcqPkkX05YJRsYBVPxZVme7CGcSisP0zI
	 oiaZHsGiztbVzbbtEF4eN/uGl//4QJjUgJiahuNDCKVg8mez7WBudax3owXTUtOlSw
	 F8AB/TtNqQMqY/XzZzkM0MRUI6zUCbHR/ma+HbkkkLzc1yhu4y5OvC06cwuVeedDJP
	 jLzIIFhR8lFrmIvR/1bcXrl8tOvgglPIeh+ZiAjWpleMny0ipv/77yds55NlH9ka5s
	 HpfFk8QvXbX8Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: qcom,nandc: Define properties at top-level
Date: Tue, 25 Jun 2024 15:56:05 -0600
Message-ID: <20240625215605.192260-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_145612_454323_3B4139AA 
X-CRM114-Status: UNSURE (   8.57  )
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

Convention is DT schemas should define all properties at the top-level
and not inside of if/then schemas. That minimizes the if/then schemas
and is more future proof.

There were 2 "if" schemas for "qcom,ipq806x-nand" and the
"qcom,boot-partitions: true" unnecessary, so the conditional schemas
can be simplified a bit.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 38 +++++++------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 4ada60fbf81d..35b4206ea918 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -31,6 +31,18 @@ properties:
       - const: core
       - const: aon
 
+  qcom,cmd-crci:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Must contain the ADM command type CRCI block instance number specified for
+      the NAND controller on the given platform
+
+  qcom,data-crci:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Must contain the ADM data type CRCI block instance number specified for
+      the NAND controller on the given platform
+
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
@@ -83,18 +95,6 @@ allOf:
           items:
             - const: rxtx
 
-        qcom,cmd-crci:
-          $ref: /schemas/types.yaml#/definitions/uint32
-          description:
-            Must contain the ADM command type CRCI block instance number
-            specified for the NAND controller on the given platform
-
-        qcom,data-crci:
-          $ref: /schemas/types.yaml#/definitions/uint32
-          description:
-            Must contain the ADM data type CRCI block instance number
-            specified for the NAND controller on the given platform
-
   - if:
       properties:
         compatible:
@@ -119,19 +119,9 @@ allOf:
             - const: rx
             - const: cmd
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,ipq806x-nand
+        qcom,cmd-crci: false
+        qcom,data-crci: false
 
-    then:
-      patternProperties:
-        "^nand@[a-f0-9]$":
-          properties:
-            qcom,boot-partitions: true
-    else:
       patternProperties:
         "^nand@[a-f0-9]$":
           properties:
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
