Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C3AC43217
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6Z9twOrZGjd0ARYFLJ+fHm+MEVVOq7zoac+d+TG2fE=; b=ioE7WbDRVhkB5H
	M3IRBfjwCxf5hUbgBl4vPcH3p0ml2iEQ7rjdzOjdIV5xaOLyOD1x/3dfBml84EHfV2hd5JgZzvBVO
	71hP6s53RXNxap6008hiQCb3gNBPxCff+2lfR6deK3tV+Ag18iEx6w3ENO9qcWCVk/BehIIfUfVPs
	Z33Qo7pqxDBoVOodUN5njH0pDy7Uzp/gLSqXXSSOHlpG2tBcQeUR/OAMqxTR0IZ1/bYYK4qVGi7BX
	l0SUfbqURHEN4ingNoTaKEO3fS/LRJ0yR2H4KKTgHj5sI7GIXVOWGQTIr8TaQrIaBO2hKWniFiChr
	JwTZkjw5/aACUj9ndO/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVPG-00H3B2-RY; Mon, 14 Nov 2022 09:05:31 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNU-00H1vl-BM
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 08016FF802;
	Mon, 14 Nov 2022 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgUll1fxlsNo04DlGgybxKu379cOxJAzo1HQkDdb+Qo=;
	b=l4xs2676U1pQOknyH9fqDpMzMkTRIOFkWzTFi6wkdFM+iXSGHGlYXdn3L8+QsClT2lDF54
	vE1KS4zB2ghyi88sSiUZtf0yptFp9t2nvgS5kReBo/W5SaCBSX6MxI3bPQpXR3tT5OmVWH
	Rkitf/J5ztmMu5pO4Dr22sdsNZQ6D4YIbpvTOS1CaYw35qNe6zKAS+ynHePeb9qCMOES5K
	5EWYyAihxZKrTYnvHXGlvmffeOdRjbuf5OI2s53m4MCKjROCbCXYn8h2DxdCt7BKcXAwwx
	3JVuBEOgO468pU7LJ3c30tIzg7eW7OTsPuLpE/1qo7gxq68N/tn0CIY8ttGT6w==
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
Subject: [PATCH v3 07/17] dt-bindings: mtd: onenand: Mention the expected node name
Date: Mon, 14 Nov 2022 10:03:05 +0100
Message-Id: <20221114090315.848208-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010340_564949_33257C0F 
X-CRM114-Status: UNSURE (   8.06  )
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

The chip node name in this driver is expected to be different and should
be prefixed with onenand instead of the regular "flash" string, so
mention it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
index a953f7397c40..8a79ad300216 100644
--- a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
@@ -15,6 +15,9 @@ description:
   as child nodes of the GPMC controller.
 
 properties:
+  $nodename:
+    pattern: "^onenand@[0-9],[0,9]$"
+
   compatible:
     const: ti,omap2-onenand
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
