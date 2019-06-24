Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1335C48BE9
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 11:08:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C5C208E3
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 11:08:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fwoabIkZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y8arNI92"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99C5C208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rG8pkI66+5ehwTXb7AsbfsCnWmj6k1GWTz+sogJsqFk=; b=fwoabIkZRktWvI
	/C3BCBcSzMsESTnHqM4EzTwof3uh9fhBDmeZ/6iRmciYgvcCeAKV8vtMRArGWzkWUbnYVbnXzbHg/
	kIK5+yVSF7CZWI1uqK9jjEjJJepuxZBFMwRw0DDuDB7AV3Xf0Rg/QXfmiziwpPaxSbItfhhtYvRFb
	Gkg4lWxYdKhAo9guWWXFM30tZx+O0xP1rMaI0Pogy7ePyW0uT64+WlPEMtom7aUbKriTupvWecjgG
	UUksO8bz2XrbRt0pbKibrkgvV++G1q/PzGKMB5sI9mD4wdLDKFoaccfU+u702wRqu6Es44XGmkXHw
	nFCsh5VMEnTEiS9Xngpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfMpG-0004zT-RF; Mon, 24 Jun 2019 11:07:54 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfMpD-0004yt-PB
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 11:07:53 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OAxFgd066809;
 Mon, 24 Jun 2019 05:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1561373955;
 bh=xj6qPp/mhLO8O/bD0ogOLiG7+uM+u74/DU37aW5o1M4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=y8arNI920qA2FKw6lZyuxo6SNGGd/H26cY8TI4eWFeTba/3B3cQr9GiCAbIzNc87J
 olZsV+bILard07rOsP64e2IbDPEUBPA3qrJyGOl4Wsf5RPXSDQbhpYqomrQJByWfiL
 a2iU0rWNgvYJrLv7Qb9aFVUhYbSFRfgTEm9ZKVYk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OAxFHW008896
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 24 Jun 2019 05:59:15 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 24
 Jun 2019 05:59:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 24 Jun 2019 05:59:14 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OAxBkM108281;
 Mon, 24 Jun 2019 05:59:11 -0500
Subject: Re: [PATCH v3] mtd: spi-nor: fix nor->addr_width when its value
 configured from SFDP does not match the actual width
To: <Tudor.Ambarus@microchip.com>, <liu.xiang6@zte.com.cn>,
 <linux-mtd@lists.infradead.org>
References: <1554018157-10860-1-git-send-email-liu.xiang6@zte.com.cn>
 <5ffc9e32-ff69-9819-7bfd-ad9f793bb629@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <aea913e6-d168-32dd-1913-f1796905f98e@ti.com>
Date: Mon, 24 Jun 2019 16:29:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5ffc9e32-ff69-9819-7bfd-ad9f793bb629@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_040751_922989_1EA6FD73 
X-CRM114-Status: GOOD (  21.30  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, nagasure@xilinx.com, liuxiang_1999@126.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 22/06/19 5:19 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Liu,
> 
> On 03/31/2019 10:42 AM, Liu Xiang wrote:
> 
>> Some is25lp256 get BFPT_DWORD1_ADDRESS_BYTES_3_ONLY from BFPT table for
>> address width. But in actual fact the flash can support 4-byte address.
>> So we should fix it.
> 
> It's better to be imperative. Substitute "So we should fix it" with something
> like "Use a post bfpt fixup hook to overwrite the address width advertised by
> the BFPT".
> 
>>
> 
> We'll need a fixes tag here.> Suggested-by: Boris Brezillon <bbrezillon@kernel.org>
>> Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
> 
> When? If they didn't explicitly suggested this approach, lets drop the S-b tags.
> 

IIRC, this was actually Boris's patch. No need for my S-b tag me :)

Regards
Vignesh

>> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
>> ---
>>
>> Changes in v3:
>>  add a fixup for is25lp256 to solve the address width problem.
>>
>>  drivers/mtd/spi-nor/spi-nor.c | 25 ++++++++++++++++++++++++-
>>  1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 6e13bbd..d252a66 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1682,6 +1682,28 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>>  		.flags = SPI_NOR_NO_FR | SPI_S3AN,
>>  
>>  static int
>> +is25lp256_post_bfpt_fixups(struct spi_nor *nor,
>> +			   const struct sfdp_parameter_header *bfpt_header,
>> +			   const struct sfdp_bfpt *bfpt,
>> +			   struct spi_nor_flash_parameter *params)
>> +{
>> +	/*
>> +	 * IS25LP256 supports 4B opcodes.
>> +	 * Unfortunately, some devices get BFPT_DWORD1_ADDRESS_BYTES_3_ONLY
>                             ^ which devices, did you get a list from issi?
> 
>> +	 * from BFPT table for address width. We should fix it.
> 
> How about "IS25LP256 supports 4B opcodes, but the BFPT advertises a
> BFPT_DWORD1_ADDRESS_BYTES_3_ONLY address width. Overwrite the address width
> advertised by the BFPT."
> 
>> +	 */
>> +	if ((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
>> +		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
>> +		nor->addr_width = 4;
>> +
>> +	return 0;
>> +}
>> +
>> +static struct spi_nor_fixups is25lp256_fixups = {
> 
> Naga will use "is25lp256_fixups" for the is25wp256 too, but it's not the case to
> change the name yet. All good here.
> 
> I really want to have this in next, can I have an update in the next few days?
> 
> Cheers,
> ta
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
