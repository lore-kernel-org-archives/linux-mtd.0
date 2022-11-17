Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F79C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 13:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6+Q5NRqfb57Prp8pWf2Puq2QP1Ei/TsgZFYilOfUJU=; b=OG1yqt+PYqmMt1
	IZx2dS+0D9JPD5TrSErQschUhDI+1zC6OoYfSWFxM8R+s+qdVrv9AmjTl1r6Fjnv2y7/MMvHhZ7od
	icv+yJT+pxVTZFDE17KfTT16Z+QDSFIML5CIiFGuVk+rnaldgNucAtS5iZhlhEPXtAbK4WeQwoc2J
	3O4fR/HlhHBNXhQ1w/EKVbNq0YTTxi3a3hZ4aeWcCSFdsqg67W6+bWBUt6/x1xbliViceF2n63/jN
	v5YJ7N+URIs/GMKzlYrAUhoKt8uZWCsWkCYe1/+O68Bp5E2MPqVx0DIr7ZwgYJtVXex8KCQ1R2UTO
	EZkPWQfCJolJkO9zDCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovfFW-00EZt6-Kw; Thu, 17 Nov 2022 13:48:14 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oveAh-00DpD9-83
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 12:39:22 +0000
Received: by mail-lf1-x131.google.com with SMTP id g7so2583197lfv.5
        for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2022 04:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHKEAmsNgrv5kSrbKaB4tLuFW91sEV9E738nyh8xMYc=;
        b=nGQ/qhtua+7pLZ4YSQyBIVtNYJgSwlmE5TpLx1oateA+BN4Fkgc57IFGtVkEd3XOUY
         OUU8btqbDJ87U0Vfh9BOtEQ2QX0NRwxWic0CiPkHzjuXerJtF9mMEkr2ctaBjbhrsI9l
         xzGUr6iwCmwuZJQDlBRY2v/DLhzCQr7D56BI7V0HJS8FlOgLbPwUK7GCnhOiKnqE3nN1
         mYXEYUE33TxRnczOoemTDlOmAGh89yBAu2koQyBjxYbKJIE2WkCdMeNzg9Krk9/Emy+R
         nUorOO10hpgyDies6XynMDR4bAeszb76YUfWXo7dU95L68xj0jSU7qa5bYpT4o4P506L
         LQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHKEAmsNgrv5kSrbKaB4tLuFW91sEV9E738nyh8xMYc=;
        b=G2uPiMlmqeWjdKIpxWOOV+WVI9LVUV3IfQTq5YICrw/+RwZ1MZjsGv281abgaMoYPZ
         eLF8N+tQkT4o8gcHSXzS+S/+OV1Wc8fknEF3ggKRLA9mDhGN2ZDzAEFVmcl25Ni9p5/d
         SOHltlHx2mXaifyY++y5X31SkguMmOyltywFcR2TAoBwIgmSkokBUNodOI1KZVKEBVm8
         hVfAkcDXsIFd+W4Ox6XrblZGn3LRkSeguzkRY9lMlR1WUVJVAszE49w5oSrj4gCZUj+L
         9bMC1Yv3ewzH9omXGSlCzIco0yXvewowEvioMwQZIb0h1TYhMPbTuiWWRDef74ZsT3eu
         IgbA==
X-Gm-Message-State: ANoB5pmwXOnG6hTOrj44Ho7SfKLT2+es9PC2nOjNA+c1t9TNtJUjhogu
	4/TTfOGUe7E0AzU8pdF5Jvp4pQ==
X-Google-Smtp-Source: AA0mqf7bJF5hus73SI6iLS9vfYrboHghUm1Qt5VwLMlR9isaWE2bW+dP7MA4lSYoYUkY+ERTSndLsg==
X-Received: by 2002:ac2:4c46:0:b0:4a2:4f6d:78d6 with SMTP id o6-20020ac24c46000000b004a24f6d78d6mr819625lfk.679.1668688749810;
        Thu, 17 Nov 2022 04:39:09 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u28-20020ac24c3c000000b004972b0bb426sm127855lfq.257.2022.11.17.04.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 04:39:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 3/9] dt-bindings: clock: st,stm32mp1-rcc: add proper title
Date: Thu, 17 Nov 2022 13:38:44 +0100
Message-Id: <20221117123850.368213-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_043911_317043_9794A3F9 
X-CRM114-Status: GOOD (  10.70  )
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

Add device name in the title, because "Reset Clock Controller" sounds
too generic.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index 242fe922b035..5194be0b410e 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/st,stm32mp1-rcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Reset Clock Controller Binding
+title: STMicroelectronics STM32MP1 Reset Clock Controller
 
 maintainers:
   - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
