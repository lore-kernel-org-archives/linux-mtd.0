Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FEBC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmwNX2jHy163ciHm2a2Ox+nrGBKzlp8hor9BK5bhD8M=; b=eW9B4Kvhhwx15S
	MFQgw+mRIIjYFIbbyZ5zpOSWxsM07NmVcTtBEqYDd/VtUt0EHL3D/kBtffK+ziSb8oh86igyIUfLt
	Ze47mdc0o3h5YnaqumjJOD2ZnxZ/WT2a1DwtjuDhy8wZ4AqJ05s+OXJVwhbNat0Gcyg4NxpolDwMB
	PN4IzyrOhfmh9sBBNuliGZPO+H3zCD5zXNTiM3ScyncL+V3E2w3MIS/M8kzqoNtDSYLR+iN2oggeR
	S/vj7nS+kzUjdPWq2NoewWnjk4T/nK4oK79PYhpCnmcrEen6PoDBx7tTAyF9bUM7O46UvIctJ8zEp
	TT0thnrHeo+EyKQv4hVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVOP-00H2Wg-UT; Mon, 14 Nov 2022 09:04:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNI-00H1q8-60
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E1669FF809;
	Mon, 14 Nov 2022 09:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Y3Ilf0k1Zb565CDODTPYfsRYtki95YJmPfK8ZRRt10=;
	b=U5weO7ep3Ye7minqImiXDZllYYNsMWXY4DLWkB4nhJMCeQqZoElaOHaHYcvxN5QPLtxbid
	pQmuUpD18pj6+/GqBS9rBAeb4xVM1eOo1WFfCyduOnVskQy4Ok1MMfGcaYtRW5mttK2OoA
	pC/w9tJq6mHpS81V28oBmN4Hh78a75QzpDSVQ4tfo8CLD1b+JZ0aXzz0YBpA8WJfd0d1gq
	nKETdlV7TG6ZlSBDZCPQpZqQ5VJ9qfMbqTOgbGF/CKLRMdmHmL/ZfCmTjzGd87GaZ7i4Wt
	VBnr6ARRELUaIg6bbhNp1zVNgrw1U1DhlhI4qLK0lNhf66X6bH6RFdHheUE+Hg==
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
Subject: [PATCH v3 03/17] dt-bindings: mtd: nand-chip: Reference mtd.yaml
Date: Mon, 14 Nov 2022 10:03:01 +0100
Message-Id: <20221114090315.848208-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010328_391354_06DF325E 
X-CRM114-Status: UNSURE (   9.27  )
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

A NAND chip is an MTD device. mtd.yaml already defines many useful and
relevant properties, let's reference this file here to get access to
these additional property definitions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/nand-chip.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 97ac3a3fbb52..8d5d2d3ef56b 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -9,6 +9,9 @@ title: NAND Chip and NAND Controller Generic Binding
 maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
 
+allOf:
+  - $ref: "mtd.yaml#"
+
 description: |
   This file covers the generic description of a NAND chip. It implies that the
   bus interface should not be taken into account: both raw NAND devices and
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
