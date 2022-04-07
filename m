Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E3AC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ki6v7yEgyv83W1MQTwlGssFUX76yTOIYhx0lMP0KXkI=; b=blDArCtt32EXAh
	lRWn5c4Y7hy0pW9m88trxo4sTNdcKYF3HMgzxYUNIuZJzeMIygVEaQ/aILHPySMeR03C//NVagyiO
	TeCNsAQFEXGL7P3ALSVDvYVMBSbYf/2F+2WF7oio0AEZ+ek3x2e09vyQjXk/nYT4ylcLvVt3jppXu
	sVNsyyUIVbKYU4c8/ayjT5qIOo0kxchSEVmHHeZ6cTmkq1mrHr92AVlPZL29AigJDtUqp31ycZvzr
	Qkzh4yL5Is2MYTHD5tyWUiglHL7XrymNZsH6Gz+BlFmr0bWR1bEiLlsXGWi1XzaUvVzUxgyMVYX64
	TmEJ0m4tiloVtVlSkjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncTlu-00CaSG-BJ; Thu, 07 Apr 2022 15:10:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTjU-00CZFt-4l; Thu, 07 Apr 2022 15:07:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d15so5164018pll.10;
 Thu, 07 Apr 2022 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9wctp4cgAJ87lym2Zv0WCtTlOTlt46quZgOg+vNxZ18=;
 b=PBBIGryJF8tfWy0x1g6mwppJAs1AYIoQvNHFky8NFszEcHHl9itybinRftiUu2QU31
 CKVbJVlw3vLomDBKs0daHpk7W9gmqUSzUxl3mbHTaYo0c6ZL3Vs8F94AwSONpV+vT5ga
 GMZjPeJJmSAnYuMdLR2l0O5c7w97HNIqodjGH21kGTdt5rpWSClC3BZG3qkAuzIVFa2Z
 tHIgWVnsBSlo+FhV6SmzXm2HB6rrnr5Oro3x9oCNRMFLT/XyLleDN2rH4t4Oo2s2fvuH
 8iza5YpWlrFuKIPYDKHvcePmRzSG9FDywtxkXhiIhbliTPmtD9jFutzFGYPcbr4RG9dB
 wSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9wctp4cgAJ87lym2Zv0WCtTlOTlt46quZgOg+vNxZ18=;
 b=H2EAiX0QxXaZ7ohkuAr7ClvDvFaHjajo4gzWH1j/N4Uvwn2ka27lHw5cXO+vB+uDzU
 OAeCFsvRi8pIfSnbU5k3tRV4tC/zzOc9RT30G4bndahehOYscTKAnyKZJPOsLYOSdAg+
 IkTJLrMVyRrn5f3SgiQxWN60oafggNSKq9aeczLg1iG1fW4jdSoB9ljJ62Tdoq/VrEL0
 J/U020pkF7TaFjt+y3umw9bMcDgLq0F5EThefaYfaqohg2RtDK5CsPEXyI4xZdhWP6TI
 Up1TpUugZDSse15PY6YPWMXKKgddn90AUMVfNsb9HDFOJeRSdngXipSI90Kl5U/rFLAk
 QrFA==
X-Gm-Message-State: AOAM532Nt5rS5WC/7ScFpBMj6zEwYJlrDcqMg3Pwx5bIjvePI2zwPRlP
 yvAKcSZQArxrzAQioEReRaU=
X-Google-Smtp-Source: ABdhPJyF3QnXvJvnMFeToyMWG3RSHtDgbSTQx3khxh/9V9tdOdT/dnG35UUAYK0Q8sRtHT6q+lxVfw==
X-Received: by 2002:a17:902:c408:b0:156:96d1:1744 with SMTP id
 k8-20020a170902c40800b0015696d11744mr14482486plk.134.1649344052923; 
 Thu, 07 Apr 2022 08:07:32 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a63aa42000000b0038265eb2495sm19329908pgo.88.2022.04.07.08.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 08:07:32 -0700 (PDT)
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
Subject: [PATCH v4 3/5] mtd: nand: mtk-ecc: also parse nand-ecc-engine if
 available
Date: Thu,  7 Apr 2022 23:06:50 +0800
Message-Id: <20220407150652.21885-4-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407150652.21885-1-gch981213@gmail.com>
References: <20220407150652.21885-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_080736_261403_CCA2F5FA 
X-CRM114-Status: GOOD (  13.33  )
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
Change since v3: none
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
