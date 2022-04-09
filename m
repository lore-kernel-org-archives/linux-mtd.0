Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC357C433FE
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 12:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUEneHu7t6sq/scPJ7DgBfRV78B2dMHXS0iQS7SLl9Q=; b=JXWMOHFep8jZ/q
	JxxU7rnhTICgaC/IqU6AicZrbHWU8mMGRdhevBLfBkqsRzZ4mG/XwWod/WnTz0/dH08yc4/AoyyV0
	PeYuhUCfHeGLX1kdHn6UuHQkwPdHTd6bT+Bgq9M3bSg4pYI/78okPIX8N9Fi/ccTBRYM3+QdcVPdN
	72Of3IVFyo7zwtzV8oogLJtJ1ilzedGs7+6Yd2DY+HNK1NEiQy128r9pjp9ok+EGmliMr7y8q95zQ
	PjXLDu3qSIhbssaQpvt1PXqavu8EgWk2hoZjqmIcYnTKlw1r6+/UcGOu72JBvz+YEDxm0Bk4Y3Z7w
	X9Q5yHn4YGA0fXKzbT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd9ve-0032DC-Dl; Sat, 09 Apr 2022 12:10:58 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd9u0-0031Og-01; Sat, 09 Apr 2022 12:09:17 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so12079971pjk.4; 
 Sat, 09 Apr 2022 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hkJi3miPsTxhbqZ6yssVUY4uyoiBTmVSZiVffYb+fyk=;
 b=X/Y4JeQv5Lu/WAGoYG/TNY1pEehMI3BHkuouryi6uXcHsr3OkiiboYCmx+MhQV+P9c
 z5/FBDtxB6uH8apjZchfZVT3NU3hlyAtlmVjYlvC+s7pKORyNo8aHDk6WXDNSe3lrqyr
 7TBjE/ZYsW6jKLXtm/c89O4Zx6xIdRKl2czVJfeTgTMuybZHvckIaWy/RRiF8wtNI5MP
 w4bl/GGEGuawSEauf5mvfgcMbd1Nd1Y1fb15yjAqRvms0lWJIZ4BL+NVcwXYKvbWwRjH
 1b7U5gRK/DVsK14LiaCrYAH25HIXx0Q6uZYn1qjIqjAicquVsvnhbgPEfTj+TGG4SXID
 2mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hkJi3miPsTxhbqZ6yssVUY4uyoiBTmVSZiVffYb+fyk=;
 b=ldB9V5fzV/LMzo/Go8im+4Dk5RGygzRTF8xRU8lee3Ak/rMMD3WebEghiVAyFUVh4O
 oUT3578varMs9uiZBxA+y2mKmsvYT+GNyoqYS88chniJfymiPOymN4BWQycMZFWFugme
 ZCqHSooCRGILIjOM7V0L1PmcWi7IUJdHULb8F4Y0jIPiUS/j9OmyjybmrD4T656eQSF8
 jG56/gVF8HMq+9BuS0fCjiuatZWuIYdkqVeGX4hg8DxVGC+jbJqD8QH5b0qBWJM9UhKp
 eyNZTWSQoDeC8FifcNuboVBVhvkxhSnMTDvyDmd2ymq8NsR9myRNYYJ7KBEvXBbkqWPl
 vAVA==
X-Gm-Message-State: AOAM530ZLR7tx4oBCPf+C9cfS00bvkuGxpCRe8tFxDDwZ+t+7XHorO2B
 3CsGHSr0R7TZxfrLNvlIvWs=
X-Google-Smtp-Source: ABdhPJzqJTFqdg+TWLe8Q4aimTAQyOj6qcVA4P8+LYsYY9dlncJgnXLe+P13s00FFvDvB/cErX83tw==
X-Received: by 2002:a17:902:ea08:b0:156:a809:ef7c with SMTP id
 s8-20020a170902ea0800b00156a809ef7cmr24259896plg.4.1649506154338; 
 Sat, 09 Apr 2022 05:09:14 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 a85-20020a621a58000000b0050569a135besm8307357pfa.201.2022.04.09.05.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 05:09:14 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Chuanhong Guo <gch981213@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list),
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: [PATCH v5 3/5] mtd: nand: mtk-ecc: also parse nand-ecc-engine if
 available
Date: Sat,  9 Apr 2022 20:08:17 +0800
Message-Id: <20220409120819.3124209-4-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409120819.3124209-1-gch981213@gmail.com>
References: <20220409120819.3124209-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_050916_075739_35566E19 
X-CRM114-Status: GOOD (  13.37  )
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

The recently added ECC engine support introduced a generic property
named nand-ecc-engine for ecc engine phandle. This patch adds support
for this new property.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Change since v1:
  new patch
Change in v2-v5: None

 drivers/mtd/nand/ecc-mtk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index 74ddaa46ba7c..9f9b201fe706 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -279,7 +279,10 @@ struct mtk_ecc *of_mtk_ecc_get(struct device_node *of_node)
 	struct mtk_ecc *ecc = NULL;
 	struct device_node *np;
 
-	np = of_parse_phandle(of_node, "ecc-engine", 0);
+	np = of_parse_phandle(of_node, "nand-ecc-engine", 0);
+	/* for backward compatibility */
+	if (!np)
+		np = of_parse_phandle(of_node, "ecc-engine", 0);
 	if (np) {
 		ecc = mtk_ecc_get(np);
 		of_node_put(np);
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
