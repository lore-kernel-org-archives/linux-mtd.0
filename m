Return-Path: <SRS0=9oOa=MG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EBAC07E9A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jul 2021 11:31:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0176F6128C
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jul 2021 11:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0176F6128C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CPpqZ+L+hdkNeM/HsUtY7AwOHs7qchqoBiFuPiXLhxQ=; b=TytrXfDTSHvGMB
	2Vm48oMALTy11f/uHlDRiKbdv6uRK1QxelMdZNilVcDhAOCUo7HDpCxAr3owrCbuJr72SD80npTzi
	x9B401/RI61UDsKl4AFN8w/IgWXEhx/DPUCgJwSW3gKOTUjqtrjkV20wDohHDjySXdZi3OItPw0p+
	djx3W5vc3u2KaEGRJ8VCkdYiK5bPh6zfZms+be+rtrJYxOXg8L9p4dD/Jh3ZD2vkYaC+QdF/V6QHY
	nV406ALNYEiLj0imrqisxP2/1qwhNWth4GDL8+KxHwiAoFk1oRCAoCX5A4NZLsxQtVc+79yEJXRqK
	CNtvpGZt3rZWJEyDKBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3d5q-00DNkQ-8k; Wed, 14 Jul 2021 11:30:22 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3d5l-00DNiz-7b
 for linux-mtd@lists.infradead.org; Wed, 14 Jul 2021 11:30:18 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
 by laurent.telenet-ops.be with bizsmtp
 id UzWF2500Q1ccfby01zWF5D; Wed, 14 Jul 2021 13:30:15 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3d5j-0017bO-1o; Wed, 14 Jul 2021 13:30:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3d5i-00A9SG-Bi; Wed, 14 Jul 2021 13:30:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: memory: renesas,
 rpc-if: Miscellaneous improvements
Date: Wed, 14 Jul 2021 13:30:13 +0200
Message-Id: <d430f9c06d6691fe8a98f923cdb7ca13772834b1.1626262043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_043017_457369_C826CEF5 
X-CRM114-Status: UNSURE (   7.84  )
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

  - Add missing "#{address,size}-cells",
  - Fix rejection of legitimate flash subnodes containing multiple
    compatible values,
  - Add missing list of required properties.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../memory-controllers/renesas,rpc-if.yaml    | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
index 990489fdd2ac33fe..c0d899a2305361b1 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -56,17 +56,34 @@ properties:
   resets:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
 patternProperties:
   "flash@[0-9a-f]+$":
     type: object
     properties:
       compatible:
-        enum:
-          - cfi-flash
-          - jedec,spi-nor
+        contains:
+          enum:
+            - cfi-flash
+            - jedec,spi-nor
 
 unevaluatedProperties: false
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - power-domains
+  - resets
+  - '#address-cells'
+  - '#size-cells'
+
 examples:
   - |
     #include <dt-bindings/clock/renesas-cpg-mssr.h>
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
