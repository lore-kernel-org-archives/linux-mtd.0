Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9D6C0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 10:38:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4E0720679
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 10:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oCqJq6RO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BU3/ano4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4E0720679
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAnLqkrN7fsJ20m+u6lu5k4+p51fHuy/7NEdxxBrquE=; b=oCqJq6ROm7zJCe
	3LdqqbiEV3DXpA+Qp4+IfOxp4HdlX/xv5SddWLthJYrOVqZ5N+E1vkhrH8+N/O1ecV7i1G3LO4eFU
	smZVQGaBRBuLraOBjmtPYsSn4sQNBDvvvNNz7Gi1ssfFJ/5+bzghUtUCyWgLNP4bq9gqY6//9PUF9
	/gQpuvsx+GzEVvNHJRGHTmXuHRN2fiEaJD54HiP7L/nWafXdEhldNE3yXEwL2CmdfuMrzvAU54/R2
	t7uwbIoeoEw+KXI5KvoELScWlHEiSYvlDOOS+4HpL+W+3LzSh9hDEx4E207gSyrPugWQZuxaCU3oQ
	7u+0dgJBKW54BER+lnxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huaNk-0005gR-Lh; Mon, 05 Aug 2019 10:38:24 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huaNi-0005ft-5M
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 10:38:23 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x75AcHhm119448;
 Mon, 5 Aug 2019 05:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565001497;
 bh=1uFoRjo+sqHmQ0i/bby6EbQk0dfwrARVx/RKVjTWgqc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=BU3/ano49QjoY/dMpIY4Y2onskLIxJm+5oZRaag+oTOCH51n8h2WppyP6HK1/BphX
 7BWLVv1XZN4fAwvO6GhdvKpdWh7MioAOORXNRpDIYvARgCno2pTTBkfQt7mpNz/6kl
 qCFCP1NxSKFkSNqGlxYpZyOHzH0FkfIqB76/eWS0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x75AcHAp085815
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Aug 2019 05:38:17 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 5 Aug
 2019 05:38:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 5 Aug 2019 05:38:16 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x75AcDOV033666;
 Mon, 5 Aug 2019 05:38:14 -0500
Subject: Re: [PATCH v4 1/3] mtd: spi-nor: always use bounce buffer for
 register read/writes
To: <Tudor.Ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>
References: <20190801162229.28897-1-vigneshr@ti.com>
 <20190801162229.28897-2-vigneshr@ti.com>
 <b125bf29-f1fd-6d33-4a7c-49cb94ef1488@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <2b10c18a-e955-31b8-b3e0-c3df83508756@ti.com>
Date: Mon, 5 Aug 2019 16:08:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b125bf29-f1fd-6d33-4a7c-49cb94ef1488@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_033822_342041_77393C4B 
X-CRM114-Status: GOOD (  18.30  )
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
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 05/08/19 2:36 PM, Tudor.Ambarus@microchip.com wrote:
> 
> 
> On 08/01/2019 07:22 PM, Vignesh Raghavendra wrote:
>> External E-Mail
>>
>>
>> spi-mem layer expects all buffers passed to it to be DMA'able. But
>> spi-nor layer mostly allocates buffers on stack for reading/writing to
>> registers and therefore are not DMA'able. Introduce bounce buffer to be
>> used to read/write to registers. This ensures that buffer passed to
>> spi-mem layer during register read/writes is DMA'able. With this change
>> nor->cmd-buf is no longer used, so drop it.
>>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>
>> v4:
>> Avoid memcpy during READID
>>
>> v3: new patch
>>
>>  drivers/mtd/spi-nor/spi-nor.c | 70 ++++++++++++++++++++---------------
>>  include/linux/mtd/spi-nor.h   |  7 +++-
>>  2 files changed, 45 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 03cc788511d5..e02376e1127b 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
> 
> cut
> 
>>  /**
>> @@ -1404,9 +1401,11 @@ static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
>>  {
>>  	int ret;
>>  
>> +	memcpy(nor->bouncebuf, sr_cr, 2);
> 
> I'm thinking out loud. This can be avoided by forcing all the callers to use
> nor->bouncebuf. That would result in a:
> 

I can make this change and make all callers use nor->bouncebuf in next
version.

> static int write_sr(struct spi_nor *nor, size_t len)
> 
> write_sr_cr() can be removed. Memcopying 2 bytes is a small price to pay, we can
> keep things as they are, to not be too invasive. But if you think that this idea
> is worth it, tell.
> 

Sounds good to me. But replacing write_sr_cr() with above defintion of
write_sr() should be a patch IMO>

>> +
>>  	write_enable(nor);
>>  
>> -	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
>> +	ret = nor->write_reg(nor, SPINOR_OP_WRSR, nor->bouncebuf, 2);
>>  	if (ret < 0) {
>>  		dev_err(nor->dev,
>>  			"error while writing configuration register\n");
> 
> cut
> 
>> @@ -2177,9 +2176,10 @@ static const struct flash_info spi_nor_ids[] = {
>>  static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>>  {
>>  	int			tmp;
>> -	u8			id[SPI_NOR_MAX_ID_LEN];
>> +	u8			*id;
>>  	const struct flash_info	*info;
>>  
>> +	id = nor->bouncebuf;
> 
> nit: do init at declaration.
> 

Ok.

> Also, you missed a place in which you can use the bouncebuf, search by "read_reg(":
> ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
> 

Indeed, will fix in next version!

> Cheers,
> ta
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
