Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87CCECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 22:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TW0lvhJ5CBZGh1rp27JU6DEiqLNeAG8lQzT6wn8aC3g=; b=LY7hNBpDpDdeg+
	E/5AAQfQWTBoVueyF96GyXDdhde/XrHk11+NmxF+gXDXfEofwHV8/edDJ3X/RHUywxthS0T+kTtiM
	eXomOkB64Kyf9HWaNCGDUil+3aFFSETv+INdxmpu4RIg+320QP5t0H3WZKtblCuHSEZtwSB3Y0rWz
	NyvZHKmoRlFDLprnG05b4D5tNShArCyHiUGn+KBJsNw5b9fU1xw9yWadDbdRhKf7+rvbCUjaKnD1T
	tcBVYBiXkxYiOBWIhXQm2/ooj8cNkf+aHPuGXUcWD5bQ6tq1ZqwihrV/iNyuVLQxI+8VwMTrXIv4V
	KDDiTGfHBMcRBlrwbyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVKHJ-00H3Z3-W9; Mon, 05 Sep 2022 22:09:14 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVKHG-00H3WG-Pr; Mon, 05 Sep 2022 22:09:12 +0000
Received: by mail-pg1-x536.google.com with SMTP id s206so8997953pgs.3;
        Mon, 05 Sep 2022 15:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=7X66Mhu89Nd1JC1tC2C3GiFsxMesGQdlZVFrlo9aYm8=;
        b=b7jRxWPyK0Rq4w8FR9ZFdzOAagpu8Ly97+vIsJC3Zr3BYQL9lMVB+ShDYBZ2D8gDRn
         iG42XCqTvMR/etwnUxtVq4dc6kjBUmYkBG8G+Uq0g4SiQD+aD7FdS44c68HxkrxInjmX
         rQwIEiXivv7vBIj5Sf8Y65QbFkdKpO+b+xgFODtb9auHWLSyyRIc9buVgrGAtV6dAmSk
         vw5WAxq8xcLg9s7lPX4OmewpOzfHhIQkLGIRLhUtapokGcK0j0Egcpyqr1AShiOI+SGy
         eWqxW4Icxyq7dn3JsNejnG/2tlPR6tqehYrDr8AxyduISs7Ol7B5gyVkSMCzO9kplR/h
         RRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=7X66Mhu89Nd1JC1tC2C3GiFsxMesGQdlZVFrlo9aYm8=;
        b=gOQCprkovLoxVWzbZ7FSu20m1Jhx4JIU/UHuM8+QGY1cg3GQBTdsCocC33YGHzC6wd
         xKICwzCQD8zlXs8MpZm/CgKLLrR2SCtcEkUTo5hAIuvqaeD2uvokKoXbQfV2SbSq7myd
         ULcUW01srifxYCkzx7X5hk0bm9JaKdX9A/Es6AN5YNoD/kakZKn8bEmh4vnZsT7d+XNd
         vibbIDSoQr1u8z/f8m7ldBYEKcKYbSU/NKO4jsgg2rzl5D5VzOQzSJg50XuFYg5o3c0+
         zQ84/u5ErW89GeymttNbgiL8HbPXGc/f7OyR2xM49In7RanJ0tErsuMCKSaN2o2zbx8O
         2eLg==
X-Gm-Message-State: ACgBeo0uG5tZI31tbSXgGkhvaDCYRRbpOl3HQlnnBZ54WJRDib1fBEzU
	t3yP4+KSzPzSK7Zy7/ikmRE=
X-Google-Smtp-Source: AA6agR6Eea0J+fyHn4cnB8pX01mZJQu8GcEqrT2a0QWMcFiUqA9q20U0tI3FWNDXq+ZYzlcm5H9Qbw==
X-Received: by 2002:a63:6e09:0:b0:430:663:7757 with SMTP id j9-20020a636e09000000b0043006637757mr24953820pgc.340.1662415749460;
        Mon, 05 Sep 2022 15:09:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f9-20020a170902ce8900b00176b8f587efsm2127192plg.148.2022.09.05.15.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 15:09:08 -0700 (PDT)
Message-ID: <73749107-35aa-0720-1a30-02a90c0540fa@roeck-us.net>
Date: Mon, 5 Sep 2022 15:09:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using
 devm_fwnode_gpiod_get()
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>,
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
 <pali@kernel.org>, LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 USB <linux-usb@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
 <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
 <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
 <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
 <YxZSUlCPEE9o/s4G@google.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YxZSUlCPEE9o/s4G@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_150910_866214_16AFF75E 
X-CRM114-Status: GOOD (  15.91  )
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

On 9/5/22 12:47, Dmitry Torokhov wrote:
[ ... ]
>> We know that count is either 1 or 2 here, so strictly speaking
>> 	if (count == 1) {
>> 	} else {
>> 	}
>> would be sufficient. On the other side, that depends on ARRAY_SIZE() being
>> exactly 2, so
>> 	if (count == 1) {
>> 	} else if (count == 2) {
>> 	}
>> would also make sense. Either way is fine with me. I'll leave it up
>> to Dmitry to decide what he wants to do.
> 
> My goal is to drop usage of devm_gpiod_get_from_of_node(), beyond that I
> do not have strong preferences either way really. It is probing code, so
> performance is not critical, but I'm obviously satisfied with how the
> code looks now, or I would not have sent it.
> 

Good point.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
