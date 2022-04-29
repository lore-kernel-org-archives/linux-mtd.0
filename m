Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5226FC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 10:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTc7ICK77hBeGqMkoR9FLbgjD7TcH3iLvmaSzwaRGXg=; b=iFciIbNN+UP8Gn
	AHE4b80cg0NYWljrEnCMSOOOMTgwdEMy8+QUG8aVgU+gcnfkNwZVXHO2LU99EB5hbFRB7snINK/4X
	wxULU3EeGnswPTvNvIiU6BVWFXeNiR6akwYgK1dCq5bwUVL9v7JYfPA8R8eO4o5x9s9SioQ2q4AOG
	+F64otUHOjKOHoVa5+FKi18afN+X0HTMVKrB4J5g6QWTfa/VaCwp5SDsydZcjbVNalX06Ts4KNyX3
	CA749vtIw1c/ZVDtuJ+B1SdPi5kLRmAn1O7mpvURmFcFgh0/kH7jTpuL5hz0wLwdAvW4KX6FDrR5+
	wneuECSJnn1Z39eXlywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkOEs-00Atp5-H6; Fri, 29 Apr 2022 10:52:42 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkOEo-00Atn5-3c
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 10:52:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5899FF80B;
 Fri, 29 Apr 2022 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651229556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzW9cUh6UOXVytZ7otTBtN11xju/vNGhzQGZ27ZQgbI=;
 b=R9uxkzpFYbyvxiWMln9FuBgLN77uBY6Nck0tPzEFtFKmWVlyqv4vEun836cJ3IG+hT+S7Y
 Gj1qus7dsakEk1gWuWdltdmNyQndF89BUy8gIxCcwV4pj+uu3WpG1jDJJS/jvNBsjOEXJg
 N7/1JaGvq3vNtBfDY6ug3+P5k8EerY63xk2LnXCPuHgQED3nR2XAmOkobvG6vjprZxXDdj
 fDKrotVfhk2asvBfatN0KD9d7TurbnIIkEJXcx34H1lL0IvksYEPMQBK3N9eUMRViWBiLY
 p5qfFozZyzIrR7iMLkCXBp+iJrtIVq8Yu9uzoarB3ZQ9NSZJFl4aXeiJdqD7bQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/3] ARM: dts: r9a06g032: Fix the NAND controller node
Date: Fri, 29 Apr 2022 12:52:28 +0200
Message-Id: <20220429105229.368728-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220429105229.368728-1-miquel.raynal@bootlin.com>
References: <20220429105229.368728-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_035238_397429_C94C8B26 
X-CRM114-Status: UNSURE (   7.79  )
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

Add the missing power-domains property which is mandatory.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index a35bd19c616a..b3ca904c8647 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -234,6 +234,7 @@ nand_controller: nand-controller@40102000 {
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&sysctrl R9A06G032_HCLK_NAND>, <&sysctrl R9A06G032_CLK_NAND>;
 			clock-names = "hclk", "eclk";
+			power-domains = <&sysctrl>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
