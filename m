Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567BFC61DF4
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+s7k3YTk7x/ojVcuEAHkJmRZmF1eNdr9HBrWBvrioo=; b=ww+SO5FV1yvEua
	Q74ydB7uVOkt9zp7yjTjCdZO/rUEjZOt+VwXhbKVpgrqoQK0vqw+X0kzYamxfXxNajcjpQG0YdAys
	kudoFcSf0kzyXM6usbRcmkAWn6tKKJB18qpwQCHBvWkT0AOfLcaA0MKZZiX/Z83SEeN3P+ESqpp9f
	162kd9XMAIjQhtA2nCdx+zqsvDZRUTdrI9dL/qIMYHggJNBqvkT681zWMeLMXjRbmSwzjFeYfTljP
	NFcpisMHTFyOK8EHVcmgeWsw5pvnKbu+jvOD9KjWg8Hw0KvRvwAY9O+OObJnJPKI2gZRLdUBswYWq
	tegva3LZ5hy+Oq9fY2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6YYO-007azY-20;
	Fri, 24 Nov 2023 15:57:16 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6YYK-007ayL-2I
	for linux-mtd@lists.infradead.org;
	Fri, 24 Nov 2023 15:57:14 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so296637166b.1
        for <linux-mtd@lists.infradead.org>; Fri, 24 Nov 2023 07:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700841426; x=1701446226; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZF6yae9bb5tDXC/CsnvGYPJ3X5s4815eVzyjB3BR8k8=;
        b=shpyELELLGk/7HWHtTl7FoETUEYSmps0Fr+AKYAFfHKKU1YSU96NonF/+taXmnjVPC
         bXuNJxC5bAEOM+3JbLc+N667/5LQpNfUhauPP+rGIEjjmyZSLQdvpB828A8tu1x23v7m
         11eO1rBXtfFQrWADkPp2U8S463ol2T2mTLeaPYaGU4DFlCSfSo77IRNhWL1CaqnXbj3c
         KnqX84AkaLZytGtHnq6Rk9/rDiPcfDOpaJjcQZysViDgM7ZYHSaNG20uy2HfY14bVGlN
         LNY/DWubqm1KDAN8BzwSky0lVCn9DBewLpk3dZgHsXdhRvnooqplAtcO7jmEfxbOwceo
         Ku6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700841426; x=1701446226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF6yae9bb5tDXC/CsnvGYPJ3X5s4815eVzyjB3BR8k8=;
        b=kQ/2wVjbxlPlDAt6Rqtrxpzjs94On+3xiEOG+x22VVTwIsSbEkMGnYbNrKENocKmDR
         yMQLFakPzuapN9ZQS6aAhfmKZEaUYaAzm+nOzMxB10/kG2bj4BJNRyjv4wc4T1mDaPYt
         aEM0oq3K/czHRP9wG0q+6X4DbcFLvftW7eKmxEFE6dIK/XP0YRC4780rRpDNMa0TPohA
         UcVdCuV7VMDeIAzWk0wzwJfcZh5mf0G06ojiHgA8Ok/peLpgYlV6exTRhMRpcGUu+pj7
         LESupv/L8IMkjQgQ4o1aY3eT31M6oA47JzqyQ84NgnvTzCKHpXU5fAv77XhBlgs8Asj/
         tXJg==
X-Gm-Message-State: AOJu0Yw5gt9PDkHhRtpRN7981cGGVQHuV8liOWBus3rawdc45UVCtBCo
	+eECmsDGmkhEN+VYgccjVQnBMw==
X-Google-Smtp-Source: AGHT+IFEf8Zmz3QMkGFpwb/grFbBwT9wDbpNPDHQrgCCp5UTdMYETULTAfdNeVMu4HrvKK4xKSxTEg==
X-Received: by 2002:a17:907:740a:b0:9e5:d618:d6c1 with SMTP id gj10-20020a170907740a00b009e5d618d6c1mr2310550ejc.19.1700841426518;
        Fri, 24 Nov 2023 07:57:06 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id jj13-20020a170907984d00b009b65a834dd6sm2195878ejc.215.2023.11.24.07.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 07:57:06 -0800 (PST)
Message-ID: <42cc0ae2-d61a-41cc-b46e-132dace301b0@linaro.org>
Date: Fri, 24 Nov 2023 15:57:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: mtd: spi-nor: add sections about flash
 additions and testing
Content-Language: en-US
To: Pratyush Yadav <pratyush@kernel.org>
Cc: michael@walle.cc, linux-mtd@lists.infradead.org,
 linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
 <20231123160721.64561-2-tudor.ambarus@linaro.org>
 <mafs0sf4vdxqd.fsf@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs0sf4vdxqd.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_075712_753152_F3A6CC13 
X-CRM114-Status: GOOD (  20.34  )
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



On 11/24/23 14:36, Pratyush Yadav wrote:
> Hi,
> 
> 
> On Thu, Nov 23 2023, Tudor Ambarus wrote:
> 
>> Add sections about how to propose a new flash addition and about the
>> minimum testing requirements.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  Documentation/driver-api/mtd/spi-nor.rst | 189 +++++++++++++++++++++++
>>  1 file changed, 189 insertions(+)
>>
>> diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
>> index c22f8c0f7950..cc8e81e09544 100644
>> --- a/Documentation/driver-api/mtd/spi-nor.rst
>> +++ b/Documentation/driver-api/mtd/spi-nor.rst
>> @@ -63,3 +63,192 @@ The main API is spi_nor_scan(). Before you call the hook, a driver should
>>  initialize the necessary fields for spi_nor{}. Please see
>>  drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
>>  when you want to write a new driver for a SPI NOR controller.
> [...]
>> +4/ Use `mtd-utils <https://git.infradead.org/mtd-utils.git>`__
>> +and verify that erase, read and page program operations work fine.
>> +
>> +a/ Generate a 2 MB file::
>> +
>> +    root@1:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
>> +    2+0 records in
>> +    2+0 records out
>> +    2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.848566 s, 2.5 MB/s
>> +
>> +b/ Verify erase::
>> +
>> +    root@1:~# mtd_debug write /dev/mtd1 0 2097152 spi_test
>> +    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
> 
> Perhaps mention that the 2 MiB region should already be erased.
> Otherwise some flashes might refuse the writes (like the ones with ECC

right, then maybe we could do a

/erase
/read
/dump and see 0xff
/sha1sum to have the 0xff checksum
/write
/read what was written
/sha1sum on the read to make it's different that the 0xff checksum and
that the write worked

> -- Cypress S28 family comes to mind). Experienced engineers should know
> this already but it might trip up some beginners.
> 
> Looks good otherwise. Thanks for working on this.
> 
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> 
>> +
>> +    root@1:~# mtd_debug erase /dev/mtd1 0 2097152
>> +    Erased 2097152 bytes from address 0x00000000 in flash
>> +
>> +    root@1:~# mtd_debug read /dev/mtd1 0 2097152 spi_read
>> +    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
>> +
>> +    root@1:~# hexdump -C spi_read
>> +    00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
>> +    *
>> +    00200000
>> +
> [...]
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
