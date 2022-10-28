Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3479CFA3741
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Oct 2022 00:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5UWdWsEeHLH5ISzdBfyZjP10xxRgLwyTIrcnX00Mcw=; b=tRHjfh6r3N2J8q
	o7iypshTSiM2Sohaj9AWMnHPedaB2VRw3pQ7sWzuEX7zt7+5pLK8gqqSUnJKzfCkDIxLBSoU+E08c
	GkmscYopaV66ms1h5cbIpP9ZRrFWGuWLU3CwgdqLS1T+TAahkvPyGc9BjgqqEWqWUCOBWoPqarp4i
	O1/Wu5Z8/QqW5WfRAlCzJfhta6Zl55cKqgwf3gnNy7Sq8JXseR0q1Al17W05u+oq1C57mCGXe5Rce
	M8U6TUnMCV54EdiV+FMk9vdMM2pdFTC8Th6JapXCcK4dur/sal6LaCmar7nkwnIBi10R6HPcTTL3y
	HGOCCjstv8vFECwnMKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZLo-003Moj-ER; Sat, 29 Oct 2022 00:05:24 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGW-003Jm8-My; Fri, 28 Oct 2022 23:59:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8DB9DFF805;
	Fri, 28 Oct 2022 23:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KpStTXdcGcnaU4hB/viIKrO6+1KaRilXzfSuhGy+2cA=;
	b=VBjU+wVidPlrjqLZQdwiodK53fUS7K3whpmeKn/tfVtBUrkSbVsjCRdkzVwe/3DyWs0TCE
	mTW515S1DusSM7cKmsvAkDbIeEqS5YU2j0wllWyA/euVn+is+CwdT28RYoEAzWj93WkZCr
	Qcs+TckXRj6RIzqb0FltZ/nTwB9gQqZFMUi6k73vttmeKZoNt+9IfwgWCknA9uZec5ge3n
	IulfPqL/39odF/wR2gufdE/vkxESFf8CCd5c2rcpngeq/6QtNyh+h4hDFU6TWB3HdCDtUN
	RAhG10YoaSBVO5bOT7jZ43D3bjyjNiUTOecNlNsbEXK6DE4EFa/kIqSyfI7wtA==
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
Subject: [PATCH 10/12] dt-bindings: mtd: Drop object types when referencing other files
Date: Sat, 29 Oct 2022 01:59:31 +0200
Message-Id: <20221028235933.934850-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028235933.934850-1-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_165956_917795_D04176A4 
X-CRM114-Status: UNSURE (   8.52  )
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

Setting an object type is redundant when a reference is made, so drop
these useless lines.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml             | 1 -
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 4fdce7211b55..64714fc8c852 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -44,7 +44,6 @@ patternProperties:
     deprecated: true
 
   "^otp(-[0-9]+)?$":
-    type: object
     $ref: ../nvmem/nvmem.yaml#
 
     description: |
diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 359a015d4e5a..3f2a1480e1eb 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -51,7 +51,6 @@ properties:
 
 patternProperties:
   "^nand@[a-f0-9]$":
-    type: object
     $ref: "nand-chip.yaml#"
 
     properties:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
