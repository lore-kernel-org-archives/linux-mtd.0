Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D6FC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZfmUfK8wtbtwC/S6Yvvd7Z3OSdkKtqZ0BU5TgHUzrA=; b=ShKukMTxpUs+7n
	M36Z+VN9o8+hFzpYhl4S9Bn72m4TZczXgH14p7EkWcN+TxynF9QZN7KSkmTd5Zrb5dXBg1gEMoatt
	G2L+iHMpXNKGKNde+gDXeUhGJfj+X6wjydE7VWf3na7mcuJHFkp0pB8G+gUw8jxlDgQ2eXCFM3Iqt
	nmcKwouy8qRzrjBA7VcJyR0q2/S1sMdskIWp3DFea/B7j925ajgqascztGLlz5ZBN76MlbDwz4dsh
	eOweFDY46Q7dZJu7PavTUj8NcOjeZiTRFh9mS03APZGWJc+0jOelDfk9Tx8y5ZNbu7QjP4T8Rz+oF
	JqlfZmc+qDSwbHf7QpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWz1b-00DRKb-8C; Wed, 23 Mar 2022 11:19:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWz1D-00DRCA-5m
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 11:19:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4E65BCE1F5A;
 Wed, 23 Mar 2022 11:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD0DC340F2;
 Wed, 23 Mar 2022 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648034345;
 bh=rG16zrXMlR5pZ2N5h0bd4xXIP29JlwrupEHA19K82bo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jNt7fmQq7JORRVP6/1tw+bRPSDhZrK9iyI8llDrqrzJGJpdIDabtRK3P8wM6za5R1
 xQSiVp2eqC8Gwv/vBTES76XDBwQ3nI5Ebx90SIllsBXStpj1QEf+x8em8FX2JaoKCH
 jMiqbj/5e9k34gpBWSZFnC6frDVebFeao6RzxROW0oJikp1zDjxkN/QOjPLzFop/ga
 bgbWBYj9mr8nTz8MBUFejke5OGK9aKNFhUpwTYR8MsShs7RRfyzNq9/wt/uLlQ732a
 k6dFQGju3d9+ZpoVnxfRPML2+SnhT8aekLD+bCgds2it6M++dEh3MT2c+mvVYb+cg8
 AKwXqFpvGBnhg==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 2/3] dt-bindings: mtd: ti,elm: Add support for AM64 ELM
Date: Wed, 23 Mar 2022 13:18:50 +0200
Message-Id: <20220323111851.4699-3-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220323111851.4699-1-rogerq@kernel.org>
References: <20220323111851.4699-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_041911_434269_4ABD3072 
X-CRM114-Status: GOOD (  10.77  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TI's AM64 SoC has the Error Locator Module. Add compatible and
related properties to support ELM on AM64 SoC.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../devicetree/bindings/mtd/ti,elm.yaml       | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
index 24ed0fb84204..bc01d35ce605 100644
--- a/Documentation/devicetree/bindings/mtd/ti,elm.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     items:
-      - const: ti,am3352-elm
+      - enum:
+          - ti,am3352-elm
+          - ti,am64-elm
 
   reg:
     maxItems: 1
@@ -25,6 +27,17 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+    description: Functional clock.
+
+  clock-names:
+    items:
+      - const: fck
+
+  power-domains:
+    maxItems: 1
+
   ti,hwmods:
     description:
       Name of the HWMOD associated with ELM. This is for legacy
@@ -37,6 +50,18 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am64-elm
+    then:
+      required:
+        - clocks
+        - clock-names
+        - power-domains
+
 additionalProperties: false
 
 examples:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
