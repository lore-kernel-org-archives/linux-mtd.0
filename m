Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75801C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxAkFazFMsZtA7ghzNUGnQ/ZeRyzMWlNcGuOcPsYFvU=; b=dLAwlJZ7hfwISy
	65d2l/jPSdvBTwae0cTll7ETPEwSYAsd50xoQrfY6C3HKdDHdeRWWNEjedhLzdViM7DzRz2YMXeIh
	0B3Fo8QWjh+t5eVysSVe19NZ+C5N19N0phplIfj4Wk6yZhbgd6UwmAjrVeG0VythXdW0VCjXK2SD9
	2ZOuFAOR/cJzxs0nfGiAAWTUB3HhPTKx7/O/dV6jRq76xq0wxHGBwff21cYQYN60vddd3ICd7Z0U0
	ESwotZbGcIWH16tBeTZF2/Ipy43g93rlNf3cSrkYGH49SqWQc2jOgr3OkOpxa5BHIMie+x3KKm87/
	B7duRRGjO/P6LuAyBLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzsD-004Wqu-B8; Fri, 04 Nov 2022 16:48:53 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzqw-004VwO-Vh
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8EF324000A;
	Fri,  4 Nov 2022 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Az+vA24nx4uvmv1Sczda31bkwb6yQkjFSBWEcaTheT0=;
	b=ChQj65BOvZTCxBNYdAezFTY653MJ7ia/ynKE/exoiU1+ta/nj9vOU47PweC4brOYyobd2Q
	QSL7o/J6vNEgkyS97jmPqVaPZTsCdf3HJ7Enm/QCbX27+wTUBvCMdiymxCyHlWd3sAUYJC
	07ZSrzuLaNJpX7hMftY2WlwzroIVXx5RFnlPiW/0xdM+Qu4o2i0bYBPg+8eBTm782NLtHc
	13Atqdm9kmT+kRCHWJLlLhcAFHDS50TdCNF4crWB39lnoLc1yf3pXOYlNvXvBU7occfnN/
	Exbgr+IN8mhycDdx0mKf6zW4KUHpgxQoTmo67SCNY6QS7xG+z9urJ4o1kNdKww==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 12/17] dt-bindings: mtd: partitions: Change qcom,smem-part partition type
Date: Fri,  4 Nov 2022 17:47:13 +0100
Message-Id: <20221104164718.1290859-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094735_283069_EC1A4F24 
X-CRM114-Status: GOOD (  10.19  )
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

As described in dd638202dfb6 ("dt-bindings: mtd: partitions: add additional
example for qcom,smem-part"), the aim of documenting the subnodes was to be
able to declare nvmem cells. Hence, the partition property does not
really apply directly here, let's instead reference nvmem-cells.yaml
first.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/partitions/qcom,smem-part.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
index 805eabece7c8..681a51f5257c 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -23,7 +23,7 @@ properties:
 
 patternProperties:
   "^partition-[0-9a-z]+$":
-    $ref: partition.yaml#
+    $ref: nvmem-cells.yaml
 
 required:
   - compatible
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
