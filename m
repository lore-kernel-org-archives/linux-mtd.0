Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C1DC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 14:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OevJ/xkPcnKwfq/cKes4YY4jpaXR5Om65KI1Bp6z7aw=; b=pSURlixpZrN7u2
	ehuu5/GHVnoIc9eBAlZPpxxcd4b/Er6LV6gGPVOvNGDvmLjgTzlKIi6zKU3M4lnHS8EW7njbAmAUN
	Or6Kwd4D69x0iWy8Jwqok8D8It7uUm24kUYmyG802vnwfygOlqT0yfOkb1AwaYSAoYfn9y8aMPmde
	ImIUUqT6LGElnpwP2FdffDKUafQJEeQV0N4QPOviKcbZwoS9JtWsxzJaWdnqdRxix50QNWHP6jLlc
	GRw5e3Keg9/0YVEjy1Z1VSsDPLyQO0og5ZrOn53K1aKQUhzhl6kdpQf9cnkqbYsD7EoNYGwbuhO5e
	4LBX647Vv3tGSwmazhzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6cF-00BLIB-QX; Tue, 13 Sep 2022 14:10:20 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6Yi-00BIGa-LI; Tue, 13 Sep 2022 14:06:41 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-127d10b4f19so32320873fac.9;
        Tue, 13 Sep 2022 07:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=s6AlJol1WXkTtPhwmopMK+Eef1rB1gY5f+tJ12KpnB0=;
        b=nS8+ld9Xf8aFDxMeyzUeBrH3lB9tYJlORMubihdmyMA8CH7Y49yxgRcGC4cLCXw6lW
         skAzjlDeyLmOYHO66s3B2HKwQWEvY5dSveMYXEYQgl2ttD5GJ91dE8q/DK9aNy/Hi4/1
         mkItLtSlosqEPPOGaXszn4dXI/iKcRROWxkOzhB4vCu0ZsUzSjTVld9nOOdeSDPZcE/J
         nXtwmIteHAT8g5u05pJSe9FZOfWt0IO+r9ROn7bLNs4J1CabpzxOWzDMxQ9MROQvhW+D
         5L9RIxetYolQKmCwGEdllS2w5mgXUWVItqa0iTzCc0SJwxeAO65S/GaabLhMO38JMEJO
         NaBw==
X-Gm-Message-State: ACgBeo2KX7rdPh9eXvJ8aQg/ORLiMXnatZ2lnP5wKF7WhbjIWget+XDB
	U9aWPNq+cEHN6oQN8RpmrQ==
X-Google-Smtp-Source: AA6agR7DEpROfK34CcJc9ua54a54y7oXUr80MDoa0RjLp7zD/zwbGg+f95PbuxN+K1kvWR0jclK1jw==
X-Received: by 2002:a05:6808:d4e:b0:344:cc0a:2a48 with SMTP id w14-20020a0568080d4e00b00344cc0a2a48mr1537325oik.241.1663077998885;
        Tue, 13 Sep 2022 07:06:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bl32-20020a05680830a000b0034d9042758fsm5232514oib.24.2022.09.13.07.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:06:38 -0700 (PDT)
Received: (nullmailer pid 3593227 invoked by uid 1000);
	Tue, 13 Sep 2022 14:06:37 -0000
Date: Tue, 13 Sep 2022 09:06:37 -0500
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: vkoul@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org, linux-usb@vger.kernel.org, u.kleine-koenig@pengutronix.de, linux-i2c@vger.kernel.org, linux-rockchip@lists.infradead.org, kever.yang@rock-chips.com, broonie@kernel.org, ulf.hansson@linaro.org, wim@linux-watchdog.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux@roeck-us.net, miquel.raynal@bootlin.com, linux-serial@vger.kernel.org, linux-phy@lists.infradead.org, sjg@chromium.org, vigneshr@ti.com, kishon@ti.com, linux-spi@vger.kernel.org, philipp.tomsich@vrull.eu, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, linux-mmc@vger.kernel.org, linux-watchdog@vger.kernel.org, jamie@jamieiles.com, zhangqing@rock-chips.com, richard@nod.at, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v1 07/11] dt-bindings: watchdog: rockchip: add
 rockchip,rk3128-wdt
Message-ID: <20220913140637.GA3593173-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <a4da79fe-3449-6538-742f-790835ffe43a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4da79fe-3449-6538-742f-790835ffe43a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_070640_844741_64C5C9DC 
X-CRM114-Status: UNSURE (   7.19  )
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

On Sat, 10 Sep 2022 00:01:56 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-wdt compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
