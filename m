Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FC5C6FA82
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Sep 2022 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=entcZz0SgGoQh6NgNxWiBfdUyGG1dk/mR8B7TTemsmU=; b=ofiSwui7aAuWUl
	0g6sDNpoD2WdsnyeGay4jWJpiOcVEzK21c9OTq2yIfMcMHYK2eDS8cvxzHjXB0An5Z20yG3Rx8Llj
	aEfbxd7AfhIdu5D+AT5/ok+iiDuMN/nOJfiuyx52vySpR6D9sNWkl5+vk9fBwJfGh2li8zrQPJfTe
	LnBfCRK12h4IaUMZsCk/foBUz9IbP3w6VDp2kJSgOglxtxNhP7iqtpU8bJole53JQp5bXutwTeurH
	j+C8Q8VPvVU+aGNbHRwzUFHw+ClZByyr4mP2UUhIfaHvPsA0EzEn+fr2T7tcY+JkIIQVyv+LTXgeH
	zgbdpGEvZwLXqEXSgOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX1s1-00Awg3-Cj; Sat, 10 Sep 2022 14:54:09 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX1rs-00AwcI-9s; Sat, 10 Sep 2022 14:54:01 +0000
Received: by mail-ot1-f51.google.com with SMTP id l7-20020a056830154700b0065563d564dfso2882997otp.0;
        Sat, 10 Sep 2022 07:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pILdS+ykma6wojNncurew9VCgVoLwIUCOBAwYVFiN38=;
        b=Fojqx2VVcYfmSAMMTzeDjKTuIXS6AXaaOx3F5HnpATAHq9sibdrsy80o50UhQxCRRF
         zCY1wRmalILYvwD0KfW5pST020SIR1j8Lchlb1Ktz+FVhKkQR2+SLvbu22bmux93M/d2
         OJItCuaeeQmwTFiQn1aV5cXcAVGPRII/3dRnl249SZJRlTT2Gv+DgHEcJFqiOJHSZ/g/
         CzJ84nKcepBZOSJ6lYh4gjymF7sDX3N3KONz/0DBpmyNMdvi7vwkkxNliSuHyIzO1dhb
         qsPsgLckZmZq5OyEec10rJ2fEX0yy+jWK+sTrM7gL5+SP6JODusdX2SExNb+pkxXqUgw
         89mg==
X-Gm-Message-State: ACgBeo3ySBs2WH1xEmzz2PYSU9pNzIXSrgSgYsn1mT/9yTmgr7yp8dGs
	cM8Kjhhz5uNRHh8dOelLbA==
X-Google-Smtp-Source: AA6agR6uLUKNbC4IvKC2wLt/j2kzd2cW1yheQpUF3UEh3yZ8k9afTPnXNhIXR5NohpsvuQZfDM3fvw==
X-Received: by 2002:a05:6830:1496:b0:639:648a:55f4 with SMTP id s22-20020a056830149600b00639648a55f4mr7242714otq.370.1662821638995;
        Sat, 10 Sep 2022 07:53:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x2-20020a056870b40200b0012b298699dbsm2159608oap.1.2022.09.10.07.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 07:53:58 -0700 (PDT)
Received: (nullmailer pid 34701 invoked by uid 1000);
	Sat, 10 Sep 2022 14:53:55 -0000
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, thierry.reding@gmail.com, linux-rockchip@lists.infradead.org, philipp.tomsich@vrull.eu, vigneshr@ti.com, wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, miquel.raynal@bootlin.com, krzysztof.kozlowski+dt@linaro.org, linux-serial@vger.kernel.org, robh+dt@kernel.org, kishon@ti.com, linux-spi@vger.kernel.org, vkoul@kernel.org, linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, kever.yang@rock-chips.com, zhangqing@rock-chips.com, linux-kernel@vger.kernel.org, broonie@kernel.org, linux@roeck-us.net, gregkh@linuxfoundation.org, ulf.hansson@linaro.org, linux-watchdog@vger.kernel.org, jamie@jamieiles.com, sjg@chromium.org, u.kleine-koenig@pengutronix.de, heiko@sntech.de, linux-mmc@vger.kernel.org
In-Reply-To: <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
References: <20220909212543.17428-1-jbx6244@gmail.com> <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
Subject: Re: [PATCH v1 03/11] dt-bindings: pwm: rockchip: add rockchip,rk3128-pwm
Date: Sat, 10 Sep 2022 09:53:55 -0500
Message-Id: <1662821635.180247.34700.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_075400_366941_7E090146 
X-CRM114-Status: UNSURE (   8.64  )
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

On Sat, 10 Sep 2022 00:02:22 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-pwm compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


pwm@10280000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@10280010: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@10280020: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@10280030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@20040000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@20040010: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@20040020: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@20040030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/rv1108-elgin-r1.dtb
	arch/arm/boot/dts/rv1108-evb.dtb

pwm@ff1b0030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb
	arch/arm64/boot/dts/rockchip/rk3328-a1.dtb
	arch/arm64/boot/dts/rockchip/rk3328-evb.dtb
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtb
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dtb
	arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
