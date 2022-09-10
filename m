Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A32CC6FA82
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Sep 2022 14:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yymLlGOwEQkQDNCjVNV4BnJeqv9qAzXXUXFWypXaPvg=; b=PviRE+rXQ3UXfO
	TK2lxC+H1bab+QcvpeLsmVjZk4kBID6kGwdGzSi70tFuuPlXoNfLfC8NQGoPWBtrlWapl3asKo0lV
	unVCP9JtL6FcZzjoLru8l7rNuYg8hFIFldlbPzUY8tghRyDz5k+w0Fq7mo99Y0KmtQqZFGwwTft8Q
	vyjGXbzQYbv3E5/+gNmVlzfeLJTWJSQsGHktYMCQaFP6TS3VMK7BtdGxwIk4dcCJuR63HYcPkubhZ
	HCwKy9aruya2BVxItHym/XYQOzZv/mshgsfCvU19XUyvDGP7GxrzT5jiEtqb1hZlRx5PL6i+rtcIn
	pGVtKbwnbxcLjEY7Ypqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX1sC-00Awnx-IL; Sat, 10 Sep 2022 14:54:20 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX1rv-00Awdl-BN; Sat, 10 Sep 2022 14:54:04 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-127ba06d03fso11513741fac.3;
        Sat, 10 Sep 2022 07:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CoE1Ttusw0El8RVuwL7vJ+sUMh013wcJJxIsVP3JE8k=;
        b=PP6xKuZ412rr0EoGYDyc6RJqDGR88aEVBmkqxbJyoOCsl4QjWl9lFKwFvrEyX3YN3+
         EBHz6rh2jFa1H8kbsFX0a+zf5wb9dFUgm0HV1xhirfnAXRsArjhqH7GlcmX1DrJ/nHFO
         sC+05+EM1C5T+mEhU9JbjfWqrbRefZSUp5N9gaFnPPiE7GNdsLaR2hxv4eDf8HtubM1P
         twJDzloMDg6aiJUDm0XYpm+UEDw0rdwInhJ6+DLF6ysS248fYHe9/oPd0wx3TyyXN+Bu
         bGwVs5PK3/SpTPWxz5WVO/290y45S4uaqC61qks3aIS+168JWt4PE/3M1PDTqyQPEM4d
         3fng==
X-Gm-Message-State: ACgBeo3E2Ho8872d+F1qIb5vbXOXsPKk/gmvFGo/tQ2pwcHc45ox2Ln9
	XDb+ZrP2iuyy0e5qXU2dyw==
X-Google-Smtp-Source: AA6agR7QnkJvBeFKVjr4lQWP2YPcXrsjPepKXysHeccFpuHeF5YxdAR1V0QPbwTm0zS3ZRTkGxTbOA==
X-Received: by 2002:a05:6808:1b24:b0:344:8928:69fb with SMTP id bx36-20020a0568081b2400b00344892869fbmr5983433oib.182.1662821641824;
        Sat, 10 Sep 2022 07:54:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a4ad106000000b00448a3ecdc9dsm1321063oor.22.2022.09.10.07.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 07:54:01 -0700 (PDT)
Received: (nullmailer pid 34699 invoked by uid 1000);
	Sat, 10 Sep 2022 14:53:55 -0000
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: linux-mmc@vger.kernel.org, linux-rockchip@lists.infradead.org, vkoul@kernel.org, gregkh@linuxfoundation.org, wim@linux-watchdog.org, broonie@kernel.org, sjg@chromium.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org, linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org, richard@nod.at, kever.yang@rock-chips.com, zhangqing@rock-chips.com, vigneshr@ti.com, jamie@jamieiles.com, linux-pwm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, miquel.raynal@bootlin.com, u.kleine-koenig@pengutronix.de, linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org, ulf.hansson@linaro.org, kishon@ti.com, devicetree@vger.kernel.org, thierry.reding@gmail.com, linux-kernel@vger.kernel.org, philipp.tomsich@vrull.eu, linux-spi@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <c05fb9a3-ebf7-adec-e8ca-bd137d157f50@gmail.com>
References: <20220909212543.17428-1-jbx6244@gmail.com> <c05fb9a3-ebf7-adec-e8ca-bd137d157f50@gmail.com>
Subject: Re: [PATCH v1 05/11] dt-bindings: spi: rockchip: add rockchip,rk3128-spi
Date: Sat, 10 Sep 2022 09:53:55 -0500
Message-Id: <1662821635.172121.34698.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_075403_412943_62FA0B89 
X-CRM114-Status: UNSURE (   8.41  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 10 Sep 2022 00:02:07 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-spi compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


spi@ff1d0000: Unevaluated properties are not allowed ('max-freq' was unexpected)
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb

spi@ff200000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	arch/arm64/boot/dts/rockchip/rk3399-evb.dtb
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dtb
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtb
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dtb
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dtb
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtb
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dtb
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtb
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
