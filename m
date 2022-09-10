Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45644C6FA86
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Sep 2022 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUHFX+xW2aEp5QOg5jKOhio2WtHUWjhUD2kt4DJ5Omw=; b=Wj21LyGEBK1ikV
	UFpMZ100gRj17OiM5YRg3CGIlPyqJSh6BNLY3W9opuMRz/+X9WUbu+uUd0epKchtxe6WBNAz1WeJc
	rbjz1tO7rkdBIzR07Mh8twgyUMnV1oErPZsBSzaRzNQ2UNxHzm4DGvpuFZThYYvuOihDCa7kC/Ykk
	exLmmlytm7WBfsQGidRb9IrZ4Ws6VibZPHQeEEFXx0n/AqKMRKl/Y7wKQ30zwASDD8DQwMbmx0hmp
	qu3TeeGBQjEJFeqhJ5rHOaf6gjCxLWPj6HyiJfrgC8eG0TMQnwGjKl4hh3sq8w8MQvKosRwMjUaYW
	ZxDMVAbiwP6Kzw3y+5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX1VN-00Arkn-LI; Sat, 10 Sep 2022 14:30:45 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX1VA-00AriD-IV; Sat, 10 Sep 2022 14:30:33 +0000
Received: by mail-pj1-x102b.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so4206253pjl.0;
        Sat, 10 Sep 2022 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=NfxfbFr6yb0xol1xxFYNDP3VjWYzuHsl9L6WlI3ZH0I=;
        b=o8CJbWXfF7dDOkG/l5CIf/K/X51rljLp3Su1VTY6THuSv7r6HBvEecHssTHM10MXAz
         SMIRv61RSwPsKDY0NpAu1a/8WXreef5wZy9lzEa1Tlvzo4qiIgqLpSckinSbLPpGmKsL
         EwiXyjllU2nMgctHnqy9HkEHRPMBH784+q8IR7VxWoXuT+KHOceyVlmeYRVkvTcZHD7S
         0F7WE+CRClm3Sg58TTzZkougAJkCokbofBPu9qntooE6rBkvjc7aWuKjmWes01f5kgM8
         Rp0+peZSiyk8AqeSLwgtvnpxW87q7bi+pu+E+/OA5O0tWmP/AQCv+NXZVw9MjXpYLlCz
         nUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=NfxfbFr6yb0xol1xxFYNDP3VjWYzuHsl9L6WlI3ZH0I=;
        b=dSwWmDijn6o6ALjM5mDB/Pt/X6Us1kkAvSTDPsVDNEhnza+R1HAuBy+R8DCK4doV2d
         qB2zYQykPzT7mLuGlSjZMNlgoM8yWdtrsnvTl3tUZZvUK+EWgmkKH1ZsTrfpLho2EyCi
         Q/a7nmV3tt1l+P7xftiMJ2vM/1UaF3DwLQo7UN/KO/saVhoctZHgF7gVzrYs1dQq9OgD
         UAzy/lRNHlyYK7GtBl56H5ejbJVplZBB0UHRywVpdohTB9dWcd1b9ZGO/0iyCxjeP48H
         357d4m/oLGZ5ymxeNGbKIhUZCWsTMZx+La6UOAdycEkHR7DzPsHDgAWkj1971CcESEAw
         2gJA==
X-Gm-Message-State: ACgBeo2Pre/P3HYVVKtIrrLPKul1MF4T4KH+dTZcuukzw3mFkLmgDYwX
	hSA5btQZiiOx67UnOv4QGkA=
X-Google-Smtp-Source: AA6agR45j1E2oUagm+srWFqub3Qu6YOOhrbPdG8/lVANoSphqwJKLExI6LaQWXuJkmIkirNUxO79XA==
X-Received: by 2002:a17:90a:a60b:b0:200:919a:55a1 with SMTP id c11-20020a17090aa60b00b00200919a55a1mr14980138pjq.194.1662820230702;
        Sat, 10 Sep 2022 07:30:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b00176b63535adsm2328040plc.260.2022.09.10.07.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 07:30:29 -0700 (PDT)
Message-ID: <0dab9988-3a7e-77f2-de71-58e67cc79663@roeck-us.net>
Date: Sat, 10 Sep 2022 07:30:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 07/11] dt-bindings: watchdog: rockchip: add
 rockchip,rk3128-wdt
Content-Language: en-US
To: Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, ulf.hansson@linaro.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, kishon@ti.com,
 vkoul@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 gregkh@linuxfoundation.org, broonie@kernel.org, wim@linux-watchdog.org,
 zhangqing@rock-chips.com, jamie@jamieiles.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <a4da79fe-3449-6538-742f-790835ffe43a@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <a4da79fe-3449-6538-742f-790835ffe43a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_073032_637004_059C46E8 
X-CRM114-Status: GOOD (  10.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/9/22 15:01, Johan Jonker wrote:
> Add rockchip,rk3128-wdt compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index 6461eb4f4..92df6e453 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -20,6 +20,7 @@ properties:
>             - enum:
>                 - rockchip,px30-wdt
>                 - rockchip,rk3066-wdt
> +              - rockchip,rk3128-wdt
>                 - rockchip,rk3188-wdt
>                 - rockchip,rk3228-wdt
>                 - rockchip,rk3288-wdt


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
