Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBA6C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 02:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jecoZsUctnlcDoW1+2fqkGhd4kL61MuiF2ptegOlQyg=; b=ZkUgZdacQm/vWf
	rqPc7B48uXCnn62XaKQtvjZQR1fZ7L0Hd/3+8KIoE45ztuioEM7EP2r05AYIIDhUQ17NR/x9iPhTr
	dF7DgHB534dodf8f9SC9rJD4n0Tv5x7GWlUnIXqGQ+5gzbkz+F6XzdftMmfQEUlsvp2kFbMpP71TS
	eEGPjgU6rzCfclrQElZMyRsFsU1kpWIClibKNbvl4HDgJhDtqSBfLMIL7ZOuB0a+Y5x/9tLqwe1zH
	/oHF/6UDCXHnZufwKAd1GbFAlM+D2kEQKUcMZjLsfYV16dgfp+gsCEPX7xRXIPfAB6d6oFiTemWKk
	zXEv6gV9R5fLwXSEUXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWUU0-009l0Y-T9; Tue, 22 Mar 2022 02:42:53 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWUTx-009kzo-L1
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 02:42:52 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so1170334pjb.4
 for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2022 19:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rEY/h+4Sphr0hAcylYNk2Yi0tkyfCG6fY8IoqjvLISs=;
 b=pMq1IK2/MsNaini+cWJAPY8v6lDfRGOCPp9vZ4pYUlMd4ORcdU2ETbsu3Wc4b2mn6P
 KDuFqPCqsEeHi/5lTzJh9HARLqlGPGCP9uV96une4gIf+/TILqUPI4YpoKGS1/GM76Ih
 dAMheLYvGTEJLsE+S0R0Q3gcOMWELyry349XMGnYm9zpvLY8T+dpB1JloHW3YXSQvSD9
 GblRvhsRI1DiHf4+5wx8OjxbPkh5r44In8LhSb/fMV9ah0t1kcvqVs346bAeWFX28vfn
 BAxk57QM+wLNFErgB2R18gkfzW7q1yoOqtzgQPujgkPPhPQFj18LOORqV6RqExo9JjOt
 5Izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rEY/h+4Sphr0hAcylYNk2Yi0tkyfCG6fY8IoqjvLISs=;
 b=NbEUgQJ4V5qQnq6tAnNo99XYwS0SiaPSkDNHhGTf1ikgERCiP62ZMYr/pF14Zrefdk
 IHhAvn7l0vked0w5WKIc1DnLqz9c7efVbor47Q3dwWuoW2XNzGjE08077GIwt/vQ9pUk
 svtoV/yiZmWrIn0AbZhzfI9JMuIQC7d4ZPm2Wv6F2m40mLPA9iM4CbyyJ31kbNX7WIcl
 NBTsJ8r2Rl1eNHas0yxM//UtSqqg+yjfoHH3YmLbAvC/IKMxOIb2tQ4PM8rUgqkeYVrZ
 4eQMBpcO1vuyc2bvjls2ppewtAGTDKVh6zvPeS6v/5sbEm/1XrUElbFpWAUkFNU04FX6
 F6Vg==
X-Gm-Message-State: AOAM5313j3tJe0H/F3JiYbsmlkBQSx8iF200j80Lrk0EqlDevmSKs1Qy
 7WJNwQEDT29hpFQrTxyyt0vlSYk/qPo=
X-Google-Smtp-Source: ABdhPJydaDcy3GFhYZJU5jDclfHGMnQOlokHTjIv8xDMjZUzOLN5KBHfD5tarxsdTdmZ1lU4X296XQ==
X-Received: by 2002:a17:902:ce90:b0:154:3029:97e6 with SMTP id
 f16-20020a170902ce9000b00154302997e6mr13983574plg.111.1647916968584; 
 Mon, 21 Mar 2022 19:42:48 -0700 (PDT)
Received: from [192.168.122.100] (133-175-21-116.tokyo.ap.gmo-isp.jp.
 [133.175.21.116]) by smtp.gmail.com with ESMTPSA id
 i7-20020a628707000000b004fa6eb33b02sm13144543pfe.49.2022.03.21.19.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 19:42:48 -0700 (PDT)
Message-ID: <8a193154-e840-6c15-13bf-42267ab72807@gmail.com>
Date: Tue, 22 Mar 2022 11:42:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 stable@vger.kernel.org
References: <20220316155455.162362-1-ikegami.t@gmail.com>
 <20220316155455.162362-3-ikegami.t@gmail.com> <20220316182100.6e2e5876@xps13>
 <01fed0aa-8844-1db9-f167-e7e7944bc092@ti.com>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <01fed0aa-8844-1db9-f167-e7e7944bc092@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_194249_747862_3AD26CBA 
X-CRM114-Status: GOOD (  19.87  )
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

On 2022/03/17 19:01, Vignesh Raghavendra wrote:
>
> On 16/03/22 10:51 pm, Miquel Raynal wrote:
>> Hi Tokunori,
>>
>> ikegami.t@gmail.com wrote on Thu, 17 Mar 2022 00:54:54 +0900:
>>
>>> As pointed out by this bug report [1], buffered writes are now broken on
>>> S29GL064N. This issue comes from a rework which switched from using chip_good()
>>> to chip_ready(), because DQ true data 0xFF is read on S29GL064N and an error
>>> returned by chip_good().
>> Vignesh, I believe you understand this issue better than I do, can you
>> propose an improved commit log?
> How about:
>
> Since commit dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to
> check correct value") buffered writes fail on S29GL064N. This is
> because, on S29GL064N, reads return 0xFF at the end of DQ polling for
> write completion, where as, chip_good() check expects actual data
> written to the last location to be returned post DQ polling completion.
> Fix is to revert to using chip_good() for S29GL064N which only checks
> for DQ lines to settle down to determine write completion.

Fixed the commit message as suggested by the version 5 patch.

>>> One way to solve the issue is to revert the change
>>> partially to use chip_ready for S29GL064N.
>>>
>>> [1] https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
>>>
>>> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
>>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>>> Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>> Cc: stable@vger.kernel.org
>>> ---
>>>   drivers/mtd/chips/cfi_cmdset_0002.c | 25 +++++++++++++++++++++----
>>>   1 file changed, 21 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
>>> index e68ddf0f7fc0..6c57f85e1b8e 100644
>>> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
>>> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
>>> @@ -866,6 +866,23 @@ static int __xipram chip_check(struct map_info *map, struct flchip *chip,
>>>   		chip_check(map, chip, addr, &datum); \
>>>   	})
>>>   
>>> +static bool __xipram cfi_use_chip_ready_for_write(struct map_info *map)
>> At the very least I would call this function:
>> cfi_use_chip_ready_for_writes()
>>
>> Yet, I still don't fully get what chip_ready is versus chip_good.
>>
>>> +{
>>> +	struct cfi_private *cfi = map->fldrv_priv;
>>> +
>>> +	return cfi->mfr == CFI_MFR_AMD && cfi->id == 0x0c01;
>>> +}
>>> +
>>> +static int __xipram chip_good_for_write(struct map_info *map,
>>> +					struct flchip *chip, unsigned long addr,
>>> +					map_word expected)
>>> +{
>>> +	if (cfi_use_chip_ready_for_write(map))
>>> +		return chip_ready(map, chip, addr);
>> If possible and not too invasive I would definitely add a "quirks" flag
>> somewhere instead of this cfi_use_chip_ready_for_write() check.
>>
>> Anyway, I would move this to the chip_good() implementation directly so
>> we partially hide the quirks complexity from the core.
> Yeah, unfortunately this driver does not use quirk flags and tends to
> hide quirks behind bool functions like above

Added the quirks flag as mentioned.

Regards,
Ikegami

>
> Regards
> Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
