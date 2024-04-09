Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0F7C67861
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WD3DNrhJY5wywbqkz2K4dxvFDnL0/d/lIDYTmUtroGg=; b=kBAZtLd0GnxZrNjKcLiprHyQ7J
	8Qr8EL8ekmCh0OzgOk0sGayU2yF+d1Wi9SCApABpwjW79dPRrI5L0x7wGSAnWlu8/5iERNIh1mq12
	B0ed5u8yaFRY31F91or8PbNrrKf74dMBRDXQxZ2EDO5jJ7xspnoKA5iUjJLQwTI6C0xZ9u75LRoZM
	NvIGybwc7kE4zsIfhjZd//49Kzst+gbj18UfACYPDozfFPTlIJRwJdwYGIivJ1sfycz9kTMnVuFHl
	5HeeEMoXpuuqIivCuDBxxNmsqVo6T4sJH1QSA7DmjVir2B26N56/6tC0CjY3+RVPt/NteIV10lqJr
	LTY5Rbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBRR-000000026cx-2AlO;
	Tue, 09 Apr 2024 13:23:13 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBRN-000000026Zd-2kcR
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 13:23:11 +0000
Received: from [192.168.0.106] (unknown [114.249.187.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 99A683F0F8;
	Tue,  9 Apr 2024 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1712668984;
	bh=EksjzJ3CymsKewjeeiKpJNkz0yRVlJ2oULqb01KBTqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type;
	b=A23wJqihb5Kdv+wzWFFG6vwgSMNE/tUjnslryEmEuiJ9KkLgBqyeqebFkz7/DCWot
	 lFihHW/ZGX8UicD/PAiIeislIgv5DIX8RVeABp9P9ihREmi3Fp28XXG9xG2C574uWW
	 LIA9UkfNM7zwOhSoZk6ariCLFrUf9pW6HT+rTnrtyMzha7VmLpq6ojSwBmCkgOGIgb
	 p0Gooll0lujoBRh8/AyvGyp4Ha+mn7J/91lqbLPYfP7vYUpiXbcIeZaTkVcxJ5Fv97
	 MBTcvzEf2JI04SV5TpuosVBOgttdaTRytGlsF4wGCHZB9mMRWx2UrL4oYkXnMEtMNf
	 aTsf76tijFkWA==
Message-ID: <a82f7811-e9f4-4d1f-91f4-56b87d35eb9a@canonical.com>
Date: Tue, 9 Apr 2024 21:22:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for infineon
 cy15v102qsn
To: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org
References: <20240408124328.777375-1-hui.wang@canonical.com>
 <D0ER81J5LHKW.N4T3BI3FRLDB@kernel.org>
 <81551ca3-532d-43c8-859e-c3d9be8d6e9d@canonical.com>
 <D0FGHMY4V864.118ONNO1DWQ7G@kernel.org>
Content-Language: en-US
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <D0FGHMY4V864.118ONNO1DWQ7G@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_062309_908043_73BD68C6 
X-CRM114-Status: GOOD (  15.63  )
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


On 4/9/24 16:41, Michael Walle wrote:
> Hi,
>
>>>> It is 2Mbit F-RAM which is logically organized as 256K x 8.
>>> Please have a look at drivers/misc/at25.c. I'm trying to get rid of
>>> the NO_ERASE flag. This is more of an EEPROM like device. The at25
>>> driver already have some kind of FRAM type support.
>> After reading your comment, I checked the drivers/misc/at25.c, I found
>> It couldn't work on my hardware. In my case, the F-RAM is under a spi
>> bus (spi-nxp-fspi.c) which only supports spi_mem transfer mode. So
>> currently, the mtd/spi-nor is the only choice.
> Then it will be a great opportunity to make the at25 driver spi-mem
> ready :)
OK. :-)
>>>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>>>> ---
>>>>    drivers/mtd/spi-nor/spansion.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>> index 6cc237c24e07..5dc94926b2cb 100644
>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>> @@ -981,6 +981,12 @@ static const struct flash_info spansion_nor_parts[] = {
>>>>    		.name = "s28hs02gt",
>>>>    		.mfr_flags = USE_CLPEF,
>>>>    		.fixups = &s28hx_t_fixups,
>>>> +	}, {
>>>> +		.id = SNOR_ID(0x48, 0x51, 0x80, 0x06, 0x00, 0x00),
>>> This doesn't look like a JEDEC id. The datasheet says it is a 11bit
>>> manufacturer id?
>>>
>>> -michael
>>   From the page 82 of datasheet, the Device ID is 0000000006805148, and
>> the ID read by spi_nor_read_id() matches it (id[0] is 0x48, id[1] is
>> 0x51, ...).
> JEDEC manufacturer IDs are not 11bit wide.
Have no idea here. I thought it is same as the cy15x104q and the 
spansion.c has the support for cy15x104q.
>
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
