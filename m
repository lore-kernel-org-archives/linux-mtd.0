Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8B9C33CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 13:00:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E922207FF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 13:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AXuu742v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E922207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XTBHV8MlkZy/mLmnqdlTOGWaklT7rG1j8X7OQnsiy1c=; b=AXuu742vtn5qe/xN7vMpMHxOY
	lZWxFCs3gjB6+XriDQM6IlVwn5Kj4DuqN5kYLtPTG0uPoKBeuJbB9nr0l8kOgHtO+q+UtU5xzrj/Y
	cgaG+heI2d5UTgXjdZriBTy+1CVEQHAlwRoaFEMfaavxaWovGdrH2ZHoM7ZOxw5ZCYYshFDNglU+F
	0Nw7fdzgBiHcp2rHiSt92u/fZuc89y8osazJYnUXwBHczWDYa5feOeSyyj2dnR7dpXh5ctTkCWHpA
	WhKsQwNEL+F0ZqGRE/fWYJEIyb4ZXy9ZoEYRDMu1eWAKFgxba7hafrPIOkupkUUyJh309oJVfo4wy
	AJd5+tolw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqzKM-0008HP-GP; Mon, 13 Jan 2020 13:00:18 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqzKI-0008Gk-Gb
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 13:00:17 +0000
Received: from lhreml705-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 1DEB58465481F0FD5A60;
 Mon, 13 Jan 2020 13:00:08 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml705-cah.china.huawei.com (10.201.108.46) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 Jan 2020 13:00:07 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 13 Jan
 2020 13:00:07 +0000
Subject: Re: [PATCH v3 3/3] mtd: spi-nor: support lock/unlock for a few Micron
 chips
To: Jungseung Lee <js07.lee@samsung.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <js07.lee@gmail.com>
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CGME20200113055910epcas1p384c04182e7c643163d659d42fafd01b3@epcas1p3.samsung.com>
 <20200113055907.9029-3-js07.lee@samsung.com>
 <8ff035e5-ac9e-cc25-6cb8-6d201c2fdb96@huawei.com>
 <799d1e85197f328b05c112e42baf327248f9c9a7.camel@samsung.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <97c5c844-13c5-cfad-158f-417947e44d0e@huawei.com>
Date: Mon, 13 Jan 2020 13:00:06 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <799d1e85197f328b05c112e42baf327248f9c9a7.camel@samsung.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml729-chm.china.huawei.com (10.201.108.80) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_050014_815202_6F7380DB 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: chenxiang <chenxiang66@hisilicon.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 13/01/2020 12:45, Jungseung Lee wrote:
> Hi, John
> 
> 2020-01-13 (Mon), 12:30 +0000, John Garry:
>> On 13/01/2020 05:59, Jungseung Lee wrote:
>>> Some Micron models are known to have lock/unlock support,
>>> and that also support 4bit block protection (bp0-3).
>>>
>>> This patch support lock/unlock feature on the flashes.
>>>
>>> Tested on w25q512ax3. The Other is modified following the
>>> datasheet.
>>>
>>> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
>>> ---
>>>    drivers/mtd/spi-nor/spi-nor.c | 11 ++++++++---
>>>    1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-
>>> nor/spi-nor.c
>>> index 7e8af6c4fdfa..97a027c38d66 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -2583,12 +2583,17 @@ static const struct flash_info
>>> spi_nor_ids[] = {
>>>    	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
>>>    			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>>>    			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
>>> },
>>> -	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K |
>>> USE_FSR | SPI_NOR_QUAD_READ) },
>>> +	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
>>> +			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>>> +			       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>>> +			       SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6)
>>> },
>>>    	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
>>>    			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>>>    			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
>>> },
>>> -	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K |
>>> -			      USE_FSR | SPI_NOR_QUAD_READ) },
>>> +	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
>>> +			       SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>>> +			       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>>> +			       SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6)
>>> },
>>>    	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K |
>>> USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>>>    	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K |
>>> USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>>>    	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
>>>
>>
>> Hi,
>>
>> I'd like to test on a n25q128a11.
>>
> Thanks for your interest to my patches.
> 
>> Seems I just need to add "SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>> 	
>> SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6" to
>> n25q128a11 INFO also, right?
> You're right.
> 
>> Thanks,
>> John
>>
>>
> Best Regards,
> Jungseung Lee

OK, great. So from *limited* testing (which you can judge by my response 
time), this seems to work ok:

root@ubuntu:/home/john# sudo flash_lock -l /dev/mtd0
root@ubuntu:/home/john# sudo mtd_debug write /dev/mtd0 0x100000 4096 
dump4096
[  220.310538] spi-nor spi-PRP0001:00: Program operation failed.
[  220.316314] spi-nor spi-PRP0001:00: Attempted to modify a protected 
sector.
file_to_flash: write, size 0x1000, n 0x1000
write(): Input/output error
root@ubuntu:/home/john# sudo flash_lock -u /dev/mtd0
flash_lock: error!: could not unlock device: /dev/mtd0

             error 5 (Input/output error)
root@ubuntu:/home/john# sudo flash_lock -u /dev/mtd0
root@ubuntu:/home/john# sudo mtd_debug write /dev/mtd0 0x100000 4096 
dump4096
Copied 4096 bytes from dump4096 to address 0x00100000 in flash
root@ubuntu:/home/john#

This write to the bottom portion was previously passing (which was 
improper to do so). Note that the flash_lock -u error is a known issue.

I'll test further this/next week if I get a chance.

Thanks,
John



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
