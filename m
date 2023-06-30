Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EB3EB64DA
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xp03waZLVdc+mGAP4lVUwLMTyb2ajubbX57HkHFsboM=; b=omtMhFNUQ9E3dW
	HUZwyqLQEE33o9eUsWoXaeTO0d8KtgiCwwIkM8qZFeern6e4gwNplntcjr0VLxBY8e1nPELjg+v+N
	INRfwyR4ZRXHQt39UnpACNXJqS3fVu74l1ziMogJMI1GoJ/NhGejYRIXfbEOiJ3J+8wHMCFR9yuFt
	KZjT3SUhlHehaGZvqQmBuQpaQ5gn0sHG3G+3EUF4Qa+r+0HyPQXbjLFHTNCFBiB8C4Z/M4yA67IBP
	XaK6zkqzhWgLkZ/dsF9y/Ua1gKSo+LV9wyzqzW4Q3lzrlCZpu7hYw5sbOi3dDvEdWweXt5/voLZt9
	EGB1Ezgb2Cp/o4s4jJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHUC-0047yE-0J;
	Fri, 30 Jun 2023 17:00:44 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHSb-0046q9-2P
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jun 2023 16:59:09 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-313e12db357so2526302f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2023 09:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688144341; x=1690736341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Eyaf/JArFBnOJmUxcF7DoGLYY7fHW+Lur/i45+1eYA=;
        b=cRsI+Jc0zlEoiUnzMwgGVMTkMYll1xolMO9sNUYMp0FooJsUY4ea3qKTvrBPV3W1xS
         PdZIteGitEx9EYSLfRJOYktkFaGNgrjM1fFkOgOEvg9QpZfmPTHRP0w9/N2IQbu4+vs0
         nb54cBQE/s37T2C5zG7nCIR1V1emFvCiO2dgZn0Pz5F2ONkZj2tZtARRUTJGEin0ve2S
         TMKzcm5hDnbkJdr2TIU0CbpiH29R/WxZLmENSPUSj9byP3++sCzxuhKXEZ1zIb6Wn2I2
         cYCa21dnclLHYM4KbKNbtJpA/o/MUiaWI16RbEycKNxYjhX7e3isSa7OfeVEqG9msFcB
         UCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144341; x=1690736341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Eyaf/JArFBnOJmUxcF7DoGLYY7fHW+Lur/i45+1eYA=;
        b=l3rTDRUwCe3uGr6hil6V8XWcTHxFrdP2+PF4WbeBD3MJYDOoGDfXW59y9FViiAdpo0
         C5KIUDUAE62Ae+obXwc540e9MdbMvnHKrF93JmPn/4hGxdUYaH7rxD0SyxKVQbh9UMCy
         BntDOcoWiz4ZmH89JYsMjpwkPdOjA8GkVqKiwmF4EHAA5yHte1/cQbUpEbxbAystvhna
         ig38jCL4ZYx8C8/FH5eFAEdEn+BUwhIEJbRvrYCV3PBGfjHPDN5gJByu6tFkOpg6OPzT
         bhWt4TSfBDsi/PN4CGMLM8mLZxYhuepEES412FlyVqXdEgKsH58MjL6h1SBRXH9uz5G4
         JBtQ==
X-Gm-Message-State: ABy/qLZpbY/OV3pqQaKPovbG/nxC3vWK3Wrr5yLBZsILSn9MbbasZ+VK
	KG9xiRptvE4sAUHDSCLTM//meg==
X-Google-Smtp-Source: APBJJlHFfj2oZl0xVr1nB2zXh05figvBAqXp7tIH/wIQJvw0txyZj53M9A0+P0VhEGIP+1a6UuKwCw==
X-Received: by 2002:a5d:49d1:0:b0:314:172b:a75a with SMTP id t17-20020a5d49d1000000b00314172ba75amr3025280wrs.26.1688144340838;
        Fri, 30 Jun 2023 09:59:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:59:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:40 +0200
Subject: [PATCH v2 15/15] MAINTAINERS: remove OXNAS entry
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-15-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-oxnas@groups.io, 
 Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Daniel Golle <daniel@makrotopia.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/Lhm4rki32xogr5e1680FrjcVLCt+j7sMVgTOqF2+4g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm6aoHZMmN8vUbEzTBcIOV7ONJvx2yeNn0kZRnx
 LgLt0iSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JugAKCRB33NvayMhJ0aMOD/
 4o1u07bP99PyNkyrdoo5HuA/tEA4HRTOWRFwUBK2Fr4hLcuccLKZbqEoot/K06rPOpWlmBA0xJibYq
 9sx1cEJc+h2Z6AM6bLv21ZYqK5qXiv45NFZpA+avGwHQ3eQR49KMC8+J9Fb92MOTESddkVzr1uu4WE
 e9aJ1LI/ccd/i2cJ1q6JYWT4B5L5cIQbiI/ZtSRz8pqJ4w6w0RKypV0T7VJm80k0Jv8SmEp0Dlp+vG
 2WQAMcwB/wTd8fh2LKmHED0shMiW2MEQuAkLKiPoDPvybnsLhvaPHGkWmSMXRhTZl6DoGzOsvrTeGt
 aTFim1T/5SP8kSCH5IyYKe7HfsE8Yt9gBcyRyqu0NC2ehuN5DgDWJ25XQwf3CLLfN8xEj42a7f9Exr
 zWAe21b8vupE/IPlBZdtLAl4pizrS9O5UPCdYcEh7XVCBa8AMrQci3cdYVfnZjmMz9oQqhg9nYhA0V
 JGXiIp5zNtWsKoFqxPzpq30E48YAl7SC9jsUWLsXeqRm5FyrRsX8HmFPcHSNlOHUHID+XL5ltvxMy9
 5gbGOWZlwiRjX+X7+KZrzjzudA7BX8jOe+INgytdS3AgKSHSOiXc8Sx/ja2xf/Z/Hwp1CQeFZO2eQN
 2DfMAaMQrsOrzJs9Ps4BqxlAh6NcIKGU989Dmfjl521a7QN3/cdOvxA/sGbw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_095905_816452_FBD3E4C3 
X-CRM114-Status: GOOD (  10.64  )
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

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove MAINTAINERS
entry for OXNAS files.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 MAINTAINERS | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4545d4287305..cfe1bc884005 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2565,16 +2565,6 @@ S:	Maintained
 W:	http://www.digriz.org.uk/ts78xx/kernel
 F:	arch/arm/mach-orion5x/ts78xx-*
 
-ARM/OXNAS platform support
-M:	Neil Armstrong <neil.armstrong@linaro.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-oxnas@groups.io (moderated for non-subscribers)
-S:	Maintained
-F:	arch/arm/boot/dts/ox8*.dts*
-F:	arch/arm/mach-oxnas/
-F:	drivers/power/reset/oxnas-restart.c
-N:	oxnas
-
 ARM/QUALCOMM CHROMEBOOK SUPPORT
 R:	cros-qcom-dts-watchers@chromium.org
 F:	arch/arm64/boot/dts/qcom/sc7180*

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
