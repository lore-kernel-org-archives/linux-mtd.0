Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A03C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:43:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13A6961977
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13A6961977
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ikDW5/XxGE8FFJS40E84U9r6t13LzY+jenbXhjxqxC0=; b=FzUoKbR95RDaQkOwI/Wabdbxt
	RaYviXYraV49hUUOyOAUJTRcNTxuPKr13xGr2/FzWR8+Itk75iIUa/P/PQppW8Dq6ssYhPG9J0SXk
	zNo/6ThZg3MS29FH10bUiYlEJVi6Ot9hjrxXq7n0zdysae+asfj3zRFVRy0lF6QvrXUD7rHHvVXzS
	x+27ucrA9FGfSSY/H0cyg+uB4hXk2H1nMCD5Da7/hAvibM6ygL3QOi5Fx9ndWr5gIn/+H+uivdMXs
	QHs36DrDJ6XHMQ4+eSVqbbwna7+7XQjnn7skth9yHHsODf+s5B1cSHt14U4Qss2Q2cIyYjfpY+PfJ
	6eKSVTc3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3Mg-00DyjB-47; Mon, 10 May 2021 10:42:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LP-00DyUG-NS
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=MdYKW9hUwsLljY+b8FNQtlkLV9SNwjkNd0+N76acb1s=; b=3ed3TzGMy6aEuIey9tEEMVTNsi
 x9hL0lNuAbpkkO25WywXvD2Vnfu/XMaYriJzh1bda/z8ve5IRbrDlRRVlP6SXnIO0UOZpOKMZdJWq
 TJ6JtyqIuNZQFGYqbhyBo7Y7cFzx/chl/j1WycdjKdDJh+1dpFeg5POPXWshlnrMkOaZjGYsc9ucO
 dUob3BQquGTI993Te8WrB1QMvAmhyI/Ulf90HLlbJwT7E35Hhhvq7YcpCgtgliDXayzcbQl+5TNbU
 xY4ZuUhz1wX7ICx4bmOEAIeNHky3HQe5Lyrx7dMqfCLeW1lcKiKbcEdWRrEWwKykfzRVAVOI6cLtP
 SIqFX7AA==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LM-008YZ6-PH
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:40:58 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2B0481C0006;
 Mon, 10 May 2021 10:40:54 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 1/5] dt-binding: mtd: nand: Document gpio-cs property
Date: Mon, 10 May 2021 12:40:47 +0200
Message-Id: <20210510104051.9701-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510104051.9701-1-miquel.raynal@bootlin.com>
References: <20210510104051.9701-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034056_998717_D1D0E37F 
X-CRM114-Status: GOOD (  12.60  )
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

To reach higher capacities, arrays of chips are now pretty common.
Unfortunately, most of the controllers have been designed a decade ago
and did not all anticipate the need for several chip-selects. The new
cs-gpios property allows to workaround this limitation by adding as many
GPIO chip-select as needed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/nand-controller.yaml | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 678b39952502..70a400e385b2 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -38,6 +38,15 @@ properties:
 
   ranges: true
 
+  cs-gpios:
+    description:
+      Array of chip-select available to the controller. The first
+      entries are a 1:1 mapping of the available chip-select on the
+      NAND controller (even if they are not used). As many additional
+      chip-select as needed may follow and should be phandles of GPIO
+      lines. 'reg' entries of the NAND chip subnodes become indexes of
+      this array when this property is present.
+
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
@@ -164,14 +173,19 @@ examples:
     nand-controller {
       #address-cells = <1>;
       #size-cells = <0>;
+      gpio-cs = <0>, <&gpioA 1>; /* A single native CS is available */
 
       /* controller specific properties */
 
       nand@0 {
-        reg = <0>;
+        reg = <0>; /* Native CS */
         nand-use-soft-ecc-engine;
         nand-ecc-algo = "bch";
 
         /* controller specific properties */
       };
+
+      nand@1 {
+        reg = <1>; /* GPIO CS */
+      };
     };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
