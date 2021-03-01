Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C18BC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 10:53:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABEAB600EF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 10:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABEAB600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o7OKN3t7P1KzEWaeztVCDuRIVIPCSHWaZnGE3VWP+DI=; b=zHS0LXlFH7aL45wBBOnh8P9t5
	N/NpM5Cezyg13YEULGe6hq/dBPCKWBZpO6ahfmSym9zk5u9MSV/dALFgOQf7oX2JAz2jLBw1tfi+E
	xIYJc78mdH8RMWtZY9hjOIIaV0k9lsMUNrTOcEubbIqhtF0ljSBlloMBit93HM6JJhmzdNybqJO59
	vaOK3h3/mMlTZRWcmzgowz61+qJULd9J4Sb4P5bbXYdJw2s7Nh7kM5Ej8kWXTK5VsZ222q3C/vZds
	bk4fykNGL9YwUdc0kYS86af8aqEjK7LK1KgD/qEZ75+2+xq3+SUzhxY1ct/DRZAEPdwj94jozzyJv
	BIGusdy0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGgAf-0004LL-TN; Mon, 01 Mar 2021 10:53:01 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGgAd-0004Kq-6M
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 10:53:00 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 121Aquux117698;
 Mon, 1 Mar 2021 04:52:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1614595976;
 bh=On/p6VyO3egD4paTURK6bZ5hh7fsc9v7/DTA+Blf8q8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=wpwx+Eh832KMIUGM1ToIYVjxTcYCcJ5OKx15Pc/tnmg+d7wFzG2/y+gBfWDo3mo0T
 SX5SLILV+vPI1+m052S+da6kW/GBw+8vgw7sSl+Lls/ZxSH2nIwxMonVUWvFpiyQ8v
 8d85/BCblfg8RUCmC4GPr+URl+okB0SvqCf58tjY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 121Aqu05098940
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Mar 2021 04:52:56 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Mar
 2021 04:52:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Mar 2021 04:52:56 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 121AqqxS033007;
 Mon, 1 Mar 2021 04:52:53 -0600
Subject: Re: spi-nor: maxronix MX25L12835F support
To: Heiko Thiery <heiko.thiery@gmail.com>, <Tudor.Ambarus@microchip.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
Date: Mon, 1 Mar 2021 16:22:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_055259_375818_C5E6798E 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 2/28/21 3:22 AM, Heiko Thiery wrote:

[...]
>>>> +#define SPI_NOR_AIM_SFDP       BIT(23) /* Try to parse SFDP. Used by flashes
>>>> +                                        * that share the same JEDEC-ID, but
>>>> +                                        * where a flash defines the SFDP tables
>>>> +                                        * and the other doesn't.
>>>> +                                        */
>>>>
>>>>         /* Part specific fixup hooks. */
>>>>         const struct spi_nor_fixups *fixups;
>>>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>>>> index 9203abaac229..1ebce775eae4 100644
>>>> --- a/drivers/mtd/spi-nor/macronix.c
>>>> +++ b/drivers/mtd/spi-nor/macronix.c
>>>> @@ -50,7 +50,8 @@ static const struct flash_info macronix_parts[] = {
>>>>         { "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
>>>>         { "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>>>>         { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>>>> -       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
>>>> +       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256,
>>>> +                             SECT_4K | SPI_NOR_AIM_SFDP) },
>>>>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>>>>         { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
>>>>                               SECT_4K | SPI_NOR_DUAL_READ |
>>>
>>> I tried your patch and it works like expected. I can now read the
>>> whole flash in ~2sec while without that it was ~6sec.
>>>
>>> # time dd if=/dev/mtd0 of=dump.bin
>>> 32768+0 records in
>>> 32768+0 records out
>>> real 0m 2.08s
>>> user 0m 0.01s
>>> sys 0m 2.06s
>>>
>>> vs.
>>>
>>> # time dd if=/dev/mtd0 of=dump.bin
>>> 32768+0 records in
>>> 32768+0 records out
>>> real 0m 6.16s
>>> user 0m 0.05s
>>> sys 0m 6.09s
>>>
>>>
>>
>> Great, thanks!
>>
>>> Should I prepare a patch with that change or will you do?
>>
>> Let's wait for a few days, so others can intervene. I'd like to
>> clarify what's happening on mx66l51235l too.
> 
> Since a few days have passed and no one has commented, I would like to
> bring up the subject again.
> 
> I can send a patch for the changes you suggested. What do you think?
> 

Why not have a single entry for mx66l51235l/mx25l12805d with superset
capabilities declared. And then use info->fixups->post_sfdp() to fixup
capabilities for mx66l51235l based on absence of SFDP tables?

SPI_NOR_AIM_SFDP seems redundant to me. SPI NOR Framework should anyway
be using SFDP for detecting flash capabilities and away from flash_info
based static data.


Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
