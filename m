Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B1CEB64DB
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pr+8ojxh4qEo3t4hJ8t6fC2BA+zXnLd0bc1ExJtccbU=; b=U8TSjARhvtD5Z6
	yaIMOua2pCnEQ391Q78AKVRvNsfa/0RPkgeH4JzQjeiLpgmQMC2z6oMI5AWVW0CRM7CEDBLy19GXm
	k7PoygJ5qGqvrUlvGArSMVfWl3hSMFcFc5JOxVRuHbEjZy+QAiotTdehr68j50FV/tP1g+Gahf6Rj
	GvcQwAfWGvs5nM0vK0jInB+jCSoENSLgHI654ELrUIvyqvWdBe4q92NvBlOf6v1E8PncqGs4bQMEF
	yBtdLxZrP3RoMFhKRCSgPgkPabI6C0J+QDPXGsEZVsCV0xe0Q1YxfTVA3loWbKRcgrDdPhJ1KFrx/
	3QKT6bb9E0TJv1TQLAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCT-0080RE-1a;
	Mon, 19 Jun 2023 09:29:29 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCP-0080OI-2a
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:27 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gyySi5VUeQySy3GUmJZDdRBNyYoa22j8dB4qSinZXG4=;
	b=Lu2Mrxma8BrTvU57KDds1H3Xah6qLho2vGkrpwfc8GftDB7cxwTCoE9zjHaDEctoB/nnnk
	LXZhma4gE8dIM1zaGOJKXQUAz5ZcN4oxpWDL3L6pL+ZMsUW2Jcvc73Ho3ccvFg+mdAySbV
	m5MvX5JBfkVBq8qG/Zr3ZhWkA9Kn21bgzU2BxfdbBZLVOT4SzMlHqSgqCsqOk2T63PuukI
	LT4vQUIkYgQ5+4HSjo356FGGVWP0hVH15Xaqzx/XDPdDmAe0rXegxwQG7vvlk8BQZY9oOh
	b725pR+qVCT7rWSqoieKhlbIvRSbYmirtijTS0g4DKZAc8GbqAVVi2Pusu8QcA==
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
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 135711BF20F;
	Mon, 19 Jun 2023 09:29:22 +0000 (UTC)
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
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/17] dt-bindings: mtd: Accept nand related node names
Date: Mon, 19 Jun 2023 11:29:00 +0200
Message-Id: <20230619092916.3028470-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022925_986390_E4328473 
X-CRM114-Status: GOOD (  11.63  )
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

There is no addition there, but the mtd.yaml file is so generic, it can
be referenced by a wide variety of devices, including nand ones which
already define the node name to "nand@<cs>". Right now it does not lead
to any failure but when we will constrain more the schema, this will
become a problem because we want the mtd-wide properties like label or
partitions to be available for the callers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index da3d488c335f..b82ca03e969c 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 properties:
   $nodename:
-    pattern: "^(flash|.*sram)(@.*)?$"
+    pattern: "^(flash|.*sram|nand)(@.*)?$"
 
   label:
     description:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
