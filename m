Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2520C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGmUjXWz31fQKNBqhY21f76cJRMRXHPcJwGL3C92Ubk=; b=YUHIdxKhh8GaDA
	Djr5+Nch1SPhb088a9ELg7kQU8N3Hzn5AKAwGJQAKZtk23EnD4XDiAllzVMPMOwbXXg+ofkFHAkJp
	Yk5sGEEMpU4iQeL9y5Msq8J0355Bc/3+9ZvsJk/X18BLcGbAasry4RlsGyzPGQzHWVD1EqRQG1XGg
	ZSprw8wOP0O+BQBbka1qWmMHQX+xh59Zw4/9TqlBIbgaHyr3QrUyauK7x33IbPh9+XAhLpfby8vtF
	5RbkvolYIxocWDUi1QltXmGVoubZQN5fU+fLAfrL8rEk8DmVmnSE53tQbRPGJr6xMr5Z/BzkZLVPb
	YieX1Aj4FQl+3g1LXg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVRZ-00H4pw-Cw; Mon, 14 Nov 2022 09:07:53 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNn-00H28W-CM
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:04:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 15A47FF80A;
	Mon, 14 Nov 2022 09:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4XXOMBEfkOnV0QqjTL56rdfmw5ub9qZ5YqwWMsqScM=;
	b=PyF8XpzkEOT588yhvLs5BREzHcO14FndTUUNfuU1EVSDQIma8+TH5yYBkK3Spl1OahmPln
	RqJ8dqzyUUYgJic6TcjT/UistfhpCZvHl0H5vpb1PyLam2BPka+Jo5biGKqD3M3+/PbTuS
	6b6aN5d6vfJ2X1xAnwKAVyRVxO8fHdtBxUzMDCDqD2VKWdeV2P0Q7z7knDfS2b3wyai6m3
	+Ng54sox6PA/Q0tfZsZRhJYwHlE9dkcDoIqMXK8fNeC773/IzJam+1s9e+15KpM29gHQs0
	JsEkZgvP96xsLkK+U9ZpC9DSt0cdUYpPVflm9P+2qQqOmiPzD1HSicbT+W3MbQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 15/17] dt-bindings: mtd: Argue in favor of keeping additionalProperties set to true
Date: Mon, 14 Nov 2022 10:03:13 +0100
Message-Id: <20221114090315.848208-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010359_752931_CAB1B2B7 
X-CRM114-Status: UNSURE (   9.13  )
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

In most cases we try to avoid it but in some cases this is
needed. Clarify why by adding a small comment.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml                  | 1 +
 Documentation/devicetree/bindings/mtd/nand-chip.yaml            | 1 +
 Documentation/devicetree/bindings/mtd/nand-controller.yaml      | 1 +
 Documentation/devicetree/bindings/mtd/partitions/partition.yaml | 1 +
 4 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 2494ec2d80e3..9ee285b7d162 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -60,6 +60,7 @@ patternProperties:
     required:
       - compatible
 
+# This is a generic file other binding inherit from
 additionalProperties: true
 
 examples:
diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 8d5d2d3ef56b..6e2dc025d694 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -70,4 +70,5 @@ properties:
 required:
   - reg
 
+# This file can be referenced by more specific devices (like spi-nands)
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 3f2a1480e1eb..220aa2c8c0b5 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -129,6 +129,7 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+# This is a generic file other binding inherit from and extend
 additionalProperties: true
 
 examples:
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index f1a02d840b12..8bdec706ba9b 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -60,4 +60,5 @@ then:
     $nodename:
       pattern: '^partition-.*$'
 
+# This is a generic file other binding inherit from and extend
 additionalProperties: true
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
