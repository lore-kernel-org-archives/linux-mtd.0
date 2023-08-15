Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE70C001B0
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 15:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abEjp4pHkrDwlEVm60N0eBivvnsKpCpw32d4vqlcR08=; b=L3HVI3TWMk9ybb
	Zq5aVfSFadTi7ehdqM4+cWTHfi8QiR37GjAtl0XtO9X7hwwlVyctHnbdtcKKfwqkoG5W/XLWILEjd
	uYAaOSoZdF1KU7z/E9miiSjq1HNVfS3y86G+NZynrldm2eo36Xb09evfVlZPXu0vLNRMAJd76WFd4
	G3/4ZUspKBXXcYpOMZFhIHRuP+AJwk9bsmS6cz6ku1l4rGRFsT5S800A+bAtJwoPMtC8Nv0puYDdy
	/xUj/K1SUJN3G2E3olTxtm87nBxG8KzzNMywnfbDUCFAoXUaWYVRY/vTk8PAF3lUMZTw9D0IpgJjY
	XjFyTYcBzTm3TeCGivVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwEH-001tJw-0j;
	Tue, 15 Aug 2023 15:45:09 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwE7-001tD3-3D
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 15:45:01 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68859ba3a93so378275b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692114298; x=1692719098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tA3QjSCigQ8q8wip9gFTKQkaEIdBJK1A3l6+t1K7Bv0=;
        b=ejBR2jtUerzx5wnrj86G8N+bYfois34YCppqR75oLTPLq7/QzDutph+WKgbHb9TqkQ
         BRwskwQ64WTnA2SvrsJQrwU2R/Yf0P8FKH2BrA2mU1DIq1lqfoHLYujw3hlFqPKexAE0
         PjCMKLHX9eH8M7wWAqubZGqfJFjytNf2qHyGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692114298; x=1692719098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tA3QjSCigQ8q8wip9gFTKQkaEIdBJK1A3l6+t1K7Bv0=;
        b=Xzd+WOYmSk3pdlQ00HRVi430INPD5xjYv/gJSUyUnfk9wMl7A69i6WyPMgfVxc8gDg
         8NN0f9HPUN0iT825F3inW6BAb/fyWFB5FtyIU1tbE/dNDZHqU90F+w+jl4aCa8M70UzQ
         1+Ry098lBU5nBztoXvwErZhlBLkMGmpY/r9zjIwEc1KHsTsvzwFgPU/jLgzkxhWA7l/O
         aHHmtfV+U0T0IRJlziJCqDq097g/BGH/sxLE3+/4bMjvD3GIfBoLmE6iBtR5Zv6c0idF
         cBBzv5GKKzlmUUG9eF3yvskdD7XWin+YpqhmwIAPdeNSGFjn3zGhEnxXGv5YTL+ER0Yp
         X/HA==
X-Gm-Message-State: AOJu0Yzx5fv0R2ppycPgC7S6zsb8VRE/uSZ6RNGfwRLJQoShWvfeOKMf
	U55zVYsPC7n1YYbanhe2fAWV4Q==
X-Google-Smtp-Source: AGHT+IG+MhhXs3J/eE7KIJtSsSOonQIqrRHLUlpGdM77zZQi1lncYBUpQPdXQrlw7WkocLYr2AbghA==
X-Received: by 2002:a05:6a00:2305:b0:687:2fa9:532d with SMTP id h5-20020a056a00230500b006872fa9532dmr11655270pfh.17.1692114298463;
        Tue, 15 Aug 2023 08:44:58 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40cf:3807:f8c8:2d76])
        by smtp.gmail.com with ESMTPSA id n13-20020aa78a4d000000b0065e154bac6dsm9431247pfa.133.2023.08.15.08.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:44:58 -0700 (PDT)
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
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8183: disable quad mode for spi nor
Date: Tue, 15 Aug 2023 23:31:54 +0800
Message-ID: <20230815154412.713846-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
In-Reply-To: <20230815154412.713846-1-hsinyi@chromium.org>
References: <20230815154412.713846-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_084500_033331_6118EC54 
X-CRM114-Status: GOOD (  10.79  )
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
index 6ce16a265e053..8e4761e2b8ff4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -877,6 +877,7 @@ w25q64dw: flash@0 {
 		compatible = "winbond,w25q64dw", "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <25000000>;
+		disable-quad-mode;
 	};
 };
 
-- 
2.41.0.694.ge786442a9b-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
