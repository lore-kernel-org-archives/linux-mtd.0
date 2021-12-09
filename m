Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89997C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 09:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idU1sdpRDluqWuBM3oZYu0I7GmkxBQLyBu5ehv1WqB0=; b=XV4Bqg3BIyabOG
	IYV44c7t1nQITr18AG91IaepptOyrB9vLe/C32FR9QW/Z6AWcHS9+vS63+juX/BbAaTUc67RlZOSf
	A15/5nsZqRQ2CjG8W4jqCDXfoGrndJnqj5veYfPWCMRxt8pfOge5mjD73rHVWn0aN7uvNZWbozxBP
	IKmB2E1f9UvK8durtOa6LK0cssOTC4WpND3CoePSrPuec+S+WJxOMi74ejmhI8T/IymZfP6F12lOp
	b79b3XmusymgDcSP/SqXJpvQH1MHFpft4tT4whNMr7/Xch2xvO5cplyYA+GCG5T6rsdC2oqQD+UE/
	BHDHPRmEeJCHndD6UkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvFMl-00FJgs-G7; Thu, 09 Dec 2021 09:05:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvFMT-00FJXk-Fu
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 09:05:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F7F0B823FF;
 Thu,  9 Dec 2021 09:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D61EC341C3;
 Thu,  9 Dec 2021 09:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639040707;
 bh=nhM6FAfawSp8ox2QppOpEA1hlDsMTl6ElG2mFrppNuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pi3FOi8tsqETYnRRjfBniPDSm7WWwuh2BXmZtmg4NsI90xq2gcsT2bKUGBxGzcGsH
 9tupH6+02Yc9p1Q/7jt+Z7MkNUuRAe/uPGmBEcn/BLPlFAAXtikZuub8/0OUTQ8E7M
 xaRr90A5yJpV5/VeESbxmwAOJrLPtpPFPSVXQg+t/B5cGapy5/hsSTQ1Ze8JOP0b5Z
 PLNe8rVOe4uatuJb3IX27f1uNkye5sxFHN/Kb5A4cUJGw3vwErtKOkM92J4Acyw4yt
 4xSp620ESEK5wvR2Dr4PSzHXxGm01z6tPgau/j/IImDP1uRa04PK1HxNtnSJuGvPKF
 xQLAn0tEIDz/g==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Cc: vigneshr@ti.com, kishon@ti.com, nm@ti.com, tony@atomide.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/6] dt-bindings: mtd: ti,
 gpmc-nand: Add compatible for AM64 NAND
Date: Thu,  9 Dec 2021 11:04:53 +0200
Message-Id: <20211209090458.24830-2-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209090458.24830-1-rogerq@kernel.org>
References: <20211209090458.24830-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_010509_694674_FBADB33F 
X-CRM114-Status: GOOD (  10.72  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

AM64 SoC contains the GPMC NAND controller. Add compatible for it.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Roger Quadros <rogerq@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
index beb26b9bcfb2..666ae4a78544 100644
--- a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
@@ -16,7 +16,10 @@ description:
 
 properties:
   compatible:
-    const: ti,omap2-nand
+    items:
+      - enum:
+          - ti,am64-nand
+          - ti,omap2-nand
 
   reg:
     maxItems: 1
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
