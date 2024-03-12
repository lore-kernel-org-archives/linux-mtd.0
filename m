Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD102C54E60
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2024 12:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIlLbi+E5jC1i/dvuBvrQEMQvYQYNI5jB8zGvl0aLiY=; b=DJEgbzqOZs6+xQ
	/uax87cG+CDEmNwT4sUWxbppy3uKDuF7H9jh7lXhgwwyEK03jXwafGhHgLTxuOAyanxK4B16OA7RN
	TPzDOqVWdHk5Mfe0ihRODlfWaUwzS+ZypBDWGT7sN+e6AbN4Z1FlcUbnnemZ9OwRsJcbSq098J8kD
	1+e/TXasDfns65uhkNEoky5tc7yH8fGpKxP0ZE2ue8RVeKSfsM88eyOpDlYLDVZ6TKV5SZboZKeq3
	FRuFlcj766YDrZ6O44MkeUdX0YXVagqF1uohFT7a/87LqhZIesTgtrmcPpsLpibCe3maiDaIbJ5O3
	XnYvdqofVRmRoc9fiN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk11H-00000005giP-3wWW;
	Tue, 12 Mar 2024 12:14:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk11E-00000005ghB-0eWs
	for linux-mtd@lists.infradead.org;
	Tue, 12 Mar 2024 12:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AFD8611A7;
	Tue, 12 Mar 2024 12:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498B1C43399;
	Tue, 12 Mar 2024 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710245647;
	bh=RIledjCrWSCL/IPypQh0lHmpGxAEht7ZxoU3/0wNE40=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YMtMcM1HD9JepAKEyuQuswytFBV5pq115pEWz+RZw+dGwUTHO+H4E8uCtlCmZLu3K
	 yeOtnQJas5uaLZ5D4TxqkVTt8JDac3yA4qXENMSAKlo1jxQnELvmHvHhkI7osYGwze
	 YtiXGANJtJ+sCP1L4YujohQOGY44MzijVk8bgsW/4iKM8MrU41wWsXsGr3yQcI5Hlv
	 ddPv1rRmJn5LS76fTTGBSTVsIoyDae2Ohagyot/OLHO4LaUc2iLaAYU7ypAGttwB2e
	 r/F1J1p7aMpA21mP3h8ofprS7UQ3ZLuF7U3n1xXqT7sW50x6UCInYUuiyGxhWwRwTS
	 AQFPaCOFGml7A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  kernel@collabora.com,
  kernel-janitors@vger.kernel.org,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: core: correct type of i
In-Reply-To: <865fc24b-ae27-4084-893b-c5c389480a09@collabora.com> (Muhammad
	Usama Anjum's message of "Mon, 11 Mar 2024 22:11:33 +0500")
References: <20240304090103.818092-1-usama.anjum@collabora.com>
	<865fc24b-ae27-4084-893b-c5c389480a09@collabora.com>
Date: Tue, 12 Mar 2024 13:14:03 +0100
Message-ID: <mafs0r0gf8x6c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_051408_273523_591B9320 
X-CRM114-Status: GOOD (  13.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Mar 11 2024, Muhammad Usama Anjum wrote:

> Soft reminder

Miquel should pick up the patch when sending out his pull request [0].

[0] https://lore.kernel.org/linux-mtd/20240307180919.4cb7a4cb@xps-13/

>
> On 3/4/24 2:01 PM, Muhammad Usama Anjum wrote:
>> The i should be signed to find out the end of the loop. Otherwise,
>> i >= 0 is always true and loop becomes infinite. Make its type to be
>> int.
>> 
>> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> Changes since v1:
>> - Make i int instead of u8
>> ---
>>  drivers/mtd/spi-nor/core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 65b32ea59afc6..3e1f1913536bf 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3373,7 +3373,7 @@ static u32
>>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>>  			     const struct spi_nor_erase_type *erase_type)
>>  {
>> -	u8 i;
>> +	int i;
>>  
>>  	if (region->overlaid)
>>  		return region->size;

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
