Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9827AC38A02
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Oct 2022 00:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CAIXDDT4wyuPyycnaFYif0ks/yRatmrl3ULDV/WHtI=; b=SqHd6XNF0QG7O1
	mbZtKq9qt/bZfA2oBDMy8ZX3svq7wKcv8WFNHshbb88PkoWXh0ECQtQJmAtoEeKpVd1ZHqdT8uE04
	NTl+gI1PMtQ0yLVN5zXuDjQfp8P+eRy37lebSD26oy7mvHFEY6tu08Xo8sMWprBjO++2fAHQTS5mI
	2odCX8xOTA5IsNa4IY/pkuPXLpZUld1yjS3OP9W/wOuhikjxDBhnpEfJUwBDRGXFYKAi13J/iE+eh
	tfIytkYWrAc4WHgk14463D66rhcyVR4O99d29DgiQ/9EHs3rpw2rM6rHQrpbUbbal1o1jlbjlSLeR
	QqtCev4LB7EXGm7RpoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZNX-003Nfj-BJ; Sat, 29 Oct 2022 00:07:11 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGa-003JnO-EU; Sat, 29 Oct 2022 00:00:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1CCACFF80F;
	Fri, 28 Oct 2022 23:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UEYlWh78STx8kM7HdfKAssnfJ9FCt1Mok1R8ei+AmNY=;
	b=e8517KkBQ6XkYOpU3YdF4RvgZDguqK03Sk4EcOEa4oQB84Sz7SHVwl1hcVckcNl9SOmSsJ
	REyjtbeLsnM11NWSWWFuYsVvA1exiAd4fFxu3gQeGW0lPZv90IHFQP9SjkLW6Z4ittLM8a
	2ht+gWanmogiE2OchmVHiWFWwh8ERkRmomFoNdNK62EZiBAeiUyxppmLGEa7n+zep3yNY/
	djNlr5WAnEk2krmDyFzE126JPtxljRbXlRetg0wFVxiJik3TaRlS0jnRh+lky/lpgnTHOI
	GTD8+QRLWo8vqBwK0ljvY0S1KcT8PA4Sffw8VccMU67eskMO17ehFh8uaNPzgg==
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
Subject: [PATCH 12/12] dt-bindings: mtd: Constrain the list of parsers
Date: Sat, 29 Oct 2022 01:59:33 +0200
Message-Id: <20221028235933.934850-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028235933.934850-1-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_170000_658060_4233B6F3 
X-CRM114-Status: UNSURE (   7.62  )
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

Parser compatibles cannot be used anywhere, and the list is limited. In
order to constrain this list, enumerate them all under the top
"partitions" subnode. New parsers will have to add their own compatible
here as well.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index bddb7bdf441b..29db0b5c115e 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -27,13 +27,29 @@ properties:
   partitions:
     type: object
     properties:
+      compatible:
+        contains:
+          enum:
+            - fixed-partitions
+            - arm,arm-firmware-suite
+            - brcm,bcm4908-partitions
+            - brcm,bcm947xx-cfe-partitions
+            - nksys,ns-partitions
+            - nvmem-cells
+            - qcom,smem-part
+            - redboot-fis
+
       '#address-cells': true
+
       '#size-cells': true
 
     patternProperties:
       "partition@[0-9a-f]+":
         $ref: partitions/partition.yaml
 
+    required:
+      - compatible
+
 patternProperties:
   "@[0-9a-f]+$":
     $ref: partitions/partition.yaml
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
