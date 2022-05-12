Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D523C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 21:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joHFeki2ld2u8Dp9lX7bhnHWFtnT9jkHEe01UMPksgU=; b=ZTMr4X7TAh/TJBZajvHVDKtQA2
	sMLZuMUkBEPQn6BPSkTB3UmMZ+/QrKSsx30fY3I3kzJvFZTV43aoo+h5gcsqKDVeNO2d0lS5zMzqe
	46onw5TgdxUMNPrGLDhvvOHTXsIgzJScTeOjI/t7hx+H37A9hkN6IToqbnNf9tSYj3cHc5y7tYJY+
	9OgitWxh/7lDVo7zh5Fmq5fnvMlUmY1k/M09quXbIpgNlFg8axPpz9smIu5iC4I4gO7bxOUpxcA7y
	+fX9/MtSB2rvCcUXD6SYW9Du8W3nZWuVRlVfQ8sZXvcxpEzCbwT8uovK+KiFJMoIvnieAoyENc8Pn
	rT5vd6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npGWL-00DeXM-Hy; Thu, 12 May 2022 21:38:53 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npGWJ-00DeWk-9R
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 21:38:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 658C42223A;
 Thu, 12 May 2022 23:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652391529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBBt/FAIKmfsQtoIjpIUSnsN4iprNg7zfmpDUhgexVQ=;
 b=TJmsEN/E4Ya2eRU280WYV/mdSeEH516xunC+jMc/cZNXnZ23S/GVsN0uwuRwFGjI9pYzfE
 L/LgxWPP4Lwa0GsYTOn+sOnqiG73HeISY/gZFuzWRFqEF+OjN4qUsNkn/bQk9MNPi2XEXk
 zW8ZBhkh/7aD1ePTMApDC3hVA2zXLVk=
MIME-Version: 1.0
Date: Thu, 12 May 2022 23:38:49 +0200
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, p.yadav@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 3/8] mtd: spi-nor: sfdp: Clarify that
 nor->read_{opcode, dummy} are uninitialized
In-Reply-To: <3affb097cbd5798098fa99e80050b322@walle.cc>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <cdfe160d76401fe538c42b71edb1fe338604c055.1652063152.git.Takahiro.Kuwano@infineon.com>
 <3affb097cbd5798098fa99e80050b322@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <3dc7debffed6f3ca1221dffa48e0f330@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_143851_534085_74D33C0D 
X-CRM114-Status: GOOD (  11.00  )
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

Am 2022-05-12 23:33, schrieb Michael Walle:
> Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>> 
>> nor->read_{opcode, dummy} are uninitialized (value zero) at SFDP 
>> parsing
>> time. Clarify that in the code.
>> 
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> Tested-By: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>>  drivers/mtd/spi-nor/sfdp.c | 18 ++++++++----------
>>  1 file changed, 8 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index 61ae8c8c5237..058ce218d2af 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -178,12 +178,10 @@ static int spi_nor_read_raw(struct spi_nor *nor,
>> u32 addr, size_t len, u8 *buf)
>>  static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
>>  			     size_t len, void *buf)
>>  {
>> -	u8 addr_nbytes, read_opcode, read_dummy;
>> +	u8 addr_nbytes;
>>  	int ret;
>> 
>> -	read_opcode = nor->read_opcode;
>>  	addr_nbytes = nor->addr_nbytes;
>> -	read_dummy = nor->read_dummy;
>> 
>>  	nor->read_opcode = SPINOR_OP_RDSFDP;
>>  	nor->addr_nbytes = 3;
>> @@ -191,9 +189,10 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, 
>> u32 addr,
>> 
>>  	ret = spi_nor_read_raw(nor, addr, len, buf);
>> 
>> -	nor->read_opcode = read_opcode;
>>  	nor->addr_nbytes = addr_nbytes;
>> -	nor->read_dummy = read_dummy;
>> +	/* Restore setup to its uninitialized state. */
>> +	nor->read_opcode = 0;
>> +	nor->read_dummy = 0;
>> 
>>  	return ret;
>>  }
>> @@ -690,7 +689,7 @@ static const u32 *spi_nor_get_map_in_use(struct
>> spi_nor *nor, const u32 *smpt,
>>  	u32 addr;
>>  	int err;
>>  	u8 i;
>> -	u8 addr_nbytes, read_opcode, read_dummy;
>> +	u8 addr_nbytes;
>>  	u8 read_data_mask, map_id;
>> 
>>  	/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
>> @@ -699,8 +698,6 @@ static const u32 *spi_nor_get_map_in_use(struct
>> spi_nor *nor, const u32 *smpt,
>>  		return ERR_PTR(-ENOMEM);
>> 
>>  	addr_nbytes = nor->addr_nbytes;
>> -	read_dummy = nor->read_dummy;
>> -	read_opcode = nor->read_opcode;
>> 
>>  	map_id = 0;
>>  	/* Determine if there are any optional Detection Command Descriptors 
>> */
>> @@ -757,8 +754,9 @@ static const u32 *spi_nor_get_map_in_use(struct
>> spi_nor *nor, const u32 *smpt,
>>  out:
>>  	kfree(buf);
>>  	nor->addr_nbytes = addr_nbytes;
>> -	nor->read_dummy = read_dummy;
>> -	nor->read_opcode = read_opcode;
>> +	/* Restore setup to its uninitialized state. */
> 
> Who is modifying this?

Ahh scrap that, this very function. I need to go to sleep.

I just saw your next patch which will also get rid of the
addr_nbytes. I'd still like to get rid of this state sometime
and pass it as an additional parameter. But:

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
