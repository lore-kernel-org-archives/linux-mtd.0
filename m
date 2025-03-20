Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9A0C28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 08:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZGdRKbXGTU6Me+/L1KDPRs3dXnZymHMa+iX+1/zVzY=; b=bV+C21Vup40mYb
	dAQvyS3ID2YGmu2iqQpjwWZCB1r6az1RVlqbtykqrjda9lW3Kju+V3cemSphuiYjXNdc5jpaOTnxD
	9DYtv/tDCYyYRcEFrufIorH2fM+gzwpIDgPHvyB/n4ylIgHslolSql4f9AhVQa6K2cnWJ/3TfZTly
	1w4v08HqHU7nYbMcDwmAoZYGg7ZqEb3EI1Bwk3wj9Bv/fJvWSNvq6RYDjl+R6puY8DsD85F743txO
	s2ERA6RVw/IBsiopvoY12S5oWYPBuQlxsunkW3WdaflEKXazZniquwD9yt9KF2c1HNB3t37KrRSGb
	jxyC9SjavSsCByRPNiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBY0-0000000BaNL-0f7v;
	Thu, 20 Mar 2025 08:46:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBXx-0000000BaLq-1Mvt
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 08:46:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf680d351so9665535e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742460395; x=1743065195; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfkZbmXHv6HdaFKCvg0xy8xiKc1444qZgsmkOFSiajk=;
        b=b2vRxIf8ordGe2wgUATH2wmUYwW5DScWHtfHrDwg+THlGH+3GPW6XBoRbFM7ZX87EZ
         iQdIZv2oUHVfgMhNvIgOVnce1p0j3p9cke7uLxVOWrOIYvvokWYRz4Okjrab9rOAws5s
         T+3oP4I/HKSQaO0F7hOcCpAGZ7mQg8BxooBWJdEFH6p+J2tkvNlTSzuPLXl/soob1jS+
         cec/9H3D7yKO/2JZskZXf+uFj5o4o4CMJ9cLCf78mghCgcpxJtGEPtrrlIjbjdfTLiTz
         9hh206QrmmxvjF9XDAR/DVn4NIgq1t5X3+bo3qqdJZAUYMHum1R8gAgkxBc+E/fjvCdM
         zzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460395; x=1743065195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfkZbmXHv6HdaFKCvg0xy8xiKc1444qZgsmkOFSiajk=;
        b=ZWkk06ee8AGcGeDfCTDV0Q7rUkqEPvMjYateR+KZi9oiIVzSPDoSsHSOaXCAZfAxfi
         yLafF3GDTi97dgM4szK9SU8RFpy6D5+UaQbQQsjcfoyB3osrLpHssB6lQ/oMQcQ/P9LL
         YZeavu157z8S3/UR1iX0aPCNag9i188YuN4xbeXDpzF46CfSpO9hS403C7lFx6WNzaRI
         CLLxTHfgwtoDDCx2t5JRNwOq5xe9qblF7DrVih4J3bvYu+BOzpxaz0QWHWxRyxYU2Ilb
         nrgsTpjGXBBO2dtEx/peRaS2ndRUQr9y46xwHhp+oCcuQ+qcmcjKzaOIzW7cq1LxpED+
         j0eA==
X-Forwarded-Encrypted: i=1; AJvYcCVxoVu5U8z+mdsEllYlNAiGuSiFVUezCyZL1hCj9JOJtICAJVeeZD5RKYXM1IoTVVS7Vn0i3wqBmeg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi09JF9Cp0fKwMEZ80Bs1o1TzxpGmbwEZ1Mhk2C1HQDfOPeF9Q
	1jzkZk8Qan/v97f52K8aWD8N8xGpnwUONYuWj062eY1seDRpsQ69o9lhlhY7jO0=
X-Gm-Gg: ASbGnctjRHSYQT3DD9VBaQBgqdvQ9wBJABZCBBIc1X0DUkoFNrpcecit8W4oFVntbUY
	yZfpYgsChntKbOTrklLjE5VX9IR8phzUwsZ2Em8fF+JFiJT2g+WY0E7YAiT7OfQY/7ajG5ZLQBv
	Fo7iHr/5SdG3U6Vhk0sRZIJrVTP7uCpurAM51BEFalZQFxlMrsFVYbFa9GPjt1Yq6+YeN9FThtD
	r7q7z2q0mAUbvAzsGTNuSaw/WcoHKyBYKDQlLkvmgeXW3l4AgKLuNvG00pJp9PGi8XICxCJwVvV
	SgUdt//smH0qQEwqc79uErDV+nwZlGLzyL08LZee8Z8a6DaCF7RJGISXtxRK8L9e
X-Google-Smtp-Source: AGHT+IFhAr87mT/WfIlGczrZhfPbuPAn/0ZVXaVyIrOXlRMdhsY8Tg/ShSQG2plPZGrbZoJlFbA9mQ==
X-Received: by 2002:a05:600c:4448:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43d4915e47emr26472375e9.2.1742460395436;
        Thu, 20 Mar 2025 01:46:35 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f864d4sm42159145e9.37.2025.03.20.01.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 01:46:34 -0700 (PDT)
Message-ID: <ceb81e52-3159-479b-9006-aae54a74fc3a@linaro.org>
Date: Thu, 20 Mar 2025 08:46:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
To: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: LEJEUNE Sebastien <sebastien.lejeune@thalesgroup.com>,
 LENAIN Simon <simon.lenain@thalesgroup.com>,
 RENAULT Xavier <xavier.renault@thalesgroup.com>
References: <87dbbbdfb2d54da781e4f8c5fa75851c@thalesgroup.com>
 <9ae9eaf4-bd5d-4902-9ca8-d83b9f326245@linaro.org>
 <ba593d13fad2419c9dba03fc001d599a@thalesgroup.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ba593d13fad2419c9dba03fc001d599a@thalesgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_014637_371430_EC5D64F4 
X-CRM114-Status: GOOD (  30.33  )
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



On 3/19/25 3:02 PM, LECOINTRE Philippe wrote:
> Classified as: {OPEN}
> 
> Hello,

Hi,

Don't top post please, it's hard to follow the emails exchanged.
> 
> Thank you for your feedback.

you're welcome!

> 
> I encounter some issue attempting to use the at25 driver.
> I am not able to read the flash ID with at25 driver because the chipselect appear to be deselected between the RDID command and the read data. The RDID command is not taken into account and the chip only reply with 0xff.
> With at25 driver, it use a spi_message containing two spi_transfer, one spi_transfer for the command and one spi_transfer for the read data. For some reason, this end up in .transfer_one() in the spi_controller driver of my SoC.

What spi controller driver, is it upstreamed?

> With spi-nor driver, it use spi_mem_exec_op() which work well in my case.
> It appear at25 driver can currently be used with Cypress FM25 chip and from some of the datasheet of this family it seems that the chipselect need to be driven low during the entire RDID sequence.
> Am I missing something here ?

Splitting opcode, address, dummy and data per spi_transfers shall work,
spi_mem_exec_op() does it too when the controller does not define mem_ops.

It probably just a bug somewhere, raising CS up between the transfers
shall be fine.
> 
> Currently, the at25 driver assume a lot of property from the ID data (manufacturer and size) which don't seems to be relevant with the CY15V104QSN model.
> This chip is similar to cy15b104q and cy15v104q currently supported by spi-nor driver.
> https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/mtd/spi-nor/spansion.c?id=8a2644d5f3608822925c9204a3d19a8e3025fd4a

having those flashes in SPI NOR was a mistake. We can't just drop them
as we'll break backward compatibility.

> Also, I don't have access to at25 spi eeprom to validate any deep modifications on this driver if we need to do so according to the thread you are pointing to.
> 
> How can we handle this ?

You need to figure out why your flash doesn't work as expected and fix
it. Is your controller spimem capable? If yes, try dropping the ctrl
mem_ops and see if it behaves sane using SPI NOR and the controller
using spi transfers. If it doesn't behave sane, then there's probably a
problem into the controller driver.

Cheers,
ta
> 
> Regards,
> Philippe
> 
> 
> {OPEN}
> 
>> -----Original Message-----
>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Sent: Thursday, March 6, 2025 11:54 AM
>> To: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>; Pratyush
>> Yadav <pratyush@kernel.org>; Michael Walle <mwalle@kernel.org>; linux-
>> mtd@lists.infradead.org
>> Cc: LEJEUNE Sebastien <sebastien.lejeune@thalesgroup.com>; LENAIN
>> Simon <simon.lenain@thalesgroup.com>; RENAULT Xavier
>> <xavier.renault@thalesgroup.com>
>> Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
>>
>>
>>
>> On 2/28/25 2:01 PM, LECOINTRE Philippe wrote:
>>> Infineon CY15V104QSN is 4Mbit serial SPI F-RAM device.
>>
>> Please consider moving this flash to the at25 EEPROM driver:
>> https://lore.kernel.org/linux-mtd/20240604074231.1874972-1-
>> mwalle@kernel.org/
>>
>> Cheers,
>> ta
>>>
>>> Signed-off-by: Philippe Lecointre <philippe.lecointre@thalesgroup.com>
>>> Acked-by: Simon Lenain <simon.lenain@thalesgroup.com>
>>> ---
>>>  drivers/mtd/spi-nor/spansion.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spansion.c
>>> b/drivers/mtd/spi-nor/spansion.c index bf08dbf5e742..32f8892d7afe
>>> 100644
>>> --- a/drivers/mtd/spi-nor/spansion.c
>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>> @@ -922,6 +922,12 @@ static const struct flash_info spansion_nor_parts[]
>> = {
>>>  		.size = SZ_512K,
>>>  		.sector_size = SZ_512K,
>>>  		.flags = SPI_NOR_NO_ERASE,
>>> +	}, {
>>> +		.id = SNOR_ID(0x50, 0x51, 0x80, 0x06, 0x00, 0x00),
>>> +		.name = "cy15v104qsn",
>>> +		.size = SZ_512K,
>>> +		.sector_size = SZ_512K,
>>> +		.flags = SPI_NOR_NO_ERASE,
>>>  	}, {
>>>  		.id = SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90),
>>>  		.name = "s25hl512t",


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
