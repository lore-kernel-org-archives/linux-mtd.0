Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8194C04A6A
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 15:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6O+MGq3zMV+csB27jq/5TDQwNg9HM10EnKWnGEcfoQ=; b=1BLHV424EGhpz9
	GMG2CRvUlGos4jGVbnFXWLHfSNKyhzTFl4TY+2R+Unu47uU/U6e2VrD7SQXKn2xBRg4dMddD82WfZ
	/Fk89SvqUrmBvfMPEE0i/KxTT20irds+F08SiKXoslClLBgvU+mWU8ZnO9UWePcufC3unGJGCWC6r
	bhDyj3YD9s27aRpFBihWUPBEga1RPjBXvNKTuEqoil62g7Is9XuNMhW1Tj1czPl7DqGC/ciU/oJ6V
	ylpgAi2jOtnWy+cs7eKpd+we8dCkL/njQE5mbEnNPThWFV/ZlT6hSkOGkcohU/J9mm+NVJ9LyViqG
	srpwZYFDH6mqnqE0R95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwEN-001tNu-1i;
	Tue, 15 Aug 2023 15:45:15 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwED-001tFa-1y
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 15:45:07 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-688769faa09so245517b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 08:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692114302; x=1692719102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJmTT5Birsmw3IffSKTzNizstUWs73hZ2XtnCyouma4=;
        b=EmtRFWNxOZBhCSvbwn/tqeAcE99fLpxaVbN7woJu/mWoDOtjxym1jTZkxHhu07Rkyt
         aRrgPSp/P/3sucNU9SeuOykjKSQh3VlqmEj8eU7wU4xRqA6huNIOrfmc4oNT57mf+z5F
         6gU0Vk6XMHXfclV87Ur5S7pFb+TluJkDGSF1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692114302; x=1692719102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJmTT5Birsmw3IffSKTzNizstUWs73hZ2XtnCyouma4=;
        b=TQHIHtYW1Qn15yeLPG3JAsnVWhpzvHujiBAuDvw5eqFvafi7Myh2bnRjmYM63VSpmP
         CxdQQE20VvGzBAYVwFICKKeY/rZoyivJa1jdYE/WwzfId7uncgEzeQiCAgKiqV0LlJe3
         QFuk5YEzgklR1GoPylCVtVjd8CEti+CEF0eFq2a2Ksjw4aLclF+FnYBHHfifdT1ihpEn
         KctZgareOzPtIX4CPyTm15F6dvveuHii1+8aDaNrt1nPjCv3IIjnwO6ZVmfGkI06SgYL
         Z0o2lpv+HMnKUliWiXRdwpu723gahquUgwG5JQFHue06vcm0cueGNV4it6jwsZReDoED
         iEyw==
X-Gm-Message-State: AOJu0YwCYbATW1r1KPdi176jOePLl1J1K3goqwYew96HkGezbr4Wpsbk
	DGG5dCWgTz95N6CmiTK5n6uvOw==
X-Google-Smtp-Source: AGHT+IF1i0bsPTgkJk9HYJHsQ+5ia/nkZZCBU7zl2is+oYE8IhKDNs3GjUWaIoKqVbHs5puDt5BuXg==
X-Received: by 2002:a05:6a00:10cb:b0:688:48be:50b4 with SMTP id d11-20020a056a0010cb00b0068848be50b4mr1899247pfu.16.1692114301925;
        Tue, 15 Aug 2023 08:45:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40cf:3807:f8c8:2d76])
        by smtp.gmail.com with ESMTPSA id n13-20020aa78a4d000000b0065e154bac6dsm9431247pfa.133.2023.08.15.08.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:45:01 -0700 (PDT)
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
Subject: [PATCH 4/4] arm64: dts: qcom: sc7180: disable quad mode for spi nor
Date: Tue, 15 Aug 2023 23:31:55 +0800
Message-ID: <20230815154412.713846-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
In-Reply-To: <20230815154412.713846-1-hsinyi@chromium.org>
References: <20230815154412.713846-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_084505_648985_0F811FD4 
X-CRM114-Status: GOOD (  10.55  )
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
IO pin. In trogdor platforms, we won't use quad enable for all SKUs, so
apply the property to disable spi nor's quad mode.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 5a33e16a8b677..0806ce8e86bea 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -436,6 +436,7 @@ flash@0 {
 		spi-max-frequency = <37500000>;
 		spi-tx-bus-width = <2>;
 		spi-rx-bus-width = <2>;
+		disable-quad-mode;
 	};
 };
 
-- 
2.41.0.694.ge786442a9b-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
