Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67E0C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 11:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYRyIQgqVQktLOZ1+a5AL1+GUNpJ9ShfgpcNX6ilnmQ=; b=3gYA7APlsxpC88
	ljsFdGGepf4BqCFXCUUTiQNSw9DieiD77gsDzmYaO8Ph7Vxg6QaI877DBSoBuUkSg71gzThd7D9fe
	CLsrvVqmxT3fZS3YcJdbx+sNAb3mxMqnPY8iwqcf4TqiGX7QmqF+AJWAQCJrxKa5PDw8kLAyR01xn
	5gjeuPWkAxdGbrpXTrzAhhtW8q6Qx0v2/b3+6swV/CN17tigBWgNTCTs5OZoJWA+Sf1Mr09WSy9Ri
	SYMbwyFllP6em0FmHiNA1Px14F/Cc44NQ+jsJoIEXs/TsE6wm/+l+GOJa1NUQZniVI4on81z9ADZC
	32+Hx2X/xpZPzv3uEx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqZbL-00ABg7-Pm; Fri, 26 Nov 2021 11:41:11 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqZZp-00ABAw-46
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 11:39:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 850F2FF813;
 Fri, 26 Nov 2021 11:39:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 05/20] dt-bindings: vendor-prefixes: Clarify Macronix prefix
Date: Fri, 26 Nov 2021 12:39:09 +0100
Message-Id: <20211126113924.310459-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211126113924.310459-1-miquel.raynal@bootlin.com>
References: <20211126113924.310459-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_033937_318896_C3291F71 
X-CRM114-Status: UNSURE (   8.01  )
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

When looking at compatible prefixes, Macronix is sometimes referred as
"mxicy":
- mxicy,mx25r1635f
- mxicy,mx25u6435f
- mxicy,mx25v8035f
- mxicy,mx25f0a-spi
and sometimes as "mxic":
- mxic,multi-itfc-v009-nand-controller
- mxic,enable-randomizer-otp

The oldest prefix that is also the one preferred by Macronix engineers
is "mxicy", so document the other one and mark it deprecated.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a867f7102c35..93d65dc3746c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -774,6 +774,9 @@ patternProperties:
     description: Mundo Reader S.L.
   "^murata,.*":
     description: Murata Manufacturing Co., Ltd.
+  "^mxic,.*":
+    description: Macronix International Co., Ltd.
+    deprecated: true
   "^mxicy,.*":
     description: Macronix International Co., Ltd.
   "^myir,.*":
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
