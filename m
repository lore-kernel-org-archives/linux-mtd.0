Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D6BC4828F
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Feb 2024 20:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCiENwZNKWW2M+49ljTt8FmMo+TWSnUG3sCq74uE/Qw=; b=ztG95gg4CNYz0o
	4vmgkj3WvsbAZ5DT6kbtwkT/YZa5i1HXsADVCD9ZOGx324GG1l3E6PSUrilITJK/BxLrPOTPig1k6
	2zbu3KHOfOTx0E10jnBCKASDz4qRjonTIM1rd0xMxkSozDG4NQy+hzV2h/IETFIP+SMAOcZxY5MuU
	uQ4qkooq7KjMZa8BWpiKOkyMMjMpq7krpJOk+uWLoWgSeN05jcSB5CX8gQpWQyjU4ROdwFl/CyZpV
	mXxNUgAGrOckKnhhgFcC/DJCOoP3IB9B/toobCxjR0bB2jlVD7R2dsqE6IHwlNekzUHwycogTeoxU
	Z2urfI110ej1TJxCu1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXoSN-0000000BhzK-0jbK;
	Wed, 07 Feb 2024 20:23:43 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXoSF-0000000BhsB-2QCS;
	Wed, 07 Feb 2024 20:23:37 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 2C616C002E08;
	Wed,  7 Feb 2024 12:23:35 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 2C616C002E08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1707337415;
	bh=tkkKLCiY+CmMh/9fyV9TP9Qpf1i/v+KHxHF98/KxN+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ix1v4o9bKQFqE4Iq/7WQfxDfx2qYveU8FtEqQHEPNaNYdCYT5IM5bJE59Thpp+1fU
	 N3mVgwVY7/aetVlvupau5v6F1Xu2oNkutjYM1hhd9zaNT5Y6NSwhag2LcWJoyOiZAU
	 9dnxC7ZPD4zTY1BFOQRaD+dmuN/wsu05Rn1R5w/Y=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id BB3FF18041CAC4;
	Wed,  7 Feb 2024 12:23:33 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
To: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	devicetree@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 03/12] dt-bindings: mtd: brcmnand: Add ecc strap property
Date: Wed,  7 Feb 2024 12:22:48 -0800
Message-Id: <20240207202257.271784-4-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240207202257.271784-1-william.zhang@broadcom.com>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_122335_697858_944F685D 
X-CRM114-Status: GOOD (  12.54  )
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

Add brcm,nand-ecc-use-strap to get ecc and spare area size settings from
board boot strap for broadband board designs because they do not specify
ecc setting in dts but rather using the strap setting.

Signed-off-by: William Zhang <william.zhang@broadcom.com>

---

Changes in v5:
- Update the description for this ecc strap property
- Add check to make sure brcm,nand-ecc-use-strap and
  nand-ecc-strength/brcm,nand-oob-sector-size can not be used at the
  same time

Changes in v4:
- Move ecc strap property to this separate patch and remove some
non-binding related text from the description

Changes in v3: None
Changes in v2: None

 .../bindings/mtd/brcm,brcmnand.yaml           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
index 6a717bcedfd3..52a4c993b6f1 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
@@ -146,6 +146,13 @@ patternProperties:
           layout.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      brcm,nand-ecc-use-strap:
+        description:
+          This property requires the host system to get the ECC strength
+          and step size from the SoC NAND boot strap setting. This is a
+          common hardware design on BCMBCA based boards.
+        $ref: /schemas/types.yaml#/definitions/flag
+
     unevaluatedProperties: false
 
 allOf:
@@ -195,6 +202,18 @@ allOf:
       required:
         - interrupt-names
 
+  - if:
+      patternProperties:
+        "^nand@[a-f0-9]$":
+          required:
+            - brcm,nand-ecc-use-strap
+    then:
+      patternProperties:
+        "^nand@[a-f0-9]$":
+          properties:
+            nand-ecc-strength: false
+            brcm,nand-oob-sector-size: false
+
 unevaluatedProperties: false
 
 required:
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
