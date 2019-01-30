Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBDCC282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 11:15:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E91621852
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 11:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IUvzGfSB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=procenne.com header.i=@procenne.com header.b="reekghxx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E91621852
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=procenne.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=51gKcfMR0Z1DGdnZ04r+Zp1prV57udC6wrsEh1wyF/w=; b=IUvzGfSBp7r5B20xHMpW6ReMD
	5tSVQTZQ50+A7+8ZNBRVqJDAIejnCbsc+kNwdDqbdi1oj7k+167PA5CPqzNF5qMbyExnVI0vMXbzj
	g4BMtQrO9/NN/Mmzh1+o9Ag7WeEOs8WXhQRUu4S65gABUUM+vm5FOX6Ih9sevTUbeLBDlPN+4kADG
	G24yoxqwA1qlcHbbwPYFW4vzCtwbXieKk77Afa6X0bzXRj6B4IuJV6n0637rN9zBVT3A98ChyDbYG
	VLaJOzP4jH4mXb6EDtL4bm9TxnsiBX6sVsd3X0A/4S8E35L8FjexyjSeyazIIHfSHOCqLlScdnOuP
	1/5sarsBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gonqH-0000Pk-Fx; Wed, 30 Jan 2019 11:15:41 +0000
Received: from forward101o.mail.yandex.net ([37.140.190.181])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gonqD-0000OV-LU
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 11:15:40 +0000
Received: from mxback19j.mail.yandex.net (mxback19j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::95])
 by forward101o.mail.yandex.net (Yandex) with ESMTP id 95E313C00D7B;
 Wed, 30 Jan 2019 14:15:31 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net
 [2a02:6b8:0:1472:2741:0:8b6:6])
 by mxback19j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 0XrCIVjExF-FUY8JaeX;
 Wed, 30 Jan 2019 14:15:31 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=procenne.com; s=mail;
 t=1548846931; bh=dRegKhDExX2OcHYXywxBkvE1likDHNPeZPd7FB4kAGk=;
 h=Subject:To:Cc:References:From:Message-ID:Date:In-Reply-To;
 b=reekghxx46nmLs0J4mcedw9JXGBhhVIezX045n/C1YBISC4tFLxbN5nj7KyKJTGjv
 OfRzWIIdjh8y7iNCIo37DSBOyco42FDREZGLhmBVKBm8Og3bobWTqbQCwrJM+LRNWj
 vlH0jpiUoG+LncqX4wlNP6Y/KXbDe57XZEXOOckk=
Authentication-Results: mxback19j.mail.yandex.net;
 dkim=pass header.i=@procenne.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 fVbTfkEHgN-FTOK5IgD; Wed, 30 Jan 2019 14:15:29 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
Subject: Re: [PATCH] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
To: Schrempf Frieder <frieder.schrempf@kontron.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1548843970-8473-1-git-send-email-ahmet.celenk@procenne.com>
 <ef00c0a2-299e-55c0-9df5-5b2eccccda41@kontron.de>
From: "A. Celenk" <ahmet.celenk@procenne.com>
Message-ID: <ad173dc2-02ec-1f4d-2ba6-6f525b8d2912@procenne.com>
Date: Wed, 30 Jan 2019 14:15:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <ef00c0a2-299e-55c0-9df5-5b2eccccda41@kontron.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_031538_151385_C8AF3DE2 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thanks a lot.

I've just pasted what one of the Cypress employee typed. See: 
https://community.cypress.com/message/183438#183438

I've asked my question with a code snipped from an older kernel. 
Probably he missed that point and I couldn't notice that flag exist in 
newer kernels. I'll be adding that flag.

On 30.01.2019 14:05, Schrempf Frieder wrote:
> On 30.01.19 11:26, A. Celenk wrote:
>> Due to two different versions (S25FL128SAGBHI200 and S25FL128SAGBHI210) of
>> the s25fl128s qspi memory, the single "s25fl128s" device entry must be
>> split into two to match the correct JEDEC ID's for each version. Solves
>> paging related issues of S25FL128SAGBHI210 chips.
>>
>> Signed-off-by: A. Celenk <ahmet.celenk@procenne.com>
>>
>> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
>> Cc: Marek Vasut <marek.vasut@gmail.com>
>> ---
>>    drivers/mtd/spi-nor/spi-nor.c | 3 ++-
>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 13a5055..1ee2d56 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1898,7 +1898,8 @@ static const struct flash_info spi_nor_ids[] = {
>>    	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>>    	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>>    	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
>> -	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>> +	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64, SPI_NOR_QUAD_READ | USE_CLSR) },
>> +	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_QUAD_READ | USE_CLSR) },
> Why are you dropping the SPI_NOR_DUAL_READ flag in the new entries?
>
>>    	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>    	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>    	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
