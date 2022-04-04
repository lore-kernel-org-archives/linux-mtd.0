Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D375C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yie1sbjFdBkFcEdxflwaW6A5ZES4Cu4mZy+J61/LM4=; b=iAUDaeSplj9bpG
	ctGoredK5DhWnAkRBaG00/DGJbxU9SuFJntRjChzODolxjqpeQ8MfY37IZYSyE9lAm8NHe8GA/bfv
	Bz/TIkG0CbB/jxlcl9FlixsCOgWDXNp9Q5XS8SQiBFujT0cWGdtEtsVDRKpzc7ZNNPbWRo3+G7Xer
	etAwLBF9Uad9NU1NeIyYHNGl/o6oBk9ozjBKw5D5438Ax4ETWgbmw+1oWFo2O96OvwuLPgJyfsRIe
	BId/ai00jGXZFA70ClPsLyvV6xbMPnli8plkUSzrTFQbYaBodytFy2vwn0lW4uAZW9444hI0ZzQ3p
	dJ9GDRQgh194IntJYYPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMdd-00F4Ex-Cu; Mon, 04 Apr 2022 13:20:57 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMbo-00F3Kf-Tv; Mon, 04 Apr 2022 13:19:06 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 m12-20020a17090b068c00b001cabe30a98dso381903pjz.4; 
 Mon, 04 Apr 2022 06:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tr9MXM2WGjlcOGtwp7Avizlxz3VlU8PL1ya73J3s4Ig=;
 b=Xf91QF0idYVwUahX8ttAZz14sSrH+eixEI3rSHYsili6Ih/R7nHWcCRBZxB9N5ECth
 RMptGkG0Ph1znURnR7mrrPpbijT4ZSnkpAz4zN0FEbMh5OBFK26CExBjTnO+tEzmm/1y
 ZzeVY792mP60j7vxBOwsGntJ0SMV649Vb/aobHBVLbQxL5OeDq1v25qlEWmAQkfs09A5
 dKu4orpVuYkFl87bvFkrymuNEOQcsOFItsGjK9AA56iGyDP4f+qJxaDf7qcERdQ5ESsD
 Z1XCF341CYv3nlKNgo0unN0VwdfRVf6D5thUKlWPnj8bQOgXcZjZwzJRRb/FHmXwQJh/
 Av8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tr9MXM2WGjlcOGtwp7Avizlxz3VlU8PL1ya73J3s4Ig=;
 b=fHilC4I7LUfSxsor6NBZDB1M5BMyQK+2FZqO9/JEvYgevMCOZDZJ6YYd9S0JMNBa8l
 AqR9d4VYziFdN17k5BfogAoUJ7LTtZhkG7UZHwd8bfjdfJCaEeGQhKc9WaeMy6AZZ7OV
 tG2CdpQzaLI1TJJZRFHT0NFnQOw/XRU3l8HQ7HnzpRW17BepviN4g8CkFGsscZE1RiPE
 7MAkyl5NsMoabJQBu6aVyfcYC/anWoBsstWLdDknzNqPg+bGSanY8q9NXrYsWJ5Hexqo
 DRRdM5inTJ9+wJhHT9e9umr+5R9xIRZ82wpjEAi/y1EwbO5/xiaXVVK4xzFks9hxr5GO
 P0JA==
X-Gm-Message-State: AOAM532b/sOVpciVEckg4ogK+G0zkUg7bdiCWYh4cf3zR+SZxGevOsav
 eSXa9nLIgymdFcsiyFMfOhQ=
X-Google-Smtp-Source: ABdhPJxHIowboWR6OquGW3jejuoZgLb6nqgQOKG84z4iHSVnDNhg8f8dxwGH8twCkweJzpJKMPx0CQ==
X-Received: by 2002:a17:902:c643:b0:156:b53e:60e1 with SMTP id
 s3-20020a170902c64300b00156b53e60e1mr2434713pls.43.1649078341990; 
 Mon, 04 Apr 2022 06:19:01 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm12475705pfj.43.2022.04.04.06.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 06:19:01 -0700 (PDT)
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
Subject: [PATCH v3 3/5] mtd: nand: mtk-ecc: also parse nand-ecc-engine if
 available
Date: Mon,  4 Apr 2022 21:18:16 +0800
Message-Id: <20220404131818.1817794-4-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404131818.1817794-1-gch981213@gmail.com>
References: <20220404131818.1817794-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_061905_024631_C59C0E0D 
X-CRM114-Status: GOOD (  13.65  )
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
Change since v2: none
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
