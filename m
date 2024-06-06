Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D424C27C55
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9t9DI4pNJGyy5bI6cQvifRq22WAnpI6bA0onHi1EmE=; b=bvn20hHMdn9HVH
	XGjHNpWG2xqtLho6fdAE70BDMKK7vO4k8mjj05Z4gMjeWrWxDXKOJ7NdCn6QkDCVNeMugLA4EjuEr
	n4RAiu/WW1O46ikdY3SR6eD+H5vHkFOjHnC04i0d1WHEXnXrgK0KkRRwhpR+p3XWYoruAum2F5WR9
	JIm54JZyaeSgEAlUGoZkNtK2D5+Lj2gVJ0cygSZJg5zSlVr4guaZUNV1MGgXKGpnSzQjnjetOm5bB
	ra2FeEypvarjXrxNrAWzboTHXMtusV9gYYnP8bWeqk8Cp40RRGFylGP4264/C13+ENCp8J6tQFxfF
	5UtS73ODDoYnFVe0nAtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGh6-0000000AfFS-1lBh;
	Thu, 06 Jun 2024 17:14:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGh4-0000000AfF0-1whi
	for linux-mtd@bombadil.infradead.org;
	Thu, 06 Jun 2024 17:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1vBrOmztxvBw+j73gnLOXwBxCVfezAXKUqEGyYm7Fts=; b=MjbE/epZDZTZtWxUcRgECwCJY8
	Y1AAzq5apQvo5e5+rf722JPQXCgNALYB+obzkRNEKI6g8P94jBBHOBxOYjGrHwPcZ+0RSAA+u3Cza
	nn8b+DWsBIQsWI5FSj6u/WwaE+JXZPSQ4En+N5nsrIcTUdkk55nqB67i0bDmq1AlLMJ52/llf+ayI
	RHUGbFc1mkgwsn47jv9yp6l19WtXotZXUrxZaYCx0I3mOLWPTEnSBOeHWyw0CCSpKbIeIR2lUSjEe
	QHEAnh88VkPvxQ1S9QXpsRg3HNwd9lsHJbUjEiblNcLCgjXY5tMinnULHFNpBub7qpILZAb9D0Uqx
	zcaS2jeA==;
Received: from www530.your-server.de ([188.40.30.78])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGh1-00000001fRX-2JZ3
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 17:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1vBrOmztxvBw+j73gnLOXwBxCVfezAXKUqEGyYm7Fts=; b=kpWsQY2+cY0zYTy6UinHv5YmIN
	7lP0AP1opPSmrj4ovt/CwCKTZohixjRO7oMjFCcjLYw8kr+4g3O5cdCWB4mGLZUKSqeN1pf6GiVvB
	DjfOkZH3NmsY/wkBRwI/ZvJcXQu8s6WHDB2JSaOi+DDhmlxEqepkAT0BQUVOahnBi1psQdjSEGBzD
	hc83WZfTHp/lJAFHkkLD8drOP+V/fEtkCOLDmqEtoItOXinUlU4VJO3JodLHl9kvUR3gaH+QSId3P
	fO6mLgGyn4V3mdZTj60sC/ARwDW0j199MLwzWuyHuIXvwBPD9HYSEwO2js1iOGROEzJAGYVB9+gxc
	b4goRBQg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sFGgb-00012F-Sw; Thu, 06 Jun 2024 19:13:58 +0200
Received: from [80.62.117.184] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sFGgY-0005oY-0K;
	Thu, 06 Jun 2024 19:13:57 +0200
From: Esben Haabendal <esben@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Rasmus
 Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: core: add flag for doing optional
 SFDP
In-Reply-To: <a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org> (Tudor
	Ambarus's message of "Thu, 6 Jun 2024 14:31:22 +0100")
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
	<20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com>
	<a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org>
Date: Thu, 06 Jun 2024 19:13:57 +0200
Message-ID: <878qziat9m.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27298/Thu Jun  6 10:30:08 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_181427_597521_A7C03E42 
X-CRM114-Status: GOOD (  14.26  )
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

Tudor Ambarus <tudor.ambarus@linaro.org> writes:

> On 6/3/24 14:09, Esben Haabendal wrote:
>> A dedicated flag for triggering call to
>> spi_nor_sfdp_init_params_deprecated() allows enabling optional SFDP read
>> and parse, with fallback to legacy flash parameters, without having dual,
>> quad or octal parameters set in the legacy flash parameters.
>> 
>> With this, spi-nor flash parts without SFDP that is replaced with a
>> different flash NOR flash part that does have SFDP, but shares the same
>> manufacturer and device ID is easily handled.
>> 
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 3 ++-
>>  drivers/mtd/spi-nor/core.h | 1 +
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 3e1f1913536b..1c4d66fc993b 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2933,7 +2933,8 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
>>  
>>  	spi_nor_manufacturer_init_params(nor);
>>  
>> -	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
>> +	if (nor->info->no_sfdp_flags & (SPI_NOR_TRY_SFDP |
>
> I don't like that we update deprecated methods. The solution though is
> elegant.

Maybe we should un-deprecate it? I don't understand why it should be
deprecated. It obviously has a valid purpose.

>> +					SPI_NOR_DUAL_READ |
>>  					SPI_NOR_QUAD_READ |
>>  					SPI_NOR_OCTAL_READ |
>>  					SPI_NOR_OCTAL_DTR_READ))
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 442786685515..77f61a984cb3 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -535,6 +535,7 @@ struct flash_info {
>>  	u8 no_sfdp_flags;
>>  #define SPI_NOR_SKIP_SFDP		BIT(0)
>>  #define SECT_4K				BIT(1)
>> +#define SPI_NOR_TRY_SFDP		BIT(2)
>>  #define SPI_NOR_DUAL_READ		BIT(3)
>>  #define SPI_NOR_QUAD_READ		BIT(4)
>>  #define SPI_NOR_OCTAL_READ		BIT(5)
>> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
