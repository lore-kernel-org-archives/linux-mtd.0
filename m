Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBC6C61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5f3v2jRWhwwRNw6BDt75bRGPcqkZOHV6qyTk1J7Ii8=; b=tu32qj8IihY6/F
	4YuvKj9KFBwT/YcmmsRrY62h8GhaYCxc9t4N4LL2u55o9YEmNIEQAodia/OICmEnbrvOZlvfypgKV
	yLiuf83KTfTHme//3HmiBz63H3DOerYCx2PYVHkEgqZmMfzmiIfzh23XMQig+nFP5ejmY8Ht0QC55
	9kMQNnaD8nGW883aFBQKt7HWGNqsewUKigj+7SXF7wVZ2hGe93pzDgxb3TNXBh1eC03SJtqmAS/0i
	ry/EflYV1dZQwGhULQUyY/YbudGxQUfhEruFmt7nAYF8RO+Z9G0mru8v65N2Ny7bFq+zKpNwMQK2h
	kgxX8bQ6mwrech+x+clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNvCx-001m3W-Vy; Fri, 03 Feb 2023 12:30:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNvCn-001m0f-2N
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 12:30:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso3712648wms.4
        for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2023 04:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oliUtLWESo3lQu6iHKqwx+2QOwN2sNCjDu921E6eImU=;
        b=PC6jnhprbBOYA5gQ8hht4uhJybrq7/0C64ACU2Gt9qfbW1pk9VfapwtzsEQiHMXbWG
         1JppW/crId+0Ce/5NY+vbYD8aQrWah3VOr/cgyiKfrz+CsV1xjGADT9tWMUyPppehNBX
         SC0wy/PcQSuekQwM7g/y6t2SL8B/Gkosz5mtmibN43bNv0b1mD4tCXB0banPcItFJwfc
         i54CE0XoHTzA+jAmoTtBHleO+mnp2xAR7FyjhdHzEDNwwY9TdNXm+ghb8j6ArobpiwRR
         9hn30hxFYj4ol+bMYzOz9KNKlsouP5G6WIVr/nA+qavbwuBMicrP2QKe1d5rCLF7jiXP
         ViLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oliUtLWESo3lQu6iHKqwx+2QOwN2sNCjDu921E6eImU=;
        b=4A6BN8B0WT32cr0waLgwfPZiWi4LvEct0GnZ6dw6EKDxP29jhGWwCz81V079DoPZyU
         yIlKR6SYIM7G04UYIZPYxwMlQbbcz9R3AKKoaSRMTFNtVkHJPaWrTKiLAr2TijYSvAnA
         H1vmQhzDSU1THv3YE/oWGqTDXisxG6S6ziEnelLu9PRz2xywJG/ISyczrMawqbDywx/n
         v00zVCukFVhLZ05PwZSCutY/rYL0oVGtdEaTS4ixoomusNa/Z1GxhPKOg/Zr01PZI7EY
         n10ONA0kA5ZEr5JGumcBKDCrhejIBF22iwLdiiG+aOPuwQ4TBuTv4eFXSHH6kUHjs7ug
         jaOw==
X-Gm-Message-State: AO0yUKVU0H78Q7A1GZd92AS/9aPHvxGFfV1qoAcOGg/9tgDXOD1S9srP
	809TqymjYNzulti09B//4BCDXA==
X-Google-Smtp-Source: AK7set8hvfzN5yvSx0vn3SHDYBE0Cu37jFl12DeSADMr5lTBdrNCrV6wJaZ+esFXBrp8t+sFKTfd2w==
X-Received: by 2002:a05:600c:4395:b0:3df:9858:c02c with SMTP id e21-20020a05600c439500b003df9858c02cmr4411370wmn.1.1675427409090;
        Fri, 03 Feb 2023 04:30:09 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm2871505wmc.4.2023.02.03.04.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 04:30:08 -0800 (PST)
Message-ID: <e50fe7d3-0c73-d4af-9a61-74d1279202cc@linaro.org>
Date: Fri, 3 Feb 2023 12:30:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] tree-wide: trivial: s/ a SPI/ an SPI/
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-wireless@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-rtc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org
References: <20230203101624.474611-1-tudor.ambarus@linaro.org>
 <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
 <Y9z0bQ8TeFROA0Fj@sirena.org.uk>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <Y9z0bQ8TeFROA0Fj@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_043013_154669_EAED39EC 
X-CRM114-Status: GOOD (  13.19  )
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



On 2/3/23 11:47, Mark Brown wrote:
> On Fri, Feb 03, 2023 at 11:28:03AM +0100, Geert Uytterhoeven wrote:
>> On Fri, Feb 3, 2023 at 11:17 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>>> The deciding factor for when a/an should be used is the sound
>>> that begins the word which follows these indefinite articles,
>>> rather than the letter which does. Use "an SPI" (SPI begins
>>> with the consonant letter S, but the S is pronounced with its
>>> letter name, "es.").
> 
>> While I agree with your pronunciation, I believe the SPI maintainer
>> (which you forgot to CC) pronounces it in James Bond-style, i.e. rhymes
>> with "spy" ;-)
> 
> Yes, I do.  To the best of my knowledge most people just say "spy"
> rather than pronouncing the letters or anything.
> 
> In any case as I said in reply to one of the individual patches English
> isn't regular enough to go with hard and fast rules on anything, and the
> letter rule is much more commonly used where something is needed.  Using
> an here looks wrong to me, and the fact that a is so widely used does
> suggest that usage has escaped whatever rule there is.

Indeed:
$ git grep " a SPI" | wc -l
131
$ git grep " an SPI" | wc -l
88

Ok, let's drop this patch.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
