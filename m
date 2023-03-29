Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C4EC6FD18
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVGgrveP3gqsJUO5MO/ABqa07SpFllk2T2IScoDpFFo=; b=ocLCoruan+U4ni
	eZB4fHDYysbnTjGJSD31XTrAuxousmCfUTmXOgOMSxNwG6VEUSxLtKr/r4ZAeqCXV0jT2yf9zeN8c
	oZ2a5s3xF3kT7YVOCfLWwOURaTUaWsHxk8azAu7lTqIMt0WtFzkyWD3eLveUgLXXLTZ6sLHrxTnA2
	9rlN68LlBbhEAXOIU4qagBlBdhAoJCdOpDOG5Z+086kHv4hmGM5ZBg60AdDwdTdk/Fs/3v/vfWspc
	iPROLIAPl5t9OZt9nDSuKAXst8te+j22zo3lnyOr+S6YEp0d4/lGP0he0uJBnImgV86oB7kL+ifj3
	PuFXdNnD6b65K1wcLTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phTjI-00HZD2-23;
	Wed, 29 Mar 2023 11:12:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phTjF-00HZBp-0J
	for linux-mtd@lists.infradead.org;
	Wed, 29 Mar 2023 11:12:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id v1so15250896wrv.1
        for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2023 04:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680088351;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u7uBggWPep8LzWC8musIl7sBP7Epwidb0rSty9bgw+g=;
        b=wh5PpbYm5Kt3OfLC5haNuiQKnsqkeXxsOprmrfOJtU7lM0BLgWyT772Vfx8iMcwWup
         1sTRuitAaV2qPjBPyHD39sBSfgGvHgafSDUyfouDeosKEOfekuiS6SkDOcOvJ1nrSlyV
         3U9OMKy8NJfISzi+Eb7+Mpu6ptQToj+bGJ0AujdjJ5TRQSiW1bSTnmWFSdsxqfRfV23g
         gos0YdtskJOe7vdpyRqWK/5fckjzhd8ysQj+eSKTuZzcFodNWhUkYTps0hbSOC+DCwBE
         McfTWYpLO5vo5bSIwYAzSzV399wePtyO02lps4g6QehLNaOGQd8XcfwIWWvk/YjnLOka
         rxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680088351;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7uBggWPep8LzWC8musIl7sBP7Epwidb0rSty9bgw+g=;
        b=LYGPuMd7QH+AlJN4ReTtAxTzgu+5UIlh+/4e17SBspP3oSEWMl0YEWZdk9D0yg3FOx
         pfdLHYfGLhK3+nJl80FLpblb5JetIKEAztxlQ6ShlvfvngOZVut3ZvbRqJfbfHAtzh/K
         nAXnmliPxRHOIEUiF/fZK+LsTNGuXHIzbznstrV0g4uBKStPTmPfAYHdLhmK8/cncsaa
         jny+x/HI+Ky26R+8i+JWwYjCRpdaIELR9qgN6wG2tke5RyXsnfvjLoN78wvWub08uvsu
         xIrFRvA/qzB298lfYdYk0O6UfoEVz7RkkNLDX4EuW4BOSgRIV1Lu4pOtSdoqcAluFfFf
         q0eQ==
X-Gm-Message-State: AAQBX9cqcG5Uw3Z0cQPlYlweo6RXgQLPBFqlzuTRwdFBB1MNcUVGK9B7
	MJ+kr9s1NBd2G/SacIh2AomarQ==
X-Google-Smtp-Source: AKy350a+ndi7TVZFzxVyzVnCFNqvUZRW7lI3oTnMDcnhTFKHu/JbmEM8ZukYJFkNs1i1Puuh7tXKcQ==
X-Received: by 2002:a05:6000:2:b0:2cf:e3e3:5b01 with SMTP id h2-20020a056000000200b002cfe3e35b01mr13333134wrx.56.1680088351584;
        Wed, 29 Mar 2023 04:12:31 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id t6-20020adff606000000b002d828a9f9ddsm21835724wrp.115.2023.03.29.04.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 04:12:31 -0700 (PDT)
Message-ID: <f243010c-72e3-6b59-6696-af7c7cdc6596@linaro.org>
Date: Wed, 29 Mar 2023 12:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 8/8] mtd: spi-nor: macronix: Add support for
 mx25uw51245g with RWW
Content-Language: en-US
To: liao jaime <jaimeliao.tw@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
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
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAQoYRknqq7=HFAeAB=W59G5ui_t3VSt3Xa33YbXeWPtJyxQsQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_041233_160507_8009994F 
X-CRM114-Status: GOOD (  22.03  )
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



On 3/29/23 06:48, liao jaime wrote:
> Hi Miquel
> 
>>
>> Hi Tudor,
>>
>> tudor.ambarus@linaro.org wrote on Tue, 28 Mar 2023 17:31:46 +0100:
>>
>>> On 3/28/23 16:41, Miquel Raynal wrote:
>>>> Describe this new part and provide the RWW flag for it.
>>>>
>>>> There is no public datasheet, but here are the sfdp tables plus base
>>>> testing to show it works.
>>>>
>>>> mx25uw51245g
>>>> c2813a
>>>> macronix
>>>> 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
>>>> 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
>>>> ffffffffe5208affffffff1f00ff00ff00ff00ffeeffffffffff00ffffff
>>>> 00ff0c2010d800ff00ff87790100821200e27704674630b030b0f4bdd55c
>>>> 000000ff101000200000000000007ca14800000000008888000000000000
>>>> 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
>>>> 727103b80000000090a3188200c069960000000000000000727100987271
>>>> 00b8727100990000000072710098727100f872710099727100f900000000
>>>> 00000000011501d0727106d8000086500000060100000000020001030002
>>>> 00000000060100000000000072060002000000eec0697272717100d8f7f6
>>>> 000a00001445988043060f0021dcffff
>>>> 047a884cf44d9ffc2a94d3ab37b48c63  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>>>
>>> which hash alg was used, was it sha1? No need to resubmnit just for this.
>>
>> Actually git just ignored all the lines starting with '#'
>> like if they were comments and I did not notice...
>>
>> I will amend my commit logs and resend.
>>
>>>>
>>>> 6+0 records in
>>>> 6+0 records out
>>>> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
>>>> Erased 6291456 bytes from address 0x00000000 in flash
>>>> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
>>>> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
>>>> *
>>>> 0600000
>>>> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
>>>> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
>>>> d24a9523db829a0df688f34b8dc76a1383b74024  qspi_test
>>>> d24a9523db829a0df688f34b8dc76a1383b74024  qspi_read
>>>>
>>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/macronix.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>>>> index 6853ec9ae65d..b65d41e5f749 100644
>>>> --- a/drivers/mtd/spi-nor/macronix.c
>>>> +++ b/drivers/mtd/spi-nor/macronix.c
>>>> @@ -82,6 +82,10 @@ static const struct flash_info macronix_nor_parts[] = {
>>>>     { "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
>>>>             NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>>>             FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>>>> +   { "mx25uw51245g", INFOB(0xc2813a, 0, 16 * 1024, 1024, 4)
>>>
>>> Sector size and nsectors shall be discovered at parse SFDP time.
>>> Does INFOB(0xc2813a, 0, 0, 0, 4) work for you?
>>
>> I'll check.
>>
>>>
>>>> +           PARSE_SFDP
>>>
>>> Yaay
>>>
>>>> +           FLAGS(SPI_NOR_RWW)
>>>> +           FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>>>
>>> Is SPI_NOR_4B_OPCODES flag really needed?
>>
>> I have no idea, I took that from older code.
>>
>> Jaime, what do you think?
> I think Tudor hopes that SFDP table could determine how many address bytes.

No, no.

:) and hope and programming don't get along.

Does this flash define the 4bait table? Can you add a print in
parse_4bait table and check if SNOR_F_4B_OPCODES is set? If yes, the
fixup flag is not needed.

SNOR_F_4B_OPCODES is an indication that the flash supports dedicated
opcodes for 4byte address, without the need to change the address mode
to 4 byte. When 4B_OPCODES are supported, we prefer not changing the
address mode, because when changing to 4 byte address mode, the state is
kept at reset (or power loss) and flashes might not be able to boot at
lower layers (u-boot for example).

So I'd try:
{ "mx25uw51245g", INFOB(0xc2813a, 0, 0, 0, 4)
		PARSE_SFDP
		FLAGS(SPI_NOR_RWW) },

In the future we'd like to add a sfdp-decoder in mtd-utils to decode the
sfdp dump and ease the review and avoid such questions, but we couldn't
allocate the time to implement it up to now. Meh, we're doing it at best
effort, in our spare time. Volunteers?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
