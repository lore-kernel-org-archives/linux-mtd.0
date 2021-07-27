Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C42FC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 16:02:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD1261B6F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 16:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CD1261B6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=An8d2Kyw5J/7FupK6+RohmYBnwSuBarRFwcnTiuCxBU=; b=vpB2lrRbRCahtr
	opGKMWknfb2ehdVkRDvy0aajvgU8NsR3j31iBRvyzD+/S7N58fw1h94wWSDq7xwWbu+Dlv8ul6lHR
	XYgKUUJ69POQZq6ASN8pcpxMZH2/lVgq3tYdJwO9EKxCchlV1LHu5B+pI1PPLhIlgcMzgwF8xBoyi
	mgT7ibcef2w1gihw5NcPbc/KftBjYOR1hMijzL9hjfp3jkSlC3hBw05xBV36S3xxr4JzEWFlMm6+K
	IhN7fr3rdEdwUyrvNx5zvbwii9aV1xUhiyCCM7YwcyArsqwbUyN+Lb/JcZKzekWuqqf2x0Yg8GnC9
	8V/uOGiwDNIsyOXBou7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8PWD-00FGuH-NT; Tue, 27 Jul 2021 16:01:21 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8PW8-00FGqh-VM
 for linux-mtd@lists.infradead.org; Tue, 27 Jul 2021 16:01:19 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b0a9:7e88:5ca4:551a])
 by michel.telenet-ops.be with bizsmtp
 id aG172500F1fSPfK06G177b; Tue, 27 Jul 2021 18:01:09 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m8PVz-001RuT-4K; Tue, 27 Jul 2021 18:01:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m8PVy-00Fqnr-Ml; Tue, 27 Jul 2021 18:01:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: memory: renesas,
 rpc-if: Miscellaneous improvements
Date: Tue, 27 Jul 2021 18:01:05 +0200
Message-Id: <d81b59a513c2a5204c8378b4a89cd07f97c46797.1627401508.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_090117_192236_99D32CA5 
X-CRM114-Status: UNSURE (   7.94  )
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

  - Fix rejection of legitimate flash subnodes containing multiple
    compatible values,
  - Add missing list of required properties.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop #{address,size}-cells.
---
 .../memory-controllers/renesas,rpc-if.yaml      | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
index 990489fdd2ac33fe..d25072c414e45326 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -61,12 +61,23 @@ patternProperties:
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
