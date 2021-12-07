Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A80C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5s1tRdcWgnEsc3wWZ+SWKvrRBgI/RfD3F55esJCNv9s=; b=CeR+8eAUhQyacT
	SwITZY0LImB0EhH1kvd9Pi61oE0Zhmo/vrndoGqFRivtFuwblN0nSWX6mitB+xwsQnmQ/I8gzelKU
	xA4ioRRxCpOK7KbPlWr0JeBgEbPWzPiZZQOe1RZXxEElpabuq9wkYxqJHvNjQohO8iZixLxON5mEh
	f2kZAbFE1er4zG7A2x1m4F0GSt/gw6u1xGsyJzES/JqFAXrN/H0VRqb4e43G8/0gM8kvyhh1yy+py
	+CDyFGa+5UFOA2YRtboV/0eMgb7OPcROc5juaUQXp4JFFELhzHKNvYr2+Eo5qhMIwYiVUoIlJvLgW
	WpwBRbQylPmG4I7YWQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muWsn-007pKT-NY; Tue, 07 Dec 2021 09:35:33 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muWrm-007onw-Jz
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 09:34:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0ACE560012;
 Tue,  7 Dec 2021 09:34:27 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 03/22] dt-bindings: mtd: nand-controller: Harmonize the
 property types
Date: Tue,  7 Dec 2021 10:34:03 +0100
Message-Id: <20211207093422.166934-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211207093422.166934-1-miquel.raynal@bootlin.com>
References: <20211207093422.166934-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_013430_949658_0E2F4126 
X-CRM114-Status: GOOD (  11.30  )
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

Harmonize the different properties in this file by:
* dropping the non-necessary allOf's
* always defining the keywords in the following order:
    - first: "type"/"$ref",
    - second: "description" (when relevant),
    - then the other generic keywords ("enum", "default", etc).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/nand-controller.yaml | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 5cd144a9ec99..7024ca24c2e2 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -58,8 +58,7 @@ patternProperties:
           Contains the chip-select IDs.
 
       nand-ecc-engine:
-        allOf:
-          - $ref: /schemas/types.yaml#/definitions/phandle
+        $ref: /schemas/types.yaml#/definitions/phandle
         description: |
           A phandle on the hardware ECC engine if any. There are
           basically three possibilities:
@@ -79,25 +78,24 @@ patternProperties:
         description: Do not use any ECC correction.
 
       nand-ecc-placement:
-        allOf:
-          - $ref: /schemas/types.yaml#/definitions/string
-          - enum: [ oob, interleaved ]
+        $ref: /schemas/types.yaml#/definitions/string
         description:
           Location of the ECC bytes. This location is unknown by default
           but can be explicitly set to "oob", if all ECC bytes are
           known to be stored in the OOB area, or "interleaved" if ECC
           bytes will be interleaved with regular data in the main area.
+        enum: [ oob, interleaved ]
 
       nand-ecc-algo:
+        $ref: /schemas/types.yaml#/definitions/string
         description:
           Desired ECC algorithm.
-        $ref: /schemas/types.yaml#/definitions/string
         enum: [hamming, bch, rs]
 
       nand-bus-width:
+        $ref: /schemas/types.yaml#/definitions/uint32
         description:
           Bus width to the NAND chip
-        $ref: /schemas/types.yaml#/definitions/uint32
         enum: [8, 16]
         default: 8
 
@@ -113,15 +111,15 @@ patternProperties:
           build a volatile BBT in RAM.
 
       nand-ecc-strength:
+        $ref: /schemas/types.yaml#/definitions/uint32
         description:
           Maximum number of bits that can be corrected per ECC step.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 1
 
       nand-ecc-step-size:
+        $ref: /schemas/types.yaml#/definitions/uint32
         description:
           Number of data bytes covered by a single ECC step.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 1
 
       nand-ecc-maximize:
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
