Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F04C35242
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:45:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4158D20848
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ug3WKYd2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djVfoEvV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4158D20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXIxN8tsjECNcTT09pEk2ZsrbBcGEXSSwHCcHZ5w3ZQ=; b=ug3WKYd2ou3zwH
	8495K3Ln8RLMWicgPgB4vqfKTE6s0c0xRk4D67jVyA01ASyTdDyV+GIlhsDpw9z1SzPqxKrpA9JV9
	AaPmloSf3Sb0f2SBqhUV5KDFROtqOufa/D6vkxKQyOJ9okRguEWTbMZucyWYlc0PEON8mltAcch4+
	ewZ656JRubUIfFUeBJthMbS7NQs59DA24lNW4qq3WGw+fVjOxIc2lwOYr52EKvLBlnR9UXFirdmHV
	iKNJXGLBy3YriIfFReDCmXPJYlOjMo0PkEEsMkdTyxl1Gd61R6WclUybvy9sEBQeu4xFVKls0dqKt
	hzPDKvcB3GcMmaey6Qng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1g90-0003vJ-Ut; Wed, 12 Feb 2020 00:44:46 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1g4m-0008Ht-KO; Wed, 12 Feb 2020 00:40:26 +0000
Received: by mail-lj1-x244.google.com with SMTP id e18so234236ljn.12;
 Tue, 11 Feb 2020 16:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=caDIr3rP6oosu1+kaTV/U9Y5uOqTsEJ+evHiz9URQq4=;
 b=djVfoEvVfIrazuwClaIyoiPfUM8to2+bMx3D9Wv4DKZg4M3KNwM5B7lVFVi/ThZjuN
 D/IOBS50MpHYmJZjx/r7OSCQXr+nqh5t1B3y37b8YsbDSSJF8A9rDU5d/WrrgLcwJwdt
 rWCZkN2cP8KFl+zCY9Dv7sPv+L0id5nyDY/85pQKC4wwZZ/5gFWBmHZQAFEhFYmu8wpi
 Jtl+3z6aCj5u9e5sAJuAonl4JDHDlgevY7zh6mi0cu884C5Y7c7Ru1Aj8ctqPWwUdtHe
 ikstkQoiBMtzpL2T9jIZM75yaRcjhW5PnoJSYbEsJ8sdxcCk1jCCfszElMW+knCwvaWn
 wB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=caDIr3rP6oosu1+kaTV/U9Y5uOqTsEJ+evHiz9URQq4=;
 b=kEEjZuXXNPkjtqthITMUzkIUjAfgQK/ahWNQjnsNVdcoCHyT0aU1cqsPIbEFy4WmT8
 8ilYV3m8rvI3aNvAK3QMDEP5/Nvbyp/WuKvb5QUMU/r6BS1kFzrj2Luvha0PaVmB+WTQ
 i1sv02A2n592bIpfMrsZrdxbG7BdYsRsx5DoNXar/efGsXFxFQoLDRQ+yx+Fp2VZ2xfp
 GNLJXvsQf+aov8s2Dy0bCJVJi7beBHfi6I/8oJMNzE60oQo02Dvi+DcXnYmU+dUkQ7I1
 4RKKQY14ew9VPw5B7Zakhm8iNg/0FaT1yFo6FOAqqNJT+Xd4k1jCgVQmnz3zu6RqqgtX
 y8AA==
X-Gm-Message-State: APjAAAWJ7MU3S5zWWzy66CGDnJAe9bZeaTi2mG5B/vcPLuWVnHMKCT97
 VUqba0lDfF2iVwvShN8L05I=
X-Google-Smtp-Source: APXvYqy6JFvRC9NklpSqlYRY6lVX8UkHC9NOlwj40Nhm8KFKwboQJSVotTIA/W7iSbWh/4xCAN+43g==
X-Received: by 2002:a2e:9596:: with SMTP id w22mr5753039ljh.21.1581468022989; 
 Tue, 11 Feb 2020 16:40:22 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl
 (109241122244.gdansk.vectranet.pl. [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 16:40:22 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH 08/14] mtd: rawnand: ams-delta: Make read pulses optional
Date: Wed, 12 Feb 2020 01:39:23 +0100
Message-Id: <20200212003929.6682-9-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_164024_729534_C756790E 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Allow platforms to omit NRE pin from device configuration by requesting
that pin as optional.  In that case, also don't apply read pulse width
from chip SDR timings.  There should be no need for further code
adjustments as gpiolib can handle NULL GPIO descriptor pointers.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 11689218d23a..c481d73e3dcb 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -202,8 +202,10 @@ static int ams_delta_setup_data_interface(struct nand_chip *this, int csline,
 	if (csline == NAND_DATA_IFACE_CHECK_ONLY)
 		return 0;
 
-	priv->tRP = DIV_ROUND_UP(sdr->tRP_min, 1000);
-	dev_dbg(dev, "using %u ns read pulse width\n", priv->tRP);
+	if (priv->gpiod_nre) {
+		priv->tRP = DIV_ROUND_UP(sdr->tRP_min, 1000);
+		dev_dbg(dev, "using %u ns read pulse width\n", priv->tRP);
+	}
 
 	priv->tWP = DIV_ROUND_UP(sdr->tWP_min, 1000);
 	dev_dbg(dev, "using %u ns write pulse width\n", priv->tWP);
@@ -276,7 +278,8 @@ static int ams_delta_init(struct platform_device *pdev)
 		return err;
 	}
 
-	priv->gpiod_nre = devm_gpiod_get(&pdev->dev, "nre", GPIOD_OUT_LOW);
+	priv->gpiod_nre = devm_gpiod_get_optional(&pdev->dev, "nre",
+						  GPIOD_OUT_LOW);
 	if (IS_ERR(priv->gpiod_nre)) {
 		err = PTR_ERR(priv->gpiod_nre);
 		dev_err(&pdev->dev, "NRE GPIO request failed (%d)\n", err);
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
