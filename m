Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BC5EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psyHM50EDP7WIBfeMH2GCzOL1/5MwyZNfktjOOZu1lE=; b=gOro/aknAMOOS5qIUcDWFBC1yx
	fmCh3VIDaqjv7QQ6DTN2tUEB1HK5ibnhjXDocAmpbvXf+1T5IZPp6YQhNs3IVQxz1vXjfMKol5W2Z
	GnAWYDAXEfZv3dRFA1E97wh4eC6ZruUGitUeNcCEuidwYB8yTDZMIsv/h5lICJ2GiKTzOTjyn4HC8
	oJ2zgYwuDqnRPMWD290p3MI7ecTnrvsq7cYqSzHx/A9hUmLt5WZF1/swDMwFFZuLHxJGhzXEUfG83
	unF2bzMxOOiY6hFfXx5pABV3SrNrszqTJDw4XCRgX3aasp89Nj6MOQqi48kztY3BmMmoBjdNvFtOP
	I8qb3umQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqRE-002Bpx-2S;
	Thu, 13 Jul 2023 07:08:32 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqRB-002Bnw-2w
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:08:31 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E7D24155;
	Thu, 13 Jul 2023 09:08:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689232105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gx6Z4FQNJUfoY7X3WyDlkTNq2/CBX2LAisHPvK4smEE=;
	b=Cr833eotiDt/cnEqtjQvcLMkP9YyeNWpAD1Nk9ekZG6Gw91ejbAtJYJ41ANHW3BvKYKtT0
	xjU3viurg3ShmBz4NmISY3ovjk8HIQbt+eCe1gm6NpupPWBE6QD3UEAgwNPxX9OCcKY2kF
	sFFQx05kLmtdGugLX8Rek5pWG6B1NPVpDXAv+TNEhtkjvBr1G1J0VXS5KSyjLe+fxhjHRr
	taZt6g4OeU3ZXY82q8pvDhG6tuHngUec3P3qDNp19jsUjaNNz8SWljYAW6F2fHByXZCdeg
	xr9z7KWOkSk6PgS9dqHgEhNkSrsvQKnw/RMQWWDv/gDQ6gXXsPRqo1ArN+lSMQ==
MIME-Version: 1.0
Date: Thu, 13 Jul 2023 09:08:24 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3] mtd: spi-nor: Add support for sst26vf032b flash
In-Reply-To: <8b7d2420-26b6-405b-8ef7-75e0a0201402@linaro.org>
References: <20230712161503.448024-1-miquel.raynal@bootlin.com>
 <8b7d2420-26b6-405b-8ef7-75e0a0201402@linaro.org>
Message-ID: <e7b1e7c916564e761b0e51a424898efe@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_000830_166581_5AE8DA09 
X-CRM114-Status: GOOD (  19.23  )
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

Am 2023-07-13 04:20, schrieb Tudor Ambarus:
> Hi, Miquel,
> 
> On 12.07.2023 19:15, Miquel Raynal wrote:
>> Describe this new part. The datasheet is public.
>> 
>> Link: 
>> https://ww1.microchip.com/downloads/aemDocuments/documents/MPD/ProductDocuments/DataSheets/SST26VF032B-SST26VF032BA-2.5V-3.0V-32-Mbit-Serial-Quad-IO-%28SQI%29-Flash-Memory-20005218K.pdf
>> 
>> Here are the sfdp tables plus base testing to show it works.
>> 
>> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
>> sst26vf032b
>> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
>> bf2642
>> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
>> sst
>> $ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> 53464450060102ff00060110300000ff81000106000100ffbf0001180002
>> 0001fffffffffffffffffffffffffffffffffd20f1ffffffff0144eb086b
>> 083b80bbfeffffffffff00ffffff440b0c200dd80fd810d820914824806f
>> 1d81ed0f773830b030b0f7ffffff29c25cfff030c080ffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffff0004fff37f0000f57f0000f9ff
>> 3d00f57f0000f37f0000ffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffbf2642ffb95ffdff30f260f332ff0a122346ff0f19320f1919ffffff
>> ffffffff00669938ff05013506040232b03072428de89888a585c09faf5a
>> ffff06ec060c0003080bffffffffff07ffff0202ff060300fdfd040600fc
>> 0300fefe0202070e
>> $ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> e7efddddb3d5ee89ca37bf6b6e789645  
>> /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> 
>> $ dd if=/dev/urandom of=./qspi_test bs=1M count=1
>> 1+0 records in
>> 1+0 records out
>> $ mtd_debug write /dev/mtd0 0 1048576 qspi_test
>> Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
>> $ mtd_debug erase /dev/mtd0 0 1048576
>> Erased 1048576 bytes from address 0x00000000 in flash
>> $ mtd_debug read /dev/mtd0 0 1048576 qspi_read
>> Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
>> $ hexdump qspi_read
>> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
>> *
>> 0100000
>> $ mtd_debug write /dev/mtd0 0 1048576 qspi_test
>> Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
>> $ mtd_debug read /dev/mtd0 0 1048576 qspi_read
>> Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
>> $ sha1sum qspi_test qspi_read
>> 2f2f191c7a937eca5db21a1c39e79e7327587cc1  qspi_test
>> 2f2f191c7a937eca5db21a1c39e79e7327587cc1  qspi_read
>> 
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>> 
>> Changes in v3:
>> * Dropped the second patch (untested changes as advised by Tudor).
> 
> thanks
>> * Avoided playing with locking as I cannot test it either: simplified
>>   the diff by just using the PARSE_SFDP flag.> * Rebased on top of 
>> -rc1 and adapted the patch to the current state.
>> 
>>  drivers/mtd/spi-nor/sst.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
>> index 688eb20c763e..754e49f7ac33 100644
>> --- a/drivers/mtd/spi-nor/sst.c
>> +++ b/drivers/mtd/spi-nor/sst.c
>> @@ -111,6 +111,8 @@ static const struct flash_info sst_nor_parts[] = {
>>  			      SPI_NOR_QUAD_READ) },
>>  	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
>>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
>> +	{ "sst26vf032b", INFO(0xbf2642, 0, 0, 0)
>> +		PARSE_SFDP
> 
> if it's just a matter of PARSE_SFDP flag then this flash is a candidate
> for the SPI NOR generic driver, we don't need an explicit flash
> declaration for it.

Ohhh, right. I didn't remember when I've sent my R-b. Can I dig out your
old documentation patch and renew it and add some kind of checklist to 
it?

-michael

> But I assume you need
> .fixups = &sst26vf_nor_fixups
> otherwise the flash comes write protected by default at boot, thus
> erases/writes will be ignored. Are you positive you run the tests again
> for v3?
> 
> Cheers,
> ta
>>  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
>>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
