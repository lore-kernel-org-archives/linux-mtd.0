Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FA8C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 23:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ip3/oH/VROeZESJi6E2d8M0SXFAgDG/vZnQrn8cSHeE=; b=19pRHAMaLaWdrG
	zVz1ECjhN/tLeE556xG0SVp8WSn8zd8KrBVzbi1E32bU+k+4aV5tD7obLIwd+sKSPdarwUgZ1N0/3
	VH+X9BCbDukAUKMvlfSjpOTiXjGoY2+rJt4jOpg/x5ks4A70yaJIQLgHed9ombaJutkUXynt8FpUs
	uZDwFicmaW6dPjaLEzufu1ILRdGbHnML4ebc+fotUfk4K9mfSQltlJGosrfIkiJtCPWBBVKgHND0l
	dOYhaU3n8zK8m+HMvwu3IyUVevFCyr3HhvDhg0lrfLEghZVTiPx6zK/7nKTF6JlUnVvHlhdqFmnnH
	f0/Cczuis0oIg04Eqgvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkZk6-00CzeI-9P; Fri, 29 Apr 2022 23:09:42 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkZjt-00CzZ9-GU; Fri, 29 Apr 2022 23:09:31 +0000
Received: by mail-oi1-x22b.google.com with SMTP id y63so10035622oia.7;
 Fri, 29 Apr 2022 16:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=43bhXKjvki5l9d/uYFdijwNa1GUErzr1H3q463hR+XU=;
 b=OUSt6wkRUbg0ovBrwSGrseeTfVqA3atJE26IGGL8DNDKMbVWyzV7fWqixesYb9S/mA
 rgBp/vgWVmZ/2SlxqdaVKFisC/DX2eo4pEgNEmTUveV61siwDvexnXReKJ4KInzJ+JVf
 qFRYIk57Zf7KE5IqQd6E9kuwLyNvXqeY18u9sXPldsZHCbpZQ9kw31XwNt/jpYsmggt1
 3DzogSdIaSMtewj0hqjuAW3EwbG0+z+yCYsMAftASTL8pYSQ3/TIzpEEpEvE1aCdKITD
 c0o8+XWDHiHzhST5JtA4/c6tGuJLD552k5cdjIV4SeeCvbAOGItN9qS8zGZ2A17U8O+I
 msTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=43bhXKjvki5l9d/uYFdijwNa1GUErzr1H3q463hR+XU=;
 b=qLYRrqYV9JVirloc0I6h+lRQw5KQULvEjMnu4Lr1hKA3i4PrTVBkijf6WwB63txdgN
 DcFsR0aU5wyOo2twxilqpXlTM6PPgi4UFT5ToJ4iAcNp3yw9992aVE4WJkvKn45M8IzJ
 1FwKf/NejnI6z3fvukimMdSHRTdNQz+Y0GzCH/8qiiIHztjhVniseRn6eaOIB4b4dDnT
 BEKwSF7979abjlM2SSGfLxEwaUQjGYh46uwU871oNwuBar0IvI323QzmiPEIx7vDjTFX
 kn9Bs1dMpSyrzbL7SSBAMREDHUOcoXoQi103JBCQ75UCQ2wmkuRizxvLjmE89OzLUKrY
 8vKQ==
X-Gm-Message-State: AOAM532TSflJ3mYzuJEmhDAhwryJkRFSa+vXtOjACzHHtHHEyoXKFZdV
 eLtJlUiTm+t7KyMyAZlnkYE=
X-Google-Smtp-Source: ABdhPJwXwAJF7RkFvU52UI/VP0gJxz700pwOLyrX7CYTkoQTpT4bc4rvMjOD84iMZwh8LrG+2Nl3bg==
X-Received: by 2002:a05:6808:17a7:b0:325:c561:31fb with SMTP id
 bg39-20020a05680817a700b00325c56131fbmr1544693oib.75.1651273765807; 
 Fri, 29 Apr 2022 16:09:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a9d77c1000000b0060603221242sm230484otl.18.2022.04.29.16.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 16:09:24 -0700 (PDT)
Message-ID: <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
Date: Fri, 29 Apr 2022 16:09:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Philipp Zabel
 <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, Helge Deller
 <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-rtc@vger.kernel.org,
 USB list <linux-usb@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
 <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
 <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_160929_613896_B3FF0A0D 
X-CRM114-Status: GOOD (  16.34  )
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

On 4/29/22 14:46, Arnd Bergmann wrote:
> On Fri, Apr 29, 2022 at 10:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 4/29/22 10:48, Guenter Roeck wrote:
>>>
>>> I tried the pxa-multiplatform-5.18 branch. Its failures match
>>> those in v5.18-rc1.
>>>
>>
>> Uuh, wait, the build wasn't complete. There are still some
>> failures. I'll report later.
> 
> Sorry about the breakage, I got a few more reports about minor build errors
> and warnings, the newly uploaded branches should address all of the ones
> I got reports for.
> 

Unless I am missing something the failures are the same as before. See
https://kerneltests.org/builders/qemu-arm-testing/builds/74/steps/qemubuildcommand/logs/stdio

This is with v5.18-rc1-49-ge8ab9a9a2745 which is the tip of
soc/pxa-multiplatform-5.18.

Should I check a different branch ?

Thanks,
Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
