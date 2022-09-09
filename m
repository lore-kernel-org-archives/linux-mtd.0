Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724F4ECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 22:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taxWjI5xaUF4gM03i7UQFYNIzj6cJDoQd/aIJuoMlD0=; b=hPq76o0YFAVXiu
	ovjOjnOb3jEQDNahKz42OYCk9eRRwqxPVa7+4Tk1Vlk87GJLpxt9QcAbyMaZevqETCdWwPRUp4Zpg
	SQGUViJCuMUGL7ZB6UoCmsm1Bd2fAtu4CgqRTrcWBwOqyUsBrYIDWbtiBOZDA9AQUp42uyCasSr11
	FBu4ABBL5wkmClIY4aBMFUa3W8qnhOJ6ylQL6tt0p7UFbwjaHv9phQ4POxwMNTsWgi5xqHLTil17T
	/Jt0s+LA3bbM9VEgfrL9jf2UguOkdA8Az74YgMbIalcM+eG0ce4ZDXghrRZJ8l8NyDvfzxYrW9W1i
	xSAIgPbArX5uS5ugsXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWmB1-003NKf-AW; Fri, 09 Sep 2022 22:08:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm4x-003IFG-NA; Fri, 09 Sep 2022 22:02:29 +0000
Received: by mail-ed1-x52c.google.com with SMTP id b35so4566745edf.0;
        Fri, 09 Sep 2022 15:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=Fs8pAg8991d6hPaGLSjixDt92luWuK1ATlOmGa3JgXs=;
        b=MB3oR7785j4SJnsqLPSJb504gcGumCClB14257XrKJtcEiC/kF6bEdlL09RLv6sa3c
         DjHJrzfKZu0ESnqMyHtBPF2sl3Dx35xpv04+dk2X7Blqfi2FMU69dKGJ/yVH06uh59DW
         dxEGQeJWVJK4VXG+rdAS1TRdE7dqqdVQ0nq1oCNMcl+wXxdXAYdiw4cOLFRPWidwYc32
         Rl97DJdm1LT4ZxT/HBdftH5gNV2RB4JinQd3viocth9NDF00zS7JT1kAxgamXKyi7EpI
         jf7n4yCUNhaFR1+tLpygHnw+tAb6wBq7fsKKd6oFtT8TsPTYh2Dwf72uMGU2OUJJ76RV
         lfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Fs8pAg8991d6hPaGLSjixDt92luWuK1ATlOmGa3JgXs=;
        b=Fe/U1N4VHKRc7ivxyinY/UDm+8vQ49/m+AdH9vG5fi6NVenMP8vizBtqWZ6n4rCDh2
         S3vEiAQfgozFBemXT218czW/W/9PGVpFJf3xQg/kgWnS1N61S/1D50guODrOx4130wIM
         PAU4HsH3mhJi+z+itEnPUxYHFhOen2prIOOgAaRjwu4ZpxZj684BihBj9s3xe2ajw+fk
         yQAPXLd3zDypd51SY1JgOcpuXUXhcZjQ7u0NeRk7uw13j8RucJCxs1/q/l9XB+3gmd3h
         KVPqnTWzGbJTRYETTpIimVGd81ZrRoD/oL4J3jW0LBPW1u7r3T5PJ/dNDaaHIqyXlFJb
         UbXQ==
X-Gm-Message-State: ACgBeo2s5QxqBTDiH12UKAY1gYHhbNCX1i+m6d9+54PRYyrfJ8QQkc6H
	SzsIMX4ds8t2jfcQQDWgVR8=
X-Google-Smtp-Source: AA6agR69cDbvBaFqHukimCR0ASFhSn0OKiFTxMEiefYWYalPtMQi1Y52hZWynrN+zwAm9XjrsvdtWA==
X-Received: by 2002:a05:6402:501d:b0:443:1c7:ccb9 with SMTP id p29-20020a056402501d00b0044301c7ccb9mr13046040eda.101.1662760945016;
        Fri, 09 Sep 2022 15:02:25 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id s19-20020a1709062ed300b0073c10031dc9sm805766eji.80.2022.09.09.15.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:02:24 -0700 (PDT)
Message-ID: <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
Date: Sat, 10 Sep 2022 00:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 03/11] dt-bindings: pwm: rockchip: add rockchip,rk3128-pwm
To: kever.yang@rock-chips.com
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, ulf.hansson@linaro.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, kishon@ti.com,
 vkoul@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 gregkh@linuxfoundation.org, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, zhangqing@rock-chips.com, jamie@jamieiles.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220909212543.17428-1-jbx6244@gmail.com>
Content-Language: en-US
In-Reply-To: <20220909212543.17428-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_150227_838362_E6F7B129 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
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

Add rockchip,rk3128-pwm compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
index a336ff936..f86170871 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
@@ -21,6 +21,7 @@ properties:
           - const: rockchip,rk2928-pwm
       - items:
           - enum:
+              - rockchip,rk3128-pwm
               - rockchip,rk3368-pwm
               - rockchip,rk3399-pwm
               - rockchip,rv1108-pwm
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
