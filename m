Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A481C761A6
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 08:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoN6gRU/deL56E2vpTYUIDdajenRGI2zfpMk1+mQ3uY=; b=TPh9ewunUxHPVX
	yBU9lM4eXWZLI35utB8qE1HmcB1LjgP67jr+e9b1iVmu6q5wh6dn87xd9/TmSQrXTANBIR1kI6Q5z
	n27Xu8X18sXXzIcWVkKcqFb/nq9oTpMl6+nH71D8HMPtsdhUhi9nblCa91YZEl5gq1rqEztfUma1N
	NmfyEY1obiOk3WJG0Hqb6/Slw/zBUzBhRjNu3XwxwIWv4IK+syvNpZOevUcwLzjJNgaudTdvTnYv5
	4qVJAdszFtiHdzB7M2+61hGo6eCqeCqUkWgH64F6NG5WJtKp8DasKGzP9dOKIizogBvYGtgV9wQoY
	7QpWICOm4VL29eN41N7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFUI-00EWPp-1d;
	Mon, 03 Apr 2023 08:24:26 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFUF-00EWOu-2l
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 08:24:25 +0000
Received: by mail-ed1-x535.google.com with SMTP id cn12so113985215edb.4
        for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2023 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680510260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gNih2AmskSeWRAtmKLvAD60cS4Y1IGvZIjP3eVyQhg=;
        b=DhI3fRieoVNMwN0ovpSR5xDUQpkzO2q5B79Ijosn43aHIa5mdaTXrp51CqA+UkX+13
         i6tuQ9COhivXAATY3VJuh2VVjLvK9fxpMGCPRa0CIgM2ZRYSLVBOpAQlxTTrE8kS43z5
         25G+EawMAKtOcNbiKXQLNEx2x6mQKfQlNg5yAqlmfDF4K+7LK+FzXLhTLHEOEGEyPkWG
         gBpcn9l1gv+M6ga9qnTER8bWLKFhfMOWNuYLYZWqcz97XP4lrDaaVSCPDAoE0T8Iw73T
         9VIXXZK1KtRalgbVitSe7/XS8KgFkHt2Vlyrga1ngC5twl6/qmK1p+Tnx9g9IDvIu7+u
         mkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680510260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gNih2AmskSeWRAtmKLvAD60cS4Y1IGvZIjP3eVyQhg=;
        b=b4vtA3JyCHjL8Ok4a/0zfic0dfsX8QOYFLFUeG2MYOL+aOoyRO8yJfgivqOBCimhQs
         G1NXQ3osVvrffHQ06zD8OzQ3p3AczS35f6Y3l9zKI0yx34SJbc9bknCN6051G56kkiUG
         /aGYUX/AFZRa4gTzx6neOCT3o8KpPLilQoM3Ple+BKPiMF2vMBa5Jjo0vO7eskx/nYZ9
         luTflKNcheVcGpqECZQcaBuw+hCp4s3CfsZ9UHI0JDANjkccaDDYYv8JVbNbJBjB8Q3o
         u6iqcv17JWMcDKcRSg1fIahw3hf/Ujzm5qAwAtOmdyYUoOwTu+HAqcXMy1BPTAHxg8jB
         8mPA==
X-Gm-Message-State: AAQBX9fS9hCH/+1g0a/4rgMX4POO05VMZKT8m3JnY/1ESZYNeNjxA1p3
	RWgGFegFptPTNnNBaMyh8hTJcas6Zy928Q6HO+M=
X-Google-Smtp-Source: AKy350b5vOmTHX5QE4fxWvo3kfcFcWBiGvwZ0dEg3GcgtLv6eSWMyJEZkJS+5gzz+nqnb2vuei0uQw==
X-Received: by 2002:a17:907:7ba1:b0:8b1:820a:7b60 with SMTP id ne33-20020a1709077ba100b008b1820a7b60mr44011004ejc.6.1680510260104;
        Mon, 03 Apr 2023 01:24:20 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id u13-20020a1709063b8d00b0093e261cc8bcsm4224935ejf.58.2023.04.03.01.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 01:24:19 -0700 (PDT)
Message-ID: <f1f0d45b-fdb2-ec36-6785-d88003e3bb15@linaro.org>
Date: Mon, 3 Apr 2023 09:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 2/2] mtd: spi-nor: macronix: Add support for
 mx25uw51245g with RWW
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230331194620.839899-1-miquel.raynal@bootlin.com>
 <20230331194620.839899-2-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230331194620.839899-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_012423_890622_1761FB27 
X-CRM114-Status: GOOD (  18.43  )
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



On 3/31/23 20:46, Miquel Raynal wrote:
> Describe this new part and provide the RWW flag for it.
> 
> There is no public datasheet, but here are the sfdp tables plus base
> testing to show it works.
> 
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> mx25uw51245g
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> c2813a
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> macronix
> $ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
> 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
> ffffffffe5208affffffff1f00ff00ff00ff00ffeeffffffffff00ffffff
> 00ff0c2010d800ff00ff87790100821200e27704674630b030b0f4bdd55c
> 000000ff101000200000000000007ca14800000000008888000000000000
> 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
> 727103b80000000090a3188200c069960000000000000000727100987271
> 00b8727100990000000072710098727100f872710099727100f900000000
> 00000000011501d0727106d8000086500000060100000000020001030002
> 00000000060100000000000072060002000000eec0697272717100d8f7f6
> 000a00001445988043060f0021dcffff
> $ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 047a884cf44d9ffc2a94d3ab37b48c63  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 
> $ dd if=/dev/urandom of=./qspi_test bs=1M count=6
> 6+0 records in
> 6+0 records out
> $ mtd_debug write /dev/mtd1 0 6291456 qspi_test
> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
> $ mtd_debug erase /dev/mtd1 0 6291456
> Erased 6291456 bytes from address 0x00000000 in flash
> $ mtd_debug read /dev/mtd1 0 6291456 qspi_read
> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
> $ hexdump qspi_read
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0600000
> $ mtd_debug write /dev/mtd1 0 6291456 qspi_test
> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
> $ mtd_debug read /dev/mtd1 0 6291456 qspi_read
> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
> $ sha1sum qspi_test qspi_read
> d24a9523db829a0df688f34b8dc76a1383b74024  qspi_test
> d24a9523db829a0df688f34b8dc76a1383b74024  qspi_read
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 6853ec9ae65d..7db1a1a6a1fb 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -82,6 +82,9 @@ static const struct flash_info macronix_nor_parts[] = {
>  	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +	{ "mx25uw51245g", INFOB(0xc2813a, 0, 0, 0, 4)
> +		PARSE_SFDP
> +		FLAGS(SPI_NOR_RWW) },
>  	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },


looks good!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
