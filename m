Return-Path: <SRS0=FVTc=6K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161FEC55186
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 02:45:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9BFA2071E
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 02:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lhf7rMBQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9BFA2071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpYIGqXskuobxK3ZyoO2Nbo5aBzxi5pDNxRW7kLcUw8=; b=Lhf7rMBQcDKUh2
	VuQRCqi5iuv6HCbN11op/wcV1YiVZd9LHUrx1GqvGjWuL1xqYFo3eKfDTRvm8uCXpaE9PieB006VQ
	XxMqXBp4rNs4GPMXx6UJSgBfcMXcIA78Ddi+Jy1kJiV0hVdsdHvfwqgtTqy0HjIOYcRFICEpMzNhC
	CjBloTeXLvxW4kRks84jXIiKRwd8i2RWdOzlEesH+fC93SMbglKtWdViPytpbi4nriAMVImUgwDtr
	7kLu8RGCSPsbAOB5W2XWdD49T8Hk6Icq5AzqozobJtV/E9vGDpezAGpV+nNX9ov5RcksRJjzB7Ebj
	3JsB5UFn4OacxgTXGd6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSXHo-0000QY-Bl; Sun, 26 Apr 2020 02:44:52 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSXHl-0000Mf-95
 for linux-mtd@lists.infradead.org; Sun, 26 Apr 2020 02:44:50 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 50727C02D76675834FCD;
 Sun, 26 Apr 2020 10:44:36 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0;
 Sun, 26 Apr 2020 10:44:28 +0800
Subject: Re: [RFC PATCH 1/2] mtd: spi-nor: Add capability to disable flash
 quad mode
To: Pratyush Yadav <me@yadavpratyush.com>
References: <1587720044-49172-1-git-send-email-yangyicong@hisilicon.com>
 <1587720044-49172-2-git-send-email-yangyicong@hisilicon.com>
 <20200424133004.r2oryuyocz7zmrgz@yadavpratyush.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <af86e219-160d-40fe-1a61-6bc8b81cca14@hisilicon.com>
Date: Sun, 26 Apr 2020 10:44:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200424133004.r2oryuyocz7zmrgz@yadavpratyush.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_194449_485551_11F38ECC 
X-CRM114-Status: GOOD (  17.43  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 tudor.ambarus@microchip.com, richard@nod.at, john.garry@huawei.com,
 linuxarm@huawei.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,


On 2020/4/24 21:30, Pratyush Yadav wrote:
> Hi Yicong,
>
> On 24/04/20 05:20PM, Yicong Yang wrote:
>> Previous we didn't provide a way to disable the flash's quad mode.
>> Which means we cannot do some cleanup works when to remove or
>> poweroff the flash, like what set 4-byte address mode does in
>> spi_nor_restore().
>>
>> Add the capability to disable the flash quad mode, by introducing
>> an enable flag in the flash parameters quad_enable() hooks and
>> related functions.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 38 ++++++++++++++++++++++++++++----------
>>  drivers/mtd/spi-nor/core.h |  8 ++++----
>>  2 files changed, 32 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index cc68ea8..d0516e8 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -1910,12 +1910,13 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>   * spi_nor_sr1_bit6_quad_enable() - Set the Quad Enable BIT(6) in the Status
> Nitpick: This should probably be changed to "Set/unset the Quad 
> Enable...". Same in other places.
>
>>   * Register 1.
>>   * @nor:	pointer to a 'struct spi_nor'
>> + * @enable:	true to enter quad mode. false to leave quad mode.
>>   *
>>   * Bit 6 of the Status Register 1 is the QE bit for Macronix like QSPI memories.
>>   *
>>   * Return: 0 on success, -errno otherwise.
>>   */
>> -int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
>> +int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor, bool enable)
>>  {
>>  	int ret;
>>
>> @@ -1923,10 +1924,14 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
>>  	if (ret)
>>  		return ret;
>>
>> -	if (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)
>> +	if ((enable && (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) ||
>> +	    ~(enable || (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)))
> This condition will always evaluate to true.
>
> Since (enable || (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) is always a 
> boolean, it will evaluate to 0 or 1. And ~0 is 0xFFFFFFFF and ~1 is 
> 0xFFFFFFFE, both of which evaluate to true.
>
> IIUC, this condition is supposed to mean "If we want to enable and it is 
> already enabled, do nothing. Or, if we want to disable and it is already 
> disabled, do nothing." This might be what you were going for:
>
> 	if ((enable && (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) ||
> 	    (!enable && !(nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)))
>
> Same for other places this pattern appears.

Seems type error. It should be
     !(enable || (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6))
Thanks for pointing it out.

Thanks,
Yicong



>
>>  		return 0;
>>
>> -	nor->bouncebuf[0] |= SR1_QUAD_EN_BIT6;
>> +	if (enable)
>> +		nor->bouncebuf[0] |= SR1_QUAD_EN_BIT6;
>> +	else
>> +		nor->bouncebuf[0] &= ~SR1_QUAD_EN_BIT6;
>>
>>  	return spi_nor_write_sr1_and_check(nor, nor->bouncebuf[0]);
>>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
