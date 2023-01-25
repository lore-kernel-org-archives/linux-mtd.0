Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE1AC54E94
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 13:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+yePrH0xrhUZhkEiROccUBsXjedAHt/9g1jvrBO+F8=; b=zj1vtwfpq48ssg
	vruYo9XC7K9CTwZ/84B387jbtSep7zrStYGMuxKzE7BPE3PA7EiaA+i9SlVlTCYi7J1pkl2WrC8F3
	z+Eo7X7zV8M7Lw6968SLjppxQ/nRXUVif/d+trksgLVyTcQT4OoIOp9MJ57LTppO3UAmv8rdNEFXe
	oZtgfDTawxGYiJo2C88SOHOxuc8uXJO8Z4G6LpGaHdgfi1HxA/ph3A1KzNp0VzL/xgQfAiwrEKfn+
	ZBj0RgVM7jZWldlmGq5ZV+Lak+vZJJIKrNBZnWuRNh4lDM7QI0zkyUfSPoiJpIZmOPCbRVmZH1w8R
	WDnuH9s5YbK2v6w5Q+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKfPs-007LTk-E8; Wed, 25 Jan 2023 13:02:16 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKfPp-007LSV-RU
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2023 13:02:15 +0000
Received: by mail-lf1-x12c.google.com with SMTP id cf42so28859898lfb.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Jan 2023 05:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WUlWEcztX7LC+YPVdX7zQ3TiSCzemn77YbP9UmZzYSE=;
        b=ZWujWps5xV+1Wp9WkpTktZV8uw9uUYoO8g5XV6hX5GoFex0wS6QvPRwAG/2X2m1TpC
         AnHeNzLJDDtn53tWfoYWTefbTDjXDAE0nyphHivQZvoRdrxbqpV+7GwZiiMjSczRHu8S
         2+wR907XANDw+tY9iJAZ7kQb7uGdBtK+VXYG5abfl8fMtfvdNrdyGPXGOMxIoU9QKeVu
         4IlTBODyMAWFOY81r6JOyh5Fa315CiPWT2rXXbjFQEfpJSeF4VXVDJglh9UTsnUwh9su
         TYGOZhQhykmGOSX5lbdOvzn5eD1DRAR9mumAOcV1QbWLinLDbhcnO/qlNyd2Axsp+wEi
         p/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUlWEcztX7LC+YPVdX7zQ3TiSCzemn77YbP9UmZzYSE=;
        b=52QFtpqOSHKTWm5GqN9nE3fpqGWMEibamxFC80mPJz8Rj/7FfEWpWjiRpMHXqfd2xV
         7SyL+J6xOCHZ2cWIQlmpmNJMveMg1GTkrvkKrMDh2PsNnuAqvR8NxfALszD0gNvCmQKm
         9XEi8MKVg8NsHfyeXK5N5jBtSNiPqal9VFLL+Mt+yMWrf5Onm2u8Wlm4JX7260G2K5J6
         nZZKGp3ns+nQCXsbrEeqz5CMnlQSEsUUlYSnx842k2dJ+0LIb4Ppm75R1uXkHavigJ1w
         nBEajM9pxHw+938EJPri1KuuPrDNVLnZcdf9hjqWhQfytqyBVKEAxwrgHlJ5gyCilUYR
         y/3Q==
X-Gm-Message-State: AFqh2krIk7+HzX/pysrl3eGcy/tcJSFNwmnZ548DNSz3SZNjPTmeSgJK
	LWVM03R+S10IqMfKX/qI1BryGscspv922c8MeEKJWA==
X-Google-Smtp-Source: AMrXdXua3Xzk3n+mAS+SHWDmCwyiaUE3a82cF5mU8PKvzbJFSacMHuyCjbHJ/PWxjesRw9CjRh1dmLPf3Blx2uP0BXc=
X-Received: by 2002:a05:6512:3984:b0:4ca:faca:5b59 with SMTP id
 j4-20020a056512398400b004cafaca5b59mr2768406lfu.615.1674651728174; Wed, 25
 Jan 2023 05:02:08 -0800 (PST)
MIME-Version: 1.0
References: <20230124230048.371144-1-robh@kernel.org>
In-Reply-To: <20230124230048.371144-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jan 2023 14:01:55 +0100
Message-ID: <CAMRc=MfdDv5teeQx802Qi3otwfXtZ1jAX_bzvH4DQMvdas9YtQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing (unevaluated|additional)Properties
 on child node schemas
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Sebastian Reichel <sre@kernel.org>, 
	Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-pm@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_050213_905631_B29511F2 
X-CRM114-Status: GOOD (  15.37  )
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

On Wed, Jan 25, 2023 at 12:00 AM Rob Herring <robh@kernel.org> wrote:
>
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
>
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  .../devicetree/bindings/gpio/x-powers,axp209-gpio.yaml |  1 +

[...]

> diff --git a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> index 7f26f6b1eea1..31906c253940 100644
> --- a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> @@ -35,6 +35,7 @@ properties:
>  patternProperties:
>    "^.*-pins?$":
>      $ref: /schemas/pinctrl/pinmux-node.yaml#
> +    additionalProperties: false
>
>      properties:
>        pins:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
