Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6213CE79A9
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXPhUWLv/JCzchBJjVQXUCjtowhgWiqApVH977bnZiM=; b=FMD+D0ncBgYB6Z
	HdWuG2PiPv8Lh5WM3vrAAu6id0shsLWk4EX7e7e46WX18k+vrkvKixWlUTMe7X0ajnv0OTtBkHtrc
	fu7z1VRLTErI61zRhobDmEMSkcNsyw0PxzSi9KoyLFxxI/SRCnsDEqY+YGlLXESCqO77BFZuZZK6l
	1gOZM3tIK+U5kQFZatd+oqyYHVxnuViouEZeqR1hSwlJnbj0zZQPEb/+OQKfNuYOg50IgcmxVQqiR
	z/4+ToXwf+BRBq96tMB1A7c9+6FrcyCZdX3lRQpgOmlpKIaKqyRIjE42d4fOb8Go1Mb+DM+5f63bu
	iNMuDdUX9V1I2bIhixUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qidKx-000psn-2t;
	Tue, 19 Sep 2023 16:12:31 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qidKu-000prr-0c
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 16:12:29 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-532c3b4b55eso988883a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 19 Sep 2023 09:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695139945; x=1695744745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2W38CXjFimuUk344mBPsm35p6+nVhboQggc89jf+vgg=;
        b=JJXhwWzldtYCYf5ADq0MyxQrm6TJdtE5hxrq6mIJQ0RFgn6TvDrblwhXOVc9ZHzArx
         kigaHKXdNT8dy3GYHylJl/qqQsiTTkS3ln4wdusZq5FTOFZZXFlNUvqsPqvSxJ5kA8vz
         uFm+rE7wlDfhdwogDYb2mZk59bztOELip26Um9IA7r2jFSl3Etw7+I1ACa+BAh13UGSf
         euHhslllqOIdnE4S2EK0VYyBQlca5qnspuUauNs5SeJ4OLWkPK1dxjWqhwUgmgomXZF5
         xlxmWEf/NwCfzUO5KLfeHlTobeE8N4zHDVOQtfJYDHZjQqD2giQJuiUXENOAvvLj3L13
         SOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695139945; x=1695744745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2W38CXjFimuUk344mBPsm35p6+nVhboQggc89jf+vgg=;
        b=pcwgs19zzeuOz6TanmD8EUW8G+qZ9kZHS038d3qW7r3DAhsnS+Z0wfQUGyoODLON+a
         oe3owCL9mXVU75dUSHE5je8eWr+SJoQ142tvJv+HZ/wXhNrA2iygIlNi/UYDqGr9YGIK
         0pJJhABlNpxKsmcjfu2Ub58k7akVUQo9Qb53IXqrmkiC9XN0TN1jBnCfPoz9YWSsP9I/
         r5aW3CdBMKYasF4xVs+b0ngjdH7Ccd2ZViffvY4vTyRKzK7evHnVrrrO1ux+Q1H5gqis
         R2AbVedeuuA/UpAiqKx1Zp4j5QKz64P1JZGu/W6ukVEKngrhYK9kUxZdypNLZGKdtuoD
         Miag==
X-Gm-Message-State: AOJu0YwAulkACuqtVn0de+63u8tL+dTGQ2uLYAuO3kIj+mAR+gAsji8d
	LBceU8tXKy/iGOzw/kIQtZZrLg==
X-Google-Smtp-Source: AGHT+IEgICnrUOfTdBjga4HXzzAlrzXcKnDGFHfmp2FVXBZ1kFHupppnYd4zaPlaSJeMPbr2HFmBug==
X-Received: by 2002:a05:6402:4498:b0:532:c6d7:b93c with SMTP id er24-20020a056402449800b00532c6d7b93cmr1663344edb.5.1695139945348;
        Tue, 19 Sep 2023 09:12:25 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id e20-20020a056402149400b0052e1783ab25sm7648500edv.70.2023.09.19.09.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 09:12:24 -0700 (PDT)
Message-ID: <8d72820d-bbaa-abc8-4448-87f0f054c381@linaro.org>
Date: Tue, 19 Sep 2023 19:12:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] mtd: spi-nor: atmel: add at25ff321a entry
Content-Language: en-US
To: nicolas.ferre@microchip.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230908151400.164470-1-nicolas.ferre@microchip.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230908151400.164470-1-nicolas.ferre@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_091228_233335_6F0B302F 
X-CRM114-Status: GOOD (  27.35  )
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



On 08.09.2023 18:14, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Add the at25ff321a 4MB SPI flash which is able to provide
> SFDP informations.
> Datasheet: https://www.renesas.com/us/en/document/dst/at25ff321a-datasheet
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
> Hi,
> 

Hi!

> This flash is present on the MikoE flash 10 Click board and was tested on
> sama7g5-ek at spi frequency of 80 MHz:
> 
> Here is the test I ran:
> root@sama7g5ek-sd:~# dd if=/dev/urandom of=./spi_test bs=1M count=3 
> 3+0 records in
> 3+0 records out
> 3145728 bytes (3.1 MB, 3.0 MiB) copied, 0.932896 s, 3.4 MB/s
> root@sama7g5ek-sd:~# mtd_debug write /dev/mtd0 0 3145728 spi_test 
> Copied 3145728 bytes from spi_test to address 0x00000000 in flash
> root@sama7g5ek-sd:~# mtd_debug erase /dev/mtd0 0 3145728 
> Erased 3145728 bytes from address 0x00000000 in flash
> root@sama7g5ek-sd:~# mtd_debug read /dev/mtd0 0 3145728 spi_read 
> Copied 3145728 bytes from address 0x00000000 in flash to spi_read
> root@sama7g5ek-sd:~# hexdump spi_read 
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0300000
> root@sama7g5ek-sd:~# mtd_debug write /dev/mtd0 0 3145728 spi_test 
>  Copied 3145728 bytes from spi_test to address 0x00000000 in flash
> root@sama7g5ek-sd:~# mtd_debug read /dev/mtd0 0 3145728 spi_read 
> Copied 3145728 bytes from address 0x00000000 in flash to spi_read
> root@sama7g5ek-sd:~# sha1sum spi_test spi_read 
> 06d5459972d51a2ff4270e612270c6519e797a0b  spi_test
> 06d5459972d51a2ff4270e612270c6519e797a0b  spi_read
> 
> Here are the data from sysfs:
> 
> root@sama7g5ek-sd:~#  cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> at25ff321a
> root@sama7g5ek-sd:~# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> 1f4708
> root@sama7g5ek-sd:~# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> atmel
> root@sama7g5ek-sd:~# hexdump -C /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 00000000  53 46 44 50 06 01 00 ff  00 06 01 10 10 00 00 ff  |SFDP............|
> 00000010  e5 20 e1 ff ff ff ff 01  40 eb 08 6b 08 3b 00 ff  |. ......@..k.;..|
> 00000020  ee ff ff ff ff ff 00 ff  ff ff 00 ff 0c 20 0f 52  |............. .R|
> 00000030  10 d8 00 ff 50 2a 2a 01  82 ff 9c d2 64 c1 08 46  |....P**.....d..F|
> 00000040  7a 75 7a 75 f7 c4 d5 5c  00 06 51 ff 88 30 00 00  |zuzu...\..Q..0..|
> 00000050
> root@sama7g5ek-sd:~# md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> d540f07cbfb7c9c19654c453b561b311  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 

Wonderful, thanks Nicolas!

> Best regards,
>   Nicolas
> 
>  drivers/mtd/spi-nor/atmel.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 58968c1e7d2f..c94d52951481 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -184,6 +184,10 @@ static const struct flash_info atmel_nor_parts[] = {
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>  		NO_SFDP_FLAGS(SECT_4K)
>  		.fixups = &atmel_nor_global_protection_fixups },
> +	{ "at25ff321a", INFO(0x1f4708, 0, 64 * 1024,  64)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +		PARSE_SFDP
> +		.fixups = &atmel_nor_global_protection_fixups },

We have recently changed how the flash entries are defined. Would you
please try the following changes instead?

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 95f0e139284e..44218716d81e 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -213,6 +213,12 @@ static const struct flash_info atmel_nor_parts[] = {
                .flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
                .no_sfdp_flags = SECT_4K,
                .fixups = &atmel_nor_global_protection_fixups
+       }, {
+               .id = SNOR_ID(0x1f, 0x47, 0x08),
+               .name = "at25ff321a",
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+               .fixups = &atmel_nor_global_protection_fixups
+       }, {
        }, {
                .id = SNOR_ID(0x1f, 0x48, 0x00),
                .name = "at25df641",

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
