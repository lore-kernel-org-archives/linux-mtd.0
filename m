Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62985C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 14:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdLQh8QvtRQUkoLhdVdYejqqs2fefObMzHeYpJQU0W4=; b=gk7XDluXcm9LZi
	I+czrJ+ZNCFOIQ5Jk82S5JcWCXm+ZZ6s7tiC2U46sThq62fKIRfo4Bqw/KhOOozZmyKCG0V6tklBm
	kjRai+F55EqWtsi5RwJ9LGk/nJZL6nRBG/a84Ddq+IiBmh8meEPRTTOxYEi75vWW1w0cqVOVJ3dM6
	7kOB/3Mluw4JTADZZrNnNbiWUYGX6/qKesKRz/kQ+JVCV52RXbcRYv1NV5JCrxqaS7lPWyw3RnDXq
	awVAgC7rCKCPW2kGBCM59iHbnPz0Ks8TL67uBTJ9Nmsqeb7wRdVqiFnou69oniNPhFgMSh50cH4Cj
	77hiSN/SQkpKVQWWivTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6Zb-00BJ3L-BQ; Tue, 13 Sep 2022 14:07:35 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6YH-00BHZ1-KX; Tue, 13 Sep 2022 14:06:15 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1225219ee46so32403579fac.2;
        Tue, 13 Sep 2022 07:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gPHBD3/yThDshlFcYv9k71widUkhofw1FDDYpv8K6pk=;
        b=YpnBWRmUPfIUSlZkaTHu0d8GWjzS+fWUde7rqDLlhdHpuRZojQNqskb0Ix0BgGtuaM
         LYb+eWeDGabyam9aSzlJwftZsz3wwBgy7UoirL6VhwKM1FBsq08nSdXw3ipib0dC+KL4
         n1MUw+7PTR5+mxVecBcGEdpAEsHce1SmaeRCQXYGpmyWUJnHrJR2mXacAoXYIWzdoy2d
         p8j2iaRzRShVOLhpAGwYJhV5Bu0uHrG5XyoRyYeuKC9/tIcx75irOPG7oH671oliimoM
         /tk3+/neQExDQqoGjZRCcB/Yt0RqvxrA1I05bj0fn6ZcYozyJwGC5/wmfeCYT+yXxM1K
         GBSQ==
X-Gm-Message-State: ACgBeo0NYFzuXZdjNLEcOJpFNl8GBo3AkC4M4nAJnobSnsv9A40puv7H
	JcCcCfGT4ezSPMewML6eVw==
X-Google-Smtp-Source: AA6agR7aYuCePPGemiIdeL1jOXYKj30AqVdS1PK/922ZOdsnkY7FMM5ZgzSpgpw9aw4LGK2gnAELfg==
X-Received: by 2002:a05:6870:c884:b0:118:ae35:e200 with SMTP id er4-20020a056870c88400b00118ae35e200mr2011500oab.244.1663077973166;
        Tue, 13 Sep 2022 07:06:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 5-20020a9d0d85000000b0063975d170a8sm5980941ots.7.2022.09.13.07.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:06:12 -0700 (PDT)
Received: (nullmailer pid 3592371 invoked by uid 1000);
	Tue, 13 Sep 2022 14:06:11 -0000
Date: Tue, 13 Sep 2022 09:06:11 -0500
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: zhangqing@rock-chips.com, broonie@kernel.org, u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org, philipp.tomsich@vrull.eu, miquel.raynal@bootlin.com, heiko@sntech.de, linux-mmc@vger.kernel.org, sjg@chromium.org, linux-rockchip@lists.infradead.org, gregkh@linuxfoundation.org, linux@roeck-us.net, linux-i2c@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org, linux-mtd@lists.infradead.org, linux-pwm@vger.kernel.org, richard@nod.at, kever.yang@rock-chips.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, kishon@ti.com, linux-arm-kernel@lists.infradead.org, jamie@jamieiles.com, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org, vkoul@kernel.org, linux-usb@vger.kernel.org, thierry.reding@gmail.com, vigneshr@ti.com, ulf.hansson@linaro.org
Subject: Re: [PATCH v1 09/11] dt-bindings: phy: phy-rockchip-inno-usb2: add
 rockchip,rk3128-usb2phy
Message-ID: <20220913140611.GA3592344-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <d477a077-a68f-e752-5192-807db80a9e68@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d477a077-a68f-e752-5192-807db80a9e68@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_070613_921935_61F82586 
X-CRM114-Status: UNSURE (   7.45  )
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

On Sat, 10 Sep 2022 00:01:45 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-usb2phy compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
