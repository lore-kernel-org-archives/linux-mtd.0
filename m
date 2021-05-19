Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568C8C433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:29:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E6361001
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E6361001
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P5vtzfXeNiMMzwcvhah64ruh0XMqMwtc81I6DBUZoFo=; b=kA4WfTje8DLZR1vnmHrVW8FAs
	WGil9rBm1cFnN4epGHculjoK978KKD/REu6+undI8v1jsPcHKvT9LpCMnVB2Cldt4q5lBMXeu2MfH
	e8PgkqfPLrMuz/pNHxYb4CS7JXhTRb9cCZxVHLQXbF0AuOLaY2AlQ/2Jp8OWHayTtk1EWjrmf6cbN
	255H5lIfhFbPTWgWHgVMv5lPGVJxhi7yw+Z5ttgdPLEIctqxMvxJ9iOVTyHseyCoX/qWGJGraWj4D
	eNAZ9mWhc1MdJ3WsOr9s1TsWFY3DcoHTz39P3uNMQCi4Y47N2NdwjsmJ6G3IolGC9lPBj0JvaTeew
	2M5NE+TgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljQvf-004lbW-JU; Wed, 19 May 2021 18:28:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuC-004lNS-Tp
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Ujn/4fNJ2q7LwzVijICF9YwQbwQZEWaU2dc0d/P1URs=; b=2NWRtRiE1L5Y7wHsF/yF+RTdbO
 m7NarZH1UClod7as212xHiyW2hJEFmXkpKD4z4I8VRcj9ivfQ+63fglGE+6oaYwtD6ct0ojxIY/8/
 sgW/3erJOOw5/JQyR7vrAV/umxEYiJUS9tta5PC+twSGk/pT5z+FzvugNexPs3BiaAbOnUoqa2Drh
 oui6jRqU8eL2/PCoxdgL9kxQRqqLS20NNYcs6Gdfi4B/2b/4uxMZW4FzsXUHsN0/AgI7ESJfRyIAN
 Jxte6BZljs6DI9MhFliJ19yoaabzwR6dZD/dZTdvljJvt48tnKi4EuEbclkbCu0ooZEVWE/a8cpNC
 FjaQW/pw==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuA-00Fh6p-9G
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:26:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 08F34C000C;
 Wed, 19 May 2021 18:26:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v20 05/19] dt-binding: memory: pl353-smc: Fix the example
 syntax and style
Date: Wed, 19 May 2021 20:26:22 +0200
Message-Id: <20210519182636.1110080-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112650_484929_295C06E2 
X-CRM114-Status: UNSURE (   9.44  )
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

Enhance the spacing, the comment style, add { }, remove (...).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/memory-controllers/pl353-smc.txt | 48 ++++++++++---------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
index 046efcf8bd52..9f65df034b45 100644
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -23,27 +23,29 @@ Required device node properties:
 			of the memory region requested by the device.
 
 Example:
-	smcc: memory-controller@e000e000
-			compatible = "arm,pl353-smc-r2p1", "arm,primecell";
-			clock-names = "memclk", "apb_pclk";
-			clocks = <&clkc 11>, <&clkc 44>;
-			reg = <0xe000e000 0x1000>;
-			#address-cells = <2>;
-			#size-cells = <1>;
-			ranges = <0x0 0x0 0xe1000000 0x1000000 //Nand CS Region
-				  0x1 0x0 0xe2000000 0x2000000 //SRAM/NOR CS Region
-				  0x2 0x0 0xe4000000 0x2000000>; //SRAM/NOR CS Region
-			nand_0: flash@e1000000 {
-				compatible = "arm,pl353-nand-r2p1"
-				reg = <0 0 0x1000000>;
-				(...)
-			};
-			nor0: flash@e2000000 {
-				compatible = "cfi-flash";
-				reg = <1 0 0x2000000>;
-			};
-			nor1: flash@e4000000 {
-				compatible = "cfi-flash";
-				reg = <2 0 0x2000000>;
-			};
+	smcc: memory-controller@e000e000 {
+		compatible = "arm,pl353-smc-r2p1", "arm,primecell";
+		clock-names = "memclk", "apb_pclk";
+		clocks = <&clkc 11>, <&clkc 44>;
+		reg = <0xe000e000 0x1000>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0xe1000000 0x1000000 /* Nand CS region */
+			  0x1 0x0 0xe2000000 0x2000000 /* SRAM/NOR CS0 region */
+			  0x2 0x0 0xe4000000 0x2000000>; /* SRAM/NOR CS1 region */
+
+		nand_0: flash@e1000000 {
+			compatible = "arm,pl353-nand-r2p1";
+			reg = <0 0 0x1000000>;
+		};
+
+		nor0: flash@e2000000 {
+			compatible = "cfi-flash";
+			reg = <1 0 0x2000000>;
+		};
+
+		nor1: flash@e4000000 {
+			compatible = "cfi-flash";
+			reg = <2 0 0x2000000>;
+		};
 	};
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
