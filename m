Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA530ECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akYLUVwPm8QhNe7vEIKkO2j7SbGLO1P5+gc/Nh75HmI=; b=vlRlDmDbyuHQIU
	zTTLzSyLzAqzwpU62RLh5Q2nH+rWn4cm2llne969FzS4Uvnhf/4GXZBrAHMCKrOyI27QSF8jkYv2q
	WZe0Mm6cpsmU9mzDFcPELHNJsJs+fH5GLO0PMBAvQjtqTxoyb3ht718gjrgUKcggFEWTxMA1Q6m4w
	6wzMtUSqlAVgaDI06aM6aCbdTKwgF16H11u3baqPD5qzatXo2UFbrL0lXZ1LvLgqqPUmlJlV1FlLi
	u3CruZYCc5PN5D3qW1V+lrXzQhLrCFMX9MueojMjsGRBz7e4EqH0Im6verBwAwsmELHIE61tZTU0F
	7510Z7gvGolHs3XadMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm7M-003JzG-B6; Fri, 09 Sep 2022 22:04:57 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm4V-003HuI-Qv; Fri, 09 Sep 2022 22:02:05 +0000
Received: by mail-ej1-x636.google.com with SMTP id l14so7121239eja.7;
        Fri, 09 Sep 2022 15:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=dJgP6ROM7fy18qXnDj4sYxfn6j3cBSDbu87Uzoh/mPs=;
        b=kzsAPKknk5rN0rZqP+/kkZT9XwPez/aS/y5XL0nwcYk+/BI211OTBLPuemprjBz6qp
         V2BIkYbqgTAQKjlW2yqwtaLrzr0K+JvWHOD5vfT25lgDqBxHZnoMmLc+IMg20UwMgmHB
         nzxPUY43D4VDSFlSIhufRNZ2edGGboiSrqKyYJLROoXNcctNcL4ycSb57S57/dXrJF5j
         aOL9hFb0VPuVn3EQ8LayVCDxFhtR9LNi6NlUOIQ6t/IpJk1+iM0m61pYtGpgrwenGvPX
         E30QG30rPWpxoBdCymkQMWKy2AMI3+UdbKuKEmt223Xv+01zv25LJmdvXqm18+QuILh7
         Lp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dJgP6ROM7fy18qXnDj4sYxfn6j3cBSDbu87Uzoh/mPs=;
        b=cdlnbnMjNqFAXmrvDUkxBdwBBZ2dcFZ+K19iTa+qQLkJBIv0VkSNBjhoj7DIWx3gIG
         lVcU7agDQfJw38wSkk6pTygiK1JCNtYOFHp8EHXqTPzx4uZoZl5Zdxr8vsW1mzZOM3mT
         MxHU8/V7Ns8PG+UpKdM1CfLXg2H3NdYoqQn9WxVUVTLucCOw34VpLiRbidsD1jOHEHNq
         AQcVxi8fB+/31YaTZCFLvZENnGtYDdNgsDrfMHynDgK/8hvVS8Q47Ys7OiCsoYHAzGzk
         NIWadmu/EE1oRx5Xm+/fMrT3TwjyE7y6J2CUad3UUR+gHMJ18SIyUyymoDWe4HjBX2u8
         +7lQ==
X-Gm-Message-State: ACgBeo2J2PGcI4yEgBU8jQ/oPoP0izX5w8Po/YHA0J8AeocWAr1jpn1q
	inOk6DWnT5C/S6CIK0XLa30=
X-Google-Smtp-Source: AA6agR7uYAXXWiQFLUOqvuZJBRDWcRoJN/vf/0M+mARnp2SlRABjXV8skeF25VKomorxrgW9DhSQ0Q==
X-Received: by 2002:a17:907:c08:b0:77a:9b71:222f with SMTP id ga8-20020a1709070c0800b0077a9b71222fmr1545881ejc.739.1662760918453;
        Fri, 09 Sep 2022 15:01:58 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id ka5-20020a170907920500b0073c5192cba6sm787243ejb.114.2022.09.09.15.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:58 -0700 (PDT)
Message-ID: <a4da79fe-3449-6538-742f-790835ffe43a@gmail.com>
Date: Sat, 10 Sep 2022 00:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 07/11] dt-bindings: watchdog: rockchip: add
 rockchip,rk3128-wdt
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
X-CRM114-CacheID: sfid-20220909_150159_936896_3C8B6719 
X-CRM114-Status: UNSURE (   7.01  )
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

Add rockchip,rk3128-wdt compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 6461eb4f4..92df6e453 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -20,6 +20,7 @@ properties:
           - enum:
               - rockchip,px30-wdt
               - rockchip,rk3066-wdt
+              - rockchip,rk3128-wdt
               - rockchip,rk3188-wdt
               - rockchip,rk3228-wdt
               - rockchip,rk3288-wdt
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
