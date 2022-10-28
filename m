Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A46AFA3741
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Oct 2022 00:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+Zr3+N9FCoBmxrYG+IOotoB0x/Iy7w4Vn3Kipgbi6k=; b=QpGLsuDKfXC9x9
	2N6hVJyEw2n+J8DCijvR7M1Xs8a7Ug+gaAL+Ey/cR+6WEqkcdY7n14/VmizYUhXiEefraNUfWNpLc
	H3EJn2+3mDhbb24RcwgAIVBdL6Gc85bAEIyZUVmNB5AiY0Q5H9roVZg9TqeZnK3W65QgHYptsMSa3
	p83+PHez4vLloGgyHd0CvfD49hYOLCq4xiMXFq2+WzlB55FwUf0H1friJDD2pdd44kdckbSniY5Ru
	2NrNXTEmF3+M/B9MZ5Ph85FlYhkrKlTvzRXLSQw+LNd2IElPRTOEDfrY9QBPRnLUFrBHnBehpZV1t
	wW2tnYalCU60h1gGzKIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZJ5-003L5q-CL; Sat, 29 Oct 2022 00:02:35 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGP-003Jjk-Fp; Fri, 28 Oct 2022 23:59:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4E9E5FF80A;
	Fri, 28 Oct 2022 23:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5SJVLshBVlGykXsCSO2AKVjwL2+PMExjLt3OhdqhtdQ=;
	b=i8fDsaSdYRzc05KB/dgw6uIfPbZONDAVT+z0pOerZRxOWZYOnMs/Z73FAEJ193yoP56j8l
	jtOxOk1H6nfbPOvWRoU6seXVFKZ0ng7Yh4wC1kI4O9WszGc8xMHu1ZZ1D4z+lJqcBH1rb4
	LZf4A8TJKSu9KfLu5OpUlQmZWzLQz0bH+osL33jkeSqfUdxPyDpZclCn9hUHqnaI4j9Avr
	1SowBsybEEoyUluEY7MKw2sVZV9ezanDf9G5NcLcKLbZFPbLPjTTA+JrxZ5liyGN7vu7lb
	81st12DEPMeFOcKR+/0wgH4fvp3JYxUnWC8I+eGrazqJfTCUw9s3pk/qSsh5zA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 06/12] dt-bindings: mtd: nand-chip: Reference mtd.yaml
Date: Sat, 29 Oct 2022 01:59:27 +0200
Message-Id: <20221028235933.934850-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028235933.934850-1-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_165949_693397_54721C28 
X-CRM114-Status: UNSURE (   9.71  )
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

A NAND chip is an MTD device. mtd.yaml already defines many useful and
relevant properties, let's reference this file here to get access to
these additional property definitions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/nand-chip.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 97ac3a3fbb52..8d5d2d3ef56b 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -9,6 +9,9 @@ title: NAND Chip and NAND Controller Generic Binding
 maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
 
+allOf:
+  - $ref: "mtd.yaml#"
+
 description: |
   This file covers the generic description of a NAND chip. It implies that the
   bus interface should not be taken into account: both raw NAND devices and
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
