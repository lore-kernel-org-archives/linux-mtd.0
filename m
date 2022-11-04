Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8F5C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAyW0r7yqp89rrV20u9hkQkUlSUd4mcuUZLB+Yt4os0=; b=f3UwpMHJx0KwUN
	jwgK88BB2iGsGnD2aN6SFUBedE0UA5pCHnh19tnzvrvd1nxh6C8UK7a7yikgQC+8zlKikZNT2LR3G
	cg334yInOcgTPU4rO49SSe6KtEQw8RgERk1sIYwLBI2AvfPMpsabr2+KO2aPTtoUmycjdufsNt4zH
	RuDl6aeRx3I69iqrtBLoLV54Vmoosjz65tF0sXQ4ocUOA+2iyTQ/qdUFyPRGMLxOhInw0gc0Q8qKa
	nNbjZwKPdHYIqOEP47ookpqZs9DDWCd87V23w2fmpkt8lO8s084qd7Zc9ZEr0kCff1Y4x0BoaST3a
	XJXnaqHcGEjGd+8VwHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzrG-004W6k-80; Fri, 04 Nov 2022 16:47:54 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzqq-004VsX-Ca
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CC8D840013;
	Fri,  4 Nov 2022 16:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abWxBYqdkWoQQQ3GX9Ts6R6Hk4Vd1Cu/4zxI2EIxg38=;
	b=Mnu1nATjTqPwq1hRv6A1JF5exhMNr+6cwqEEau+Z4GMy5leCp8uBPVSTRgOhjEOq7YF3iy
	L4/RtjaX7s6M2CjuDAG0W4U2x1+cAUwPObARXyXP9LDIHKF4hoxW9fquRa5CLyFmxLCfnD
	r9mzSqyQSBBSWPgrUjRE7jDiaRTqHNhWVo7uJ3ZazBNXH2sY531Y5s8gvt0LmDLzYQSqgU
	+GNWnTR2TV6cVROa/PdiExz9IAKOqfx2Kzmij7FByKaYI4tUHWqXfa26UYlVGRtnpWiC9x
	A+KlQORXPG8I3mKUdAPVbWpeNpqsbNNXgqSCQ+5zR5fhVsEsyWMEzdu6QkRvVQ==
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 06/17] dt-bindings: mtd: ingenic: Mark partitions in the controller node as deprecated
Date: Fri,  4 Nov 2022 17:47:07 +0100
Message-Id: <20221104164718.1290859-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094728_617211_5B3DB238 
X-CRM114-Status: UNSURE (   8.76  )
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
