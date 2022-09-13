Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A08C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsHmKXfYPT/Qh03Y1HIUCwFpPTLp/XhmPU2mbJTdPl4=; b=wan5jSMeiTxNgC
	xvogNw4JBWVN+gg/iHyqAqOKftspCUGP7qFps7n2SHD8BoL8YYLmGlIpkK2OHiXVX6606HJX0EPRG
	tjA1/8zAp7VgkXq696F2AnB+xoqrHAQclGcWEwO9tAzOC91qLdWjKwxOCjzU1UIK/z7DA9FvRjHgH
	O2qU0pWa30JXaN5I3dtrOCboFfVVmTVob2b9gUOZhzDqfZ4DraHB3tSy4lD5a+yV2rPF2sJlptd8h
	oGsyz9T+Zew2eKHIFRCMqCEBnyy1dNGkpToa6LdhqNzOs8xzRmAnhvSNOftmXF5QDLEHefFkGHV4e
	lWQBW1OUMfbruHnFnNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6oE-00BWYB-Qe; Tue, 13 Sep 2022 14:22:43 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6hm-00BQLT-PI; Tue, 13 Sep 2022 14:16:06 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-127ba06d03fso32493419fac.3;
        Tue, 13 Sep 2022 07:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zYRS5/+Q00Jt+sqvHB1fjEMsS/sAzxnNY3oApp6VsX4=;
        b=yP4ylM+zGNeBn5ll1r1TLZjj+h+0ugh4hkIMfPprhT6CcY8pxJRw/YTAyTl4QmNwfk
         wqIApECjqWnpoyVzDbN8+XBd5sqOsZaG7vgxcu3lzlm1xVInEVa3Cu9XvT193PppSywD
         yWx4SJ/ViHeMGsXOYVamJhuXHH77pqNFG8UqCsy5V8nxcnCIptxQqSe6huXMDKOCVKv6
         uRe4q/E0k+WOhKlPouiqkjbDJzbOGmaeGewo7BauUOav3v7rxfpD/5HjPYp8qDDljzIO
         Ci9zbfYqEVXXGrwBjxhCh9M6ir9Mfy1bdhKz13Lnvfo6RjBmmX7xfzNbqdfSRu57xybA
         +ntw==
X-Gm-Message-State: ACgBeo1mVmGVH1I4Rx89X4kJnjoDQFMBtGO2Jaue9UC5DHn4LQimt1xz
	2UCwOhlovzqCK93op4piAg==
X-Google-Smtp-Source: AA6agR6hOpZPvoPt2Eb14Hvai4q1Lk4rE7+yyu9TNmztp+7DqLeOhYDLvEKfa24JcgVwwqI0QlyFNw==
X-Received: by 2002:a05:6808:15aa:b0:34f:b7e3:26f5 with SMTP id t42-20020a05680815aa00b0034fb7e326f5mr1747211oiw.22.1663078560574;
        Tue, 13 Sep 2022 07:16:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i34-20020a056870892200b0012644cc4feasm6980943oao.55.2022.09.13.07.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:15:59 -0700 (PDT)
Received: (nullmailer pid 3606168 invoked by uid 1000);
	Tue, 13 Sep 2022 14:15:58 -0000
Date: Tue, 13 Sep 2022 09:15:58 -0500
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: kishon@ti.com, wim@linux-watchdog.org, linux@roeck-us.net, sjg@chromium.org, heiko@sntech.de, linux-watchdog@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org, broonie@kernel.org, miquel.raynal@bootlin.com, linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, richard@nod.at, ulf.hansson@linaro.org, linux-arm-kernel@lists.infradead.org, zhangqing@rock-chips.com, jamie@jamieiles.com, thierry.reding@gmail.com, linux-mmc@vger.kernel.org, robh+dt@kernel.org, kever.yang@rock-chips.com, linux-spi@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, philipp.tomsich@vrull.eu, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de, vigneshr@ti.com
Subject: Re: [PATCH v1 04/11] dt-bindings: mmc: rockchip: add
 rockchip,rk3128-dw-mshc
Message-ID: <20220913141558.GA3606130-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <f2cb42c8-3664-a2d5-074d-5c9a10c693e8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2cb42c8-3664-a2d5-074d-5c9a10c693e8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_071603_983206_9BFB68E7 
X-CRM114-Status: UNSURE (   7.46  )
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

On Sat, 10 Sep 2022 00:02:14 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-dw-mshc compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
