Return-Path: <SRS0=dr70=ZC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928A8C43331
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 19:50:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D4F2206BA
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 19:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WZKHbTOx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="PylxqHHA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D4F2206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fZEex89gy4foKtzcs8wDRdLAZrVMXIHH14t1C8kwxs=; b=WZKHbTOxNYxRi+
	PLGZwKfikNpPU1T1/eZfcCP9XiSTMwX2wjKIGct7+xQCsBp+0QwM7pZ8hDg+D+Bm9CndhJnvr6z7b
	fCBN3Vo67gISSBdj8vcNpIuF4ivhL0O6KF71WMdjR39oOgBq/cyQoUTItB55WD/xbGTLFS6hY3Hmc
	SXax1EJQSBylFXC4c5Ey/chmnMzcLY5FSV33vO1He2HPBZQkp77p6e42w2r2mpmkrmp9/8AGs6DUO
	SjSD4b26G+6/wmS990heMpCSMrUXq9jL9qHmkD09kdqVSeYO6t9gB6+ABhw9F3SoCFThJ9ZHlMaBN
	2XsPxrN7Ou1rotctHMaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTtDq-0005r3-Le; Sun, 10 Nov 2019 19:50:06 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTtDn-00055c-Bl
 for linux-mtd@lists.infradead.org; Sun, 10 Nov 2019 19:50:05 +0000
Received: by mail-lj1-x244.google.com with SMTP id 139so11478699ljf.1
 for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2019 11:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rWQTKBqiNaFb46235lmkgWbKyuBpKGTd6Qfes4E34MI=;
 b=PylxqHHAynRtgy4+2AVQvePDZKFPzog5a8N+b5L7D+p4YNHxAMe4OfNZ9k0/RcfRNK
 fOtOh1T7NW81OZeSixRv+J5RGqwEJ8qM5V4jwQ/SBiNuaIncLdlNmPQoRoTT6W6o2qO+
 TC0DPZhTzOBea8ewFsJV8gpHeccNWaoUEWkrgt1Uyh5Ragax4xqhuoEPGh9TruoQlsfl
 ngDRPG+8mPPXOOGOEMSm/OcgdQq5JKxSO5eBwFvRm2w+BllHA5fCybPbMxy3u4cU9dEw
 zjHZaNGyEFZsROUIUS6BZbgxecG29Q2IaCAddne4yYXoH5p3CAc3YtYHfOAxXcsFrRvM
 zR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rWQTKBqiNaFb46235lmkgWbKyuBpKGTd6Qfes4E34MI=;
 b=QkviyAoH97KvbW7GXQi8VEC7V2H33tmqyiD9b2Jh1oH0Nndwd9ByUzDpkDyIaYc0C3
 YGQmuJHArFTsIbEqHbm+LIKIZCfKkt5g/OaOE7vJldBFCVL9STyjoam9mw11oIorCKu2
 o7UwaOueQ6u7HLEfMI+qMOFHHCo1NkCIOESqX7msrqpLtJmAIlOai+z3PiYfUqSo4vTS
 ilvMBNpXyEZ3vAjVyZ+My1+YEe9L5o9zYXWM6U4sl50d+BBRR+SuMa6cnqT52ZGqRdll
 Wp+Q+J3aMrFl0qkanh3X44aeJEHUaNMaD/sbF5E6X60+jhHgpGqDcPkdnXDRQYQHIHYK
 IXfQ==
X-Gm-Message-State: APjAAAV0dWFfXDoKInJ48cB4jiw3PFzb14FFl2nBy3puih1c+WDvrMTi
 Nc65gjQxJw5QUuAMF0DU+09rEw==
X-Google-Smtp-Source: APXvYqxG3kXsnTU5Xv6NMdpu8rqVrYf+HCynkP1xr6qtQ9eUNC5WV0XSRpZsaQEn7RAxnZisgbx/uQ==
X-Received: by 2002:a2e:93d7:: with SMTP id p23mr13802661ljh.102.1573415396806; 
 Sun, 10 Nov 2019 11:49:56 -0800 (PST)
Received: from wasted.cogentembedded.com ([109.167.219.12])
 by smtp.gmail.com with ESMTPSA id a11sm5807414ljm.60.2019.11.10.11.49.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Nov 2019 11:49:56 -0800 (PST)
Subject: Re: [PATCH v2] mtd: spi-nor: use spi-mem dirmap API
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <ef173d36-c918-4636-ace6-f6ba82dac672@cogentembedded.com>
 <20191109203558.4a03c398@collabora.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <9418cda1-9f46-f688-75f3-e09d3e6ee0b2@cogentembedded.com>
Date: Sun, 10 Nov 2019 22:49:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191109203558.4a03c398@collabora.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_115003_587844_69EF5100 
X-CRM114-Status: GOOD (  19.20  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 11/09/2019 10:35 PM, Boris Brezillon wrote:

>> Make use of the spi-mem direct mapping API to let advanced controllers
>> optimize read/write operations when they support direct mapping.
>>
>> Based on the original patch by Boris Brezillon <boris.brezillon@bootlin.com>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> Changes in version 2:
>> - moved the spi_mem_dirmap_{read|write}() calls from spi_nor_{read|write}() to
>>   spi_nor_spimem_{read|write}_data().
>>
>>  drivers/mtd/spi-nor/spi-nor.c |  125 +++++++++++++++++++++++++++++++++---------
>>  include/linux/mtd/spi-nor.h   |    5 +
>>  2 files changed, 104 insertions(+), 26 deletions(-)
>>
>> Index: linux/drivers/mtd/spi-nor/spi-nor.c
>> ===================================================================
>> --- linux.orig/drivers/mtd/spi-nor/spi-nor.c
>> +++ linux/drivers/mtd/spi-nor/spi-nor.c
>> @@ -305,22 +305,28 @@ static ssize_t spi_nor_spimem_xfer_data(
>>  static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
>>  					size_t len, u8 *buf)
>>  {
>> -	struct spi_mem_op op =
>> -		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
>> -			   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
>> -			   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
>> -			   SPI_MEM_OP_DATA_IN(len, buf, 1));
>> -
>> -	/* get transfer protocols. */
>> -	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
>> -	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
>> -	op.dummy.buswidth = op.addr.buswidth;
>> -	op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);
>> +	if (!nor->dirmap.rdesc) {
>> +		struct spi_mem_op op =
>> +			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
>> +				   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
>> +				   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
>> +				   SPI_MEM_OP_DATA_IN(len, buf, 1));
>> +
>> +		/* get transfer protocols. */
>> +		op.cmd.buswidth =
>> +			spi_nor_get_protocol_inst_nbits(nor->read_proto);
>> +		op.addr.buswidth =
>> +			spi_nor_get_protocol_addr_nbits(nor->read_proto);
>> +		op.dummy.buswidth = op.addr.buswidth;
>> +		op.data.buswidth =
>> +			spi_nor_get_protocol_data_nbits(nor->read_proto);
>>  
>> -	/* convert the dummy cycles to the number of bytes */
>> -	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>> +		/* convert the dummy cycles to the number of bytes */
>> +		op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>>  
>> -	return spi_nor_spimem_xfer_data(nor, &op);
>> +		return spi_nor_spimem_xfer_data(nor, &op);
>> +	}
>> +	return spi_mem_dirmap_read(nor->dirmap.rdesc, from, len, buf);
> 
> Can we put the spi_mem_dirmap_read() in the if() branch instead of
> having an extra level of indentation for the most complex block.

   Have you noticed a complex variable initializer in that block? Do you want
it to be done on the simple branch as well? 

> 	if (nor->dirmap.rdesc)
> 		return spi_mem_dirmap_read(nor->dirmap.rdesc, from,
> 					   len, buf);
> 
> 	...
> 
> (same comment applies to the write path BTW).
> 
> With this addressed, you can add
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

   Thank you. :-)

> 
> Thanks,
> 
> Boris

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
