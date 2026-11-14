Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E47606A331
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pxcuDsyf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=yqSHP3Np
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7h7Is7uidSozXd2ylUuDVhXL8zVxQLtUVuKlVltC4zg=; b=pxcuDsyfy018YlnmURVh+yeabs
	hfMscZEizpMDr2NFu7n+V/Fu9dLGirRBRX9UKkNgvwoFW71JyyNy0KYPYvoueg8kYIvz5W1WDwvSl
	Cug1PYkGO4BAwYlc/Sk+wU2LyDziKyQotCSYLjbZ2X35ctmqLoLDsZRIa/VYwdsMhmgCXHhBwjs2j
	gL2S3PHBHf9bYeGvhQ/U5Qj+lIi/rM0+IY7T8dissEwrCYN4ZSuAaykgVNK3AhDyQJjSdjeIWm/NV
	5UvgQr+2/SQcoFVEDzrDk12IlhdwVejyQWJ6mpDegpewVq5D62IBEpVvgJpwZlyerUjeM4zGtao4v
	0lFC7hgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAeM-0000000FjAX-0D0F;
	Sat, 14 Nov 2026 10:06:22 +0000
Received: from mail.simonwunderlich.de ([23.88.38.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAeF-0000000Fj74-3T3w
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 10:06:19 +0000
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 578D7FA0B2;
	Sat, 14 Nov 2026 11:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794650771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pl2hOz6BzMGr9Dpq8GYJiAgRRx0ylFIRGI3z7sZaMZs=;
	b=yqSHP3NpQXlqj10CQ0FopwiVDN+5CY7Z2xafQRDZxF7Bc2dqQgAeBw3kNge0fSqpj4999J
	LsDUAP1nNvjpm0hLtB2c6Y1A7oI0+n6zQQGioVZ1KG0/Gr6C386KhtyxTchsVgWrAaXYzx
	t/u4OA8WDnEinmAlc4bg4X21/UiyisXRXVF6J9QDYtFJyRHTtI2QmT+0ac1AX2V+T1EnZ3
	vwc8AePElrLdBNcJ7DWuRzhHyeDXeQAKhEzgy+TOnYbPc0W/y1v78TWNjcoHvGaH1HVvHL
	bg4e0PGEB9HAcTVIZYVL1c//TNgoKPGvnaqrBwbPDeN3W9DljUkHU7NoRNoS2Q==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	John Crispin <john@phrozen.org>,
	Sebastien Decourriere <sebtx452@gmail.com>,
	Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org,
	Simon Wunderlich <sw@simonwunderlich.de>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] mtd: maps: lantiq-flash: fix NULL pointer dereference on probe
Date: Sat, 14 Nov 2026 11:06:03 +0100
Message-ID: <20261114100608.3432120-2-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114100608.3432120-1-sw@simonwunderlich.de>
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_020616_430732_E47AD6D2 
X-CRM114-Status: GOOD (  11.04  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 6145e07e9c77 ("mtd: lantiq-flash: Use
devm_platform_get_and_ioremap_resource()"), ltq_mtd_probe() stores the
ioremapped address in ltq_mtd->map->virt before ltq_mtd->map is
allocated. ltq_mtd comes from devm_kzalloc(), so map is still NULL at
that point and the probe dereferences a NULL pointer on every board
with a "lantiq,nor" node.

Allocate the map before mapping the resource.

Found by code inspection while porting a lantiq-flash change from
OpenWrt, which replaces this probe function downstream.

Fixes: 6145e07e9c77 ("mtd: lantiq-flash: Use devm_platform_get_and_ioremap_resource()")
Cc: stable@vger.kernel.org
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 drivers/mtd/maps/lantiq-flash.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 80d467eba92a..5c2ace302b50 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -118,15 +118,15 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ltq_mtd);
 
-	ltq_mtd->map->virt = devm_platform_get_and_ioremap_resource(pdev, 0, &ltq_mtd->res);
-	if (IS_ERR(ltq_mtd->map->virt))
-		return PTR_ERR(ltq_mtd->map->virt);
-
 	ltq_mtd->map = devm_kzalloc(&pdev->dev, sizeof(struct map_info),
 				    GFP_KERNEL);
 	if (!ltq_mtd->map)
 		return -ENOMEM;
 
+	ltq_mtd->map->virt = devm_platform_get_and_ioremap_resource(pdev, 0, &ltq_mtd->res);
+	if (IS_ERR(ltq_mtd->map->virt))
+		return PTR_ERR(ltq_mtd->map->virt);
+
 	ltq_mtd->map->phys = ltq_mtd->res->start;
 	ltq_mtd->map->size = resource_size(ltq_mtd->res);
 
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
