Return-Path: <SRS0=/ENy=75=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB47C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 07:12:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EEF02074D
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 07:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qpl0iXwo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EEF02074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Wr929quGRHVxzW/QfSE8Y/GYDLVnIUd4e9SR9JmCw8=; b=qpl0iXwoxPYs4Z
	V/ERUwD8MIPsVbuNNFrP1hUZchXxy7VVbpRnGSK/9yTtWVLtwGFz/U/kR9CyTejEJ7QXjjrWzaWaF
	GCgExChkNcKyQlpCdu8i0L1mqn0BA0SjQFb7eiQJFpo0dhQY5PtoWByujgoMq7KgjF617NSPjPapO
	ZLZZTbBo0hOBx6n/YEuXikVJ9uRMXM9S/RMXPnFJHCQCh6aJirTXm0e/2NBTA5GrN2309jwSOArvH
	Gmv5IOHWSL9DTF6mQDz1uORaP4qJQi/0pYdHVEeu8qONuFijZc1gXZDVU56Vx1MIwsceAkBgCmhcq
	h+owMwUNwDQ49/H3Uziw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl5li-00080n-PH; Tue, 16 Jun 2020 07:12:26 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl5kL-0006jV-9b
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2020 07:11:04 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id F14FEEBF59673FC47EBA;
 Tue, 16 Jun 2020 15:10:58 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 16 Jun 2020 15:10:49 +0800
Subject: Re: [RFC PATCH v2 1/2] mtd: spi-nor: Add capability to disable flash
 quad mode
To: Pratyush Yadav <p.yadav@ti.com>
References: <1589282819-42358-1-git-send-email-yangyicong@hisilicon.com>
 <1589282819-42358-2-git-send-email-yangyicong@hisilicon.com>
 <20200615105321.d2pjwjmm3wch4qtx@ti.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <01838d06-29ec-5931-988a-51ebc12f25b0@hisilicon.com>
Date: Tue, 16 Jun 2020 15:10:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200615105321.d2pjwjmm3wch4qtx@ti.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_001102_149824_C5C137F3 
X-CRM114-Status: GOOD (  16.74  )
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
 tudor.ambarus@microchip.com, richard@nod.at, me@yadavpratyush.com,
 john.garry@huawei.com, linuxarm@huawei.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,

Thanks for your review. I'll modify Patch 1 and 2 and
send a formal serie.

Regards,
Yicong


On 2020/6/15 18:53, Pratyush Yadav wrote:
> Hi Yicong,
>
> You generally shouldn't mark a series as "RFC" if you intend it to get 
> merged in.
>
> On 12/05/20 07:26PM, Yicong Yang wrote:
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
>>  drivers/mtd/spi-nor/core.c | 53 ++++++++++++++++++++++++++++++++--------------
>>  drivers/mtd/spi-nor/core.h |  8 +++----
>>  2 files changed, 41 insertions(+), 20 deletions(-)
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
>
> Nits below.
>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index cc68ea8..72e8d8b 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -1907,15 +1907,17 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>  }
>>  
>>  /**
>> - * spi_nor_sr1_bit6_quad_enable() - Set the Quad Enable BIT(6) in the Status
>> + * spi_nor_sr1_bit6_quad_enable() - Set/Unset the Quad Enable BIT(6) in the
>> + *                                  Status
>>   * Register 1.
> The "Register 1" should be on the same line as the "Status above".
>
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
>> @@ -1923,45 +1925,59 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
>>  	if (ret)
>>  		return ret;
>>  
>> -	if (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)
>> +	if ((enable && (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) ||
>> +	    !(enable || (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)))
> I still think writing it as:
>
>     (!enable && !(nor->bouncebuf[0] & SR1_QUAD_EN_BIT6))
>
> is slightly more readable. But maybe it's just me so this is OK I guess.
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
>>  
>>  /**
>> - * spi_nor_sr2_bit1_quad_enable() - set the Quad Enable BIT(1) in the Status
>> + * spi_nor_sr2_bit1_quad_enable() - set/unset the Quad Enable BIT(1) in the
>> + *                                  Status
>>   * Register 2.
> The "Register 2" should be on the same line as the "Status above".
>
>>   * @nor:       pointer to a 'struct spi_nor'.
>> + * @enable:	true to enter quad mode. false to leave quad mode.
>>   *
>>   * Bit 1 of the Status Register 2 is the QE bit for Spansion like QSPI memories.
>>   *
>>   * Return: 0 on success, -errno otherwise.
>>   */
>> -int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
>> +int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor, bool enable)
>>  {
>>  	int ret;
> [...]
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 6f2f6b2..719a31d 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -219,7 +219,7 @@ struct spi_nor_flash_parameter {
>>  
>>  	struct spi_nor_erase_map        erase_map;
>>  
>> -	int (*quad_enable)(struct spi_nor *nor);
>> +	int (*quad_enable)(struct spi_nor *nor, bool enable);
> Update the comment above reflecting that @quad_enable "enables/disables 
> SPI NOR quad mode".
>
>>  	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
>>  	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
>>  	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
