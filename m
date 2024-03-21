Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14337C54E58
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GQ4GQbaFEGug9OoHMppgvrEAqNhl29/bl2T/jNBU9eA=; b=k9hFJHYmuQ/eVZ
	4qn4l8igpOKkLpLNZARWD1yMdLthsYsJDGiT7hMU4BuqG7YY558GOi+AyZz5Oll0dABZ038663naw
	qtM5lASUL06hy3hO5weRjla3kvgiXB83wula/udi5ap9ecNvaP8lU0dKz/5EK7oduTNp7/zXuRIYB
	R7BjE9sWDKncQrVD6Ta5HguVqbNWVHtx4TjZl+udNq1VLRc4Taa20PcQjRlv+CHKpwXZuGMOmNT/c
	oe9Mpg12nSNUKQCVjpNZ/9bnjYfaFl0uST3YevjkQokqcQ1LX70TagrhgFoLQLs6pWMdq4Up/tPUd
	cAgrY+xGqgy+gHyDKOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnF9C-00000002YYk-0iJa;
	Thu, 21 Mar 2024 09:55:42 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnF99-00000002YYC-1ghe
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 09:55:40 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d476d7972aso13834281fa.1
        for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2024 02:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711014936; x=1711619736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRdYtRQgQCnEH10wkUIxAuGuQILiDbkAHuoOc+MadDQ=;
        b=OPKTi8rgbKbSBcky5XX5yI44l1GuCyvRPJ2ij3UBp+u6u2YSR+u+PxvV6FVufEZfkp
         5Jcl5qBmwbtJpNXVaQ2Lb2tMqfOaEBESLLzCnhrHGEm61UtBTLgc+vUMc/1Rf9lGWmUb
         DY8S8wvFHpTmQ6WjN481uhksZxnrgJzEmGZj7N6rodlE0g4EPQ4s3WzIFaNCoamtpUh+
         w83yn30i7gNZdyPJ7M2tJkIdFBuJSvzKd8xwfx+4sWArXpwhjEOIf+nWyGNOjyi7vvsv
         K34ksTI3BOGYk44PQfuAvpCpcvOckmxy7/317DYvnUQyW5dJqgSykXwQ5+aPKDHm9zzb
         uRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711014936; x=1711619736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRdYtRQgQCnEH10wkUIxAuGuQILiDbkAHuoOc+MadDQ=;
        b=O+yYUo/heXpdj4hrhWQV5D9f4Pf9NSzJyLpE3K5fxhRf9EVQ8f+vnooHiculMqxpXn
         qMkDEq9D7NFGRR8SsVnVf5Yg43edoNnrnT1WjSS3f4k7j9KQlghrciPxnT05TYNo9iwg
         XbPOBTKM7EOefFXIL1r9aC/Ed22LEGg0Midd3hG5aLIYU58laq/Bh0uvImUvl7s7l4E2
         5xbfZUuorROD1L/tcEDVt+XG20H2DCHGPefobjQhzUCAZQZmOnyawW2UA2elDSb/CkwB
         LE4Wc0xUIdYqFQ4svf0DpSwQD3Vo6BFq2dzojRUAXj4bwJBFxOPtnrLF+0iE1sVG8df1
         pmQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2mJ4HFPViHx0eF6wSuJYhFfU8RvLx7uWnR+bVZeq0lqFINTcdO8H/OEc5odBg/+JAzNl1BvKi8Sfm4Ab/MQnhG3w4Va1oHjKhwHu1RQ==
X-Gm-Message-State: AOJu0Yy5R78wfNpK+nCxK70ZCSJVBpRNikcYlv51dkd/FtAbEn2Im6ZR
	gEkDHWy8Dq4mmiN9YOoE4Ri925+eSY3wr9afZHcTyyK/mGoVV3Je
X-Google-Smtp-Source: AGHT+IEweDT5R/pbQGL244a1a+Gfu1CUq42BQlOsQYAQ+MsCxskzyKPWWCdQMVQIczFksFberVTLgA==
X-Received: by 2002:a2e:944d:0:b0:2d5:122a:4b13 with SMTP id o13-20020a2e944d000000b002d5122a4b13mr5932802ljh.16.1711014935817;
        Thu, 21 Mar 2024 02:55:35 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p11-20020a05600c358b00b0041408af4b34sm4987103wmq.10.2024.03.21.02.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 02:55:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: limit OTP NVMEM Cell parse to non Nand devices
Date: Thu, 21 Mar 2024 10:55:13 +0100
Message-ID: <20240321095522.12755-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_025539_491614_EBD3031E 
X-CRM114-Status: GOOD (  14.99  )
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

MTD OTP logic is very fragile and can be problematic with some specific
kind of devices.

NVMEM across the years had various iteration on how Cells could be
declared in DT and MTD OTP probably was left behind and
add_legacy_fixed_of_cells was enabled without thinking of the consequences.

That option enables NVMEM to scan the provided of_node and treat each
child as a NVMEM Cell, this was to support legacy NVMEM implementation
and don't cause regression.

This is problematic if we have devices like Nand where the OTP is
triggered by setting a special mode in the flash. In this context real
partitions declared in the Nand node are registered as OTP Cells and
this cause probe fail with -EINVAL error.

This was never notice due to the fact that till now, no Nand supported
the OTP feature. With commit e87161321a40 ("mtd: rawnand: macronix: OTP
access for MX30LFxG18AC") this changed and coincidentally this Nand is
used on an FritzBox 7530 supported on OpenWrt.

Alternative and more robust way to declare OTP Cells are already
prossible by using the fixed-layout node or by declaring a child node
with the compatible set to "otp-user" or "otp-factory".

To fix this and limit any regression with other MTD that makes use of
declaring OTP as direct child of the dev node, disable
add_legacy_fixed_of_cells if we have a node called nand since it's the
standard property name to identify Nand devices attached to a Nand
Controller.

With the following logic, the OTP NVMEM entry is correctly created with
no Cells and the MTD Nand is correctly probed and partitions are
correctly exposed.

Fixes: 2cc3b37f5b6d ("nvmem: add explicit config option to read old syntax fixed OF cells")
Cc: <stable@vger.kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Use mtd_type_is_nand instead of node name check

 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5887feb347a4..0de87bc63840 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -900,7 +900,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	config.name = compatible;
 	config.id = NVMEM_DEVID_AUTO;
 	config.owner = THIS_MODULE;
-	config.add_legacy_fixed_of_cells = true;
+	config.add_legacy_fixed_of_cells = !mtd_type_is_nand(mtd);
 	config.type = NVMEM_TYPE_OTP;
 	config.root_only = true;
 	config.ignore_wp = true;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
