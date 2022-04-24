Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F480C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Apr 2022 03:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IjA9AgDAYGUwA8UhrEbLcWOx0ycDIZEMl0tyRMr45E=; b=0DLlWVSE5XXbyn
	OfmkWOXMJlKlCx7j/oig8wXw/zd3F3ul4NocGk7ochUWx0Nul+fZzJo51eCU8cObdHIVw21qzuGFQ
	XqMwhMJkAAPvLa6HLzGBzMq2YJFBc1leL48kiVkzdK+e531Qvn+AqPdd3riFgxzyjGPv44O8lQCBE
	ic2AIeV+NWAHRGRYeNX4K7jRxCa2ec5lTycWRcEwONulTHzsqxsQm2vlV2F1uiJlHqNmDQ+7tr48m
	MtXqA/LDs5DcXppeHTgskEovo1v5lddaCHQRJFOoCD8REtov8Caz+LKIJcfrjPAs/vPZUodQHJVzT
	FoWwfz7ihzZ/8WxdYaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niSuP-005et8-U8; Sun, 24 Apr 2022 03:27:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niStE-005eIA-Cf; Sun, 24 Apr 2022 03:26:25 +0000
Received: by mail-pl1-x632.google.com with SMTP id c12so19605854plr.6;
 Sat, 23 Apr 2022 20:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bx17EcXivOefNPVT0GwtSAGebJ/STejXXqwturRr7B8=;
 b=VnD8Me67cwwcUoKVkBFwr8tkQZRjrLohIPKApXMS5qmJsmyo9z8ww2EzrbiPKDMaZr
 3ClNSEpE/w6BkiUPzrTInNz2DZsTGew31xuANhhq1dTdmDx7LfMzRxF2jOe3rZm94gE2
 rPcSAolPOBcwUttbFm7CD0pYCt/EjAJeYLvJloINhrMk1D/m31lP2ybrzD8Us0EbO+3z
 F8o2ppl2ngetgUHRpxfVlBvbFXRlN+LvJK/H18UuyqNhBcr3a36R3dUSJYECgE9bmtls
 Z3yoTiqZF58OHFM7u7PQRH7ZO39FE/lbxjM1OB4YSQ/k1QXTvIUT65iKDx+M/228156L
 15EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bx17EcXivOefNPVT0GwtSAGebJ/STejXXqwturRr7B8=;
 b=sm7Jj9c7Op1AtX0dr54a63Z9v5LuKwG63RhEQRgBZUDpfCuheH7EFRyx/rmDj+AFMw
 IIGK4CGUf/1bdcPXE9YGRfUN9e4iEVOs8/UWclx3/tWGUYmHLS1WnIqyju/DWUp3I78N
 h3okyXg7mWWePRzK6mtD20SDWJNVYClZkc4Twx4JJ17ZO4UX5DZBBE4Jyus7/QjnSlSx
 nc3yxZo3OfbwUkat7MleYI6lg/F+d/DD9rK6uRorFkpypLKIRxYAlVnDzh6TapoqZrZH
 iduNpDgThgtjWreuroeFeSBrIdXkQK4D3t5H4DWJqnJ0kmGD+xUBPQEp7SUYo5LADFE6
 Vkqw==
X-Gm-Message-State: AOAM531k+8g+R/rNUVS9ouj2u2K6uL7uYDSBETSir18/3ctrmRnuI+VJ
 fO5IohH/sCXyVhahxf7fSQ9fy7KKQVtvsf4n
X-Google-Smtp-Source: ABdhPJwfQtqF2Kt/eCQMX/DK0J/qN+ecwIyk4oOsUZX9DIKzFbWhe21C3yXTZt0kur6BmqCQPnjRCA==
X-Received: by 2002:a17:90b:388a:b0:1d2:a380:e622 with SMTP id
 mu10-20020a17090b388a00b001d2a380e622mr13663216pjb.22.1650770783261; 
 Sat, 23 Apr 2022 20:26:23 -0700 (PDT)
Received: from guoguo-omen.lan ([222.201.153.219])
 by smtp.gmail.com with ESMTPSA id
 r76-20020a632b4f000000b003820643e1c2sm5790724pgr.59.2022.04.23.20.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 20:26:22 -0700 (PDT)
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
Subject: [PATCH v6 3/5] mtd: nand: mtk-ecc: also parse nand-ecc-engine if
 available
Date: Sun, 24 Apr 2022 11:25:25 +0800
Message-Id: <20220424032527.673605-4-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424032527.673605-1-gch981213@gmail.com>
References: <20220424032527.673605-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_202624_484562_695A6F99 
X-CRM114-Status: GOOD (  13.05  )
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
Change in v2-v6: None

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
