Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4F5EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hGpjBEhGRuJXlXh+X9DEHCPFzy6jtOCGcayeWdAqRak=; b=YO3t3dr7fLVh8d
	8jAfmVBZKNLxICZ7GtQVUQ/zqpkMswBVSybU6aIOB/gYzDLBxOafbKTHynZOzr620VNb36OwX1m9Z
	/VGEh0E8TvpiwTQwqy21qc1C0A+Y7ZdAzlU9RPBwxPopbZYtgYnyw49PppfiDtSN1t67Cc/UuJAIj
	hM7QkQR+ZdsaaYZuJX4G+mjifPhWIznIK+7Ry8E0OtDR+ZoWfrditR880gfhJH2FlBDQb4k6MuhXD
	iSQw849MaTGyXxwmXfKQF1C6Bp7g1dmXeBYbOck6WfKuYKcvIAauUA8H+nFnbMlaPNqw7UGRe3SMT
	HxzasaAwNA/hzg6ld/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRn1-001r3B-0V;
	Thu, 22 Jun 2023 21:24:27 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRmw-001r2O-2h
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:24:24 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687469058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mezy1bg7+tal880bbvSbp01OokLFkCZLszHcc7Ojt4E=;
	b=pjMnLfD0EKiP+rLHHHMXla0lkiuJnt0N/AILesDXSKWzTVlZJNIWtw5Pdi/utmZcgtzj+t
	RIxX3zn0VTtAUbsWgpwa9Jr1+L4jclPqlcYDz627vt3PwFCjO87N5U0LpC4jF5EqTIssL7
	rHe6KYxF9tDJKYhiYdomAsSZv+jpKKgeWGEOARWVeaNJszoc1D6wMGtVvM7cYAVcNoQLzd
	N89Gc8s89ax1cv7pWL8uXe/B8Z76zsUiMkNrSTA0X8Wands8VMhoS98nRtfHA4+hg1OPvc
	DoIYCGY+QyBxR/5jYJd4PNaeYxTeEHDK2WTdQ/8G+jnbwH6YPo8wNc8+/4Uc3A==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4803D60004;
	Thu, 22 Jun 2023 21:24:17 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] dt-bindings: mtd: Fix nand-controller.yaml license
Date: Thu, 22 Jun 2023 23:24:15 +0200
Message-Id: <20230622212415.3583886-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_142423_004486_14857B3F 
X-CRM114-Status: UNSURE (   9.69  )
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

Binding files should be dual licensed, this file was writtent with the
idea in mind of following the rules, but the SPDX tag did not reflect
that correctly. Fix the tag so we are sure this file is licensed
correctly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 83a4fe4cc29d..28167c0cf271 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
