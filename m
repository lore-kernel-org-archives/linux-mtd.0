Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14F4C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Oct 2022 21:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9NMl2ZEU+0NtUBGqMw4YTgeKROXyPrfACCRotJSUH/I=; b=wyr99U1dcEzUoz
	lTeKa35JLpAyXoVt9MWZFhHzs2EHc6rsXeLxoA9McIJMGL4AZZRUrRhWx4WUgSPGyB0i3Kmuzq4TP
	k9PkVRWiMR0D42lxOOAtWvNGuiLLQiu4uKprYRSjyGOTCB6rfQL4KgdBVn+f+VFhOWo9o66EL+lM3
	EDsKl46QTLpRjMNUW+e9zs1HQqh4SxhS25rFiccbMJr381qlSPI0k1Jtm+QEWpCSN3TiheqSMR6/h
	SJxGi7ymtohcbcSEW6nHd0lxFJWvAcTwsGvC9w4yzZpHj5ViO+wFNnXAJUtpxwyYeectFc9KtZ1FR
	ZQgYwgY6xFjPGVrYpq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofpF9-00BEhh-Vr; Tue, 04 Oct 2022 21:14:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofpF7-00BEgs-7A
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2022 21:14:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 130-20020a1c0288000000b003b494ffc00bso41465wmc.0
        for <linux-mtd@lists.infradead.org>; Tue, 04 Oct 2022 14:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=XkXIwov4m/9qgzTg66a2/P6fWI2LfTY8JgQsDcsVYWE=;
        b=ZrP1PLy53pP/rc8G4TvGBmXpTqmFZ/SY6Htzo8NibSOmVtY5adRrD3vJwME8Sp7BnS
         F4Z5apezARFi0/vJJ5HHOJte9xist+cmEFPDr142wi9FepLdkpOAhkfEfM5p7q1rIL9d
         YUvhs6I7tQ6tVqy9xKEv/QjdLMn/ipVXXfAdhGfa//n0Lgd46YRpu3fouTmDDIIvE20e
         amWGkIgnZIF28BO7z7AzI+AdVxiql25wkoxJytUn1+x4tVX5EkVWZuqUj1lDxkwRIjlB
         ow/Q82t9+K55SO0V1yeidCMeaIT832YiHAH6jnULNSGlFhDBmDfM+7NLxROOKXaBt0aD
         j2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=XkXIwov4m/9qgzTg66a2/P6fWI2LfTY8JgQsDcsVYWE=;
        b=1HSVlIssCRnnpJN0B1k0DTKG67je6/j+zqd150u/FA4EqDa92C0nqpiuTKsG4zPg1U
         7JAE5EcGwHomWRQzmGUAbuFv9ixT/JdpjErnBbwxNrjplp1Zt2ZjjisCJI7iRZEU4IR/
         jVBMG1erSUMdF3IvdKwSRVwCwV2quO0Tm6f/vrZUZoetD6uwovlYzw+6ewecWax3MJ8n
         ZxBFjEIKobyNhEoPBh0hLYdNM2gj9n7yiwHF7C2OQ551iWuQIaTeS8jjaR2i+j7Marsy
         Zr0Fl5JktPCd+XIBpDoUs6pd3g1aiuzUWQpE7YAvHPhbvn/E/AfQCBXZQWCeismT6nSl
         j4Rg==
X-Gm-Message-State: ACrzQf3VsMwm0bBET3W1UU8vrmb3WGL1ITlWy1SU4RTJsLE7ZCI+cF9O
	9RIrCu8fV1QPH7YPuGa6sNM=
X-Google-Smtp-Source: AMsMyM59l9ZC8Yl3Ao249Cc2WZqR71AVFD0jEz1pnEuVgMeRYp98p2nDFBIkgSgSwOvRdu9IOf0ppA==
X-Received: by 2002:a05:600c:6003:b0:3b5:aef:d8d7 with SMTP id az3-20020a05600c600300b003b50aefd8d7mr1141722wmb.50.1664918053464;
        Tue, 04 Oct 2022 14:14:13 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id j2-20020adfd202000000b002285f73f11dsm16887940wrh.81.2022.10.04.14.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 14:14:13 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	u.kleine-koenig@pengutronix.de,
	Mark Brown <broonie@kernel.org>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: dataflash: Remove duplicated id table
Date: Tue,  4 Oct 2022 22:14:12 +0100
Message-Id: <20221004211412.182940-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_141421_277175_F69BD967 
X-CRM114-Status: GOOD (  13.31  )
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

A previous change added a new id table but failed to remove
the original assignment to .id_table. Remove the original
to clean up a clang scan build warning:

warning: initializer overrides prior initialization of this
subobject [-Winitializer-overrides]

Fixes: ac4f83482afb ("mtd: dataflash: Add SPI ID table")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/devices/mtd_dataflash.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 25bad4318305..c6d25331e00c 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -939,7 +939,6 @@ static struct spi_driver dataflash_driver = {
 		.name		= "mtd_dataflash",
 		.of_match_table = of_match_ptr(dataflash_dt_ids),
 	},
-	.id_table = dataflash_dev_ids,
 
 	.probe		= dataflash_probe,
 	.remove		= dataflash_remove,
-- 
2.37.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
