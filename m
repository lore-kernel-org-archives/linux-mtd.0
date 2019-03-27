Return-Path: <SRS0=crBW=R6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3E3C10F00
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2019 16:04:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A45120700
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2019 16:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BqJxwrfL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="x+nuKIaz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A45120700
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PYUJGTxf5B7CvJhqXGs+Mvuna9PJeLBjyF4KsbB4Zk=; b=BqJxwrfL33GpO3
	zgyVhzSI0Ft0CmEAn7wZCN+UTAPkQB3kCN1Q1PJgjOIxtIsw5Fg3lBKm55vPHMtXEG3VAVpKWqqId
	2Z7CYeKqo1xrsitPRk8qMmvuSILNAHs+EetZ+v+fF0ouQbBghQOiyppxIHL69Ahlbk08QaSaBUlUJ
	gWLMEtTs0pD0enCjbfetHTW2lLZZXAJpEZ29aHJB+zEpvNwWcFxZS59/1moMTRrf4o1ht3hoLze9J
	1Tm1xHhqeSINBWkEmW7GL6ZUYMNk0l7rx5okT27A2fmj+fduPeFcb0vJ647wfxSJrqx8gcBCZDG0H
	cLg9bensxl9t7JwlEUHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9B1w-0002JP-L6; Wed, 27 Mar 2019 16:03:56 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9B1s-0002Io-KG
 for linux-mtd@lists.infradead.org; Wed, 27 Mar 2019 16:03:54 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2RG3aLv040085;
 Wed, 27 Mar 2019 11:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1553702616;
 bh=bY6i+Gb3B1LRhSlCo7jad+rnNzPpomSDjT2EHAj2YhE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=x+nuKIazGsJ/LII5BL7C3FgtqpX7YV+Jc2OFMgPiwV7Wb4emj1kxo8is156QhYvXb
 QkB6E+CyBeIK+sv0cs9yMDMO9fE4qslVOCIDr5V6VMO5Dkl/J07LavJ78TM948hNGr
 T0by+ykhjGwCqRU+HpuB7fLnxwYSdplo2TdGZAcI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2RG3ZXh126512
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 27 Mar 2019 11:03:35 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 27
 Mar 2019 11:03:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 27 Mar 2019 11:03:35 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2RG3V3k102496;
 Wed, 27 Mar 2019 11:03:32 -0500
Subject: Re: [PATCH v2] mtd: spi-nor: Return error when nor->addr_width does
 not match the device size
To: Liu Xiang <liuxiang_1999@126.com>
References: <1552484753-3393-1-git-send-email-liu.xiang6@zte.com.cn>
 <823dcd3f-8b9f-15c5-a072-06625120766e@ti.com>
 <209ad144.9c0a.169ba96e2ad.Coremail.liuxiang_1999@126.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <c718ab17-1c0a-a75f-c43a-4e2558a67d0f@ti.com>
Date: Wed, 27 Mar 2019 21:34:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <209ad144.9c0a.169ba96e2ad.Coremail.liuxiang_1999@126.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_090352_745739_C5D01767 
X-CRM114-Status: GOOD (  18.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Liu Xiang <liu.xiang6@zte.com.cn>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 26/03/19 8:50 PM, Liu Xiang wrote:
> At 2019-03-19 13:22:15, "Vignesh Raghavendra" <vigneshr@ti.com> wrote:
>> Hi,
>>
>> On 13/03/19 7:15 PM, Liu Xiang wrote:
>>> In some is25lp256, the DWORD1 of JEDEC Basic Flash Parameter Header
>>> is 0xfff920e5. So the DWORD1[18:17] Address Bytes bits are 0b00,
>>> means that 3-Byte only addressing. But the device size is larger
>>> than 16MB, nor->addr_width must be 4 to access the whole address.
>>> An error should be returned when nor->addr_width does not match
>>> the device size in spi_nor_parse_bfpt(). Then it can go back to
>>> use spi_nor_ids[] for setting the right addr_width.
>>>
>>> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
>>> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index 6e13bbd..63933c7 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -2811,6 +2811,14 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>>  	}
>>>  	params->size >>= 3; /* Convert to bytes. */
>>>  
>>> +	/*
>>> +	 * If the device exceeds 16MiB, addr_width must be 4.
>>> +	 * addr_width == 3 means the Address Bytes we are
>>> +	 * reading from BFPT is wrong.
>>> +	 */
>>
>> JESD216 standard does not mandate flash devices >16MiB to always support
>> 4 byte addressing opcode. So, its okay for flash vendor to support
>>> 16MiB flash with 3 byte addressing and Bank/extended address register.
>>
>>> +	if (params->size > 0x1000000 && nor->addr_width == 3)
>>> +		return -EINVAL;
>>> +
>>
>> Assuming only DWORD1[18:17] bits are wrong, then returning from here
>> would mean we miss parsing Sector Erase settings, Quad Enable
>> Requirements etc from BFPT which is kind of bad.
>> I suggest to move the fix to[1], addr_width indicated in flash_info
>> struct of the device can take precedence over SFDP.
>>
>> [1]https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/spi-nor.c#L4106
> 
> Boris has added a fixup function, do you think this is more better:
> 
> static int
> is25lp256_post_bfpt_fixups(struct spi_nor *nor,
> 			    const struct sfdp_parameter_header *bfpt_header,
> 			    const struct sfdp_bfpt *bfpt,
> 			    struct spi_nor_flash_parameter *params)
> {
> 	/*
> 	 * IS25LP256 supports 4B opcodes.
> 	 * Unfortunately, some devices get BFPT_DWORD1_ADDRESS_BYTES_3_ONLY  
> 	 * from BFPT table for address width. We should fix it.
> 	 */
> 	if (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK == 
> 		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
> 		nor->addr_width = 4;
> 
> 	return 0;
> }
> 
> static struct spi_nor_fixups is25lp256_fixups = {
> 	.post_bfpt = is25lp256_post_bfpt_fixups,
> };
> 
> 

Sounds fine to me as is25lp256 is the only part that needs this quirk at
the moment.


-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
