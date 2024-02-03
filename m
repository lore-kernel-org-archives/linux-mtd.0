Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF37C48295
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Feb 2024 00:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrVU//JuqckWEiCfbYfDldM6v6t184tD19+fulvPMas=; b=PElu38OrUI5x/+
	l7eNDK7/zcQl3GIt+8AR5xLC/jmvQZ/2QvWGcwn8V62CUealC0baLvEVSC3/phbGYZWTwpJF+OecC
	K14Xsk1HZgefJoSss20lcgfiLvyN+hC+N3V0levIDNUgAkfKe8n17f8y+dFxYL+cD9UAB4F7Kbicl
	TOoktVPApblRQqvR/pOpF5kMjQBNSkOSvnE4CzjBkRmPqhUjNPCPBGBdQlPKYlOsjFO8Y+HsQhUD6
	Pc2E7DpAx3LNE5EOR0NGy6js2yMmwGRSIgFFhBY5Xxf5LdK9JfJJqvZ8mcxXf+kdNQ0ZVkE13G3nG
	ZNSeFmV7KNEYKHIBDNqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3uJ-0000000DwOA-2NXC;
	Sat, 03 Feb 2024 00:29:19 +0000
Received: from lpdvacalvio01.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3uF-0000000DwKs-2bnY;
	Sat, 03 Feb 2024 00:29:16 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 71E9CC0029C3;
	Fri,  2 Feb 2024 16:29:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 71E9CC0029C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1706920154;
	bh=VYh+6T868Hjd9BlZA701iKMQ4aVmP1U0C12y+IHan7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vxD3GewRgxTIuh2y78J8VlNUvDDF1RMhBY6AcWPOG5UDt5DotblfCfD3IW82sQ9Zp
	 4OqK+KL6XYakLPsCNd5ka02MxYEHE7zt0rKpdja/fSCnDoBKvFzfCadxIKEG80A5rZ
	 8hbkxWPeJ6gzROp528jZavr/BOBJMxOtRsGpy5Gc=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id EAF4718041CAC4;
	Fri,  2 Feb 2024 16:29:12 -0800 (PST)
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
Subject: [PATCH v4 02/12] dt-bindings: mtd: brcmnand: Add WP pin connection property
Date: Fri,  2 Feb 2024 16:28:23 -0800
Message-Id: <20240203002834.171462-3-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240203002834.171462-1-william.zhang@broadcom.com>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_162915_702750_4A7DAEDA 
X-CRM114-Status: GOOD (  11.91  )
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

Add brcm,wp-not-connected property to have an option for disabling this
feature on broadband board design that does not connect WP pin.

Signed-off-by: William Zhang <william.zhang@broadcom.com>

---

Changes in v4:
- Move the WP pin property to this separate patch and change it to
boolean type.

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
index e54ca08a798a..d0168d55c73e 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
@@ -113,6 +113,14 @@ properties:
       earlier versions of this core that include WP
     type: boolean
 
+  brcm,wp-not-connected:
+    description:
+      Use this property when board design does not connect controller's
+      NAND_WPb pin to NAND chip's WP_L pin and disable the write
+      protection feature. By default, controller assumes the pin is
+      connected and feature is used.
+    $ref: /schemas/types.yaml#/definitions/flag
+
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
