Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DAEECAAD5
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Sep 2022 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uzu94YzDlU8rYW/p5bPr27m9BPKK8/QcMo4dH1PG7Yw=; b=n/egclI1Y2jvu2
	lgJuhgkGVppV3fsK78E05cn/lbokDqM1xx3NPZqbpqb2MW+0B40mesFJBau3u51WuEDarxefGuAWv
	erugQV/ZUWCGyToQhz5SPaha3txupud4tOEYELHKnmFq2PAylYiJFvVyVDvZ/0FdcvxafDP5PFics
	qT9sZUNNTIsq5OU/F/Xr33AX0HqbEq3ch+xuwTxpQcmN3mpYfLbiYh06f3EGvbtXG68kf/cx6LUBv
	LaVCYy949gW/qo0U8/XsqU4U+IfG9k54eaK18sL18XvSmDXt9Gy/FUP5HAfwhFNB+pR24O4BsJ59A
	t/QIgqMdOsrbH8GLjpeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWvC8-008Fbu-Vm; Sat, 10 Sep 2022 07:46:29 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWvC6-008F4P-L0
	for linux-mtd@lists.infradead.org; Sat, 10 Sep 2022 07:46:27 +0000
Received: by mail-lf1-x136.google.com with SMTP id f11so6490474lfa.6
        for <linux-mtd@lists.infradead.org>; Sat, 10 Sep 2022 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Xc325GZc+vxzGRAdvA0vChIvJkypnglJvofgNCbWMR4=;
        b=CPmvcoQIYyMAF4zt3FXqNSoDD7DiPiOGlYdVcymhCh+IKdlIs7rTLSuAVlx/fnmLcu
         96NZnumm1CF84Z+2pYGPbjiWAkif5ly3iN0Kwrq0KeWNsLda90xz+GV8V1yK9ItJ4vG2
         B1EJuY2n5/0kLF9US3rV3/w1AZwY4XPQxshrXFoNm8pI/hSdNgeek9/L11NVXvSYTWgU
         2fK6mTHrRrlrabBghWT0dudUvkei0lR0po0ax3jU4MditiLLlY72FydbDtgkVbMNSil7
         27Nm3kr9NLe4oefhueLn2QCXYfMY0dphxyDHblNj7RHUwh5Jd3gLvlwaOrkHot8uTUZQ
         Yt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Xc325GZc+vxzGRAdvA0vChIvJkypnglJvofgNCbWMR4=;
        b=vYemOqKtDcQ9Wg3qd208QU1gGrR3C7dnAJ6e4/7sXsjY/aZnHVfGfeR+F0xYpdOIGK
         1IT/BlwHYAe4hmJOIlch0m8AecEzf9UDH9cZ25cpYI0qYz6wcsfcjwHcJptp1KMEMOZb
         XkKPxcOlTZFOXa+bCqrBhc1i8/OQt7Fb2LQmgAP3ChvfPKY7nhPsntL+ojKf3BeUo6K4
         4dhRGNjo2I7HUTjK64jWJVE0ea7SRjmOF4WkbKT4JL1XYQj8VwBOPd3FgaE+8wn6IdwW
         P03BDqUNkbjnbZ/NbBGGfDvq7Nh3LCfexo1o+2fF55d/tmbUdpCMaZVY5H0/3nxP3ote
         FOvQ==
X-Gm-Message-State: ACgBeo2Cerk81u/P8ghl02KqQTJus/2yDSGzw4F10T14ML59jC7ey3xI
	Hr/BVMI92pFBFQcwpsYsbrvdNQ==
X-Google-Smtp-Source: AA6agR75ZEPrL/yKL8ezMsVKnuKBIXSz81lwLCFZHWoLKO6Bsf7yB53ADVYs4VBVxujyrIqJgj0K/g==
X-Received: by 2002:ac2:4f03:0:b0:496:272:625d with SMTP id k3-20020ac24f03000000b004960272625dmr5369172lfr.303.1662795983686;
        Sat, 10 Sep 2022 00:46:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h12-20020a05651c124c00b0026bda31c10fsm201998ljh.61.2022.09.10.00.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 00:46:23 -0700 (PDT)
Message-ID: <e8b33710-db07-bde4-e1d1-d42c05b87d6b@linaro.org>
Date: Sat, 10 Sep 2022 09:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 11/11] dt-bindings: mtd: rockchip: add
 rockchip,rk3128-nfc
Content-Language: en-US
To: Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com
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
 <f09665c1-9938-38c1-9a31-f196a3ef9cf0@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f09665c1-9938-38c1-9a31-f196a3ef9cf0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_004626_763873_C648F2B6 
X-CRM114-Status: UNSURE (   6.17  )
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

On 10/09/2022 00:01, Johan Jonker wrote:
> Add rockchip,rk3128-nfc compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
