Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4DCC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 05:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vHz/H/e9pPW/K1gF/YT5OpZKDrDQUCv3rnPYhLdarc=; b=CdWDupEQ5p2aXm
	2wup1rOnXRnhtH8xfqBEdm04kzRiZqopUupHhv9t3zQgmst+zBpmxuaiA7ybzmHptYuYo1xz6DHUP
	I3hepoZI4yLva9ClEjeqP8rfseU/UgaWEy/6RFRq28wM9twQSxTCaVBDXNfbBG7PkbqH+CGQ7A2VJ
	rNtqlchxCK5a89mNLGIg+ZS6e59Eh0N4xG/jrPFym4TGqrcN8GP1xPhMFh0KgIa2t0o2qooZQDOJB
	vs+sIXucIc34I4kTY+20EO7atbNEBxVek6ffFVqYjk3md/KLALEv/+t0oNct1MJR/I/juQY2WT3ud
	HSEe2cZ1sLOvnD1lQW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkwY-0002UC-Ay; Fri, 22 Jul 2022 05:11:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkwV-0002TK-9U
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 05:11:17 +0000
Received: by mail-pl1-x62c.google.com with SMTP id y24so3682878plh.7
        for <linux-mtd@lists.infradead.org>; Thu, 21 Jul 2022 22:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0T7lnqc48k+VdfG6HEbiC3+oVhuVBR2x6iYqy6fs7sU=;
        b=FhpK65ecVyYVGFdTHDpmFdvsCot+HVmS20RRFI7tFaRLWggnPyTqtztJ5GNEUz4ffS
         95mSSaKZyxYiXL22kDdxFwQf6YrFFBudhs8ufhTqIvogv0n+3cLTvqj+3zpOopDGbrk+
         90Tfe+6EjCItjJxx3qOdB7V09LxlcKq4gaIjH92mA7fU1T/XbQTsIGI748TEAkBGBkc3
         ctvb5fc49uc2nqkX2zVWiDvt4cA/l5DpodRgR12Z4PSU/+dYAlGLs+IDaYzNjfx5WCFE
         gJ7A7l8pOm+R9Q0Aeo3KJRVZcnkEuRGkSz6PqXJTYaWNIy76V4gT325nLC8dMSvaelVz
         Anbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0T7lnqc48k+VdfG6HEbiC3+oVhuVBR2x6iYqy6fs7sU=;
        b=cqTcKRkenHO9gpkGBJ49NtjGrkDXoOOo/+jL6MSzO/xZRJOOQDUbNgy6uQUCjXhL5G
         3y9MnRscCvjwDuXnnNj2UJ94kjKe1tMPsCC/lv53kp2BC7X0TnpHH9ylmbdjnNzUGO1G
         xHsF+PDq6QY8K4U1Qto1C8EwIwJf1eolEVN+i8pyvvG5l73SVynwxFv64bWySRYOuvb4
         AtUWS1pzg+JYBiYBS96znTeq081BYxuYqoj4ZwPPhiiK3bpmEZA0y/3C0vjM1j7XXUvh
         ZFEugokdQN//Zhl/EXhP7HXpGk7Awm2qL8b1P5le1yXNCnh+wXK2VfqqP7KH8trw+uAI
         L++w==
X-Gm-Message-State: AJIora9U/C+1hCk+vGWZvcvL48ML/XrHSKSB0Xz4mjfKQBZYbz9f21al
	l4fSxXY9FUwno3+8vsu7F3s=
X-Google-Smtp-Source: AGRyM1td+R0JERd6vi//qWgRShwfKDaEiBHC93oJnvCUffSEYtDdEfFgetVX4sQiujixGnaje7TxAA==
X-Received: by 2002:a17:902:e154:b0:16d:3e9e:3c39 with SMTP id d20-20020a170902e15400b0016d3e9e3c39mr1903673pla.58.1658466671428;
        Thu, 21 Jul 2022 22:11:11 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id v12-20020aa799cc000000b00528c149fe97sm2742577pfi.89.2022.07.21.22.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 22:11:11 -0700 (PDT)
Message-ID: <36924e69-318a-8955-bbc8-86356c53bc42@gmail.com>
Date: Fri, 22 Jul 2022 14:11:08 +0900
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
 <2912f41b-5966-b08d-0b52-97eba3a809bc@gmail.com>
 <774d237f-e5cb-f46f-91ee-ae3a55dcc969@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <774d237f-e5cb-f46f-91ee-ae3a55dcc969@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_221115_369727_357FE4CC 
X-CRM114-Status: GOOD (  29.39  )
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

On 7/22/2022 2:06 PM, Tudor.Ambarus@microchip.com wrote:
> On 7/22/22 07:46, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 7/22/2022 1:20 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 7/22/22 07:00, Takahiro Kuwano wrote:
>>>
>>> Good morning, Takahiro!
>>>
>> Good morning, Tudor!
>>
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 7/22/2022 1:06 AM, Tudor.Ambarus@microchip.com wrote:
>>>>> On 5/23/22 10:49, Michael Walle wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> Am 2022-05-14 05:51, schrieb Takahiro Kuwano:
>>>>>>> On 5/13/2022 6:40 PM, Michael Walle wrote:
>>>>>>>> [btw the subject still has the old name of the addr_width]
>>>>>>>>
>>>>>>> Yes, it must be fixed in next rev.
>>>>>>>
>>>>>>>> Am 2022-05-13 03:26, schrieb Takahiro Kuwano:
>>>>>>>>> On 5/13/2022 7:14 AM, Michael Walle wrote:
>>>>>>>>>> Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
>>>>>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>>>>>
>>>>>>>>>>> In 4BAIT parse, keep nor->params->addr_width because it may be used
>>>>>>>>>>> as
>>>>>>>>>>> current address mode in SMPT parse later on.
>>>>>>>>>>
>>>>>>>>>> Mh I'm not sure this is needed at all.
>>>>>>>>>>
>>>>>>>>>> SFDP spec says
>>>>>>>>>>   Variable address length (the current setting of the address
>>>>>>>>>>   length mode defines the address length)
>>>>>>>>>>
>>>>>>>>>> and
>>>>>>>>>>   When the length is defined as variable, the software or hardware
>>>>>>>>>>   controlling the memory is aware of the address length mode last
>>>>>>>>>>   set in the memory device and this same length of address.
>>>>>>>>>>
>>>>>>>>>> We don't set any address mode until all the SFDP parsing is
>>>>>>>>>> over. Therefore we should always be in 3 byte mode, no?
>>>>>>>>>>
>>>>>>>>> Actually there are some devices that have variable address length but
>>>>>>>>> 4 byte mode by default (I will work on those devices after this
>>>>>>>>> series
>>>>>>>>> is settled). To support such case, I prefer to use
>>>>>>>>> params->addr_nbytes
>>>>>>>>> as current address mode so that I can fix it in post_bfpt_fixup()
>>>>>>>>> hook.
>>>>>>>>
>>>>>>>> Are there public datasheets available? So these devices have a 3 byte
>>>>>>> I will send datasheets to you in another email. At this point, only
>>>>>>> summary datasheet is available in website.
>>>>>>>
>>>>>>>> and a 4 byte mode, but after reset, they are in the 4 byte mode? Looks
>>>>>>> Yes.
>>>>>>>
>>>>>>>> like it should be fixed in a different way. I'm not sure the "current
>>>>>>>> mode" handling is correct.
>>>>>>>>
>>>>>>> Yes, we may want to introduce a new flag like SPI_NOR_4BAM_DEFAULT and
>>>>>>> check
>>>>>>> the flag in BFPT parse. Once I send another series, please review.
>>>>>>>
>>>>>>>> We need to differentiate between the mode the flash currently is using
>>>>>>>> (nor->addr_nbytes) and the mode parsed by SFDP (params->addr_nbytes).
>>>>>>>>
>>>>>>> The flash's address mode affects the address length of Non-4B opcodes,
>>>>>>> including read/write any register ops used in SMPT parse and Infineon
>>>>>>> (spansion) specific hooks.
>>>>>>>
>>>>>>> The 4B opcodes always take address length of 4 regardless of flash's
>>>>>>> address mode. In these Infineon chips, 4B opcodes for read/program/
>>>>>>> erase are available and 4BAIT advertises them. We don't have to enter
>>>>>>> 4 byte address mode for read/program/erase.
>>>>>>
>>>>>> btw. this is a pity. you are using the stateless 4b opcodes but
>>>>>> then you don't provide stateless opcodes for the read any register
>>>>>> op :/
>>>>>>
>>>>>>> So, I think we need to differentiate between address length for
>>>>>>> read/program/erase and flash's default address mode.
>>>>>>
>>>>>> Or we keep them in sync. E.g. switch to 4bytes mode if we are
>>>>>> using the 4 byte. Granted, that sounds like a hack :)
>>>>>>
>>>>>>> Obviously we are using nor->addr_nbytes as address length for read/
>>>>>>> program/erase and should keep this usage.
>>>>>>
>>>>>> Yes, I wasn't aware that we actually two different runtime
>>>>>> parameters:
>>>>>>  - the read/program/erase address width, also used with the
>>>>>>    4b opcodes
>>>>>>  - internal mode 3b/4b. Up until now, this wasn't an issue
>>>>>>    because either the mode was switched or the 4b opcodes
>>>>>>    were used. So this was mutually exclusive. Now we have
>>>>>>    flashes which uses 4b opcodes _and_ we need the state
>>>>>>    of the internal mode.
>>>>>>
>>>>>> I can't think of a good solution for now. Need to think
>>>>>> more about this, but I'm pretty busy at the moment.
>>>>>> What I think is clear is that we need two different modes
>>>>>> here in the spi_nor struct. nor->addr_nbytes for the
>>>>>> read/program/erase opcodes and nor->address_mode or similar
>>>>>> which tracks the SPI flash's internal address mode.
>>>>>
>>>>> Hi, Takahiro,
>>>>>
>>>>> Can we determine the flash's internal address mode by querying
>>>>> the flash at run-time? Is this possible on Semper flashes?
>>>>>
>>>> CFR2V[7] has current address mode, but to read that, we need to
>>>> issue Read Any Register which address length relies on current
>>>> address mode. Chicken-and-egg...
>>>>
>>>
>>> I see. What happens if we issue the Read Any Register command with
>>> the wrong address internal mode? Will I read just 0xff?
>>> For example try reading CFR2V[7] using addr_nbytes of value 3, and
>>> if it fails, to read it again but this time using addr_nbytes of
>>> value 4.
>>>
>> It's undetermined. In case we issue Read Any Register with 3B address,
>> the host controller outputs 4 bytes (opcode + address) then inputs
>> 1 byte. If the device is in 4B address mode at this time, the host
>> controller inputs the 1 byte while device is still waits for LSB of
>> address so IO is not driven by device.
>>
> 
> So if the IO lines are floating, we'll "read" whatever is indicated
> by the IOs at that specific moment of time, right?
> 
Yes, right.

> If so, we're forced to statically specify the default internal address
> mode.
> 
Yes.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
