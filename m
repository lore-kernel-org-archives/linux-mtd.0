Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152A6FA3741
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Oct 2022 00:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xH0NeNg1rQtRhSkJ89cceFdeY23oAFeWyFtD7zHoUuA=; b=so364AyZ0D7KO2
	IM7xAPSljejvq4fN+kL3xakASyR35ZN9WHUGsS93yKkFJgd8ruZ7U7pxvRHUIEw3PuTpzoWPgYO5r
	R9rumjxlqVAKSXMFdwSF1huViJ7EwvjZYxITL3Dj+IXen3sz1YBev3OSgokFHb/NLxgMIsIzie3jb
	bZKBcCWQj7GgC/J5gErcYkDO0U3HB/p61fr9ktrw6zsxsgYafDXGwBXGa1ZuxhjHNjwwz28OLcZB0
	DzIo+Qc/SqeUghzOcxlhYQdKcz+5iKGJTxoPgEFCpNA3XE18rn0xLX4eQ1lU8LMEJwgQgSCiC6fqe
	DfYZO7fYFcRdPWNhxx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZIJ-003KZN-1L; Sat, 29 Oct 2022 00:01:47 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGN-003Jij-TQ; Fri, 28 Oct 2022 23:59:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 759B7FF809;
	Fri, 28 Oct 2022 23:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhHL581pVZ78rpGpusp3WI56Gx3E7sF7B6MwrnAS96k=;
	b=P7CshkRfu9JXj7DVXrRpLQuYtnEsg4jjuZROMuqpFGC8T620GDVxkIQQghTkMigtcrABEu
	lE8whqVO5WkhRnNR/qQVvqfL7x+syrN0Bo9lm7XyUS/NMLzI85sGsKo9I/mGQmJNpGnI3O
	clIBYSuizO/CmVTvhAK7XZ4UiCPFbnOf0DXHFLRsjh9/0gdHDBbBHFBE6lm/nR8vH6ntQz
	apeFDIBAjWpdblZMRi1io3Dd184xPKS75fDBGRUV8Z6TmdyzsVB5DfcVhh8GYueLmTAWYz
	bZ73FqDiqsc1eQJTdtoyA8gySQ/W5ufEUxfbz5WgafUboKrd5c0d1UI+K96w8A==
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
Subject: [PATCH 05/12] dt-bindings: mtd: onenand: Mention the expected node name
Date: Sat, 29 Oct 2022 01:59:26 +0200
Message-Id: <20221028235933.934850-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028235933.934850-1-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_165948_171672_AA468D5D 
X-CRM114-Status: UNSURE (   8.58  )
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
