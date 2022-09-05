Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7766CECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 15:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BcCorU86qNsN5VBdPREipFUG//tW9hM2xhFXW+jyBvQ=; b=koek4FCcNSqmLm
	W11uDeKg+roK8mOEmWvzu5nfAHg7ACIUfS0EGA7gTsebkfSVsteovHRBtx0j1vKQORkvpDcNqnP4O
	wTll95trffRIJ5QuEbxUKs+dZcYt2q3C56geHKXD2iUkODS/szoTqSTGiC34aM28ekgjAGdFPyesw
	F0Igq3kl+OO3sttK7CsJdj5Ks4uWr8LOjujBHe1hpezfJotljsMt7T5mCeULoFYa2oSr/zjqxukTA
	nGngqvLRI4enxGYG9Rr4dY8TYLVDX5q/qlLShCqGWC/+C+uaXnzTXh1JnEBBfEAYjKKHRqiIF/is4
	XgVHcqhiMr8htHLJIz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVE6s-0061pt-He; Mon, 05 Sep 2022 15:34:02 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8pI-00H2fu-FZ; Mon, 05 Sep 2022 09:55:37 +0000
Received: by mail-lf1-f42.google.com with SMTP id z6so12336249lfu.9;
        Mon, 05 Sep 2022 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=m6bwvWKIYsYkkQiw6WkHW3VenkfYyqcqiN7fetf2fKA=;
        b=IHLIbQ5vHZQVIyqqjxII8xfEjM3Q6fZoeMqDFdIiU0vsFp6oi7h0IwMdNfx1vPlnFp
         ZPEemHQtgtDg6DfHplUdQ9jQ9sLqz7D7QN4FLqbsDi3rJNDxpjjlWDcgUMOkA9w2Tjs9
         x9VWcOV0/2DW1Hg36LsG6DteksM93YpJyP0rfadAndCJKb/yY4pF55KE51FqNTxioDRe
         KBJzVpsAFs2k6LKzsnJmjaNF0PAQrTJoMhIKZekTRu34MSjNFM9c+GyRzLjBHe1ybOQZ
         eLbeL6kyIXJDXmENmbtGhQKPn5KPfZrIYSXNEMQPhMhg5ikHY+XI6LCK0LoPM/K1/Mnt
         uzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=m6bwvWKIYsYkkQiw6WkHW3VenkfYyqcqiN7fetf2fKA=;
        b=LPjRzBg191omE7ZQMgpxbPT7pdYx4LoVz7CP6esFrGhutdtlxrwVuxATZzOURpbwIa
         VJpeCX+G1pBWQH3l5YTNPovL3pU1585XhIWblsa2SYwkSiHuD6v5LCoyR8foFii7wxnX
         RlO2MRHfwPSAgJldW0Jf0ngLf6xB31SqI86aLU3h9XgYK6wii0dGKxP8+KRKdYo9/k6b
         Mm8lJ3B2JgiR8UgsH0ktOu/AG+l09vP2vv9YfHEfuq4gRqnPp7CInb6XWJSKo/xXjKd6
         CqsqTDWenzJ1G5qVaWOxtI28nfVEv1OKpCzekT/kWTVYKmQt2SllNQF/6u9n7JWeYeTV
         UB/g==
X-Gm-Message-State: ACgBeo3bPJInQ+kuMkG5gtWDu0tWCsR/O+2HQiCak6UgE0/2dCrsfW3u
	4krzcvR+QnTO17wgIafr4jc=
X-Google-Smtp-Source: AA6agR4gwPt5aivllJzzHsjCuIDbWlzFIp6/PHCkmSvNiw6IUsaZdTaionvGINkVRjZdKCtkzi3jFA==
X-Received: by 2002:a19:6b16:0:b0:48c:e218:7c51 with SMTP id d22-20020a196b16000000b0048ce2187c51mr15164353lfa.681.1662371728951;
        Mon, 05 Sep 2022 02:55:28 -0700 (PDT)
Received: from [172.16.194.135] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v27-20020ac258fb000000b0048b13d0b896sm1141980lfo.141.2022.09.05.02.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 02:55:28 -0700 (PDT)
Message-ID: <4a536310-3f79-d248-dc48-5cdbd640e04a@gmail.com>
Date: Mon, 5 Sep 2022 12:55:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 08/11] regulator: bd71815: switch to using
 devm_fwnode_gpiod_get()
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>,
 Felipe Balbi <balbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Airlie <airlied@linux.ie>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>
Cc: linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_025532_630751_6D9A9D02 
X-CRM114-Status: GOOD (  17.03  )
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

On 9/5/22 09:31, Dmitry Torokhov wrote:
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> 
> diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
> index acaa6607898e..c2b8b8be7824 100644
> --- a/drivers/regulator/bd71815-regulator.c
> +++ b/drivers/regulator/bd71815-regulator.c
> @@ -571,11 +571,10 @@ static int bd7181x_probe(struct platform_device *pdev)
>   		dev_err(&pdev->dev, "No parent regmap\n");
>   		return -ENODEV;
>   	}
> -	ldo4_en = devm_gpiod_get_from_of_node(&pdev->dev,
> -					      pdev->dev.parent->of_node,
> -						 "rohm,vsel-gpios", 0,
> -						 GPIOD_ASIS, "ldo4-en");
>   
> +	ldo4_en = devm_fwnode_gpiod_get(&pdev->dev,
> +					dev_fwnode(pdev->dev.parent),
> +					"rohm,vsel", GPIOD_ASIS, "ldo4-en");
>   	if (IS_ERR(ldo4_en)) {
>   		ret = PTR_ERR(ldo4_en);
>   		if (ret != -ENOENT)
> 


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
