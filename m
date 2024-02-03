Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FED1C4828F
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Feb 2024 00:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvD12qL/SKD8FXOshiMC+lvj06262QI2aEvjOILAoV8=; b=Zwo85IclEzARr4
	MKchMMiK6tebQk9TRFODAQf3I5nlC1KmKtsRZhJqfgcPJbMRkGUp+VLrTdiIpnbL3mc55Ozmxfhbf
	Ajn87X2G6RW7lWpWtJtpSR7OaqkscUZHOFkkU92TjQe3wMi2oFh09VHYS7aI5uRzL0Xhy7ulnObXs
	6GtERm0M4rhkBd3vwcYTGDXtapnc5jPGhS6+/YchnWJtcUMn1gbxQxyd7vgQe3cz+QDFYNENx8RK0
	5ja/aRIhYozPlDJdhtrXcojecei8TWimdfL6IsbnxLjSb53BmLNLVII3Ch/chcLqQ5UKWHXNykpzH
	M04i7zVa7qCKM/4/3Dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3uP-0000000DwTM-0uUd;
	Sat, 03 Feb 2024 00:29:25 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3uI-0000000DwNA-2Kz6;
	Sat, 03 Feb 2024 00:29:19 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0AC1AC001668;
	Fri,  2 Feb 2024 16:29:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0AC1AC001668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1706920158;
	bh=te5+l18ZZxWvnmfq+UvIJN6+FYEaQdsKeXHBLOKms1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ty2gDHgv+jc6uy7673PtqGYXFmrpGpr/XOfWkQZt2NVMDG34t3iGTNr/MwC4zIL/H
	 cMNoD2hcIjF62NLa9sUCpg5cgECxGbB9GP2s0EK60Mn1UsGiunyIEk9+/OBg2UggyY
	 op+TypxFuMBBfe7j3uvH5VR6ku6uctfclC31MeCE=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 98EA018041CAC4;
	Fri,  2 Feb 2024 16:29:16 -0800 (PST)
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
Subject: [PATCH v4 03/12] dt-bindings: mtd: brcmnand: Add ecc strap property
Date: Fri,  2 Feb 2024 16:28:24 -0800
Message-Id: <20240203002834.171462-4-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240203002834.171462-1-william.zhang@broadcom.com>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_162918_652797_BE9DEED4 
X-CRM114-Status: GOOD (  11.68  )
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

Changes in v4:
- Move ecc strap property to this separate patch and remove some
non-binding related text from the description

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
index d0168d55c73e..2599d902ec3a 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
@@ -147,6 +147,14 @@ patternProperties:
           layout.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      brcm,nand-ecc-use-strap:
+        description:
+          This flag indicates the ecc strength and spare area size should
+          be retrieved from the SoC NAND boot strap setting instead of
+          nand-ecc-strength and brcm,nand-oob-sector-size or auto detection.
+          This is commonly used by the BCMBCA SoC board design.
+        $ref: /schemas/types.yaml#/definitions/flag
+
     unevaluatedProperties: false
 
 allOf:
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
