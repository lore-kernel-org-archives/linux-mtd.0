Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E090CC282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 08:24:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A3C217F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 08:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="efspnTrg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A3C217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WS5sHRRoZodGQhJoNNCd5kOH+qtQLOaOyKcp1ZBkb3k=; b=efspnTrgVevI5c2mxjHBlEoPO
	grTuUlkbDWqpr+lrzTaxABqORKexcW0Ad78gLOkyDrHNaIRKr2Tt+MtYO7uK3TuukLEkq7y4jUAfQ
	UMVhVpkMp+arruPHQUHKlA3b9zkl7AQqcyISJp43aBEK9wObSGDqfHRWBvotBzwU6anf6OLvZ679b
	yZQjQELtfyUs/rpA9jfEt8FYCmhNdXxVgI2PJlV/T7I0H6NLPzDTESE4F490B+6TUPCaz6y0U7O6S
	q9AaCp1Ez9ww2nLNXYN6AUpsST9BpzJtQ1DtsIf2BII8t9NA6wyG4uDkBRciO7OGZYbWMrQ86DMJF
	Npqq6iK3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmDpJ-00087Y-7h; Wed, 23 Jan 2019 08:24:01 +0000
Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmDpF-00087D-38
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 08:23:59 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 979F3A1316;
 Wed, 23 Jan 2019 09:23:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id CnptdBK-BkHj; Wed, 23 Jan 2019 09:23:50 +0100 (CET)
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
To: Boris Brezillon <bbrezillon@kernel.org>
References: <20190122145632.17547-1-sr@denx.de>
 <20190122175346.602894e4@bbrezillon>
 <263cbd32-b7d4-e440-c92d-4f24f5af27a0@denx.de>
 <20190123085202.0db528ac@bbrezillon>
From: Stefan Roese <sr@denx.de>
Message-ID: <870af691-e8d3-cd91-5a55-6478ef885446@denx.de>
Date: Wed, 23 Jan 2019 09:23:47 +0100
MIME-Version: 1.0
In-Reply-To: <20190123085202.0db528ac@bbrezillon>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_002357_437590_85CB680A 
X-CRM114-Status: GOOD (  27.01  )
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
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 23.01.19 08:52, Boris Brezillon wrote:
> On Wed, 23 Jan 2019 07:57:23 +0100
> Stefan Roese <sr@denx.de> wrote:
> 
>> On 22.01.19 17:54, Boris Brezillon wrote:
>>> On Tue, 22 Jan 2019 15:56:32 +0100
>>> Stefan Roese <sr@denx.de> wrote:
>>>    
>>>> Add support for GigaDevice GD5F1GQ4UC SPI NAND chip.
>>>>
>>>> Signed-off-by: Stefan Roese <sr@denx.de>
>>>> Cc: Chuanhong Guo <gch981213@gmail.com>
>>>> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>>
>>> You forgot to Cc me on this one ;-).
>>
>> Ah, sorry about that.
>>    
>>>> ---
>>>> Frankly, I'm a bit unsure, if these new ooblayout_foo functions are
>>>> needed for this device. I was unable to find a datasheet for the
>>>> already supported devices (GD5F1G/2G/4GQ4xA), so I couldn't compare
>>>> the OOB area values here with the ones for my SPI NAND chip.
>>>
>>> Looks like it's using a different layout.
>>
>> Thanks. Can you please point me to a datasheet for the
>> GD5F1G/2G/4GQ4xA?
> 
> I don't have it, I just looked at the code.
> 
>>    
>>>>
>>>> I'm also not 100% sure, if I should use NAND_ECCREQ(8, 2048) or
>>>> NAND_ECCREQ(8, 512) for this device.
>>>
>>> Given the size reserved to store ECC bytes I'd say 8bits/512bytes.
>>> There's an easy way to validate that => nandbiterrs (in mtd-utils).
>>
>> How so. Here some output of this test tool:
>>
>> # ./nandbiterrs /dev/mtd5 -k -o
> 
> use the -i instead of -o.
> 
>> overwrite biterrors test
>> Read reported 7 corrected bit errors
>> Read reported 8 corrected bit errors
>> Failed to recover 1 bitflips
>> Bit error histogram (669 operations total):
>> Page reads with   0 corrected bit errors: 80
>> Page reads with   1 corrected bit errors: 0
>> Page reads with   2 corrected bit errors: 0
>> Page reads with   3 corrected bit errors: 0
>> Page reads with   4 corrected bit errors: 0
>> Page reads with   5 corrected bit errors: 0
>> Page reads with   6 corrected bit errors: 0
>> Page reads with   7 corrected bit errors: 500
>>
>> How does this tell me, if it's 8bits/512bytes or some other
>> value?
> 
> This one doesn't, incremental mode (-i) should.

Here you go:

# ./nandbiterrs /dev/mtd5 -k -i
incremental biterrors test
Failed to recover 1 bitflips
Read error after 0 bit errors per page

I'm still unsure how this helps here. Is there anything else I should
test?
  
>>    
>>>>
>>>> So comments welcome.
>>>>
>>>> Thanks,
>>>> Stefan
>>>>
>>>>    drivers/mtd/nand/spi/gigadevice.c | 39 +++++++++++++++++++++++++++++++
>>>>    1 file changed, 39 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
>>>> index e4141c20947a..a9d256fa2577 100644
>>>> --- a/drivers/mtd/nand/spi/gigadevice.c
>>>> +++ b/drivers/mtd/nand/spi/gigadevice.c
>>>> @@ -57,6 +57,31 @@ static int gd5fxgq4xa_ooblayout_free(struct mtd_info *mtd, int section,
>>>>    	return 0;
>>>>    }
>>>>    
>>>> +static int gd5f1gq4u_ooblayout_ecc(struct mtd_info *mtd, int section,
>>>> +				   struct mtd_oob_region *region)
>>>> +{
>>>> +	if (section)
>>>> +		return -ERANGE;
>>>> +
>>>> +	region->offset = 64;
>>>> +	region->length = 64;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int gd5f1gq4u_ooblayout_free(struct mtd_info *mtd, int section,
>>>> +				    struct mtd_oob_region *region)
>>>> +{
>>>> +	if (section)
>>>> +		return -ERANGE;
>>>> +
>>>> +	/* Reserve 2 bytes for the BBM. */
>>>> +	region->offset = 2;
>>>
>>> According to the datasheet, the BBM is only one byte large.
>>
>> Yes, will change in v2.
>>
>>>    
>>>> +	region->length = 62;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>    static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
>>>>    					 u8 status)
>>>>    {
>>>> @@ -86,6 +111,11 @@ static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout = {
>>>>    	.free = gd5fxgq4xa_ooblayout_free,
>>>>    };
>>>>    
>>>> +static const struct mtd_ooblayout_ops gd5f1gq4u_ooblayout = {
>>>> +	.ecc = gd5f1gq4u_ooblayout_ecc,
>>>> +	.free = gd5f1gq4u_ooblayout_free,
>>>> +};
>>>> +
>>>>    static const struct spinand_info gigadevice_spinand_table[] = {
>>>>    	SPINAND_INFO("GD5F1GQ4xA", 0xF1,
>>>>    		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
>>>> @@ -114,6 +144,15 @@ static const struct spinand_info gigadevice_spinand_table[] = {
>>>>    		     0,
>>>>    		     SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
>>>>    				     gd5fxgq4xa_ecc_get_status)),
>>>> +	SPINAND_INFO("GD5F1GQ4UC", 0xd1,
>>>> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 1, 1, 1),
>>>> +		     NAND_ECCREQ(8, 2048),
>>>> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>>>> +					      &write_cache_variants,
>>>> +					      &update_cache_variants),
>>>> +		     0,
>>>> +		     SPINAND_ECCINFO(&gd5f1gq4u_ooblayout,
>>>> +				     gd5fxgq4xa_ecc_get_status)),
>>>
>>> The gd5fxgq4xa_ecc_get_status() func does not work for this chip.
>>
>> Why not? Using the ECCS0/1 bits are also defined as bits 4/5 in the
>> status byte (addr 0xc0). The ECCSE0/1 bits would provide a more
>> fine grained info though.
>>
>>> Something like that should do the trick:
>>>
>>> #define GD5F1GQ4U_ECC_STATUS_MASK	GENMASK(6, 4)
>>
>> Bit 6 is reserved in my datasheet version. Which version are you
>> referring to?
> 
> http://cn.gigadevice.com/product/detail/30/469.html?locale=en_US
> 
> and the datasheet I downloaded says GD5FxGQ4xC, which seems to match
> the GD5F1GQ4UC part you mention in your commit message.

Yes, but it does not show the device ID 0xd1 which I'm reading to
detect the chip. Here the datasheet that I'm using right now:

www.gigadevice.com/datasheet/gd5f1gq4xexxg/

Looking again, its "GD5F1GQ4UExxG" on the GigaDevice webpage and
in the datasheet, 0xd1 references "GD5F1GQ4U". So I should change
the chip name to "GD5F1GQ4UExxG" instead.

Sorry for the confusion here.

I'll try to enhance the ecc_get_status() function to also read the
status register at addr 0xf0 for the ECCSE0/1 bits to determine a
more fine grained ECC information for this chip.

Thanks,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
