Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA5AC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nR2pY/L3e4acQJujFssZULrrGaj2wx1tmU5HxB7vpqk=; b=2hDJ4SapvRS60PX9r3ALqgEBVH
	p3HJwiATMcQF4MTBELY7sf72fkyPjKL98uT5ueLpaemSNAe/6QtlJ7nRrE1TdlUjihpczrvoGoRZV
	xcOjc/tN4syg5EJgwDOCgp8fYdUg3lz1WHk34PJpF9BqcyouCg5KawZiuwUeV2fTTlMcKE50P0BLr
	L/vRtJvOETIXUnqEslTdrTWwBesZaW3Z4NOrQqxOcDzGPmj9JPoySqE/2Ntb3xv259+oRaKiXpOz3
	IDfX9xaT2SWJGdw25TGXzRpTFHhcX12i3dIDKSoiTU4X4gmhQnQTYYZ8RQv/4GtZ0yiN0w43gGmDc
	juVPsRzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnRX-003fMe-VY; Tue, 19 Apr 2022 12:58:56 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmJf-003EmF-Rj
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 11:46:45 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 199A12223A;
 Tue, 19 Apr 2022 13:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650368802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hy9+f75H5O31PVsVZ9lqk9GbDwMyawdojGN879oqnow=;
 b=C8gzNaZZKpq/oD1ZbB0WXz+EJf4ObMxe22BZcTCY+2emXyQokICab8hVjiNIa/kKNAxOgD
 Ntoy4Ao17Ka8l1v7azvwmTknaTx1unzYi/a+K8Qosv/FIMyQdDKTOSsj6tyCjvE5OQWB5M
 ivTUQ5edn+2kN0UZYHm8caj/TF/TvI8=
MIME-Version: 1.0
Date: Tue, 19 Apr 2022 13:46:42 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 6/9] mtd: spi-nor: core: Add helpers to read/write any
 register
In-Reply-To: <0e4ec58c21490dcd9cf82ab89bd8c34c@walle.cc>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
 <20220411091033.98754-7-tudor.ambarus@microchip.com>
 <0e4ec58c21490dcd9cf82ab89bd8c34c@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e21b0d76bf778f78f432ba27a673222d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_044644_098150_46A43824 
X-CRM114-Status: GOOD (  15.96  )
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

Am 2022-04-19 13:19, schrieb Michael Walle:
> Am 2022-04-11 11:10, schrieb Tudor Ambarus:
>> There are manufacturers that use registers indexed by address. Some of
>> them support "read/write any register" opcodes. Provide core methods 
>> that
>> can be used by all manufacturers. SPI NOR controller ops are 
>> intentionally
>> not supported as we intend to move all the SPI NOR controller drivers
>> under the SPI subsystem.
>> 
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 
> I still don't like it because the function doesn't do
> anything what the function name might suggest. The read
> just executes an op, the write executes an op with a
> write enable before. All the behavior is determined by the
> 'op' argument.
> 
> Anyway,
> Reviewed-by: Michael Walle <michael@walle.cc>
> 
>> ---
>> v3: no changes
>> 
>>  drivers/mtd/spi-nor/core.c | 41 
>> ++++++++++++++++++++++++++++++++++++++
>>  drivers/mtd/spi-nor/core.h |  4 ++++
>>  2 files changed, 45 insertions(+)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 6165dc7bfd17..42794328d3b6 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -307,6 +307,47 @@ ssize_t spi_nor_write_data(struct spi_nor *nor,
>> loff_t to, size_t len,
>>  	return nor->controller_ops->write(nor, to, len, buf);
>>  }
>> 
>> +/**
>> + * spi_nor_read_reg() - read register to flash memory
>> + * @nor:        pointer to 'struct spi_nor'.
>> + * @op:		SPI memory operation. op->data.buf must be DMA-able.
>> + * @proto:	SPI protocol to use for the register operation.
>> + *
>> + * Return: zero on success, -errno otherwise
>> + */
>> +int spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op,
>> +		     enum spi_nor_protocol proto)
>> +{
>> +	if (!nor->spimem)
>> +		return -EOPNOTSUPP;
>> +
>> +	spi_nor_spimem_setup_op(nor, op, proto);
>> +	return spi_nor_spimem_exec_op(nor, op);
>> +}
>> +
>> +/**
>> + * spi_nor_write_reg() - write register to flash memory
>> + * @nor:        pointer to 'struct spi_nor'
>> + * @op:		SPI memory operation. op->data.buf must be DMA-able.
>> + * @proto:	SPI protocol to use for the register operation.
>> + *
>> + * Return: zero on success, -errno otherwise
>> + */
>> +int spi_nor_write_reg(struct spi_nor *nor, struct spi_mem_op *op,
>> +		      enum spi_nor_protocol proto)
>> +{
>> +	int ret;
>> +
>> +	if (!nor->spimem)
>> +		return -EOPNOTSUPP;
>> +
>> +	ret = spi_nor_write_enable(nor);
>> +	if (ret)
>> +		return ret;
>> +	spi_nor_spimem_setup_op(nor, op, proto);
>> +	return spi_nor_spimem_exec_op(nor, op);

After seeing your next two patches. Shouldn't the
spi_nor_wait_until_ready() call be here too?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
