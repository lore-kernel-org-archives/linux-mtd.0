Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E21FC001DF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADVmOb7+0jCxYGvQ+MX6p8Jh5DBqGriWG/+BzcGPU0M=; b=fNuprrJFEmreL9
	XK6nH/jf2ZVnhU/4V24sXVIIIyepr+52YA7MhouTgdG3R7AonKmpBDMHnQ3iywZ+55aVJtUOSyBqo
	Ihon6fIHw5dbjoXKnOz/Dd/ufgn3oolH52jhGbJF23/4hu6o2hORG+dcRDFI25bJsfZfcM2LDhKBe
	5OBWIgwDJDwzH8Bel8wfXcudY3NNy4Q26iQTbcwbiaDSURoGRFag65y0wC9TTqdSkZz0FUW1d4fM8
	0RpcbgeyzmPwXCBHxnWKiSs9p+65QLnJ1/VvF75hMGKYyaOkQk6bsGdzABG/1M1nfgXBVCBOwNU5r
	UfvgJV/q04xvEXBwjLDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDzS-003s5E-0C;
	Wed, 16 Aug 2023 10:43:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDzP-003s3M-1X
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 10:43:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bb84194bf3so39521685ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692182578; x=1692787378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cub/3WoMWvIiQsdbQrE3OYpvx3EStTjQpVkye0ZIEPY=;
        b=X+2roLU96FnUjC4UMH/RZzcPdjIQC7q3PfaiuYrl23IUrM5F/OtlaFd+SbRcoumS24
         /JbhmuX8yLikjrYNkG+eOKcWRFlLL0NWoRcZQ1vgSTHQ+TVZXOw9RM+Vt33UA9Krn5H3
         PF2LeNNjRnjzk+Kfl3Fg4yxytfvGrl/qQP1KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182578; x=1692787378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cub/3WoMWvIiQsdbQrE3OYpvx3EStTjQpVkye0ZIEPY=;
        b=NuvXbz5jY9WQnih0IUo376J3hgjsjMJn5/kCh54p4RZZXvUIhvRgpA72OmSgwcaYdB
         S+f1zzvTiFYfF6iVKTZY4EOMwhKt3RAUTGbMqOGJld61SdsReIv5I5P3/Jyzhe2XqmZh
         QdVcHGCLeCR7EiVPRwy6GhBhSYtmkRpr4K8Upmx4SxNxVBI22GY0w6acwvUewJLgG+l+
         YGEWERJ1eFa1u3Jge0YnE5LfN65AN190AYD0l3GMJHcxbxNW+WItU3y7fKw09IOvazpL
         AypG8eFkc/LjC3A0fgdZCaw1i8Y2yt3yaTr4XAHyKNLJ/RuIfwcorWn6+Wdmw9Xr0O2l
         hBQg==
X-Gm-Message-State: AOJu0YzxdxCUer0DezXxmthhO7eOBX3PSo596O6gYnQNrOQ648C+npc4
	I+4maZzSaRPwGQr9SE28/cbVQQ==
X-Google-Smtp-Source: AGHT+IHvVQX8EoXpLKpCr/t52+6jeFgafZ76HEeFbRCi5SpSu2BnPfp6dIpbpqFaTJpaDOuKBalzOA==
X-Received: by 2002:a17:902:6b86:b0:1bc:56c3:ebb7 with SMTP id p6-20020a1709026b8600b001bc56c3ebb7mr1052794plk.20.1692182578396;
        Wed, 16 Aug 2023 03:42:58 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40cf:3807:f8c8:2d76])
        by smtp.gmail.com with ESMTPSA id kx14-20020a170902f94e00b001b8a3dd5a4asm2899270plb.283.2023.08.16.03.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 03:42:58 -0700 (PDT)
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
Subject: [PATCH v2,2/2] arm64: dts: mediatek: mt8183: set bus rx width to disable quad mode
Date: Wed, 16 Aug 2023 18:38:33 +0800
Message-ID: <20230816104245.2676965-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
In-Reply-To: <20230816104245.2676965-1-hsinyi@chromium.org>
References: <20230816104245.2676965-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_034259_532565_12DD0959 
X-CRM114-Status: GOOD (  10.08  )
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

Some of the SKUs are using gigadevice gd25lq64c flash chip. The chip
default enables quad mode, which results in the write protect pin set to
IO pin. In mt8183 kukui, we won't use quad enable for all SKUs, so apply
the property to disable spi nor's quad mode.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 6ce16a265e053..ef472b522f2e7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -877,6 +877,7 @@ w25q64dw: flash@0 {
 		compatible = "winbond,w25q64dw", "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <25000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
-- 
2.41.0.694.ge786442a9b-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
