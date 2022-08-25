Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EFFECAAA2
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gRjcYR2dxxKmpH+DEJeeCMuvcd+hYxNK32A/+oWQms=; b=TjeMi7mWiBobeN
	R0+uFDOlz4nvHAfYrZlnr0GQQEQ98I3stCDCtqCQ5pYNcpvYWnz1RU7x4qreu6Yh8dpcr23ETMhkV
	e9mKdZhpU8kFoa8md3+SxL8nW/nh4X0INeL/oFBkZRm9JlXEASZIHm575tUYKAy+1yyYjtttyzMYv
	orWmly0U2p2Zjvxf1PeZg6ON8//OhvOUEpXskNZa8JE8h5V+ysk58bFz8biwqJxvzFjZzBpv5eHnm
	hX8QXLwidpoU/H7h/bg8tOy6Cnu1/bCmCov1KHdDzEEtG2JqMQwp+XjmYbCfTXHx55Dzqy0TADWF1
	iam2bK9koYla0KLXQ7Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKjZ-003aLa-Nz; Thu, 25 Aug 2022 21:49:53 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKeZ-003XUG-Ke; Thu, 25 Aug 2022 21:44:46 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2E90D8380;
	Thu, 25 Aug 2022 23:44:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661463880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GAM37BxS13kK4u2MMjWFwsceZiZL1wT4cZsMXON3sb8=;
	b=leMTQDqnoNGOgXXV2/te+FNiHl8b9pBP58cmm5tVEbZUvMJFN+AB99JDeWdZ2rjMc+AOHN
	IgnOPJoqtU0O+JZ1mud3zrKfP3vY6ndAfYRKRzSBpqoqB6HJgjWk7goqFrhEpZRvn0XmTS
	BjAJEAQ/CrhyKv8zl4Sh8Wdx3dHp8jmxR4LLEXW+k0Bl1h8HYJVj/MUBqnbei0/76USxVt
	U/o0En51VYdftv+zbKeycqII0QrX9IohtyhGeTj6rOJsKHZqZb2zUZyswMusS34vDbsaMh
	9H4Zh2wIyb42dlz6OUdm38td8bLfh0eZJhtOem70RPfvtNRRp3zr4Rb99cAmPQ==
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
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v1 08/14] dt-bindings: mtd: relax the nvmem compatible string
Date: Thu, 25 Aug 2022 23:44:17 +0200
Message-Id: <20220825214423.903672-9-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825214423.903672-1-michael@walle.cc>
References: <20220825214423.903672-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_144443_881094_D5F38F38 
X-CRM114-Status: UNSURE (   8.83  )
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
more specific binding elsewere and just match part of the compatibles
here.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 376b679cfc70..0291e439b6a6 100644
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
