Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8728C001DB
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiENrGJfU8ihUX0+V7UayXPp+A200MRBbE92NFj4mW4=; b=rCuhMcmeKjvynF
	DCn4f9wuUmGQdBmsjtgMWcVvasx8s1fCt5MuNLKiF0H9U3+S5b+uxxSvGRdpcht/QjCLsCwIYaxl9
	PoBdOCaJAd46YvxtTJBA5PEa/ajzjCNuJKSqGOcNyLYwAt9CGN9vOGZM9jPbUS1aDKG4yJcGbdfOX
	3PzbdzZRaqMg8duGY/ZZDwT6Hw7n9WP8v0GEnt8mADaFbus0D8CyEp4QFllt7TWtzTkU97/e36YJU
	PZdujgh4BElXqlQSpnByfycAjUhntrjYPyk95F0tXKb7njKJRK6vzFiHu1pegoNYJ4OtYaUSMsYAO
	EpXfdVNoIBR1EhJkikrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwEB-001tGc-1W;
	Tue, 15 Aug 2023 15:45:03 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwE4-001tBe-2t
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 15:44:58 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68706b39c4cso3929183b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 08:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692114295; x=1692719095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmLPugTGz1sgSy2J/v99Dk0J3o8zfc9d+fDcwlxsiEo=;
        b=hPdGnKSUgljhFqFsgGLQzZfUk5Zd5v3vXX+lFx5n/q9s02AfGmaHSqc010GOa/OM3f
         aNaofPdOvBFPFjUmGdt3gDNvOc1wV1TJoZpvyVHeBIsK21QCzXmvuoygHnn6HnbssZcB
         EsnO0+NmyNRllTqEzVtLDpy5CY61OZisnow1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692114295; x=1692719095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmLPugTGz1sgSy2J/v99Dk0J3o8zfc9d+fDcwlxsiEo=;
        b=FPG5z8q2LY283J/rYiziLYNbXbF/KxiZDxJAeg8q70ziJE4lL5+ntQ7d0hexNW+/aN
         2UmsXwalQLjLpycZidZ3xvySIRnZZPyE8+2CJ8yF5Ym9r+E4G2iuHFtv4mSJ/LZ3i5oZ
         WbTHRMzZDCutQve8XXCYKidZ2Br4uttph90zRV95IWCFwZlaF9pD69aMCY1GOYuPZtG8
         odTPnP+D0TexvZvlRwrLzdjbUd01RRtvrtq20BsK2pQhTWSqq7v0xULX5v3mD0HOd28q
         j8zvX43Ku2XBVAchWcgitVQL+S0y1tRvWAU7Cdviyy0Emzuaz7gBI4I1xlrBDUCQnugI
         GT5Q==
X-Gm-Message-State: AOJu0YziWA+QqjyJutX6CJE9lt1qU4JES/GlnLwRAf/hogrTpL56IcRc
	2W4oSJ3tmK5252ZpacoQUOEeYA==
X-Google-Smtp-Source: AGHT+IFGfwXqvhlQgK3dZJYanVm1WhEoRWmNzCEnvvClZuT/nup6kWHRH9gSZE0NGJjts8ZfBG+bbA==
X-Received: by 2002:a05:6a00:1a50:b0:668:73f5:dce0 with SMTP id h16-20020a056a001a5000b0066873f5dce0mr12705130pfv.29.1692114295080;
        Tue, 15 Aug 2023 08:44:55 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40cf:3807:f8c8:2d76])
        by smtp.gmail.com with ESMTPSA id n13-20020aa78a4d000000b0065e154bac6dsm9431247pfa.133.2023.08.15.08.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:44:54 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	"Miquel Raynal )" <miquel.raynal@bootlin.com>,
	"Richard Weinberger )" <richard@nod.at>,
	"Vignesh Raghavendra )" <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	cros-qcom-dts-watchers@chromium.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 2/4] mtd: spi-nor: sfdp: read disable-quad-mode property
Date: Tue, 15 Aug 2023 23:31:53 +0800
Message-ID: <20230815154412.713846-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
In-Reply-To: <20230815154412.713846-1-hsinyi@chromium.org>
References: <20230815154412.713846-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_084456_935823_5DDA9C82 
X-CRM114-Status: GOOD (  14.05  )
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

Some flash devices, eg. gd25lq64c, enable quad mode by default after
spi_nor_parse_bfpt(). However, the systems using these flash devices may
required the quad mode to be turned off to use write protection or to
avoid a potential short issue[1].

Add a disable-quad-mode property in devicetree that system can use it to
override the quad mode status parsed from BFPT.

[1]https://www.elm-tech.com/ja/products/spi-flash-memory/gd25lq64/gd25lq64.pdf
page 13

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/mtd/spi-nor/core.c    | 5 +++++
 drivers/mtd/spi-nor/core.h    | 1 +
 drivers/mtd/spi-nor/debugfs.c | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 614960c7d22cc..dcf4ff46c37ae 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2847,6 +2847,11 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 	if (of_property_read_bool(np, "no-wp"))
 		nor->flags |= SNOR_F_NO_WP;
 
+	if (of_property_read_bool(np, "disable-quad-mode")) {
+		nor->flags |= SNOR_F_DISABLE_QUAD;
+		nor->params->quad_enable = NULL;
+	}
+
 	if (flags & SPI_NOR_SWP_IS_VOLATILE)
 		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 9217379b9cfef..b06bd97668f3a 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -133,6 +133,7 @@ enum spi_nor_option_flags {
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
 	SNOR_F_NO_WP		= BIT(16),
+	SNOR_F_DISABLE_QUAD	= BIT(17),
 };
 
 struct spi_nor_read_command {
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 6e163cb5b478c..c17451ae0931a 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -28,6 +28,7 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(RWW),
 	SNOR_F_NAME(ECC),
 	SNOR_F_NAME(NO_WP),
+	SNOR_F_NAME(DISABLE_QUAD),
 };
 #undef SNOR_F_NAME
 
-- 
2.41.0.694.ge786442a9b-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
