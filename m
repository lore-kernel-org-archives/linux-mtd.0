Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01467C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 12:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuRu74Y1Jrq3T5/X34FVZgzvCaN72hT6aolhuSv8Iw8=; b=Fxtvzo58EA6bIJ
	NuwiGLrb/Wak/YGfOloHp6E3rQEtelJ1Z2SN3jGCZ6ThHReKwlXdNXjK+ZfPssfJg5GpJtEkqkOCp
	VcObeip1cSKwOdE0MRfBAkL7ro5jA3qOPn8cNEOGhS5lTPur/OqqUdbHOz3p1jp7BKg6apQW7Ebd1
	x+9gtYOgjELBTfWqS+WC6IT6dYLUvtCqbjsP/n8xeLbh0I7f7YyPAR68/PAPC/lF80s7NSPK6XiRi
	q5ID676S5U5hUQInqkrHH8lYdlZkMQM9YsKsYIZuF02HmnNe8Eq3/g84O/9zlCQDktfkE5Mq0kgE/
	m+rtA9Fh+vyQZyE7cUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXjCC-00252m-4o; Fri, 25 Mar 2022 12:37:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXjBw-0024z5-Od
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 12:37:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2BE3F61A08;
 Fri, 25 Mar 2022 12:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593C8C340F5;
 Fri, 25 Mar 2022 12:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648211840;
 bh=h5t3lHDxilF2die7J3nsNMpIGBfRLhFJI3qeoIHgotE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=evxYEBywQrDAhv8dH2eKjnt+4aJ9yPhhyn0uoGeuhEFc6AP5nIb39GG+PdeyOAlBt
 AbH1Un3lfQbh6FAhzMWYqXteTLEADvkidMG59m8VFI21tEV0LVv2qvPiohFbSAAgAr
 LFzVw6nO6xZBxsdiA14ZgP2xDHjWm9hyj4SnCE+6pdgYrhhLrFyBNrwMChmPN2nBo3
 osQ1i92+61CmDkybjnWJmQyH+rMz21cE1LL5D36JvIkvz1GJ/ocIhrUVQ5JX1W8AEJ
 v+3UA7wOOidY4kHy73hPBD3rplAT8RmzXB8R72YM7C/P7Orv90MW4ZRQXNcls4bBkv
 MC9nBLoxg/wWA==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	robh+dt@kernel.org
Cc: richard@nod.at, krzk@kernel.org, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: mtd: ti,elm: Add support for AM64 ELM
Date: Fri, 25 Mar 2022 14:37:06 +0200
Message-Id: <20220325123707.22020-3-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220325123707.22020-1-rogerq@kernel.org>
References: <20220325123707.22020-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_053720_857908_AD296006 
X-CRM114-Status: GOOD (  10.61  )
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
 .../devicetree/bindings/mtd/ti,elm.yaml       | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
index e36452b742c0..967c87f32c71 100644
--- a/Documentation/devicetree/bindings/mtd/ti,elm.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
@@ -16,7 +16,10 @@ description:
 
 properties:
   compatible:
-    const: ti,am3352-elm
+    items:
+      - enum:
+          - ti,am3352-elm
+          - ti,am64-elm
 
   reg:
     maxItems: 1
@@ -24,6 +27,17 @@ properties:
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
@@ -36,6 +50,18 @@ required:
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
