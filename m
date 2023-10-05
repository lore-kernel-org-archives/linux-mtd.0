Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DA1E93701
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 11:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8T2frg6PflcNC20dZ5iuc/+wyBiBSnl7BF9vTVDLu8c=; b=KkUSe6LzrJUsWW
	SMUE+Jombstwrz8rsdgSKYOs3a435lFtveSem3RaWqcx/7lNtUAAN4VpRdaDcnzmdeZM1vuaXLBzh
	DDa+yFHGUvap/OENu2p7YS1lMrq4F4EFyE3NDE4Qh5ap9IhSC1i2RXqDCA6ac7js28uJtiDziQGkN
	xQYbAJmNaP92DEAfLnQROyjXG8LASQJLUk4rjSUgiGbMpwthCy2j8GOWLiKA/GO2zIuBMK2Np+6bo
	HjoBDdw2EK1tvWAA4KQRAB1an1+BndLd1M+sSrpfjLD9ZzYeVcVJab/14OGlT//TEiH2bYEFblJTk
	6PcBBLW2fLZz+lWnK6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoM7d-00222s-1v;
	Thu, 05 Oct 2023 11:02:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoM7X-0021xi-2v
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 11:02:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 286A0618FA;
	Thu,  5 Oct 2023 11:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763CDC32786;
	Thu,  5 Oct 2023 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696503729;
	bh=85Pz+K8kLgOQBcbDOJ6o7OKQGV7g37OfU/kh2WeEacs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gcKigLZqSf0/NSiaVFaV8via9jwwlVyPeGyILq8nQ50RRFr2AguyU8yWNCjQ6boJL
	 3lLhAAXX5ZoxLQCUE9d+JZ60JnonC7Y9PGT3tWz6Jgkm6HsDfknoEsDtzNQpKUrx7Z
	 TPq5C7bPVhSafe1MK//78WmcixH4HPJ0QIzZa7EhH0ZyczEPUucQ2HG4qD8pRr4B/g
	 6gNGlxC7ex5GyPlipNXLE378Z2eJep2ZIBbNrHpKyCwH+NMjNtOy9hQ5IYrGvfsIHR
	 zzUOzS35pX3W+DxOHBa2AcBtNqBgF/8KMjYL65SSw+fK/dfBCr4zP1AjILVwfP4s8J
	 onx8dX6IuYLVA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>,  linux-mtd@lists.infradead.org,
  pratyush@kernel.org,  michael@walle.cc,  miquel.raynal@bootlin.com,
  leoyu@mxic.com.tw,  jaimeliao@mxic.com.tw
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
In-Reply-To: <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org> (Tudor
	Ambarus's message of "Wed, 20 Sep 2023 15:28:58 +0300")
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
	<20230908064304.27757-2-jaimeliao.tw@gmail.com>
	<b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
Date: Thu, 05 Oct 2023 13:02:07 +0200
Message-ID: <mafs034yppc28.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_040220_034516_C4F59868 
X-CRM114-Status: GOOD (  27.79  )
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

On Wed, Sep 20 2023, Tudor Ambarus wrote:

> Hi, Jaime,
>
> Thanks for the patch! I think we are getting closer to have this
> integrated, but I have some concerns that hopefully with your help we'll
> address and move forward.
>
> On 08.09.2023 09:42, Jaime Liao wrote:
>> From: JaimeLiao <jaimeliao@mxic.com.tw>
>> 
>> Add manufacturer read id function because of some flash
>> may change data format when read id in octal dtr mode.
>
> I'm not convinced such a method is really needed, would you please
> elaborate the explanation why it's needed?
>
> I'm looking at the mx66lm1g45g datasheet. From what I see in "Figure 13.
> Read Identification (RDID) Sequence (DTR-OPI Mode)" looks like even if
> the flash is operated in 8d-8d-8d mode, what the flash actually uses is
> a 8d-8d-8s mode for the read id. Each ID byte is sent twice on both
> rising and falling edge of the clock, thus behaving like a 8d-8d-8s
> protocol.
>
> I see this flash supports 1-1-1, 8-8-8, and 8d-8d-8d, there are no mixed
> modes supported, thus a 8d-8d-8s mode seems just like a hardware bug to
> me. So my proposal is to leave the core away and to handle the read id
> hack just in the macronix driver.

+1

[...]
>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>> index eb149e517c1f..8ab47691dfbb 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -118,9 +118,27 @@ static int macronix_nor_late_init(struct spi_nor *nor)
>>  	return 0;
>>  }
>>  
>> +static int macronix_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
>> +				enum spi_nor_protocol proto)
>> +{
>> +	int i, ret;
>> +
>> +	ret = spi_nor_default_read_id(nor, naddr, ndummy, id, proto);
>> +	/* Retrieve odd array and re-sort id because of read id format will be A-A-B-B-C-C
>> +	 * after enter into octal dtr mode for Macronix flashes.
>> +	 */
>> +	if (proto == SNOR_PROTO_8_8_8_DTR) {
>> +		for (i = 0; i < nor->info->id_len; i++)
>> +			id[i] = id[i*2];
>
> why do you overwrite the id? How about just checking that
> id[i] == id[i + 1]? why do you care if you print an a-a-b-b-c-c id?

Because id_len == 3 so you should only treat the ID as a-a-b. When you
memcmp() the ID after reading it, you would not get a match.

>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>  static const struct spi_nor_fixups macronix_nor_fixups = {
>>  	.default_init = macronix_nor_default_init,
>>  	.late_init = macronix_nor_late_init,
>> +	.read_id = macronix_nor_read_id,
>>  };
>>  
>>  const struct spi_nor_manufacturer spi_nor_macronix = {

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
