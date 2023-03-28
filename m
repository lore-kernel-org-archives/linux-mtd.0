Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB30C76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 16:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWJ6dodcFe0In9BK/5Yp8FjMccmoM5q7H3yhFmexFsI=; b=lwWidgC38pC1lI
	nGYenlGFZZXbidU/HLQvkD6UMoi6rRDw5KPYAcRO41u94gzzUDrZNtZBwGLPARxAu21QSt7QRY9l3
	CztoUOouWl5JgWhIFpefziq+BNlrs4XD2gnTr/JHuBAF3o+4k4Bvh4g1S3CsuhHGudmQGSGWXUUlX
	U3p3SqzvLUmebwDAvPKKdbndj16/mxrxKFnhumYxjD2hqGFlVoHu+wPY2obvIqpX012QSVy5U0CBp
	j/RA7W+b7FWHPlEtyWsLDHgdeq5Zn3z8MDjILRgx7nHpXYtOSTIy/H2wsXbTcBupzUj+k81mTlZLA
	cxiGwLv2U+Y07H2M/Emg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phCEi-00F8Zy-2P;
	Tue, 28 Mar 2023 16:31:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phCEg-00F8Z1-1S
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 16:31:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id y14so12876096wrq.4
        for <linux-mtd@lists.infradead.org>; Tue, 28 Mar 2023 09:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680021108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFLWYFAuwc+T1C0ztRj1H5qiKWEqLpt1k4Zw0y39YLA=;
        b=lRkq3SaCnelzip1PadTsTVyHc/1ujkcVqjNAGQJa83bKq3Fo9x0LYTQrK8RqYHjgrA
         YRhxxM0UMI2ip+ltYb1DbveirlxwZWZZTAYmZiq1NMeHBvts+GbjLpMgxHp/XDbfwKuZ
         kHY2lcmf/LlIjAd87aAz2A9a7V6POybaz0G0SEVidv05GkozkooWK+vFJEblW1pj1kC8
         bLhwkZ8eI6v7sXysDmJ3m9QCEQ62WMqSbbfriXUmfF1CE/xIdCDUTJ+ZoBtcsku/WPgs
         xg7aDDz94rga8U8o5rP40l1EdgvWz3L+ix01pud6kzR9lgj7OCf+d8+RO1waQMa7QYSL
         ZnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680021108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFLWYFAuwc+T1C0ztRj1H5qiKWEqLpt1k4Zw0y39YLA=;
        b=lF9SAmMVF39fM37wkO8auc4Dtf05S+Ot1ItzORKG1c4nfwYeCZXfPfuKNozfc83S05
         JKgPYZ3LnRJJNGLR8SBHA4Dhcgeqee2kBZDR5UXmCL7i47+vG4gi/rjCuCbQl5NpEN9R
         ftwVHY/zJ6hCNLTyjPIgKkiH4oWFPS0J0sv8CSzt0RflgysJ3vSvNwfmqAOvwTbF7Rpz
         Se1xvlBzFK1JwXSzG5uKss9eJKTtqUabBJ+sLCh5sIodHI/m73p2M7XaSvowfQV9gXnH
         g/x+672AheGXILCtQgXiEaX+CsnHrg72NgAi0A+0fY2i5Pbm9MFdobU+mAS2wksxOjnA
         CNvQ==
X-Gm-Message-State: AAQBX9fQe+5C2V2Om1W2asrwrlWMKMFbNdxdhIz9FG/2sZm+qURnXq+s
	SK/I1hSe2BdRTlHEyiC3oigOgw==
X-Google-Smtp-Source: AKy350bDybPx7O4J4A9vL9ClrZ96/S7IFl1QVDcYrE66mgixfsteFvUDTAYytYKpcGYHn598Ja0Dfw==
X-Received: by 2002:a5d:45c1:0:b0:2d0:bba8:38f3 with SMTP id b1-20020a5d45c1000000b002d0bba838f3mr14692571wrs.14.1680021108130;
        Tue, 28 Mar 2023 09:31:48 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id e13-20020a056000120d00b002d7a75a2c20sm20714117wrx.80.2023.03.28.09.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 09:31:47 -0700 (PDT)
Message-ID: <8ade974e-eb68-f448-7ec5-91c6b636eacf@linaro.org>
Date: Tue, 28 Mar 2023 17:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 8/8] mtd: spi-nor: macronix: Add support for
 mx25uw51245g with RWW
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
 <20230328154105.448540-9-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230328154105.448540-9-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_093150_492988_1DE1DE73 
X-CRM114-Status: GOOD (  18.89  )
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



On 3/28/23 16:41, Miquel Raynal wrote:
> Describe this new part and provide the RWW flag for it.
> 
> There is no public datasheet, but here are the sfdp tables plus base
> testing to show it works.
> 
> mx25uw51245g
> c2813a
> macronix
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
> 047a884cf44d9ffc2a94d3ab37b48c63  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

which hash alg was used, was it sha1? No need to resubmnit just for this.
> 
> 6+0 records in
> 6+0 records out
> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
> Erased 6291456 bytes from address 0x00000000 in flash
> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0600000
> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
> d24a9523db829a0df688f34b8dc76a1383b74024  qspi_test
> d24a9523db829a0df688f34b8dc76a1383b74024  qspi_read
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 6853ec9ae65d..b65d41e5f749 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -82,6 +82,10 @@ static const struct flash_info macronix_nor_parts[] = {
>  	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +	{ "mx25uw51245g", INFOB(0xc2813a, 0, 16 * 1024, 1024, 4)

Sector size and nsectors shall be discovered at parse SFDP time.
Does INFOB(0xc2813a, 0, 0, 0, 4) work for you?

> +		PARSE_SFDP

Yaay

> +		FLAGS(SPI_NOR_RWW)
> +		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },

Is SPI_NOR_4B_OPCODES flag really needed?


>  	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
