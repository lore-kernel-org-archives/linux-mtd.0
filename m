Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CADC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 17:19:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D3361458
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 17:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45D3361458
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dFLRcxTHmQjKaFrPVFP2CM55KLcTYc01oYHCRCt7reg=; b=AZOVq7qlcF3vlBaul0wFkrNkRg
	ci9Djw84k0sLJNjZGRO5T/rmI2oIY2376Fb/DHhk6PmJOgLLR4BdBwmLf8l6Xql6ow97Dd3/YjfJu
	dQHKYglAGfDZBSg8sLK6XCQvtkUubM5u47nlDzLJjn8DicRcQ0ZqR8Dvh9LuUy7u6AOlnilgqt/Dh
	AhRn7Njc6OO4r+kqLHJL20MFllRXUYPXXVkdIO4yqt6ijFgIb5EH450k2icO0CJ83yEn44n1kc8VR
	y28/PLjZ6AkALCDCbSt9rGFaDho6JlzxlIahrItGYu+Pd+6P2HoIes1nASMhAgkhwxlbJTQjVd/UU
	iL6ZN0yA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg9Xq-00F7cL-KY; Mon, 10 May 2021 17:18:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg9Xl-00F7au-CN
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 17:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=samvVKfx8ORhRsVDJpQjT4pMtkzy9hW5DrKZrybhle4=; b=GLKZKNOlyfLtE9pP6dCtFZeu+G
 f4KlBDVdE2agh1bUT+Qg0aBkwepHmEcVu3f0Y3D7QODeYaATI1sxaHP6YrHynLQdkfFSyCTQZvr+m
 8HyfdeSpbkqPFfN8xSJHx8I5z/9Pl1SdoxXXBUU1vsOmQWKzkNiEpE5Ndr6bdIX8ni9Z2B8YVucdU
 /AUu4SWJlDw7D1L5AWYq6KEqOcWlwP0bHAH9SAxrEQOjDnEIKuxmCqiAnRPA7bSlmzLcDkGOB6Imh
 hTJu2XT9zaKOiq3MYsQ/b2Jr+5AxQ9U0BKcR/XC/f1rh8Ty+4eE6YLOBVvcVbEcC3Ln4BZnSsWQUZ
 6QgMjj8A==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg9Xi-008y0k-E8
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 17:18:07 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9C4ED60036;
 Mon, 10 May 2021 17:18:00 +0000 (UTC)
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
Subject: [PATCH v4] dt-binding: mtd: nand: Document the cs-gpios property
Date: Mon, 10 May 2021 19:18:00 +0200
Message-Id: <20210510171800.27225-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_101806_632902_3E80DB85 
X-CRM114-Status: GOOD (  14.66  )
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

Resending only the binding patch of the series, with the following
changes requested by Rob:
* Fixed the coherency between cs-gpios and gpios-cs
* Added maxItems: 8 (this is a good enough value for most of the cases I
  guess, this can be increased later if needed).
* Adding maxItems: 8 lead to an error when checking the example,
  minItems: 8 had to be added as well to the schema to fix it, not sure
  this was expected or not.

 .../bindings/mtd/nand-controller.yaml          | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 678b39952502..bd217e6f5018 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -38,6 +38,17 @@ properties:
 
   ranges: true
 
+  cs-gpios:
+    minItems: 1
+    maxItems: 8
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
@@ -164,14 +175,19 @@ examples:
     nand-controller {
       #address-cells = <1>;
       #size-cells = <0>;
+      cs-gpios = <0>, <&gpioA 1>; /* A single native CS is available */
 
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
