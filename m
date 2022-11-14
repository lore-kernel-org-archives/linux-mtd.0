Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58792C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAyW0r7yqp89rrV20u9hkQkUlSUd4mcuUZLB+Yt4os0=; b=mHNEP09PEy8nhD
	gTTbaW9euY77uB69rLDIUG0AQQKIyy1YhzOkSUgLY6RBMEd2jPyUkOEfUOnI1SLQo4jASdCNVVgSr
	S1ajXFSvx1r7zwHxhwa5AUTysUG2KPbcikqr281BN0s7qFe5NDCXhBHFeJV6KtKfmClIkZs8qUAJA
	dYyi95AYHjU/xrcJUd9y5TGgDTbxxjlTuax1TPF3PZEAA9isdqihY+0ksKOr3IYiwjjZlhZc3p3ek
	MESb8V9X9uQ/+0jTe3L38WbqAWbu3wo7Jcb0MWxZMSKNxIAoiSj0ziD0hpu97cHKF0BuqMiMCRcxf
	i9fLHKysbeOteul5StCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVP8-00H33o-NT; Mon, 14 Nov 2022 09:05:22 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNR-00H1uJ-D0
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 00B5BFF814;
	Mon, 14 Nov 2022 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abWxBYqdkWoQQQ3GX9Ts6R6Hk4Vd1Cu/4zxI2EIxg38=;
	b=Vx8uXQPeIudcKPHv0cv4vSdQKXGtNvXUAKz2bssWEm7L8914U7EQ3bSdC08XNv/m1t864m
	7Q3WyMg2Nxxt2MonG7/VEewHlzRAle+KnJtXc1TbAz0/h0SQB4s1jGf9T8zvC2HXWYTJUX
	rPO6Q2SkF4deIHBhvUIPxDaYEx5DgKBWhaUpbG5sok6S4nCD5FQUSZW34kXqJo7/CjG35h
	pA7IAjVc2pd8inw8POVZw5Hx5GGZbhTIarPrHDFR+BHbaamtdcEGNT63dnp0pQzC9rgNrZ
	jcXN94kxIBb1rdNGE4z5mkVOM8waFtBIKW+liCcHLgIIX3kef1fs8TIAB+lkuQ==
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
Subject: [PATCH v3 06/17] dt-bindings: mtd: ingenic: Mark partitions in the controller node as deprecated
Date: Mon, 14 Nov 2022 10:03:04 +0100
Message-Id: <20221114090315.848208-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010337_665620_F32AEE2B 
X-CRM114-Status: UNSURE (   8.26  )
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

Defining partitions as subnodes of the controller has been deprecated
long time ago, but unlike having partitions within the controller node,
having an enveloppe named "partitions" (which is not itself within a
chip subnode) is not that common, so keep this deprecated definition in
this file.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/ingenic,nand.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
index 87b2944d0d1b..90dbc5eba1e7 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
@@ -32,6 +32,7 @@ properties:
 
   partitions:
     type: object
+    deprecated: true
     description:
       Node containing description of fixed partitions.
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
