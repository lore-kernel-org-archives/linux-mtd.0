Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FE4ECAAD2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 22:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyLGQxxwPA5mas4uJIyFREFsGRNd8OOxsPaqL9RumXk=; b=B9wXIXmv+MW2D2
	9getDdrYzkfQWxpsxTy/nRtQV6vFPmMPKq2eug5WGigljTX37jUt9Kz+BpdKctfnKC0fKqJsV1OD8
	w4BqkGzyHfGrgnPJKFgOFTOgLM+oI7YNUdFsN+mVe6519YItwacrKkz3aH4LvLHWjk5zMiLEB2oEU
	KmKcQO3SaSEx9viUGxEeNh93okLC1SRY8DiubiDSNIZIEB8x+FU4vuRieClteYWD4X9ka7PJ1LX/e
	K2NRnsvCieNDmx1bKwFpPLvo9isGbcMjSpv/y1sGSrCqAvKQhfk63pu7dXzVJo6xEWxDOZAKA2wJb
	0lQlfjHYW/o1vvXZXhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsnE-00FPja-2e; Thu, 01 Sep 2022 22:36:12 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsWz-00FEj6-2y; Thu, 01 Sep 2022 22:19:29 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id EF3D62221;
	Fri,  2 Sep 2022 00:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662070756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KKvaxDezpVglQbvUlzzvJIhuhv9lpFlXJWy0f0xohsQ=;
	b=hSJiAoEqoFLiXl618NYj5ODCGWBKsRSBRjJyZajQCq7YvEFL7TUa2cRG0rF0YAxW3ml3S/
	kYWFF/sQeJvRRn0RC1oJALu4df2WuE3VFELUQnzMrOYG2cJzE4LMOL9VVILuduncXO+Pxz
	cCBvFy+vBwKEeKaSkAxyKbmuEX8H7PE6pRXJ9fbIRbwEG0jFZqOGjXlKqaw6Ix4Ria98Zc
	TXdV4OVehj8MT25E3CPtFPX0oyfokMnHje+BuQCyHbzHTCF0uB1QGvqagVu/3+xSy4PrH6
	eQNhkvXMJ01RqVJAYFYBhBIhl7gdB8E10UYdrz/Ex6JNy2QkgvTxiMjV1Fk9jA==
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
Subject: [RFC PATCH v2 20/20] nvmem: layouts: u-boot-env: add device node
Date: Fri,  2 Sep 2022 00:18:57 +0200
Message-Id: <20220901221857.2600340-21-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901221857.2600340-1-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_151925_343136_2696B995 
X-CRM114-Status: GOOD (  11.42  )
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

Register the device node so we can actually make use of the cells from
within the device tree.

This obviously only works if the environment variable name can be mapped
to the device node, which isn't always the case. Think of "_" vs "-".
But for simple things like ethaddr, this will work.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v1:
 - none

 drivers/nvmem/layouts/u-boot-env.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index f184d1424b1e..d2adc246c93a 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 
 enum u_boot_env_format {
@@ -47,6 +48,7 @@ static int u_boot_env_add_cells(struct device *dev,
 		info.name = var;
 		info.offset = data_offset + value - data;
 		info.bytes = strlen(value);
+		info.np = of_get_child_by_name(dev->of_node, var);
 
 		err = nvmem_add_one_cell(nvmem, &info);
 		if (err)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
