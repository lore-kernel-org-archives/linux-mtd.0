Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB05AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 04:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbHwJD2sseHaNxOEvGpI8O8mcpW1l00HBw+JbQV5gf0=; b=m/U3dFk6pFqcu4
	FzAlOuNym5Kb7yXhPndNBPlrR22wNVqQcXFjbPxIFRtsHePaIS7fiDlcE87W9UGzdOhOhnTDd1xFa
	szRKk8whS2NLwRVHdBSxsZwpyZNZgBJZJl1tut4aF1OFM0uu6aPGclotrn8CNajmaM/mXLMlE5C/P
	72wUlnr3iSizbqj9djOK8bvbGWtTwFV6a/WiPEIKq02L/9PKZTFD4D36jJ7FNqbgRbuz13hpwmRh4
	8Q7vkMYP1VjMT7BXN8uaG1KGJGtrK3Gl5n0W3WKOzCSRxYluJ7kZ7kkysiZm5A2HnW3USZn+u6cfQ
	xqFCL1q30Gnhf/ihcgbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkYU-00HXpE-Ct; Fri, 22 Jul 2022 04:46:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkYR-00HXoB-Le
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 04:46:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id g17so3670658plh.2
        for <linux-mtd@lists.infradead.org>; Thu, 21 Jul 2022 21:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nPQMePpEOcBcAlQA4pjUDgKOieJexuz8wRZ/TeBjJyQ=;
        b=AZuyZGj8bKK+Coe6GylwToKQqjxQYAvoaT9LnakXQpCtvU6BEHwBxcvLePsgxlcAGm
         FKDcfG/sj28CGgEd4xP/WFKkrVzBuR2/DUaCXqCxzAsKwIEGX5b/vO61vVEAjLVYRx9c
         C3PTbar5qGwkm4gAolAELbGyZRjv5oejhTEpLmeAf92znWR3JJLwBcK2foxUeL0C3OqR
         3Q3KHKKo0VN0xgepLWsW8e4MXqusgbwAwjCapGrf3u/2YYcOx3P3O7sfzWbG7XNh5GQZ
         f0jxmpgovJryy8tnIgcwxcmlZLivb0mFXiISN4ixSh2fG+00gIu584Z3l8TTNdUv/V+t
         fLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nPQMePpEOcBcAlQA4pjUDgKOieJexuz8wRZ/TeBjJyQ=;
        b=WawpNgEZ29nKxJu/3h2PK6tW5q/K0CS9sfUKf6m0lSaCoEyU881+0FciIfqKGRuhHN
         p+cf/RDf3sUkSDpNaRxxc6qQpjIC5xcP3GBvxHy0+CBrdr2iBLlfWEIJDUgzuvdV8QS1
         H+YqQoBkwVVgJgjRJS6bgPPjKFrab0uJ/V8AW1htzVXWWxpgg5fk3W7cXZ2/+6qG8SZz
         8Yl9O4N4ymcAP1UUF6vtjQ41Xw69XYo973h0tn/GY+kl6JaXKgazhv9swQnj+JOwu38g
         1g19CoT899b1e4UI3+EYvTajo2z/xdnvbvSPrvtGcB0Ohk6BesYc5VjYTYk11C1h3WKb
         lFvw==
X-Gm-Message-State: AJIora8KG+owpp56otmdmOsphpy9LICeTs/8zHrowpGaDUf4TyYOSD0b
	DsicUyWw1wAcqvX7wkM++pY=
X-Google-Smtp-Source: AGRyM1v/zz93LuedvSEg1edfxeotp23x6pXB7KfCpy764hf4FjGHDkf+A/LDhXVGrJkhjvHKS9bpAA==
X-Received: by 2002:a17:902:d2d1:b0:16c:43fb:a363 with SMTP id n17-20020a170902d2d100b0016c43fba363mr1644857plc.8.1658465182099;
        Thu, 21 Jul 2022 21:46:22 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id q14-20020aa7960e000000b00528e84c3093sm2751668pfg.143.2022.07.21.21.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 21:46:21 -0700 (PDT)
Message-ID: <2912f41b-5966-b08d-0b52-97eba3a809bc@gmail.com>
Date: Fri, 22 Jul 2022 13:46:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, michael@walle.cc
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
 <c42d5930-73cd-6dbe-f650-db72f35188a5@microchip.com>
 <a035a1a3-0d82-48ab-5d09-1d5164999890@gmail.com>
 <98fa98f2-055c-2338-6790-de99670e20ff@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <98fa98f2-055c-2338-6790-de99670e20ff@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_214623_739386_42792C72 
X-CRM114-Status: GOOD (  29.35  )
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

On 7/22/2022 1:20 PM, Tudor.Ambarus@microchip.com wrote:
> On 7/22/22 07:00, Takahiro Kuwano wrote:
> 
> Good morning, Takahiro!
> 
Good morning, Tudor!

>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 7/22/2022 1:06 AM, Tudor.Ambarus@microchip.com wrote:
>>> On 5/23/22 10:49, Michael Walle wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Am 2022-05-14 05:51, schrieb Takahiro Kuwano:
>>>>> On 5/13/2022 6:40 PM, Michael Walle wrote:
>>>>>> [btw the subject still has the old name of the addr_width]
>>>>>>
>>>>> Yes, it must be fixed in next rev.
>>>>>
>>>>>> Am 2022-05-13 03:26, schrieb Takahiro Kuwano:
>>>>>>> On 5/13/2022 7:14 AM, Michael Walle wrote:
>>>>>>>> Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
>>>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>>>
>>>>>>>>> In 4BAIT parse, keep nor->params->addr_width because it may be used
>>>>>>>>> as
>>>>>>>>> current address mode in SMPT parse later on.
>>>>>>>>
>>>>>>>> Mh I'm not sure this is needed at all.
>>>>>>>>
>>>>>>>> SFDP spec says
>>>>>>>>   Variable address length (the current setting of the address
>>>>>>>>   length mode defines the address length)
>>>>>>>>
>>>>>>>> and
>>>>>>>>   When the length is defined as variable, the software or hardware
>>>>>>>>   controlling the memory is aware of the address length mode last
>>>>>>>>   set in the memory device and this same length of address.
>>>>>>>>
>>>>>>>> We don't set any address mode until all the SFDP parsing is
>>>>>>>> over. Therefore we should always be in 3 byte mode, no?
>>>>>>>>
>>>>>>> Actually there are some devices that have variable address length but
>>>>>>> 4 byte mode by default (I will work on those devices after this
>>>>>>> series
>>>>>>> is settled). To support such case, I prefer to use
>>>>>>> params->addr_nbytes
>>>>>>> as current address mode so that I can fix it in post_bfpt_fixup()
>>>>>>> hook.
>>>>>>
>>>>>> Are there public datasheets available? So these devices have a 3 byte
>>>>> I will send datasheets to you in another email. At this point, only
>>>>> summary datasheet is available in website.
>>>>>
>>>>>> and a 4 byte mode, but after reset, they are in the 4 byte mode? Looks
>>>>> Yes.
>>>>>
>>>>>> like it should be fixed in a different way. I'm not sure the "current
>>>>>> mode" handling is correct.
>>>>>>
>>>>> Yes, we may want to introduce a new flag like SPI_NOR_4BAM_DEFAULT and
>>>>> check
>>>>> the flag in BFPT parse. Once I send another series, please review.
>>>>>
>>>>>> We need to differentiate between the mode the flash currently is using
>>>>>> (nor->addr_nbytes) and the mode parsed by SFDP (params->addr_nbytes).
>>>>>>
>>>>> The flash's address mode affects the address length of Non-4B opcodes,
>>>>> including read/write any register ops used in SMPT parse and Infineon
>>>>> (spansion) specific hooks.
>>>>>
>>>>> The 4B opcodes always take address length of 4 regardless of flash's
>>>>> address mode. In these Infineon chips, 4B opcodes for read/program/
>>>>> erase are available and 4BAIT advertises them. We don't have to enter
>>>>> 4 byte address mode for read/program/erase.
>>>>
>>>> btw. this is a pity. you are using the stateless 4b opcodes but
>>>> then you don't provide stateless opcodes for the read any register
>>>> op :/
>>>>
>>>>> So, I think we need to differentiate between address length for
>>>>> read/program/erase and flash's default address mode.
>>>>
>>>> Or we keep them in sync. E.g. switch to 4bytes mode if we are
>>>> using the 4 byte. Granted, that sounds like a hack :)
>>>>
>>>>> Obviously we are using nor->addr_nbytes as address length for read/
>>>>> program/erase and should keep this usage.
>>>>
>>>> Yes, I wasn't aware that we actually two different runtime
>>>> parameters:
>>>>  - the read/program/erase address width, also used with the
>>>>    4b opcodes
>>>>  - internal mode 3b/4b. Up until now, this wasn't an issue
>>>>    because either the mode was switched or the 4b opcodes
>>>>    were used. So this was mutually exclusive. Now we have
>>>>    flashes which uses 4b opcodes _and_ we need the state
>>>>    of the internal mode.
>>>>
>>>> I can't think of a good solution for now. Need to think
>>>> more about this, but I'm pretty busy at the moment.
>>>> What I think is clear is that we need two different modes
>>>> here in the spi_nor struct. nor->addr_nbytes for the
>>>> read/program/erase opcodes and nor->address_mode or similar
>>>> which tracks the SPI flash's internal address mode.
>>>
>>> Hi, Takahiro,
>>>
>>> Can we determine the flash's internal address mode by querying
>>> the flash at run-time? Is this possible on Semper flashes?
>>>
>> CFR2V[7] has current address mode, but to read that, we need to
>> issue Read Any Register which address length relies on current
>> address mode. Chicken-and-egg...
>>
> 
> I see. What happens if we issue the Read Any Register command with
> the wrong address internal mode? Will I read just 0xff?
> For example try reading CFR2V[7] using addr_nbytes of value 3, and
> if it fails, to read it again but this time using addr_nbytes of
> value 4.
> 
It's undetermined. In case we issue Read Any Register with 3B address,
the host controller outputs 4 bytes (opcode + address) then inputs
1 byte. If the device is in 4B address mode at this time, the host
controller inputs the 1 byte while device is still waits for LSB of
address so IO is not driven by device.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
