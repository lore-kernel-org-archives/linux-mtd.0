Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67B6ECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 22:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DY+iUId7H7kLzb+4g9U8hkzsJoVH85q4ci1Q20DUp3w=; b=dQE1xhLSCmYnZf
	LoFQ+XWv5xYS4UJdA4iIJBxGsm2gVyULmjxFYKJO54RgUN/t0pHew1u72GpQeNmsvORXvi48bCmMD
	5ocHudeH1hYcC/6YR3tzN+iEskcVYf7G/nUrYUiBeKyZAI7VfU2Z3XdrOynqJt+MxoCQ9Lx+7wv2H
	8vh7WVj/jDecrJakWCBHiSvOj5sirvdv5WFC855pMpsW80f2UmDr5toOrfdNDFFqdTZLzQHfNg7Hq
	ezJXjM6QKA8FUT4pnXuJiAQbn7u5FH10E3qqncGIP6Fkqq/K0CYfWCrWN+oZb4zHvNGSyT8BcRazT
	aeE4ZSzqhZvBqRo5zVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm8E-003KtA-DT; Fri, 09 Sep 2022 22:05:50 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm4f-003Hx8-3w; Fri, 09 Sep 2022 22:02:10 +0000
Received: by mail-ed1-x533.google.com with SMTP id t5so4484481edc.11;
        Fri, 09 Sep 2022 15:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=C3qADeaLVD5Wq/Bi8b6dEyFRSiEgo2NkstG7crvWOAk=;
        b=C+5bCGSupcduQheii5Mu+8UBVGi+s97RyVpipzZT0paGye3t6W8S0T55FMowLqLrus
         z9fNAD0K5pUYe6zsdLyQY7GnA8j631W82+SauxDaz/yWzoy0DEV+9itWF5zOZhzXQ+yu
         H9pp84M41DWilCxPTMpu4pJ07lE/sA+SWEsbC8bSpqUAzOci662UbHLYFyppRmiDxTzq
         /BRjVtupv/gfI4s5KPaRZNxruCQQMW1FZOQpr8C094XmHc7cSFMeiLgJcb1kTPEOBvgl
         RANJB/mvzHM5AZS937EAnjg4yjrZyCVlJc7M/LHYf8X9Gb/TzeRkmrofY8Te2bWsiNZz
         D+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=C3qADeaLVD5Wq/Bi8b6dEyFRSiEgo2NkstG7crvWOAk=;
        b=fWfF5DbS9wfNZlj6wemOdt0Jj4PERQ9LsNGj8sQpLvfzDOTN3eVfgYoRvg/WXhNUjE
         NcPcjWpnF3BLmadBVbA8i/toMUxuqrQBAHasbcz+XWUcdus0jpn2m0vWx9Ijh1BCEBZD
         esdkx+k5gsOh+9nUZlHenI4ds8G8Plm2uvaxftb6YpeAKik2mHlr1y8Nvvy0xtZ7+lkI
         +uBziSG4sTQU7v6MDfUz/aMzLGTe8J3HoVUMcbSGMJenNGsS9h4nxjdRQ6nM3pILczA+
         ljfBtzljDZnmV5KvkIANa56JMnIift1/6irdh1UZdPpIvdK/9gfhzzVUkrEItXYW6O0m
         Ahqg==
X-Gm-Message-State: ACgBeo3Ohy2YqxvYgG5u/gLxy5/eO5II/gkjt5hyUOkxopR4NVFFowKZ
	W++YnbaSBGHT6PhnAk9eLgY=
X-Google-Smtp-Source: AA6agR7EeHoURQWCtPEXQq45h383TFHKi6B0OznbjQfOnLVUiwu64bS7CKwZHxn593dBTjdmnvEnTA==
X-Received: by 2002:a05:6402:1013:b0:448:dc53:752e with SMTP id c19-20020a056402101300b00448dc53752emr13119868edu.30.1662760923862;
        Fri, 09 Sep 2022 15:02:03 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id i22-20020aa7c716000000b0043d1eff72b3sm1002426edq.74.2022.09.09.15.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:02:03 -0700 (PDT)
Message-ID: <dfb657ab-85e5-ac47-810d-133c7e8dd823@gmail.com>
Date: Sat, 10 Sep 2022 00:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 06/11] dt-bindings: usb: dwc2: rockchip: add
 rockchip,rk3128-usb
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
X-CRM114-CacheID: sfid-20220909_150209_238884_E38CFF41 
X-CRM114-Status: UNSURE (   7.12  )
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

Add rockchip,rk3128-usb compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 1bfbc6ef1..dc4988c00 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -32,6 +32,7 @@ properties:
           - enum:
               - rockchip,px30-usb
               - rockchip,rk3036-usb
+              - rockchip,rk3128-usb
               - rockchip,rk3188-usb
               - rockchip,rk3228-usb
               - rockchip,rk3288-usb
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
