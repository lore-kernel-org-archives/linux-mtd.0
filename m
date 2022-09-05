Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F36ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxgdxW8ITCCNX9WLkgmcTmznJjQ2Xqb1Vft/W+rbrqk=; b=3tnnDWHxUqntNK
	2s2pByLcE/kszgslCsZDmXKMUA2C5fk+QJGkVrz72STwFz0HeKHZ9CzbWKDxDxuWUd9oFRyG1P9AF
	X2TnTDZ2e6lHyhc3ke4Dys0EU5qvUb/mI38JQpnK4x9Z83Yh8Ruf7KPPzgP71NowRtYZM/nmhLMij
	oN1eYyxnnt+VOgI0RrUkaLdT0Giz07XYQ+YOS0uvl4WlymsHuA75FWTwMLqmhE7TjE3tbfhwUUmfy
	ORyZcj6zQuzSZr76bPPMwC5WfWb4SPDuDB7b7RE3qemhsO0MuD5ztvcgsZYSaMY+Vo/XGdC4dmYTD
	w1p59p3TWNcTKwwHOXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGiw-008JxH-NB; Mon, 05 Sep 2022 18:21:30 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVET6-006MNw-Tm; Mon, 05 Sep 2022 15:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3XrVUU9T8R4LO8OA1f5h+alUXAX2S0TQoRT3c9Li0zE=; b=Rksyen1E831TZtaFVF6dd5U5rf
	zMwH+zULdvtyA+mHMnELJcjN5Eq92W8Crg2SIVzqkWOhRGTrN3RYbrCHjmfrGRzaBxcF7wR3RmDlF
	k9v6Cq5+Y8WAvsHpi8tl6KWAepQqeovkVYbHJ+inYvOXkSi7FPoiIQt0VISCBsM9UckLOXcZmzErr
	We9XExJwfTRxd5RXlounnNf8+tFRyp+RW2pJCpS/DXqLnNBZfi3zEhr8o2NKVjxzscsWnsabAbi5E
	HP0vodKhhNFGabPH7CDfUHf6MFQiaC7E5rVxB2oFd5Yg+TXRz1Tr6UgOVyUKKKXIXnOW81rf86m/A
	ZoFJ0S4Q==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVEMQ-009mm1-9B; Mon, 05 Sep 2022 15:50:08 +0000
Received: by mail-pj1-x1034.google.com with SMTP id u9-20020a17090a1f0900b001fde6477464so12512774pja.4;
        Mon, 05 Sep 2022 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date;
        bh=3XrVUU9T8R4LO8OA1f5h+alUXAX2S0TQoRT3c9Li0zE=;
        b=fb+biuem+7b7djICmUqeW/BHTeNp/mSIkZ0RvN2SXnaFs/5YyeMU+evecpiT94v82W
         Wxfn0CSNmSmyFNdPp1gzvwV0fM9AjmN0MOmTdZboebJPVCoX17sG9lmzebM9ao53ceUW
         yVd7msO4mdC3TWp+151flO1HCijMCEaMLiYb6sFX8Glvs7ZTTgoL3lCtGTKQ7fyXm+Gg
         pHh/glh3NMkFwNQZT6QZHQG62OtYie95f/rnYvvh4Y8aPOmfyT9Ar+2EHwInZ1j+1+j+
         Oy+Ig/euXQdz3oHAXN56OD5BQH1j8orR8xHQaKEnUQLjJ5W8lICDNDnwnI3x7eyp41JE
         4G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3XrVUU9T8R4LO8OA1f5h+alUXAX2S0TQoRT3c9Li0zE=;
        b=gQXurMqUeekc0jcq0Ov8qeqvcvsggxG57u7Bct5T9wGVkpkknUsv7KHmYWmJS1iQuO
         bq6T8HFd2fGu3wFEU4g7QY8x5HC7BuvERYt7RJJJ0R7H9qosaQwt6vHgfWGZInUZfwP/
         x0uO0L/McVpJO73ZdAAYt5BWbi62JPZemAgQMix/pLoTRSGKMyUuR03DKq5TSNaYnqeS
         pSurF+M0awbIl1TbLhlOPmt0IwBCClwVNRB5KVUOExrngf8NfyVSwqZ32pzdKjE/67X5
         CxyMpC41S1capmVWnFDfE2HkxJEWbItKC0HuKbRn9m6l6Wv02kYQfVGVw7gC9P25yHmn
         51fQ==
X-Gm-Message-State: ACgBeo0YwSuy4xd1O4Mkch/jMuDvcBlfvaHK2qmKXEDGoqVmOYkz9K7p
	64VpTW9csxm4LGU1yQ0rOrw=
X-Google-Smtp-Source: AA6agR5VS25L+Z4dRUGvyFsOt5wkYCTLrQ7nt81wIVLfBBuODfZGLGcvsv14A7LgAxNP1Gl1OohTXw==
X-Received: by 2002:a17:90a:c706:b0:1fd:e21e:7cb1 with SMTP id o6-20020a17090ac70600b001fde21e7cb1mr20626775pjt.234.1662393003052;
        Mon, 05 Sep 2022 08:50:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p1-20020a17090a348100b001faa4a6691asm10512410pjb.30.2022.09.05.08.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 08:50:01 -0700 (PDT)
Message-ID: <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
Date: Mon, 5 Sep 2022 08:49:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using
 devm_fwnode_gpiod_get()
In-Reply-To: <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_165006_415589_1D06A532 
X-CRM114-Status: GOOD (  25.26  )
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

On 9/5/22 08:21, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 6:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 9/5/22 04:09, Andy Shevchenko wrote:
>>> On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
>>> <dmitry.torokhov@gmail.com> wrote:
> 
> ...
> 
>>>> +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
>>>> +       if (count < 0 && count != -EINVAL)
>>>> +               return count;
>>>> +
>>>> +       if (count > 0) {
>>>
>>>> +               if (count > ARRAY_SIZE(hw_margin))
>>>> +                       return -EINVAL;
>>>
>>> Why double check? You may move it out of the (count > 0).
>>
>> Two checks will always be needed, so I don't entirely see
>> how that would be better.
> 
> But not nested. That's my point:
> 
> if (count > ARRAY_SIZE())
>    return ...
> if (count > 0)
>    ...
> 

The old code has either 1 or two checks if there is no error.
Your suggested code has always two checks. I don't see how that
is an improvement.

>>>> -       if (ret == 1)
>>>> -               hw_margin_max = hw_margin[0];
>>>
>>>> +               ret = device_property_read_u32_array(dev->parent,
>>>> +                                                    "rohm,hw-timeout-ms",
>>>> +                                                    hw_margin, count);
>>>> +               if (ret < 0)
>>>> +                       return ret;
>>>
>>> So, only this needs the count > 0 check since below already has it implicitly.
>>>
>> Sorry, I don't understand this comment.
> 
> if (count > 0) {
>    ret = device_property_read_u32_array(...);
>    ...
> }
> if (count == 1)
>   ...
> if (count == 2)
>   ...
> 
> But here it might be better to have the nested conditionals.
> 

We know that count is either 1 or 2 here, so strictly speaking
	if (count == 1) {
	} else {
	}
would be sufficient. On the other side, that depends on ARRAY_SIZE() being
exactly 2, so
	if (count == 1) {
	} else if (count == 2) {
	}
would also make sense. Either way is fine with me. I'll leave it up
to Dmitry to decide what he wants to do.

Thanks,
Guenter

>>>> -       if (ret == 2) {
>>>> -               hw_margin_max = hw_margin[1];
>>>> -               hw_margin_min = hw_margin[0];
>>>> +               if (count == 1)
>>>> +                       hw_margin_max = hw_margin[0];
>>>> +
>>>> +               if (count == 2) {
>>>> +                       hw_margin_max = hw_margin[1];
>>>> +                       hw_margin_min = hw_margin[0];
>>>> +               }
>>>>           }
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
