Return-Path: <SRS0=THda=RB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4B3C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 11:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C84E2087C
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 11:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NU0p79IE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="EJ0CesKu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C84E2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qBSvVWfsz5KCYwUXhcEGUQ6xBoy1ebQ40pBtdftKJk=; b=NU0p79IEmeZY4g
	XKfI4WR8h8jMXhnMeM2bKqqf0FQM8SIaXfC7FRn6U/UB2Dsw5iuVEmktSY3j9wArb5uH1SAV9qg49
	CdAB/pCXjHXBidiYigpsogbjgTPRZZ7DKoFiu+qIY9Zi4+C4rpuWfJMjpUs8bBgP1L7JIHPz10074
	dQgoV/VgD+oQdr3YOiBUzFnHPPolbzdZF3vVrkHi8QIpd7LyN4jQqUyi40CZOoCVOlj2xSovMInqh
	aeoWGD6ASgWk0pL79QFBIIqqnCJ4gQrQqn3XsHsQr7bznNPMQnAKixKrEvknsOQkaO5BpiXaKBTQd
	M2W1KLvemCO+Q38a0xWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyabR-0007Fl-HT; Tue, 26 Feb 2019 11:08:49 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyabI-00077c-7r
 for linux-mtd@lists.infradead.org; Tue, 26 Feb 2019 11:08:42 +0000
Received: by mail-lf1-x142.google.com with SMTP id 131so124101lfa.5
 for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2019 03:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MmT2bhGXf855NhayL42e55l02s2pwbtP++zHTAeMAB4=;
 b=EJ0CesKu9JJXTrSgIGnzNfwmDzOa/sCoUwTHteG6cDHIfDPVoV0G46+NH8wSJCPUTC
 UzWYrvGtUWtIrlFrF/NZdhoILm9aVnmZmlytvzZTdqSpQnWSrh2RsXA2aJDSHXpqo/gU
 WvVXqsHSV31dHg5jzI08chgk9ttfqns8Ou5Kbud6TY35v59rhVEd7UP4p9U7dWedQAUy
 +qCMgFfHd03ktyj9kG26yCd90zIZh2hKqRnnfwi7gGnKTGIftBzBDLaXftNrFzfGkXvQ
 0MEQtF+OpDV0Bjaf3R6qz+fFJdiEl8Wf5vLSvszcQULs3GZqUIgB1p8A9/FRzCA7ZZZ+
 xEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MmT2bhGXf855NhayL42e55l02s2pwbtP++zHTAeMAB4=;
 b=uE3WmOrq8E1wNZbzAM5UZ6DE8OKGKNwNcq5cxK3vh6rrp7T4QAE/2zOWnETnAg4Npu
 4U4j1NEp9QVs0SBL2freXpqtHjV8E7QdleK9knu6l5RDlEMZ1ITycTmiAqrjwRr+V3Md
 KMYUKZlqb4gDKkh9w2h8oQq/ryMwmn87PwXOw2GJZqAspCSf6dAJ6U+kU/TYNvjOzY+Z
 aZO8BK9urvlM4dVKS1MOAP5A44kqM8TEzyyAN3yHuiRs9tuf7Opy0GI6onOVkf3GJnsQ
 ZNLVIsUqFzqX7zyBl9JkrWSrZ//TkYMIJ+dmSkDsWAkgVtkewXZc9r+0WBwXjj4jB1fd
 lFEA==
X-Gm-Message-State: AHQUAuaPhRgczCR0H66zcieXoGq80lp+rqj4gAuGQ3sRXGHVQAj3DRqJ
 het2YKEmjj7yLhtjpge54tNGpw==
X-Google-Smtp-Source: AHgI3IargzVnZuZNT2i0KKBttBtDjolDxs+rDNmvDRV1sPMNY6K9rgEJZHp9WqwS+8eYM/RD3ucJaA==
X-Received: by 2002:a19:4354:: with SMTP id m20mr12920293lfj.115.1551179317931; 
 Tue, 26 Feb 2019 03:08:37 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.91])
 by smtp.gmail.com with ESMTPSA id g194sm3077350lfg.55.2019.02.26.03.08.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Feb 2019 03:08:37 -0800 (PST)
Subject: Re: [RFC PATCH 3/5] mtd: Add support for Hyperbus memory devices
To: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190219063607.29949-1-vigneshr@ti.com>
 <20190219063607.29949-4-vigneshr@ti.com>
 <42d0fd7b-42e0-605c-70ee-6e308908fc90@cogentembedded.com>
 <4910fda5-133d-7ebb-6ab3-49e0839ea920@ti.com>
 <95344724-214f-20b7-b629-149ddf396117@cogentembedded.com>
 <1137312b-c326-9e41-4667-e2126649f384@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <a208a121-53a7-7d9a-c2db-ba135e17d3a0@cogentembedded.com>
Date: Tue, 26 Feb 2019 14:08:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1137312b-c326-9e41-4667-e2126649f384@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_030840_419214_06580A43 
X-CRM114-Status: GOOD (  21.70  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Nori,
 Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/26/2019 01:26 PM, Vignesh R wrote:

>> [...]

>>>>> HyperBus specification can be found at[1]
>>>>> HyperFlash datasheet can be found at[2]
>>>>>
>>>>> [1] https://www.cypress.com/file/213356/download
>>>>> [2] https://www.cypress.com/file/213346/download
>>>>> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>>>>>     Table 12-5741. HyperFlash Access Sequence
>>>>>
>>>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>> [...]
>>>>> diff --git a/drivers/mtd/hyperbus/core.c b/drivers/mtd/hyperbus/core.c
>>>>> new file mode 100644
>>>>> index 000000000000..d3d44aab7503
>>>>> --- /dev/null
>>>>> +++ b/drivers/mtd/hyperbus/core.c
>> [...]
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	dev = hbdev->dev;
>>>>> +	map = &hbdev->map;
>>>>> +	map->size = resource_size(&res);
>>>>> +	map->virt = devm_ioremap_resource(dev, &res);
>>>>> +	if (IS_ERR(map->virt))
>>>>> +		return PTR_ERR(map->virt);
>>>>> +
>>>>> +	map->name = dev_name(dev);
>>>>> +	map->bankwidth = 2;
>>>>> +
>>>>> +	simple_map_init(map);
>>>>
>>>>    It's not that simple, I'm afraid -- e.g. Renesas RPC-IF has read and write
>>>> mappings in the separate memory resources.
>>>>
>>>
>>> Hmm, could you point me to public datasheet of the controller?
>>
>>    See chapter 20 in [1]. Note that it's not the same SoC I'm developing for (R-Car
>> gen3 family, with NDA docs) but should be mostly the same RPC-IF core.
>>
>> [1] https://www.renesas.com/us/en/doc/products/mpumcu/doc/rz/r01uh0746ej0200-rza2m.pdf?key=74862185b5e22ad09e648d21a35de615
> 
> Thanks for the info!
> 
>>> simple_map_init() provides default implementation for map operations
>>> which is overridden, if hb_ops is populated.
>>> I think, Renesas RPC-IF can populate custom hb_ops struct and use
>>> appropriate MMIO base for read vs write, while still reusing the map
>>> framework. Wouldnt that work?
>>
>>    It probably would...
>
> Looking at above link, I see there are two HBMC controllers on Renesas
> SoC. One is a dedicated HBMC controller(chapter 21) very similar to that

   We don't have this one in the R-Car gen3 -- I wasn't even aware of it. :-)
RZ/A2 is newer than gen3 SoCs.

> on TI SoC and a SPI Multi I/O Bus Controller (chapter 20) that also
> supports Hyperbus protocol.

   That matches to the gen3 RPC-IF core.

> AFAICS, passing custom hb_ops is good enough to support both HW needs.
> Let me know if something is missing. I would greatly appreciate if you
> could test this series with your HW.

   Yes, I have stated the conversion from the simple mapping driver.

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
