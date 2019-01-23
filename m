Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16130C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 06:57:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA13520870
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 06:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tK77QrZT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA13520870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M6Blc+kNu4yiZyZq0Pc2wC1I1CdhNIZxbsil5t8muno=; b=tK77QrZTa4UM0ENwQfHlmlnQ2
	P53+NsMs15XsAwCHuxLJYWpTXqvECJio789h+fUf7m2K67bzJM7X+CIEM171/s9LYcmMRMb//8kPr
	/UAMXaWu7bRs93SxBYEkSDRCH2NouFmDQuyRNjmlGW/kTmLPD1D2n92AgrsberIWMzHs1WEUTRdRE
	qaZdwu+k1F58QncoeHUWw3C9a4vx9enTY1ucEApnAlGpxkDevCJFBMfm0kta09FoWba69ih/whSJ+
	OFsenD9w3LmU0t9fIJJGczUkQB74LMe6J+QzTwK72uSyc0GYhAQyk9FOw0bJkExXZ429URszZDdBF
	fA+yoNLZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmCTe-0000Lx-Q3; Wed, 23 Jan 2019 06:57:34 +0000
Received: from mx2a.mailbox.org ([2001:67c:2050:104:0:2:25:2]
 helo=mx2.mailbox.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmCTZ-0000Le-JT
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 06:57:33 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id D916AA110F;
 Wed, 23 Jan 2019 07:57:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id itu6jS5k4WDL; Wed, 23 Jan 2019 07:57:24 +0100 (CET)
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
To: Boris Brezillon <bbrezillon@kernel.org>
References: <20190122145632.17547-1-sr@denx.de>
 <20190122175346.602894e4@bbrezillon>
From: Stefan Roese <sr@denx.de>
Message-ID: <263cbd32-b7d4-e440-c92d-4f24f5af27a0@denx.de>
Date: Wed, 23 Jan 2019 07:57:23 +0100
MIME-Version: 1.0
In-Reply-To: <20190122175346.602894e4@bbrezillon>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_225729_949697_85215F10 
X-CRM114-Status: GOOD (  22.96  )
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
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22.01.19 17:54, Boris Brezillon wrote:
> On Tue, 22 Jan 2019 15:56:32 +0100
> Stefan Roese <sr@denx.de> wrote:
> 
>> Add support for GigaDevice GD5F1GQ4UC SPI NAND chip.
>>
>> Signed-off-by: Stefan Roese <sr@denx.de>
>> Cc: Chuanhong Guo <gch981213@gmail.com>
>> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> You forgot to Cc me on this one ;-).

Ah, sorry about that.
  
>> ---
>> Frankly, I'm a bit unsure, if these new ooblayout_foo functions are
>> needed for this device. I was unable to find a datasheet for the
>> already supported devices (GD5F1G/2G/4GQ4xA), so I couldn't compare
>> the OOB area values here with the ones for my SPI NAND chip.
> 
> Looks like it's using a different layout.

Thanks. Can you please point me to a datasheet for the
GD5F1G/2G/4GQ4xA?
  
>>
>> I'm also not 100% sure, if I should use NAND_ECCREQ(8, 2048) or
>> NAND_ECCREQ(8, 512) for this device.
> 
> Given the size reserved to store ECC bytes I'd say 8bits/512bytes.
> There's an easy way to validate that => nandbiterrs (in mtd-utils).

How so. Here some output of this test tool:

# ./nandbiterrs /dev/mtd5 -k -o
overwrite biterrors test
Read reported 7 corrected bit errors
Read reported 8 corrected bit errors
Failed to recover 1 bitflips
Bit error histogram (669 operations total):
Page reads with   0 corrected bit errors: 80
Page reads with   1 corrected bit errors: 0
Page reads with   2 corrected bit errors: 0
Page reads with   3 corrected bit errors: 0
Page reads with   4 corrected bit errors: 0
Page reads with   5 corrected bit errors: 0
Page reads with   6 corrected bit errors: 0
Page reads with   7 corrected bit errors: 500

How does this tell me, if it's 8bits/512bytes or some other
value?
  
>>
>> So comments welcome.
>>
>> Thanks,
>> Stefan
>>
>>   drivers/mtd/nand/spi/gigadevice.c | 39 +++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
>> index e4141c20947a..a9d256fa2577 100644
>> --- a/drivers/mtd/nand/spi/gigadevice.c
>> +++ b/drivers/mtd/nand/spi/gigadevice.c
>> @@ -57,6 +57,31 @@ static int gd5fxgq4xa_ooblayout_free(struct mtd_info *mtd, int section,
>>   	return 0;
>>   }
>>   
>> +static int gd5f1gq4u_ooblayout_ecc(struct mtd_info *mtd, int section,
>> +				   struct mtd_oob_region *region)
>> +{
>> +	if (section)
>> +		return -ERANGE;
>> +
>> +	region->offset = 64;
>> +	region->length = 64;
>> +
>> +	return 0;
>> +}
>> +
>> +static int gd5f1gq4u_ooblayout_free(struct mtd_info *mtd, int section,
>> +				    struct mtd_oob_region *region)
>> +{
>> +	if (section)
>> +		return -ERANGE;
>> +
>> +	/* Reserve 2 bytes for the BBM. */
>> +	region->offset = 2;
> 
> According to the datasheet, the BBM is only one byte large.

Yes, will change in v2.

> 
>> +	region->length = 62;
>> +
>> +	return 0;
>> +}
>> +
>>   static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
>>   					 u8 status)
>>   {
>> @@ -86,6 +111,11 @@ static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout = {
>>   	.free = gd5fxgq4xa_ooblayout_free,
>>   };
>>   
>> +static const struct mtd_ooblayout_ops gd5f1gq4u_ooblayout = {
>> +	.ecc = gd5f1gq4u_ooblayout_ecc,
>> +	.free = gd5f1gq4u_ooblayout_free,
>> +};
>> +
>>   static const struct spinand_info gigadevice_spinand_table[] = {
>>   	SPINAND_INFO("GD5F1GQ4xA", 0xF1,
>>   		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
>> @@ -114,6 +144,15 @@ static const struct spinand_info gigadevice_spinand_table[] = {
>>   		     0,
>>   		     SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
>>   				     gd5fxgq4xa_ecc_get_status)),
>> +	SPINAND_INFO("GD5F1GQ4UC", 0xd1,
>> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 1, 1, 1),
>> +		     NAND_ECCREQ(8, 2048),
>> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>> +					      &write_cache_variants,
>> +					      &update_cache_variants),
>> +		     0,
>> +		     SPINAND_ECCINFO(&gd5f1gq4u_ooblayout,
>> +				     gd5fxgq4xa_ecc_get_status)),
> 
> The gd5fxgq4xa_ecc_get_status() func does not work for this chip.

Why not? Using the ECCS0/1 bits are also defined as bits 4/5 in the
status byte (addr 0xc0). The ECCSE0/1 bits would provide a more
fine grained info though.

> Something like that should do the trick:
> 
> #define GD5F1GQ4U_ECC_STATUS_MASK	GENMASK(6, 4)

Bit 6 is reserved in my datasheet version. Which version are you
referring to?
  
> static int gd5f1gq4u_ecc_get_status(struct spinand_device *spinand,
> 				    u8 status)
> {
> 	unsigned int nbitflips;
> 
> 	nbitflips = (status & GD5F1GQ4U_ECC_STATUS_MASK) >> 4;
> 	if (!nbitflips)
> 		return 0;
> 
> 	nbitflips += 2;
> 	if (nbitflips > 8)
> 		return -EBADMSG;
> 
> 	return nbitflips
> }

Hmmm this does not match my datasheet AFAICT (please see above).

Many thanks for the review,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
