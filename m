Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB51EC48BC4
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 05:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Shbe9QgdkDzU9OcjVUgjeXMd0nJmYbJtItdWB7sH2kA=; b=pfJj1ts7PBOvFy
	eodyYgwY84ptXhA9UT1xgjklTL/btF0m8VbanBvtK1NFxf65pnAKyGVBEQWBeTPy8Y4qxFAnCBLWy
	yDhdnhpNlawZ535gp/5x1M/S8GlLjf6opaf3PKe4mJs3iS3sr+KB+5wKKYbTTMs97yi1kXtqGjDSt
	1/8fRQmo9VK69r179zgVtLvD241bVoA6xFHin6+mvUSxOnR5kTkvjYVxB+Q624+Qes85enbDaK6cQ
	IxN5SEzLChsRZ0gv2e4PtONwvVD1jiQrpUA7UxqzPj5Ijx1N2Cm/0TLExBxom3LNhGdS++PQUv/1f
	gEygHHDSmIwTpMzbCGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNj5-00000007wak-3RhI;
	Fri, 23 Feb 2024 05:03:59 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMY1-00000007jbj-3OuN;
	Fri, 23 Feb 2024 03:48:38 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 65382C001BF5;
	Thu, 22 Feb 2024 19:48:29 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 65382C001BF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1708660109;
	bh=jLwEb4I1DX2qFCUdUG5NZdbf5UdXONu/inu49U3VjgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MevVbaeQgn8ezCqYhd8D4Yq2/ooO1PpfIkwMUi4lsOjKaUSW95jLsWZOzfV1mJYBr
	 pXOC1VTHS+HPUwHSRkUAyZIOOsLHE4okImWIqQCV7GmrfhoTvrQeqcHUj804jzb27X
	 U7HpLoOl8SHgpkHDtST3gYpfzuG8oHB7qtIRx3Oc=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id ED05418041CAC4;
	Thu, 22 Feb 2024 19:48:27 -0800 (PST)
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
Subject: [PATCH v6 06/13] dt-bindings: mtd: brcmnand: Add ecc strap property
Date: Thu, 22 Feb 2024 19:47:51 -0800
Message-Id: <20240223034758.13753-7-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240223034758.13753-1-william.zhang@broadcom.com>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_194836_356939_217990C6 
X-CRM114-Status: GOOD (  13.46  )
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

Changes in v6:
- Add other nand ecc properties to the exclude check list
- Update the brcm,nand-ecc-use-strap property description

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

 .../bindings/mtd/brcm,brcmnand.yaml           | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
index 6a717bcedfd3..064e840aeaa1 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
@@ -146,6 +146,15 @@ patternProperties:
           layout.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      brcm,nand-ecc-use-strap:
+        description:
+          This property requires the host system to get the ECC related
+          settings from the SoC NAND boot strap configuration instead of
+          the generic NAND ECC settings. This is a common hardware design
+          on BCMBCA based boards. This strap ECC option and generic NAND
+          ECC option can not be specified at the same time.
+        $ref: /schemas/types.yaml#/definitions/flag
+
     unevaluatedProperties: false
 
 allOf:
@@ -195,6 +204,21 @@ allOf:
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
+            nand-ecc-step-size: false
+            nand-ecc-maximize: false
+            nand-ecc-algo: false
+            brcm,nand-oob-sector-size: false
+
 unevaluatedProperties: false
 
 required:
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
