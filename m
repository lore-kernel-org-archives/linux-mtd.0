Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5FCC76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 08:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38y6XGQupQ4SBNLcxtcivN9tn4rq9LbSe1l80juvzDE=; b=B1EwxUCSpoN/Q4
	+TJB4ALI6E4cuWhRmdh0EOFYC7Iyxb2+bm2smfyPp1Q0q1DtmvzOOhyk39rqlsN84l9CBXtG+7kWm
	dH7mVHKlGAaBEQQlOKtNiI697/OlOTbP7T0aD/Gjhw2BH6MH3h+foEpC9oielY0NislECXWWSAZeW
	OLni274d7TIN55aHIa3uTuvZMjfkhIUKUF66ZPP46I1aqRaCwrs0GJ8eOvSgiAlyyj0ys5tjHcd99
	kYqGiYyyxWZCbPVkhLHJHqAX25NKEC0hyWCIQDntNAuDc3cd5q8ktMVZvqzSNy6IXwwHWRSQaJjrs
	QxOlxtoCSIBCHtZf1TOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFFF-00ETEA-2d;
	Mon, 03 Apr 2023 08:08:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFF9-00ET9a-2U
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 08:08:51 +0000
Received: by mail-ed1-x532.google.com with SMTP id r11so113789119edd.5
        for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2023 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680509322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kbFdGnGv8gQMTpiSIGpJTBMQrtJ8GeiVrrH/jfPC5tI=;
        b=IePFu8CoZee7pBGo2/L4MS3hHjo3XJ88BQTeO+VSgYcvPAQa+D052LEIy8f1sPzRL/
         Gcdmddb2wHBrV1VKAKxXJioHE8FVEPS5yK7k1ZvierQRODTUsLJQEJEiU4DA+w0/AQhq
         yoD6QHP4Ip7Ok4jNYFBOe6JqZoXXZYhAE2TzGWPwGjaR51U8vqpETrrzRC4ANkeiKrJW
         XtCDEuKlVJOnKJIdQ+gTAJ87uX3l2i2yDcDdY18o2z5p0HOn4uZM8fp+Xv0ehOAbzEN1
         adRrJqnaLemiOev75Rma9VLRKXPZ7FNvymFK/2tl8SG4mSGeix6RvmGI+LYdS9CM56kS
         vUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680509322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kbFdGnGv8gQMTpiSIGpJTBMQrtJ8GeiVrrH/jfPC5tI=;
        b=R7lPhRwzcaUKDV/yp/n1XSjTsvYPZalv9kvEHTife8dB6BM56jrJq5fbMj4X6+3Ntz
         usc4xjn8b2QXsKJApNO+igSYRycQXoqF6PRn/osfXdxT5Kv8Aj+el9hBBFLPDzinxXB9
         5CkpFnX5ggCxNPvvttQzrgMlSohn1MZKY3Dy18f77fgkX46WnoddWNi1yEEmMVswmav+
         Xvy0VdbCqj/HBg5aRpMJzXetm3Luxu9pfU4kMinvVy7ovQzulUK+/k9A2uN5vhVsQOI9
         kT2lwiai7Y9INvNzflLMDsQM4hjt7R1Kz/ed7cTEIpGPI4JBxsrzdIBTw9CZN46Knywr
         GcVA==
X-Gm-Message-State: AAQBX9ct7wsjOlIYN36J+dLH7vaD6lrnvtXn5mQLXJ/eL+c6hgYdMQw5
	mnxJaWR6JKfph08hbnW8gLfo6Q==
X-Google-Smtp-Source: AKy350afsa7c9+5bCjfKqZdi82Q3iSkoPx3cRfvyhCvI6kbTgmI9ofTHK4N55FM17ihU4rVvSZNWrw==
X-Received: by 2002:a17:906:1705:b0:8f4:ec13:d599 with SMTP id c5-20020a170906170500b008f4ec13d599mr35397891eje.27.1680509322043;
        Mon, 03 Apr 2023 01:08:42 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id dx7-20020a170906a84700b008d53ea69227sm4174007ejb.224.2023.04.03.01.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 01:08:41 -0700 (PDT)
Message-ID: <b7419e8b-fc8e-ce96-d984-52564d33ba19@linaro.org>
Date: Mon, 3 Apr 2023 09:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 8/8] mtd: spi-nor: macronix: Add support for
 mx25uw51245g with RWW
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: liao jaime <jaimeliao.tw@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
 <20230328154105.448540-9-miquel.raynal@bootlin.com>
 <8ade974e-eb68-f448-7ec5-91c6b636eacf@linaro.org>
 <20230328184536.33f2f023@xps-13>
 <CAAQoYRknqq7=HFAeAB=W59G5ui_t3VSt3Xa33YbXeWPtJyxQsQ@mail.gmail.com>
 <f243010c-72e3-6b59-6696-af7c7cdc6596@linaro.org>
 <20230331213743.25485970@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230331213743.25485970@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_010847_810497_94F34588 
X-CRM114-Status: GOOD (  24.96  )
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



On 3/31/23 20:37, Miquel Raynal wrote:
> Hi Tudor,
> 

Hi!

> tudor.ambarus@linaro.org wrote on Wed, 29 Mar 2023 12:12:29 +0100:
> 
>> On 3/29/23 06:48, liao jaime wrote:
>>> Hi Miquel
>>>   
>>>>
>>>> Hi Tudor,
>>>>
>>>> tudor.ambarus@linaro.org wrote on Tue, 28 Mar 2023 17:31:46 +0100:
>>>>  
>>>>> On 3/28/23 16:41, Miquel Raynal wrote:  
>>>>>> Describe this new part and provide the RWW flag for it.
>>>>>>
>>>>>> There is no public datasheet, but here are the sfdp tables plus base
>>>>>> testing to show it works.
>>>>>>
>>>>>> mx25uw51245g
>>>>>> c2813a
>>>>>> macronix
>>>>>> 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
>>>>>> 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
>>>>>> ffffffffe5208affffffff1f00ff00ff00ff00ffeeffffffffff00ffffff
>>>>>> 00ff0c2010d800ff00ff87790100821200e27704674630b030b0f4bdd55c
>>>>>> 000000ff101000200000000000007ca14800000000008888000000000000
>>>>>> 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
>>>>>> 727103b80000000090a3188200c069960000000000000000727100987271
>>>>>> 00b8727100990000000072710098727100f872710099727100f900000000
>>>>>> 00000000011501d0727106d8000086500000060100000000020001030002
>>>>>> 00000000060100000000000072060002000000eec0697272717100d8f7f6
>>>>>> 000a00001445988043060f0021dcffff
>>>>>> 047a884cf44d9ffc2a94d3ab37b48c63  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp  
>>>>>
>>>>> which hash alg was used, was it sha1? No need to resubmnit just for this.  
>>>>
>>>> Actually git just ignored all the lines starting with '#'
>>>> like if they were comments and I did not notice...
>>>>
>>>> I will amend my commit logs and resend.
>>>>  
>>>>>>
>>>>>> 6+0 records in
>>>>>> 6+0 records out
>>>>>> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
>>>>>> Erased 6291456 bytes from address 0x00000000 in flash
>>>>>> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
>>>>>> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
>>>>>> *
>>>>>> 0600000
>>>>>> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
>>>>>> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
>>>>>> d24a9523db829a0df688f34b8dc76a1383b74024  qspi_test
>>>>>> d24a9523db829a0df688f34b8dc76a1383b74024  qspi_read
>>>>>>
>>>>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>>>>> ---
>>>>>>  drivers/mtd/spi-nor/macronix.c | 4 ++++
>>>>>>  1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>>>>>> index 6853ec9ae65d..b65d41e5f749 100644
>>>>>> --- a/drivers/mtd/spi-nor/macronix.c
>>>>>> +++ b/drivers/mtd/spi-nor/macronix.c
>>>>>> @@ -82,6 +82,10 @@ static const struct flash_info macronix_nor_parts[] = {
>>>>>>     { "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
>>>>>>             NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>>>>>             FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>>>>>> +   { "mx25uw51245g", INFOB(0xc2813a, 0, 16 * 1024, 1024, 4)  
>>>>>
>>>>> Sector size and nsectors shall be discovered at parse SFDP time.
>>>>> Does INFOB(0xc2813a, 0, 0, 0, 4) work for you?  
>>>>
>>>> I'll check.
>>>>  
>>>>>  
>>>>>> +           PARSE_SFDP  
>>>>>
>>>>> Yaay
>>>>>  
>>>>>> +           FLAGS(SPI_NOR_RWW)
>>>>>> +           FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },  
>>>>>
>>>>> Is SPI_NOR_4B_OPCODES flag really needed?  
>>>>
>>>> I have no idea, I took that from older code.
>>>>
>>>> Jaime, what do you think?  
>>> I think Tudor hopes that SFDP table could determine how many address bytes.  
>>
>> No, no.
>>
>> :) and hope and programming don't get along.
>>
>> Does this flash define the 4bait table? Can you add a print in
>> parse_4bait table and check if SNOR_F_4B_OPCODES is set? If yes, the
>> fixup flag is not needed.
>>
>> SNOR_F_4B_OPCODES is an indication that the flash supports dedicated
>> opcodes for 4byte address, without the need to change the address mode
>> to 4 byte. When 4B_OPCODES are supported, we prefer not changing the
>> address mode, because when changing to 4 byte address mode, the state is
>> kept at reset (or power loss) and flashes might not be able to boot at
>> lower layers (u-boot for example).
> 
> The flag is set, no need for hardcoding it.
> 
> Excellent, I'll prepare the patch.
> 
> While I was testing I figured out: the bank size calculation happens
> too early, so if we discover the size with the SFDP table, that won't
> work. I'll fix it, feel free to squash the patch if you prefer.
> 
Indeed. Michael or me are going to fix the n_sectors and sector_size
handling soon. Separate patch is fine, I don't change git history unless
really needed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
