Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76C3C6FA83
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 10:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iuoy3Vtcequyrj27E2z7dXz6KSoZAC/FyZMYWARvjdw=; b=pplBZK1W1uMhGU
	/kV43iqy6gIr9vDbD2kaU18EriisP21TJXtmlA6o/UsUW4+LOOJC472+MeQ3uhcAMDJnkOzjoc9MT
	l55JMCppf0U0pZmOHCiRkWz8PY13cxbxoKZ8qtjX0NzZbWEnYyoQCRUh4ZXsYM9by3+g6prmJmth3
	TRsidLCTBeHlMjfsw9d8Bft6PuRxZtUzdka4OfeSteavIxzsZ3/JXJFIRCCTmTAv0tqbPmecCBiDa
	ScnBQcuyWQlKyq8WA+ELZ0kxb9qWYCsWiBmHdJZGHVk7T+IGH3fNTO4mB5MfLb5vKDwHy5o+TdwXo
	RXvCNqLAsJ3f+aNdMCHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9hE-000flX-RM; Mon, 05 Sep 2022 10:51:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8qK-00H4Ui-S5; Mon, 05 Sep 2022 09:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RdubYDDix+oOh2a0h//nboO40BpZ5xfyyxVZCNAs3B0=; b=qhoOPTCa/mk61g5rXHr7efz5c7
	4GEQUFDMscDBdoIvZ1/XJm7v/yZj5RIRq4Wg7Oa60aBzh/+4PEjHc7c6BcJn0nDpLc4pYeQriBh/L
	jja8eO+EWAJv+UqNUAM26i/PoFQwdJdhpy8FQbgvJbCO/HuW9+5/oXp9YFKPK2Av9Oc8ySLvaGSo7
	ELh7yYfVhTLPTWAoRaVbLQY1GLrbalI8PCfeRCHDQND4sE7vIE7m/47BtRxSL0NVDKmV+ZTBhAJrG
	ZvKTTwziC5PgfpZWkvvLsI9LhrTxb1wcTygoT7LWRyvARjJD6DlBp7mItLmY01FeXcOK0VAjSkWW/
	LTisUY8g==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8qH-009Uom-9N; Mon, 05 Sep 2022 09:56:35 +0000
Received: by mail-lf1-x136.google.com with SMTP id br21so12465482lfb.0;
        Mon, 05 Sep 2022 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=RdubYDDix+oOh2a0h//nboO40BpZ5xfyyxVZCNAs3B0=;
        b=et2BStfuMMuGC6Hmc0ahP2YMtl2IOvVs82z7fBLtShtRiNOLZEUcKr2FN+yvHNZxWj
         hUQof0CelJPy6k645QZnNEtobw55lyLfO/xzbj7BHjhPUtrr6ZyyJrZD5+wJPU8x4s/V
         wDTG6XP1BvwPE/YT5IW93WWtvTubg44nQ/U2m0Ukxn8zuXPeusqOLZkrZIQo7BaTII3T
         tjpw7YIxVKZOVR6ozOO29YwJBQZS8KoqWz1HV/AEJBiJwCnjVlLgAcdY8jrwxwGrjJtw
         gmvPsEX0owb2idPOc8tLiT8uceUOa827MJ139sBCmc4Km7ZtH35OknAdtVpmn61dpmua
         LvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RdubYDDix+oOh2a0h//nboO40BpZ5xfyyxVZCNAs3B0=;
        b=ktfLVNueB8TV8oGmh23QzM96qnF55yh06EbJzY6mFTdGZxuj/2VDbwDD/uvA0wG5cD
         A1QqjButs69RlDuiLPz/qOmw/KqJ1ZpZZD4OHy0lHkTWtnKAPCVPuNJqppl0X7uIn6Hg
         NAGchk9yU0kRmQMOcv1+5UlRPFERcPWQnIjf9fTyvqY8RgAOrsWeZ722ms5QpkAUGaUm
         rpamU05/2xJZs2vzrgFTEWp6DnPvYwCgzeG4AsVqFTDsKQDXdIx2cQ+bxLTXNo0fcng0
         weHyG5fIROCVgsNVqfNsYB4RdEQH6Ukw2AJ8CumyeLLajTXNG42YrLBx441En8PYsmqe
         3kbQ==
X-Gm-Message-State: ACgBeo197mpgVNh6dPpDfHiVPYKRi5OYym7MTWGu4qFJllvPo6doG3q0
	akKRlaj2RmaEAnbS3/2ka50=
X-Google-Smtp-Source: AA6agR49m1znt1xCwEgykIjaaYQRJwjqD0WPTDOx4N16eYQFUBRnr5DGteFNKPh7H42GT7aHHRsE7g==
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id p36-20020a05651213a400b004793b9ff13cmr15342515lfa.380.1662371790521;
        Mon, 05 Sep 2022 02:56:30 -0700 (PDT)
Received: from [172.16.194.136] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id o4-20020ac25e24000000b004965e80b761sm40259lfg.224.2022.09.05.02.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 02:56:30 -0700 (PDT)
Message-ID: <0b051f7e-1754-cb69-c0df-0bae08c967fd@gmail.com>
Date: Mon, 5 Sep 2022 12:56:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 09/11] regulator: bd9576: switch to using
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
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_105633_489840_4B0E6BFC 
X-CRM114-Status: GOOD (  12.53  )
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
> While at it switch the rest of the calls to read properties in
> bd957x_probe() to the generic device property API as well.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>


Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
