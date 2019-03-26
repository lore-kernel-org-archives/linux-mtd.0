Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051DEC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 07:51:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66E020828
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 07:51:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ov0DSZ4/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="sXoGtaPO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B66E020828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/5tixWE+dvQlGwHgH0M5K7z7FQd6kTHGDEBfke1TxwI=; b=Ov0DSZ4/+YzBwmzEZs/I4mdjK
	cwZgQ7vp8smk9tZrblgYPOaZOcuf1VRgt5k3CIjmvswoLNsld1EaNUqHONp/F+NhIvwcSDDOp+OfX
	o68SsJqa1P8ZaTTiysIHt7MkUzJKgBl3FvQMTMAawMKj3/gHrKBf9Jq2kimJ4ThJpqMEOeR0I6UVQ
	G8yAcVfJ1WQxwKdJsZcujVgHfPfGhfOQxwiTjCTFKs1IuzpFlJeLaNjCS+NA+Bvjmhp6AShvIfXTC
	IEhNpzXTN/Sh9DWB3SNwF9rZUFKi1eN3xtQ4vKO3PLIaZPXpArROO4cyY6zTWpxMGIdVGPLuv/KiN
	Sg0asS4og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8gsE-0002CR-On; Tue, 26 Mar 2019 07:51:54 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8gs9-0002B2-BV
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2019 07:51:53 +0000
Received: by mail-lj1-x242.google.com with SMTP id h16so5729778ljg.11
 for <linux-mtd@lists.infradead.org>; Tue, 26 Mar 2019 00:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B01lGyfJBsAdGUtQGWQpzVe+7/KX45Rc7+rWFjohi0o=;
 b=sXoGtaPOpaD9D53XCcm8wcxwm1LFUwVg4IMAN/WVKJTQIo7hZQl+sni7ILF/4GAymN
 q3xDP9Z6bdPumfRWIn2V0nNtgeKeaYKCHaBpQMxvMgWhPDGJ9M96czwD6jwRGe6EJLW/
 UUtzAEoWBrXxKG2PVZCngkFkdxy64+T5xyVoWPeYcy/KQ+PuRlDRRaEKaP0SIo+cO3Yh
 /+M8e/XRxZ49UbnLV+3fNDzx0ZgjjP4hSduPYRu1q9RnU9GmaWC8yYbEzideiPNt18wq
 WojzOTSpa0a4r4uMxEK3L6k0zaZFvFMcR1SYAi7nadIty4Y3kK1fNGK7Fombn6B/70lu
 K7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B01lGyfJBsAdGUtQGWQpzVe+7/KX45Rc7+rWFjohi0o=;
 b=jCJZR4mre95ZV/T6ZVm8fuJMw5H3MIOB15lSJP6lSUdGTpLtvWwdBe4CBZgQDMxo2u
 Kib1ry8ke9CvonpdzuoZSVlBVhvvdCmpsYWIG62QhheVaeCmCJKgqLAWkezrZYLLRwof
 u1iTJrtnY8KJlYBV8L59wsZiF9scOZrKQM5UW/LqrCnYxyoo4SSpGxAB/I9cA9R3iyf1
 +SC7cmNA7owX45PUrkU4bVZWiI247UsRKGTwrFFk6IV5oDCm3/xLDL9dyZ6rzvWWIgQe
 3bOUIILWgmjlja9xf59piVklx0D/TJ6MwE6NxWbJZ00pRuvpUlj+9UrZ3cLycu2MHgq9
 lCow==
X-Gm-Message-State: APjAAAWXGF8EN3N0kuGBN+F86/JGaL9GSKAgWiWnAkOs9GHSjymsY24n
 CMTaO1CMS6szy1Foy11Z08meeQ==
X-Google-Smtp-Source: APXvYqzuG4lVrmC5DK2tFNK2dsX3zJVU4wg/Glb6yaxJZ8YcwCwtuYUbE+8Dza7NdgZrZWBXw7g8Sg==
X-Received: by 2002:a2e:4a1a:: with SMTP id x26mr13584393lja.49.1553586702905; 
 Tue, 26 Mar 2019 00:51:42 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.80.243])
 by smtp.gmail.com with ESMTPSA id k19sm3727508lje.7.2019.03.26.00.51.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Mar 2019 00:51:42 -0700 (PDT)
Subject: Re: [RFC PATCH v2 3/5] mtd: Add support for Hyperbus memory devices
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-4-vigneshr@ti.com>
 <98e1e3ad-75d3-670f-bcf7-27389cc60a98@cogentembedded.com>
Message-ID: <02dfcf5d-f7f8-f33a-22b2-462ea92b0702@cogentembedded.com>
Date: Tue, 26 Mar 2019 10:51:23 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <98e1e3ad-75d3-670f-bcf7-27389cc60a98@cogentembedded.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_005149_398127_5D2334C5 
X-CRM114-Status: GOOD (  22.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 25.03.2019 23:13, Sergei Shtylyov wrote:

>> Cypress' Hyperbus is Low Signal Count, High Performance Double Data Rate
> 
>     It's HyperBus, according to the spec...
> 
>> Bus interface between a host system master and one or more slave
>> interfaces. Hyperbus is used to connect microprocessor, microcontroller,
>> or ASIC devices with random access NOR flash memory (called Hyperflash)
>> or self refresh DRAM (called HyperRAM).
>>
>> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
>> signal and either Single-ended clock(3.0V parts) or Differential clock
>> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
>> At bus level, it follows a separate protocol described in Hyperbus
>> specification[1].
> 
>     HyperBus.
>> Hyperflash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
>> to that of existing parallel NORs. Since Hyperbus is x8 DDR bus,
>> its equivalent to x16 parallel NOR flash wrt bits per clock cycle. But
>> Hyperbus operates at >166MHz frequencies.
>> HyperRAM provides direct random read/write access to flash memory
>> array.
>>
>> But, Hyperbus memory controllers seem to abstract implementation details
> 
>     HyperBus.
> 
>> and expose a simple MMIO interface to access connected flash.
>>
>> Add support for registering Hyperflash devices with MTD framework. MTD
> 
>     HyperFlash.
> 
>> maps framework along with CFI chip support framework are used to support
>> communicating with flash.
>>
>> Framework is modelled along the lines of spi-nor framework. Hyperbus
> 
>     HyperBus.
> 
>> memory controller (HBMC) drivers calls hyperbus_register_device() to
>> register a single Hyperflash device. Hyperflash core parses MMIO access
> 
>     HyperFlash.
> 
>> information from DT, sets up the map_info struct, probes CFI flash and
>> registers it with MTD framework.
>>
>> Some HBMC masters need calibration/training sequence[3] to be carried
>> out, in order for DLL inside the controller to lock, by reading a known
>> string/pattern. This is done by repeatedly reading CFI Query
>> Identification String. Calibration needs to be done before trying to detect
>> flash as part of CFI flash probe.
>>
>> HyperRAM is not supported at the moment.
>>
>> Hyperbus specification can be found at[1]
>> Hyperflash datasheet can be found at[2]
> 
>    HyperBus & HyperFlash.
>   
>> [1] https://www.cypress.com/file/213356/download
>> [2] https://www.cypress.com/file/213346/download
>> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>>      Table 12-5741. HyperFlash Access Sequence
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> [...]
>> diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
>> new file mode 100644
>> index 000000000000..4c2876c367fc
>> --- /dev/null
>> +++ b/drivers/mtd/hyperbus/hyperbus-core.c
>> @@ -0,0 +1,183 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>> +// Author: Vignesh Raghavendra <vigneshr@ti.com>
>> +
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/hyperbus.h>
>> +#include <linux/mtd/map.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/cfi.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/types.h>
>> +
>> +#define HYPERBUS_CALIB_COUNT 25
> 
>     As I said, this seems platform specific...
> 
> [...]
>> +/* Default calibration routine for use by Hyperbus controller.
> 
>     No, there should be easy opt-out from the calibration method.
> Currently, the driver will have to define its own calibrate method, even
> if does't need any calibration...

    Nevermind -- the method ptr can be NULL, of course, so there's easy opt-out...

[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
