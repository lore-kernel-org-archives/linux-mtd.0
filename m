Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEBBFD3773
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lzvxkn0UhWR0NtS38VYBOuIqwRRFrsNcFn3Ffzi13N4=; b=oTV4lJskJTZsbE
	tzuTZ82zw7s3RBI8MTQ4W4VRMWCKCaZvjsJ/9+qhrcnYq4N4YwM3TMiqCv7yZsh61pg2ThhSPcLnq
	XceDRDx1aVZOphnj+IQ+T/14/Gz0RrWmyQQZyCAnAi4orPYv4fzgKfnjfdjoDEpsSGgra0ARII2k9
	ak5WWkGG1zUKBFNAIPtS+B7U9Twv5UsIKn68xilDWWDEFekw4Br4r0ucDpFzDml7xs7FgTjAT0FHt
	c4NIfn1lfO4ceDfLYyoOo2bzDUaQvS0gUpW5VZrTHTl7NfqGw1jRcX8OmOBY0Wt8ecxU06tnrCamu
	ugyA/iiOGsQ1NKjbGL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHh2-00000004Vh3-3uhi;
	Wed, 25 Feb 2026 16:24:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHh0-00000004Vf9-2Peq
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:24:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 97DA44E41121;
	Wed, 25 Feb 2026 16:24:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F7EB5FDE6;
	Wed, 25 Feb 2026 16:24:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67E5B10369259;
	Wed, 25 Feb 2026 17:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772036690; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=abJKRw/BMMRuxFpyvUhg7fWU4EpemM0LOQXj3saoZxw=;
	b=rfv5+dIgOWyPultmlDTfUeZXZElPcoRds00yh+oRcxks3bNmGOQsFMtVmw0I1bMi1pP3On
	5FJCB5baHNxca/V3nIo0EWttv2xjr+XlG6UkwlNu4xZ6SEWuXnNYsnugFzX+5QE/lbtSiq
	WhDSDXqCS1r46qtdb23ImasuhMgtShC/lnAdidXn4KhcFWeX2ozZq4KIx64FyokAGG+NXJ
	YJfyrW54+E1NVKA2fnhLo5SnE5uXlQLHz6dS7BXBPwD1gtRvv/EzvqVyMvz3W7bd2SNCCw
	ZHTvd+ybkWs7lOQJYBMYOQfvNYPsDL6xccdoxoJr8wF288HQ/wA7Hy+FGxdrZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Feb 2026 17:24:43 +0100
Subject: [PATCH 1/3] dt-bindings: mtd: st,spear600-smi: Fix description
MIME-Version: 1.0
Message-Id: <20260225-perso-fix-spear600-smi-yaml-v1-1-8ef3d205ab3a@bootlin.com>
References: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
In-Reply-To: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhila YS <akhilayalmati@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_082454_749564_C7562520 
X-CRM114-Status: GOOD (  10.57  )
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

The description mixes two nodes. There is the controller, and there is
the flash. Describe the flash (which itself can be considered an mtd
device, unlike the top level controller), and move the st,smi-fast-mode
property inside, as this property is flash specific and should not live
in the parent controller node.

Fixes: 68cd8ef48452 ("dt-bindings: mtd: st,spear600-smi: convert to DT schema")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/st,spear600-smi.yaml   | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml b/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
index 8fe27aae7527..d065df269657 100644
--- a/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
+++ b/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
@@ -19,9 +19,6 @@ description:
   Flash sub nodes describe the memory range and optional per-flash
   properties.
 
-allOf:
-  - $ref: mtd.yaml#
-
 properties:
   compatible:
     const: st,spear600-smi
@@ -42,9 +39,22 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Functional clock rate of the SMI controller in Hz.
 
-  st,smi-fast-mode:
-    type: boolean
-    description: Indicates that the attached flash supports fast read mode.
+patternProperties:
+  "^flash@.*$":
+    $ref: /schemas/mtd/mtd.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+      st,smi-fast-mode:
+        type: boolean
+        description: Indicates that the attached flash supports fast read mode.
+
+    unevaluatedProperties: false
+
+    required:
+      - reg
 
 required:
   - compatible

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
