Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63583C4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 22:40:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C69042071E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 22:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rsAu8lXl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="EhcLYYzr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C69042071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tw0oRbL20LCJcrqSOx8w4wEii+MEzgxShrTeq+qS7sI=; b=rsAu8lXlUrDoyQFSU4CepwJUr
	gxJhPz1xEQbLfHBZFcsGTjXkNKsMSLltx9QjKYSQ6ROPCWCLRw0OkzJWhiSDYTyl/YzMwkaSM7zLu
	DbI8TuVUIsBoS8pDe6YtoNNp//4neY08q/1GuIW5GsYR39e4JZBRsRZjji/W7+y/l4XFOezugOmhz
	zc88mBeyYvTp/Lh1ZeLJyUcqPB1H6tERmzhLezAubXNicrJ52zhQObnUGScPLt4tWyqVSaL6CadmX
	Yll+5dIlQ7tf6rMw8g6h7+HNd4xVlP90xdy6V4obIsKaM0ye/powjP7aLw1Z/j72HzYVztAu4/po8
	ILAvFvwdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNkkU-00019N-4S; Wed, 30 Sep 2020 22:38:58 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNkkQ-000185-5I
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 22:38:55 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BD51822EDE;
 Thu,  1 Oct 2020 00:38:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1601505523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dERL4nV7dCj7Ak1q24nlDbwHf/+PRBhMetovVhnlCeY=;
 b=EhcLYYzrnTQbMj0KF43owUjRi6qmpUTlAvIqeWWYBHLjXtsWIwZujZ/wqu+gGZmCn9rot3
 tzsJRMupyHdOCDUC2+a0oA+oyQxUX6LDllDOVpiPb6lOJqINHw1qebFkcG6KHw6ziT2W23
 ZkNDH5u/d0QLRSveHfvCiAhz6ibpvUw=
MIME-Version: 1.0
Date: Thu, 01 Oct 2020 00:38:42 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3] mtd: spi-nor: keep lock bits if they are non-volatile
In-Reply-To: <e56c5f60-2f59-f913-6eea-3bf8dd4c0774@microchip.com>
References: <20200327155939.13153-1-michael@walle.cc>
 <e56c5f60-2f59-f913-6eea-3bf8dd4c0774@microchip.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <a82d1ce203383af149ed77c5fd6c8985@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_183854_313042_8E18D707 
X-CRM114-Status: GOOD (  22.33  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index cc68ea84318e..fd1c36d70a13 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2916,20 +2916,38 @@ static int spi_nor_quad_enable(struct spi_nor 
>> *nor)
>>  }
>> 
>>  /**
>> - * spi_nor_unlock_all() - Unlocks the entire flash memory array.
>> + * spi_nor_global_unprotect() - Perform a global unprotect of the 
>> memory area.
>>   * @nor:	pointer to a 'struct spi_nor'.
>>   *
>>   * Some SPI NOR flashes are write protected by default after a 
>> power-on reset
>>   * cycle, in order to avoid inadvertent writes during power-up. 
>> Backward
>>   * compatibility imposes to unlock the entire flash memory array at 
>> power-up
>> - * by default.
>> + * by default. Do it only for flashes where the block protection bits
>> + * are volatile, this is indicated by SNOR_F_NEED_UNPROTECT.
>> + *
>> + * We cannot use spi_nor_unlock(nor->params.size) here because there 
>> are
>> + * legacy devices (eg. AT25DF041A) which need a "global unprotect" 
>> command.
>> + * This is done by writing 0b0x0000xx to the status register. This 
>> will also
>> + * work for all other flashes which have these bits mapped to BP0 to 
>> BP3.
>> + * The top most bit is ususally some kind of lock bit for the block
>> + * protection bits.
>>   */
>> -static int spi_nor_unlock_all(struct spi_nor *nor)
>> +static int spi_nor_global_unprotect(struct spi_nor *nor)
>>  {
>> -	if (nor->flags & SNOR_F_HAS_LOCK)
>> -		return spi_nor_unlock(&nor->mtd, 0, nor->params->size);
>> +	int ret;
>> 
>> -	return 0;
>> +	dev_dbg(nor->dev, "unprotecting entire flash\n");
>> +	ret = spi_nor_read_sr(nor, nor->bouncebuf);
>> +	if (ret)
>> +		return ret;
>> +
>> +	nor->bouncebuf[0] &= ~SR_GLOBAL_UNPROTECT_MASK;
>> +
>> +	/*
>> +	 * Don't use spi_nor_write_sr1_and_check() because writing the 
>> status
>> +	 * register might fail if the flash is hardware write protected.
>> +	 */
>> +	return spi_nor_write_sr(nor, nor->bouncebuf, 1);
>>  }
> 
> This won't work for all the flashes. You use a GENMASK(5, 2) to clear
> the Status Register even for BP0-2 flashes and you end up clearing 
> BIT(5)
> which can lead to side effects.
> 
> We should instead introduce a nor->params->locking_ops->global_unlock() 
> hook
> for the flashes that have special opcodes that unlock all the flash 
> blocks,
> or for the flashes that deviate from the "clear just your BP bits" 
> rule.

Wouldn't it make more sense to just set params->locking_ops for these 
flashes
to different functions? or even provide a spi_nor_global_unprotect_ops 
in
core.c and these flashes will just set them. there is no individual 
sector
range lock for these chips. just a lock all or nothing.

If it is more common and not just one vendor it might also make sense to 
add
a seperate flag which will then set the locking ops to
spi_nor_global_unprotect_ops, also it seems that there have to be two 
writes
to the status register, one to clear SPRL and then one to clear the BP 
bits.
See for example [1] Table 9-2. I'll have to go through the datasheets 
again
to see what flashes just have a global (un)protect.

[1] https://www.adestotech.com/wp-content/uploads/doc3668.pdf

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
