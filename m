Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B023C001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ieB0IGN9tFXXRbKbVCGnwLOGIlVFXwCU7p8j9dyecU=; b=3xfOWJhlYt0Ast
	tBm1UNCBIAlWU4c0f8UOFst4NZ74WElXhd3m7rjP1bdXwUno95Z6uzbxM2+aJyEQsplgZF+55dWi1
	reVZTnERqxTe/VDvUQ1r0GLXPHOKBCEbJmWzKgC0dCQNgIvUrLwkjXULVECa5CoNnLvlLxLcxHoOX
	rntNqhgXsVTrQEM2xCLm9IQvGTxS7SnPAngktMeZwU+fw77CRpCavHUBbvi/ezFBBcZodjPBDwWdz
	cDCarZLJyJTI987v+ua9j1niyIunGL4NqmoNuKFawY0DSBC3ZVdX8sygX3OpnJv1wfTSLREyIqtQw
	xuzh65EGFC1RkufRbbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxhX-00CtU8-0g;
	Thu, 27 Jul 2023 09:54:31 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxhS-00CtS3-1w
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 09:54:29 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-977e0fbd742so96919466b.2
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 02:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690451660; x=1691056460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pS9DQ1IaeK41BP5Hxqm6gK93ojxOQztFzk8EFfKihEE=;
        b=RmElP4BwfHVbjiz6vNsGculs/eVx4kHbr43rVo6Aj1p2LpgH8aMWOutIWmfx9lJaya
         QRj437xI02xoPJ/L98oV8AxvK0ArYDg0IbyxNZACqc9zIeaqSnxw1JmRI3iMTOildbly
         E0A7Sn67KQR9fD+/UKrkqnLKru2yzEqTWWmlS/l2BrhH1Kn4JqO9Cr+i4eLYzbkIo8vI
         t2EzDftPYDo/J4ONwFKStpeYPE6xdVHzTPh2J+BzwOeqT3vMkKzZtmvmHMEkaFk/yMSI
         L/Njx1B/qK5odqihyEW8FXjawQzJzuPZqQcLfb9jMn81rJsjG/oFPCdDQJDYlRBG82jt
         ZPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690451660; x=1691056460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pS9DQ1IaeK41BP5Hxqm6gK93ojxOQztFzk8EFfKihEE=;
        b=QZjUJUaXQrLjABs6cwHFXiRzl5fCrZEqJt+AN7MpklJdgYvF3kAkvIAxZD/QB+clp3
         4Z0KMqZaH80cLWwK27vaFiBAieilDKUPAWp+SC0PlBomOKSRuzl57nk4Ent2j9oRmxXh
         MHVPRtKHlnEOKpOENt7C+Nrh/HhlNECFXOK1GNetmz8fBUIo/611UW78pgfcxjuxERaQ
         kWyH1xakPMz9TWSD+O130n4fDc7lfdKRdlT0lhWu+jt+tlxIwEJw6CtumpRAICmPGjtf
         Jhk3aERwlqtyyj08OZHtqiIrSK3KfPMyN6p0gwBbXZmsCsufh5QO8aQhxHgG1jki7yhi
         BQzQ==
X-Gm-Message-State: ABy/qLazOSZ5yn5SJY1M4WrpuD6m0LyXsixxkeWkoONq9rPPPLWmfFKQ
	J+GIAdCQE0PZAtksQ5AneY+v7g==
X-Google-Smtp-Source: APBJJlH7JmnAtWf00RR3dz14JYX8DXcmby2myXmtceDzmjJB7uF+Oeviqzjo6nurONUAo6+QbxYF1A==
X-Received: by 2002:a17:906:29a:b0:992:a838:a564 with SMTP id 26-20020a170906029a00b00992a838a564mr1483649ejf.28.1690451660237;
        Thu, 27 Jul 2023 02:54:20 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id oq26-20020a170906cc9a00b009888aa1da11sm554311ejb.188.2023.07.27.02.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 02:54:19 -0700 (PDT)
Message-ID: <a2e8544b-f97b-e318-1c98-7f424b1c810c@linaro.org>
Date: Thu, 27 Jul 2023 10:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: add support for Macronix Octal flash
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, JaimeLiao <jaimeliao@mxic.com.tw>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-3-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230727091610.234132-3-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_025426_740254_D6940DF7 
X-CRM114-Status: GOOD (  26.18  )
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



On 7/27/23 10:16, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Adding Macronix Octal flash for Octal DTR support.
> 
> The octaflash series can be divided into the following types:
> 
> MX25 series : Serial NOR Flash.
> MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
> LM/UM series : Up to 250MHz clock frequency with both DTR/STR operation.
> LW/UW series : Support simultaneous Read-while-Write operation in multiple
>                bank architecture. Read-while-write feature which means read
>                data one bank while another bank is programing or erasing.
> 
> MX25LM : 3.0V Octal I/O
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8729/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf
> 
> MX25UM : 1.8V Octal I/O
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8967/MX25UM51245G,%201.8V,%20512Mb,%20v1.5.pdf
> 
> MX66LM : 3.0V Octal I/O with stacked die
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8748/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf
> 
> MX66UM : 1.8V Octal I/O with stacked die
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8711/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf
> 
> MX25LW : 3.0V Octal I/O with Read-while-Write
> MX25UW : 1.8V Octal I/O with Read-while-Write
> MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
> MX66UW : 1.8V Octal I/O with Read-while-Write and stack die
> 
> MX25UM51245G : 512Mb flash, with Word mode data output format when Octal DTR read
> MX25UM51345G : 512Mb flash, with Byte mode data output format when Octal DTR read

split this in multiple patches and send a patch for each family please.
> 
> Macronix Octal flash with two types, "byte mode" and "word mode".
> Because of word mode flash with byte swap issue when Octal DTR read,
> adding byte mode flash in this patchset only.

Please reformulate this paragraph. So all these flashes that you're adding
don't swap bytes on a 2 byte boundary?
> 
> About LW/UW series, please contact us freely if you have any
> questions. For adding Octal NOR Flash IDs, we have validated
> each Flash on plateform zynq-picozed.

remove this paragraph.
> 
> As below are the SFDP table dump.

I'd like you to do some sanity checks as well, using mtd_debug. There
was a script that I advertised, please search ml for other flash updates
to see how to do it.

> 
> zynq> cat jedec_id
> c2943c
> zynq> cat manufacturer
> macronix
> zynq> cat partname
> mx66uw2g345gx0
> zynq> xxd -p sfdp
> 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
> 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
> ffffffffe5208affffffff7f00ff00ff00ff00ffeeffffffffff00ffffff
> 00ff0c2010d800ff00ff87790100841200e2cc04674630b030b0f4bdd55c
> 000000ff101000200000000000007c234800000000008888000000000000
> 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
> 727103b80000000090a3188200c069960000000000000000727100987271
> 00b8727100990000000072710098727100f872710099727100f900000000
> 00000000011501d0727106d8000086500000060100000000020001030002
> 00000000060100000000000072060002000000eec0697272717100d8f7f6
> 000a00001445988043061f0021dcffff
> zynq> md5sum sfdp
> 839ad44d1e758bea30bd9917ba763ba6  sfdp
> 
> zynq> cat jedec_id
> c2843c
> zynq> cat manufacturer
> macronix
> zynq> cat partname
> mx66uw2g345g
> zynq> xxd -p sfdp
> 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
> 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
> ffffffffe5208affffffff7f00ff00ff00ff00ffeeffffffffff00ffffff
> 00ff0c2010d800ff00ff87790100841200e2cc04674630b030b0f4bdd55c
> 000000ff101000200000147c00007c234800000000007777000000000000
> 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
> 727103b80000000090a3188200c069960000000000000000727100987271
> 00b8727100990000000072710098727100f872710099727100f900000000
> 00000000011501d0727106d8000086500000060100000000020001030002
> 00000000060100000000000072060002000000eec0697272717100d8f7f6
> 000000001445988043061f0021dcffff
> zynq> md5sum sfdp
> 00447475e039e67c256a8d75d5885ae8  sfdp
> 
> zynq> cat jedec_id
> c2843a
> zynq> cat manufacturer
> macronix
> zynq> cat partname
> mx25uw51345g
> zynq> xxd -p sfdp
> 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
> 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
> ffffffffe5208affffffff1f00ff00ff00ff00ffeeffffffffff00ffffff
> 00ff0c2010d800ff00ff8b7901008f1200e2cc04674630b030b0f4bdd55c
> 000000ff101000200000000000007c234800000000008888000000000000
> 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
> 727103b80000000090a3188200c069960000000000000000727100987271
> 00b8727100990000000072710098727100f872710099727100f900000000
> 00000000011501d0727106d8000086500000060100000000020001030002
> 00000000060100000000000072060002000000eec0697272717100d8f7f6
> 000a00001445988043060f0021dcffff
> zynq> md5sum sfdp
> cdccbfad3c384e77f3a5f7847b57b148  sfdp
> 
> zynq> cat jedec_id
> c28439
> zynq> cat manufacturer
> macronix
> zynq> cat partname
> mx25uw25345g
> zynq> xxd -p sfdp
> 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
> 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
> ffffffffe5208affffffff0f00ff00ff00ff00ffeeffffffffff00ffffff
> 00ff0c2010d800ff00ff87790100841200d2cc04674630b030b0f4bdd55c
> 000000ff101000200000000000007c234800000000008888000000000000
> 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
> 727103b80000000090a3188200c069960000000000000000727100987271
> 00b8727100990000000072710098727100f872710099727100f900000000
> 00000000011501d0727106d8000086500000060100000000020001030002
> 00000000060100000000000072060002000000eec0697272717100d8f7f6
> 000a00001445988043060f0021dcffff
> zynq> md5sum sfdp
> f7712440f8ce0adb538dfa0c10579c79  sfdp
> 
> zynq> cat jedec_id
> c28339
> zynq> cat manufacturer
> macronix
> zynq> cat partname
> mx25um25345g
> zynq> xxd -p sfdp
> 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
> 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
> ffffffffe5208affffffff0f00ff00ff00ff00ffeeffffffffff00ffffff
> 00ff0c2010d800ff00ff87690100821200d2cc02673830b030b0f4bdd55c
> 000000ff101000200000000000007c234800000000008888000000000000
> 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
> 727103b80000000090a3188200c069960000000000000000727100987271
> 00b8727100990000000072710098727100f872710099727100f900000000
> 00000000011501d0727106d8000086500000060100000000020001030002
> 00000000060100000000000072060002000000eec0697272717100d8f7f6
> 040900001445988043060f0021dcffff
> zynq> md5sum sfdp
> 950e623745a002e1747008592e6dbdf9  sfdp
> 
> zynq> cat manufacturer
> macronix
> zynq> cat partname
> mx25uw12345g
> zynq> xxd -p sfdp
> 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
> 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
> ffffffffe5208affffffff0700ff00ff00ff00ffeeffffffffff00ffffff
> 00ff0c2010d800ff00ff8b7901008f1200c9cc04674630b030b0f4bdd55c
> 000000ff101000200000000000007c234800000000008888000000000000
> 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
> 727103b80000000090a3188200c069960000000000000000727100987271
> 00b8727100990000000072710098727100f872710099727100f900000000
> 00000000011501d0727106d8000086500000060100000000020001030002
> 00000000060100000000000072060002000000eec0697272717100d8f7f6
> 000a00001445988043060f0021dcffff
> zynq> md5sum sfdp
> a3eb609c08894c84270ad06efc03766c  sfdp
> 
> zynq> cat jedec_id
> c28437
> zynq> cat manufacturer
> macronix
> zynq> cat partname
> mx25uw6345g
> zynq> xxd -p sfdp
> 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
> 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
> ffffffffe5208affffffff0300ff00ff00ff00ffeeffffffffff00ffffff
> 00ff0c2010d800ff00ff8b7901008f1200c4cc04674630b030b0f4bdd55c
> 000000ff101000200000000000007c234800000000008888000000000000
> 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
> 727103b80000000090a3188200c069960000000000000000727100987271
> 00b8727100990000000072710098727100f872710099727100f900000000
> 00000000011501d0727106d8000086500000060100000000020001030002
> 00000000060100000000000072060002000000eec0697272717100d8f7f6
> 000a00001445988043060f0021dcffff
> zynq> md5sum sfdp
> c6fb57b8fdd4c35b5f0dacc4a1f7d4f4  sfdp
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index b397fd274868..a5aee10590b8 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -99,8 +99,8 @@ static const struct flash_info macronix_nor_parts[] = {
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>  	{ "mx25uw51245g", INFOB(0xc2813a, 0, 0, 0, 4)
> -		PARSE_SFDP
> -		FLAGS(SPI_NOR_RWW) },
> +		FLAGS(SPI_NOR_RWW)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },

why? Here you don't add a new flash, but change an existing one.
Add a dedicated patch for this. Why can't you use SFDP?

>  	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> @@ -119,6 +119,28 @@ static const struct flash_info macronix_nor_parts[] = {
>  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +	{ "mx66uw2g345g", INFOB(0xc2843c, 0, 0, 0, 4)
> +		FLAGS(SPI_NOR_RWW)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
> +			      SPI_NOR_OCTAL_DTR_PP) },
PARSE_SFDP instead.

> +	{ "mx66uw2g345gx0", INFOB(0xc2943c, 0, 0, 0, 4)
> +		FLAGS(SPI_NOR_RWW)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
> +			      SPI_NOR_OCTAL_DTR_PP) },
> +	{ "mx25uw51345g", INFOB(0xc2843a, 0, 0, 0, 4)
> +		FLAGS(SPI_NOR_RWW)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },
> +	{ "mx25um25345g", INFO(0xc28339, 0, 0, 0)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },
> +	{ "mx25uw25345g", INFOB(0xc28439, 0, 0, 0, 4)
> +		FLAGS(SPI_NOR_RWW)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },
> +	{ "mx25uw12345g", INFOB(0xc28438, 0, 0, 0, 4)
> +		FLAGS(SPI_NOR_RWW)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },
> +	{ "mx25uw6345g", INFOB(0xc28437, 0, 0, 0, 4)
> +		FLAGS(SPI_NOR_RWW)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },

PARSE_SFDP for all the flashes please.
>  };
>  
>  static int macronix_nor_octal_dtr_en(struct spi_nor *nor)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
