Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0973AC43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 13:12:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2277204EC
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 13:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qjXLwSOg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yNvIjZMX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2277204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouWl0k2GcVlX0Xn0pSrAh1XplRa3+LIgis/KO2plzBI=; b=qjXLwSOgyVLmMc
	syEBHnIfhSL5OY4AOKRI13igRNb0ntfphejcVK9TxaLhKUbQfEdOUNSoCsZggEJg0S4i4KVNeLSIM
	MqWibLcNJEgFAYz43E1c8gUbrxN4pGt1JR4i7yJy8hJ1u1pvlfSvNlA1g/3iNJBSK7E6Wd5StuqIz
	J+ji9/ZGmC6so+TOOVxiqt4aCdN6tKaKcKcjpfJ+nu0ICgE3bP1BpFakPGO7K4PG92Bb8C9QctMhO
	Temw9wadN51RY0eDpH0WPlyVUk6VDyqNsgM75mWRBVYz5e1jGciVxP8x3Wuy5vOWXxqy1hvxDGG7H
	kk5JHsEz0PljxflmzwrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfOl8-0007ek-6i; Mon, 24 Jun 2019 13:11:46 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfOl2-0007e0-KY
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 13:11:43 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ODBKUo013215;
 Mon, 24 Jun 2019 08:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1561381880;
 bh=vJkcHIUEp3zSeLidRa67Ez7J0/DVGs6vngk5qn6hf2U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yNvIjZMX7MCfYb22Nes7ouURPABogmr3nKPKeCheto0PH4lQv0vMAjz/cSFSLkwNM
 k+QdZq2WqM4fy/9vaYlLofuyk5pWO20XYz6SzA4Jw+drk7njAWgbcVrXWCdkBfAt0q
 qa5mYvT6puqyl06rP/3KNegEXrN9hzAzjOh7rwr4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ODBKgt029387
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 24 Jun 2019 08:11:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 24
 Jun 2019 08:11:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 24 Jun 2019 08:11:20 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ODBHIq073058;
 Mon, 24 Jun 2019 08:11:17 -0500
Subject: Re: [PATCH 1/1] mtd: spi-nor: add a presence check for non-JEDEC spi
 nor
To: <Tudor.Ambarus@microchip.com>, <f.suligoi@asem.it>
References: <1553172946-2251-1-git-send-email-f.suligoi@asem.it>
 <55f74662-c5f6-2cdf-f1a0-c685f7ff1913@microchip.com>
 <c7ce7a2966a4414a90e84f30929cede1@asem.it>
 <7fcfd18c-45c9-37a7-270e-cd8b95796903@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <9412e6bf-e984-fd06-bc53-dd8e8198c4f6@ti.com>
Date: Mon, 24 Jun 2019 18:42:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <7fcfd18c-45c9-37a7-270e-cd8b95796903@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_061141_013730_F9A96FAD 
X-CRM114-Status: GOOD (  26.18  )
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
Cc: bbrezillon@kernel.org, linux-kernel@vger.kernel.or, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, richard@nod.at, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 24/06/19 1:50 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Flavio, Marek, Vignesh,
> 
> On 06/24/2019 10:07 AM, Flavio Suligoi wrote:
>> External E-Mail
>>
>>
>> Hi Tudor,
>>
>>> -----Original Message-----
>>> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
>>> Sent: domenica 23 giugno 2019 06:00
>>> To: Flavio Suligoi <f.suligoi@asem.it>; marek.vasut@gmail.com;
>>> dwmw2@infradead.org; computersforpeace@gmail.com; bbrezillon@kernel.org;
>>> richard@nod.at
>>> Cc: linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.or
>>> Subject: Re: [PATCH 1/1] mtd: spi-nor: add a presence check for non-JEDEC
>>> spi nor
>>>
>>> Hi, Flavio,
>>>
>>> On 03/21/2019 02:55 PM, Flavio Suligoi wrote:
>>>> External E-Mail
>>>>
>>>>
>>>> This patch fixes the following kernel error message:
>>>>
>>>> "flash operation timed out"
>>>>
>>>> that occurs when a non-JEDEC spi-nor, declared in a Device Tree, but not
>>>> physically present on the board, is involved in a write operation, as:
>>>>

DT node should have status = "disabled" if flash is not physically
present on the board.

>>>> cat datafile > /dev/mtd0
>>>>
>>>> In some cases, with enough quantity of data, the writing hangs for
>>> minutes.
>>>>
>>>> This situation can happen, for example, in some embedded systems, when
>>>> a non-JEDEC spi-nor is mounted using a removable add-on board. So is
>>>> important to find a method to check a non-JEDEC device presence before
>>>> using it.
>>>>

Can't bootloader detect presence on removable board using some means
like GPIO and then fixup DT to enable/disable flash node?

>>>> The presence of a JEDEC compliant device is implicitly verified during
>>> the
>>>> JEDEC auto-detect procedure.
>>>> But for a non-JEDEC device, the presence must be explicitly checked,
>>>> reading one or more known registers, according to the chip features.
>>>>
>>>> Without any check, if the spi-nor is declared in a Device Tree but not
>>>> physically present on the board, the driver (i.e. m25p80) is loaded
>>> anyway
>>>> and the correspondent mtd device is also created.
>>>> In this way any read operation on this device returns 0xff (or 0x00,
>>>> depending on the driver and the hardware used) and any write operation
>>>> hangs until the flash operation timeout occurs, with the "flash
>>> operation
>>>> timed out" error message.
>>>>
>>>> This patch adds the non-JEDEC spi-nor presence check before initializing
>>>> the device.
>>>>
>>>> Note: currently this presence check supports only the Everspin mr25h40,
>>>>       reading its status register.
>>>>
>>>>       The support for other non-JEDEC devices has to be added.
>>>>
>>>> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
>>>> ---
>>>>  drivers/mtd/spi-nor/spi-nor.c | 43
>>> +++++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 43 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-
>>> nor.c
>>>> index fae1474..d2cb710 100644
>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>> @@ -3981,6 +3981,42 @@ static const struct flash_info
>>> *spi_nor_match_id(const char *name)
>>>>  	return NULL;
>>>>  }
>>>>
[...]
>>>
>>>> +	u8 val;
>>>> +
>>>> +	/* Check presence for Everspin mr25h40 MRAM */
>>>> +	if (!strcmp(info->name, "mr25h40")) {
>>>
>>> Couldn't we make this check for all non-jedec flashes? Aren't we safe to
>>> assume
>>> that all the flashes have a Status Register that contains a WEL bit which
>>> come
>>> with value zero by default?
> 
> Marek, Vignesh, do you know if this assumption is correct?
> 

Seems to be fair assumption IMO, otherwise write operation to such
non-jedec flashes is broken with current SPI NOR/m25p80 driver. But, I
have a different concern even if above assumption is true. See below...

>>
>> I don't know if all the non-JEDEC flashes have a Status Register with
>> the same configuration and with the same default values. So for this 
>> reason I thought to add a specific test for each single flash.
>> In this way, every person who work with a specific flash can add
>> a proper flash presence test.
>> What do you think about this?
> 
> I'm not very happy with having a check for each specific flash, the code will go
> nuts in size. Let's do a generic method, like the one I proposed above. If Marek
> or Vignesh can not confirm if the assumption is correct, then we will have to
> check the datasheets for each non-jedec flash declared in spi-nor to validate
> the assumption :(.
> 
> ta
> 
>>
>>>
>>>> +		/* Read the status register */
>>>> +		ret = nor->read_reg(nor, SPINOR_OP_RDSR, &val, 1);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		dev_dbg(dev, "%s - status register = 0x%2.2x\n",
>>>
>>> %hhx?
>>>
>>>> +			info->name, val);
>>>> +
>>>> +		/* The factory preset of the status register is 0x00 */
>>>
>>> if we generalize this, the comment will become irrelevant. How about
>>> something
>>> like: "Check if flash is connected."
>>>
>>>> +		if (val == 0xff)
>>>> +			return -ENODEV;

Hmm, This depends on how board is wired right? If MISO line is pulled up
to logic 1 when there is no flash connected then read would result in
0xff. But if the pin is floating read would return undefined value
(maybe 0x0) and code would wrongly assume "flash is connected"?

Also, what if there is a different SPI slave connected to that CS on
removable board that responds to SPINOR_OP_RDSR command?

So, I am not fully convinced that this presence check logic is foolproof

Regards
Vignesh

>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>>>>  		 const struct spi_nor_hwcaps *hwcaps)
>>>>  {
>>>> @@ -4158,6 +4194,13 @@ int spi_nor_scan(struct spi_nor *nor, const char
>>> *name,
>>>>  			return ret;
>>>>  	}
>>>>
>>>> +	/* Check non-JEDEC nor presence */
>>>> +	if (!info->id_len) {
>>>
>>> if (name && !info->id_len)?
>>>
>>> How about moving the entire if block to
>>> https://elixir.bootlin.com/linux/v5.2-rc6/source/drivers/mtd/spi-nor/spi-
>>> nor.c#L4037?
>>>
>>> Cheers,
>>> ta
>>>
>>>> +		ret = check_nojedec_nor_presence(nor);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>>  	/* Send all the required SPI flash commands to initialize device */
>>>>  	ret = spi_nor_init(nor);
>>>>  	if (ret)
>>>>
>>
>> Thanks,
>> Flavio
>>

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
