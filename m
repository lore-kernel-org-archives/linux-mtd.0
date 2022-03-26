Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78D5C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Mar 2022 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOAMuvIPLyPBZFhXDQtSytbUAK3YUUYJ41ym2tRZ0io=; b=bwDGcY49+UTbQa
	eM3WQG3ITHhYzRLqzz3b+htRPaYlWJfSm7+RAQNmIEi3tnk6LX2qZ24DRk9j2+he8qRKMOtZ0mXGW
	wgzWZ9RSupTP2uALYC22IEIBl05hcIuP4YQUmnk3xa3ESfu2Q7E0qrF/gdKGsO8FNucP8hPHF9Cag
	xHGYwd33YZgG9cQ1vxMmqOdtyK35crF23XhgD/BL1D2SnB775/3WLpUTFZOh8/uheWdJRmJX44V/7
	dc3bkmG4fFCg7FRTK8nspGlHvxiiXhpe475diuhZ27/2AHTGd9RfXA+UZU55xIwerVdQIqpdUeI9/
	13WCBSkK56ZODMuiS16g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY1So-003yR5-DG; Sat, 26 Mar 2022 08:07:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY1Sa-003yN0-A4
 for linux-mtd@lists.infradead.org; Sat, 26 Mar 2022 08:07:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB26660DB5;
 Sat, 26 Mar 2022 08:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5255DC34111;
 Sat, 26 Mar 2022 08:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648282062;
 bh=gr9HchemhlHv/PQFsx5RRjuRl/DHTMwiXnwOfg3j+ec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=It5KV9kPNYm7RhNQVTe7cIzRFDFdtthuOV8V4V004ekTLCBKbgBsDHEdVzqnRRCOK
 a97Cs5YHsROi9+/708bNV9zzIjZC0xPuIhvrYZV2u0WRE/7b3JficOgxM8WfQtVmcs
 ID1y62wPWqKzlI5ur+cm5EO0L+FUFh8r42iQt+RF0Grz7nNWXLKZCCz9utTnarMl9p
 IPtBp+sbHXZaTKB04R1ndbJaS2C62gUD/phVtFMXTOW5PTilrpigikyqZElou1hvSF
 9a+q4HtVpX/e8S1IXxbiBR3lLx154tL2Os17QY3wM1K3o1j80aQNjmE+Aku8mrLGyj
 eYutuvq62H2wg==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	robh+dt@kernel.org
Cc: krzk@kernel.org, richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v3 2/3] dt-bindings: mtd: ti,elm: Add support for AM64 ELM
Date: Sat, 26 Mar 2022 10:07:25 +0200
Message-Id: <20220326080726.30372-3-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220326080726.30372-1-rogerq@kernel.org>
References: <20220326080726.30372-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_010744_409797_E1642586 
X-CRM114-Status: UNSURE (   8.42  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TI's AM64 SoC has the Error Locator Module. Add compatible and
related properties to support ELM on AM64 SoC.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../devicetree/bindings/mtd/ti,elm.yaml       | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
index 1821395bbfb6..87128c004596 100644
--- a/Documentation/devicetree/bindings/mtd/ti,elm.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - ti,am3352-elm
+      - ti,am64-elm
 
   reg:
     maxItems: 1
@@ -25,6 +26,17 @@ properties:
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
@@ -37,6 +49,18 @@ required:
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
