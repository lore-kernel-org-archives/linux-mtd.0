Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1777CC47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 08:26:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE9D0613FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 08:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE9D0613FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nu50rSV6fRK+nyEczFHYfKoEopZw4TkVhrw1qa28JJY=; b=S8fQHnYL8KrQ4X
	i4N9gIUM5Lq9wQzZZSshncfdTFvNQ02BoHBtyRfDgPYiJa57RPqkVbf6nvHgPUYk9mMKCaKpdihMt
	i+nElLiUti5j+O7YIgBL47p1lB3NAG3yEp+WSrNZiQqMEm7EdkxvlX8FjLRztSnEzvl+MWbWcNDX4
	xF76CdayScbC6AZ2j0cgCx/OpnfrO6Xmz0aeMgFBBVWoNbWofmQpxxOHxmehAPD+k+BdwtOmI8o4B
	TWyK4BmbYiX1r4KbeCVIi24YL9xr0oIC9Kt/r0zuDyadrp4SQOG5UwuxUHUGIL+Mi3GBMSxPYPtoz
	qOj2Sd8FdLisNUVrQ1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrG0O-00HU6F-Cy; Thu, 10 Jun 2021 08:25:36 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrFvr-00HRyU-PX; Thu, 10 Jun 2021 08:20:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 20CB520014;
 Thu, 10 Jun 2021 08:20:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v23 05/18] dt-binding: memory: pl353-smc: Fix the example
 syntax and style
Date: Thu, 10 Jun 2021 10:20:27 +0200
Message-Id: <20210610082040.2075611-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_012056_001736_D8699063 
X-CRM114-Status: UNSURE (   7.59  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/memory-controllers/pl353-smc.txt | 48 ++++++++++---------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
index 105160c795a1..46e17f5bc45b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -24,27 +24,29 @@ Required device node properties:
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
