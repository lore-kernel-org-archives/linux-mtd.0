Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4366FC3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etxASh+SisJc6MOoTbs6Zb1SzFXHHaXFpTL/JbX8nNA=; b=kItacLzdg7sEWM
	xMxSzhdAiE5SdAhyeH3f/1pXnVCvNW9f+cuViM9/kLsWPszraAbC+iriHbi44830jV+KlfmHW9emt
	/JJqG5XwW4loXZoaBtK/YdkXcmGJTGfq83+T5IVSPnDuAUG4wnid7iT97D7dI7pW5uKBEvpAj07Uj
	hSKYvbC7ikmVhxI5Gyg93azePEour4HJaPq0p3foWiJC4WSQo7VpUOpD3m16IQe/nKwaCf5Q6FmzB
	Eava1vzZJmhKgoprvugLc+x3uIPHb2LvNgi68HivzrdyXmPKd7g186ty4NvNqK2o/LH098RDZj4ZW
	JtsDABlClHIYp1H3zrkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHHR-009xq0-CE; Mon, 02 Jan 2023 09:38:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHGN-009wkK-6b; Mon, 02 Jan 2023 09:37:50 +0000
Received: by mail-ed1-x52d.google.com with SMTP id c17so39211329edj.13;
        Mon, 02 Jan 2023 01:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XzIKgubKsbYp6CHbNgEC7oTL3o/23K1nX1884mvfwHU=;
        b=G19KnHZkfpxRRK8GEtPuLli3UOIw8JaGumkCm3OfvuuGgyvVoIItwF9UL+YKeEoziV
         tVaLLp6LncTO3aVNx9fajlVFGGY7KPLBg9VJc5aEjDTIbcKpgiC20I7uipBOUNWxxKrm
         7sp0QkboCr+8Ff/nn9QaP4Aj+bjlHzvfmjUG+/BPqrAI85dL9RC7fFT8iT78Y37gCR8G
         4Trio+r7k/Xog96G03l5kDStW939gVOFO6X8zHcaM+ChvSCsr1iwZDqg6bBklfD5R3KL
         TNn7fidXDuMzE2IAC671VcdQmkt2pAoq1Qw5K9XVeS9rMR/iCoCi45F1zjojjcYdLJ0I
         jweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XzIKgubKsbYp6CHbNgEC7oTL3o/23K1nX1884mvfwHU=;
        b=IertOYkKn/az+OdGVhEOgaWs5q3tWmTU8GhXS8BbkFGpleIyAzaWnPRj3g7gQEtEv9
         lg/vsEqgViY3gMMj5gHLyEZztoi+bqno/sCUV2jMlxN2yGlLLoo7ENObNXetPUOC786a
         LZCCmiu12Ys9+FRlyIJknthx0OduV19EzaiEP7mmlpiDYvxxvIKuk4BHKB7tikG/Rsol
         9Q7AFW2Hb8c6HTlN+wY13n75rmR4ufWAQcBSfYUHwXwEQ42OB4Z7X10hqUoYmCV62Q8B
         EbJFXjXEA8v9g9m+yuWAsqxJvMbExhik/n4Uz5xq2h2AQFaaVKrzV+z/u/ubJCkfFy/1
         i3Lg==
X-Gm-Message-State: AFqh2kriI1EYeCu+85w3i4hDCUWDHfE/6jxkTb4s3pVsb/s7//hQVVkG
	+AvVriSvgTRN4Vns5TITa2Q=
X-Google-Smtp-Source: AMrXdXuS1dQR4WrrMJ2ZYnuZUsvK51zUK97T9LdHUD8iN13xlT2i9x/voG32HeRtdP8fLD4ew6NlcQ==
X-Received: by 2002:a05:6402:b3c:b0:47f:ab65:b3ff with SMTP id bo28-20020a0564020b3c00b0047fab65b3ffmr30127650edb.35.1672652262900;
        Mon, 02 Jan 2023 01:37:42 -0800 (PST)
Received: from [192.168.0.104] ([82.77.81.242])
        by smtp.gmail.com with ESMTPSA id bo6-20020a0564020b2600b0048ca2b6c370sm2385835edb.29.2023.01.02.01.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 01:37:42 -0800 (PST)
Message-ID: <28da9e33-57e8-7ac1-7e6c-13c297a945d6@gmail.com>
Date: Mon, 2 Jan 2023 11:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/8] spi: dt-bindings: Introduce spi-cs-setup-ns property
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, nicolas.ferre@microchip.com, robh+dt@kernel.org
References: <20221117105249.115649-2-tudor.ambarus@microchip.com>
 <20221118141458.954646-1-michael@walle.cc> <Y3elIdM3Xz1H4kKk@sirena.org.uk>
From: Tudor Ambarus <tudor.ambarus@gmail.com>
In-Reply-To: <Y3elIdM3Xz1H4kKk@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_013747_703618_B687D24E 
X-CRM114-Status: GOOD (  14.26  )
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

Hi,

On 18.11.2022 17:30, Mark Brown wrote:
> On Fri, Nov 18, 2022 at 03:14:58PM +0100, Michael Walle wrote:
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
>>> +  spi-cs-setup-ns:
>>> +    description:
>>> +      Delay in nanosecods to be introduced by the controller after CS is
>>> +      asserted.
> 
>> Does this need a type as the spi-cs-setup-ns is apparently just 16bit? At
>> least the driver uses it that way.
> 
>> But IMHO this should just be a normal uint32 value to be consistent with
>> all the other properties. Also the max value with 16bit will be 'just'
>> 65us.
> 
> Making it 32 bit does seem safer.  I've applied the series

Thanks. There are few implications to consider before making this prop a
u32, and I'd like to check them with you.

struct spi_delay will have to be updated to have a u32 value, now it's a
u16. This means that we'll have to update spi_delay_to_ns() to either
return a s64 or to add a u64 *delay parameter to the function so that we
can still handle the conversions from usecs and the error codes in the
SPI_DELAY_UNIT_SCK case. Then all its callers have to be updated to
consider the u64 delay.

I don't know what to say, I'm in between. 65us delays are improbable,
but I'm fine to update this as well. Let me know your preference.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
