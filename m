Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3092C38A02
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Oct 2022 00:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LY/axmT/SsEjhHdvQQvx123siIqXDtq+ex8uQBthL4=; b=yHa603mCZkILLG
	eqXz1pNnhgo/aK/psQLnDFTgjl/IHZYYnUP8gYv0xtDyhGnm/+3QCRnDKXz1VQDuhScFPrpdVp7cg
	d5jHrlJ9U8EsCIop6OEh3UwfaPyI4zQEndCcaxEGUGjl89ma8XmXttH49wLZwqr8rJ5E0O4dVmjJ8
	QGizoRPQiBwFpGeJWpACUDrq0e8tf+BU5uoYOo+s30sVVYYQ87ySygE++PCf/RJoYmQbnZqrLUH46
	TjwBsdmGWC5lJygzuScZCVurxyaAAVFFGCtP0XW3YES9zO/qNWnbQSFj5PwQuZBrJ+39HCaw/I4TW
	rNc1MFsdwCUef/DBxEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGg-003Jov-Jn; Sat, 29 Oct 2022 00:00:06 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGL-003Jhe-VV; Fri, 28 Oct 2022 23:59:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 14946FF805;
	Fri, 28 Oct 2022 23:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Butx8i3x6waX06tzNbc8/G+V5LmsGgkNbbLeRWrHG9o=;
	b=JxxlOPJyZc3Om+Fqj3548BrMCrYLgXNN+D35HC4VbVUm93L7D99yTEe6Aby6MHnU3XLoYx
	1KXubrZcGe6uTecE/BzxZNTUioN3LGAMOmPZkmFZ/blqVNtso/Z9PJPdVWll4LnzNFGduq
	A6aBJmNkCe6lP+/LY5Sot6ubuJRAdRQ00HfoNRnrVC8Gt63C5gKo/HeSHrDgiAKErL1Jim
	WnSUqjxdQOa7hPpnIlHXkrIQfWIS6KesfRrwtgy7PELGC4ZHZnMR+gVfRO29cP6QK/RGsk
	eZlnbtLuzIBW+rHSDxytqYX8cqaCdUFK5ssQlXsI5dEOyagZuARlMD3gwREvpg==
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
Subject: [PATCH 02/12] dt-bindings: mtd: Mention basic properties
Date: Sat, 29 Oct 2022 01:59:23 +0200
Message-Id: <20221028235933.934850-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028235933.934850-1-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_165946_167475_8122515A 
X-CRM114-Status: UNSURE (   8.10  )
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

there to avoid the need to do it in each and every file.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 9fcaa61b046c..10684b233ae3 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -21,6 +21,9 @@ properties:
       based name) in order to ease flash device identification and/or
       describe what they are used for.
 
+  '#address-cells': true
+  '#size-cells': true
+
   partitions:
     type: object
     properties:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
