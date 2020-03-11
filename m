Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7580CC10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 14:07:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45BC020726
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 14:07:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N109kqRb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45BC020726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzhFNjaSRRdznBRU0Bc+rEyLknnlih3vSqsJag5MP4U=; b=N109kqRbwJddiw
	KcMjyzVJNJX4BubkndNbxuOGwMDtIlsdMGUn61e0F+A8U7Iif2NKoxl6GKZ5Q0lNEodA2Q0kNGhov
	hi3OhcI0WfYmgcgDMHdZZwmfBTc0Yhal6PHGhI6lNTRmDIo04Bi91GneY0D0KlOd3LQh8WCWzV1Ig
	E/EziGkChH/6uJ0HTYNKYBzBbGX2LE7ABre5Z1U2PbwEt2p/cDRiCo1xsdrGW+Y2giico+RWV6uNK
	IvzmQaLOvDj+Sto0YWc1LN/wpcPbstaMj/wyEEBZY9k0aQ/8mwMh0CTS2e/VEubDEFfaX/iGo+fIg
	PX+KpnS6caNgo3MEDDCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC21H-0005eK-7b; Wed, 11 Mar 2020 14:07:35 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC21E-0005dc-4h
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 14:07:34 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48cv0x1gQBz1qrfb;
 Wed, 11 Mar 2020 15:07:29 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48cv0x0cDfz1r0bZ;
 Wed, 11 Mar 2020 15:07:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id fk9aTzljl-1I; Wed, 11 Mar 2020 15:07:27 +0100 (CET)
X-Auth-Info: Me9PlYoLkFSPVGCQrWSzUHql0nHJZAc+4IEp1LtN7Ao=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 11 Mar 2020 15:07:27 +0100 (CET)
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200205070834.3087104-1-marex@denx.de>
 <bdb54ba5-648a-0b79-661c-5eb9604a1ee5@denx.de>
 <b6f094b7-01a9-34a2-bf10-019a05bc7cb3@denx.de>
 <20200211170707.2183625e@xps13>
 <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
 <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
 <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
 <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
 <29cce21c-2214-7238-0bc5-db2c1a54576f@denx.de>
 <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
 <CAK7LNAT3EG0XocC0xT0f=6MBpXLga3FehOjEYbRyP6AJUbqb2Q@mail.gmail.com>
 <311cdc3c-59b5-a46b-62f0-e78fc970134a@denx.de>
 <CAK7LNAT1Bzs68X8PiWQHg4g2bpPGd-WM9D4vwf59XfwwLVuVQQ@mail.gmail.com>
 <e86925d0-805c-d364-57ca-6400b77cffd7@denx.de>
 <CAK7LNARDp1Zru3_XAQyBZHwsRov-QWOnrrwodS8pjszsKy2ysw@mail.gmail.com>
 <d4b4abf4-1af9-d57c-5b93-2d56a5dc456b@denx.de>
 <20200311140807.6f56baf3@xps13>
 <5fa809a3-cd2b-74de-3615-387232051ae2@denx.de>
 <20200311143302.309bf468@xps13>
From: Marek Vasut <marex@denx.de>
Message-ID: <aaec50bb-05da-8d4e-3e15-17fbfeb52f68@denx.de>
Date: Wed, 11 Mar 2020 15:07:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311143302.309bf468@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_070732_486678_1820DF98 
X-CRM114-Status: GOOD (  22.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Tim Sander <tim@krieglstein.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/11/20 2:33 PM, Miquel Raynal wrote:
> Hi Marek,

Hi,

[...]

>>>>> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
>>>>> index b0482108a127..ea38aa42873e 100644
>>>>> --- a/drivers/mtd/nand/raw/denali.c
>>>>> +++ b/drivers/mtd/nand/raw/denali.c
>>>>> @@ -860,9 +860,9 @@ static int denali_setup_data_interface(struct
>>>>> nand_chip *chip, int chipnr,
>>>>>
>>>>>         /*
>>>>>          * Determine the minimum of acc_clks to meet the data setup timing.
>>>>> -        * (one additional clock cycle just in case)
>>>>> +        * (two additional clock cycles just in case)
>>>>>          */
>>>>> -       acc_clks = DIV_ROUND_UP(timings->tREA_max, t_x) + 1;
>>>>> +       acc_clks = DIV_ROUND_UP(timings->tREA_max, t_x) + 2;
>>>>>
>>>>>         /* Determine the minimum of rdwr_en_lo_cnt from RE#/WE# pulse width */
>>>>>         rdwr_en_lo = DIV_ROUND_UP(max(timings->tRP_min, timings->tWP_min), t_x);    
>>>>
>>>> Like the attached one ?
>>>>
>>>> That seems to work, but -- the calculated timings differ from the ones
>>>> which are calculated by U-Boot and which were tested to work well.
>>>> That's not good, I would expect both timings to be identical:  
>>>
>>> There is no such "timings tested to work well".  
>>
>> Hmmm, the board went through full temperature range testing in a chamber
>> with those timings and passed, and there are boards with those exact
>> timings deployed for years now with older kernel version, which work
>> too. So I would expect they are good and "timings tested to work well".
>>
>>> Timings represent
>>> minimum and maximum values for certain operations on the NAND bus, you
>>> can have two different values that will both work in the same
>>> condition. And it is expected that Linux is more clever than U-Boot  
>>
>> Errr, why ?
> 
> Because sometimes people write simpler driver in U-Boot, or even
> hardcoded values.

I see, this is not the case with denali nand driver though.

> I checked the denali driver and indeed u-boot should not be much clever
> than Linux. Are the differences significant? The code is so close, you
> can probably check why you have differences. Also verify that the same
> ONFI mode is used.

It might've made sense to check those driver differences before making
such an statement ;-)

That said, I don't think either U-Boot or Linux uses the ONFI
information for this NAND, but I might be wrong.

>>> and
>>> may optimize better the timings depending on the selected mode ([0-5])
>>> (hence the different calls to ->setup_data_interface().  
>>
>> I would expect those two should produce identical timing parameters,
>> period, otherwise one or the other is wrong. Thus far, it was Linux that
>> produced non-working results.
> 
> Again, we define minimum and maximum delays. If the right thing is to
> not wait more than 5us and you wait up to 6, it does not mean you
> wrote "bad timings". 4us would be a bad timing though. It depends on
> what you are looking at.

I am look at for example

 denali->reg + TCWAW_AND_ADDR_2_DATA = 0x0000143f -> 0x00001432

Register was 0x143f before, now is 0x1432 , which is less.
I guess that would be the "bad timing" then ?

>>> Run a stress test, if it passes, you should be good :)  
>>
>> Thank you for the hint, I think the stress test thus far could be
>> considered sufficient. I guess we can agree on that ?
> 
> Oh yeah absolutely :)

Great :)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
