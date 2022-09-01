Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFE0ECAAD3
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 22:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZ4e/2+LdkEwK86zCipN/IIyHR3/yKyKL9x4bw27e5A=; b=tcD/aDcLXFJwCl
	fsFQSwyXcrHKOve9yKcRaM/aycB4/SohRSATpkIOx95MdyQypKoNfvsOD85LuZw7Rq5LMObEhdYd2
	QwjbRMwRBnoYKMKapvGxjKg1LFAcgvapMrN8qrRgW2pdjBG2LfBr4x/82VoQv3OpShtV6RCwPSwDq
	RvW/QBxb+gLP96nD3w9ud3Fx6pV3zQv6CYIhpTyYkUEfvyv32kLc0USpxbAjdIo1Oc4J68/sElFGM
	lnxvNk5O5H5eP8sykTN32Jt49R9qDb3Arqz1/00R8/W9kQO+nvziOUAly4VwN1nvj3plkk5VHv9AF
	ZSuU4Itehyxu8MT8ni2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsdm-00FKFr-RX; Thu, 01 Sep 2022 22:26:28 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsWw-00FEfY-2K; Thu, 01 Sep 2022 22:19:24 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B7C822209;
	Fri,  2 Sep 2022 00:19:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662070753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vFjv7dJFpQ+L/+5iWkUoVgYZNozNXbOSg5BVzbMzGGc=;
	b=Qt0kiq7il6F978sDpy2pchihqLpiRtEiQsZa2FbKzPwS08bYhlaAqpgpHT+HgW75YU1guf
	DJrBaW2KsEc5IJxE+UJGOj6Ac9vwwmrblO6+pF+Y6XhwfdgvNSRe/rXFkByF3JQ3NZyenG
	iPmU+fJGn9pNVf/X78l7EtSnAT4z++OreoaNo7fjYmZmk1vAZA93tpCmz4zvQl1MhJVnzu
	ouphqV0VwQSjpA2AwPnwi60vEl63jTXA/gliwSGn95wzSiSMooE1fZFGc+HwBb0ZXliXug
	Sz225qm9PxNvKvMC4Ku+i2tqYAWe8mun/8MOr+OCY9Sk6qJ4aBFcA1QFTjMmmA==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 14/20] dt-bindings: mtd: relax the nvmem compatible string
Date: Fri,  2 Sep 2022 00:18:51 +0200
Message-Id: <20220901221857.2600340-15-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901221857.2600340-1-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_151922_339968_A1E20428 
X-CRM114-Status: UNSURE (   9.96  )
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

The "user-otp" and "factory-otp" compatible string just depicts a
generic NVMEM device. But an actual device tree node might as well
contain a more specific compatible string. Make it possible to add
more specific binding elsewhere and just match part of the compatibles
here.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v1:
 - fix typo in commit message

 Documentation/devicetree/bindings/mtd/mtd.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 3498e485679b..25b91f25fcf4 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -33,9 +33,10 @@ patternProperties:
 
     properties:
       compatible:
-        enum:
-          - user-otp
-          - factory-otp
+        contains:
+          enum:
+            - user-otp
+            - factory-otp
 
     required:
       - compatible
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
