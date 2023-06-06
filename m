Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1E9C7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1l4LgyX/KTERBqy9/CcIlXqhveJ9TKXWoxnDkHSoQ8=; b=qUlAf+m+rCSoCt
	A65mzzTXI3zv2/N5mo/32V1laMtq4CKFKo2jEIAFqzcsKrBGHvt6Mw0mOPS4vvD0mkuN9H+vZ9Na8
	zNyI5701ynEAySqPDG1BHfOYasP898250Mf48xC8WEEG9dL5apxRH+rjGbtuNeA5j1nEeHYO4Vxj8
	O8na03DoW871BdZOQED0mpcAk1BEz44KE2r152XBAFzuHHtNSpWfKloEOpuWtavdczrP2RRa4Ee4o
	eeqb24QUdsYWxNZk2GEsfMu5wcvWNLZr+VZLjK1cd8aQQJKScDGSH8VPFuhXRFwAmz5I1AN6L42uW
	gMeS1QBpwCM8dC0NM+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arg-002edo-3D;
	Tue, 06 Jun 2023 17:53:04 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6are-002ebY-0E
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:03 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1nE5V46w1iNIhujeIKIuvXyLpX0KlTkSPGzhp4iCIw8=;
	b=CTfFM3Ks5TwccUj4Kwn9+zqDttDYcnbsArx82+Rj4jJ6a4aIlRZ/n5JYcZZSy/1ChgE67q
	WsFKsc+Q/R5fsA/mwnmQOT8XSSkrKwBDFBJf641hJeJELn2BNIbB4Za0dsWEVGiTeCN3g1
	LGtjFlxOa/wkljUpkySbguG0rvXuk3bKhCFIVPPaz2pTM464rc2VnMehTcOvCJE/ufdloD
	QjZ1to5fVCfySQFN7XFT2dOLe04TkWm09UkQnzE2R3ZkEXFLRJoRBhsXWa9JXEYDqJ6Lwe
	izX6/hLVSfpcmRCLRDUGFpCivp4CXtOrn8fCF0ET+D+Hbj4Rer97l81ZpWdjqg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99F8B1C0007;
	Tue,  6 Jun 2023 17:52:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 01/17] dt-bindings: mtd: Accept nand related node names
Date: Tue,  6 Jun 2023 19:52:30 +0200
Message-Id: <20230606175246.190465-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105302_259599_30F6B6EB 
X-CRM114-Status: GOOD (  11.45  )
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
---
 Documentation/devicetree/bindings/mtd/mtd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 78da129e9985..589481b0b93d 100644
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
