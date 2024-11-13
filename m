Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFB1D41C2B
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 09:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G57zUOVgbJ7EH3bWJcW6ijeZee7UlZXp8neAqSKAuDk=; b=mauTW1EBehQ+Xa
	jlb1SpUUWXGrQLzoUHOqe3/nGuu7+tpiHDGv5lV0Q+g8rkaDvlMsyyNVORS3YFKl+ZPhb4smqNt1+
	rExuo01KWyKxKe5gawpBE1D3oJdA18Gzt1DvE4XhuFQGlzi14I2O8FF4j48QeatiXQWkDpDid4A7I
	NuytxyvYJ83s250c1r4m5o+LhzUpSp5GXVwVBaSaQXhw78Ls7TJwsVAOa79LRIK4kX0AQvcMssuZi
	84i8zsSGwvMktoAWEZeGkdUDTQmRvFoE4XZgjCLet5nvLUmWEniZJ4GZk+4p9MPYC6pAgKsQNW5J1
	bZfzDKxxxaVFaY3C5iiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA4V-00000006Jdg-2Pwu;
	Wed, 13 Nov 2024 09:53:59 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9wt-00000006HK7-03RN
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 09:46:08 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539d9fffea1so6635591e87.2
        for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2024 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731491164; x=1732095964; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aG6ULzMF9hbDS27IR5UiwotWanEPH5uCO+27foPjqlQ=;
        b=H9W/QE9MkchI7YDrHoKvBa8zdmu2R0v7791oKgeOXuwtDCxIVkxXgTPFWDRf/1jWCc
         j3FaVe0Syy1BHKbaW1UbafWhRF/HWlFqUQvJ+uOoawTpR6bWC+NG/9nrtDzIcS72la/V
         758Oq2k3STD+fCm10CyuyL0GuyLMk+BZNYFzWWrx6PUeCUq7loFx6PS5YlqJiuk2Y8Fp
         sWpIvlU0DOHABxeMMmtMeovAASHC0KitYNEehKVfiaO1ODV+s1IS4WHU/l8LGH1T9TiU
         aCFKadjZlKOoSLfykiv6rskxSYuAUOs3ImwgApO8swfKdXvEWvoWWChjZntjCiw07XH3
         osCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731491164; x=1732095964;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aG6ULzMF9hbDS27IR5UiwotWanEPH5uCO+27foPjqlQ=;
        b=Rq/dY1ASEkIC3IQTr4K4hQGNBp0W46NnaDbPPps0n7DI3/8DOs/ULRlG7fEfLzzm71
         RGSvM2lBQ65elw/FsM9b8EpZT7Ky5peRxBLgDx6TMkiiJgRQF3lE/qXtJ/oEs5nCfUR7
         mXd8Emcmq2vl18mxkYmKO02GVyMP6cTCHtF7D5ElSGTwyN64X8G4BcXg/1EX+FfNeFvA
         GHI54wv12yOV/XDl9HqbNz4bQcPGBxeFAKNvvNFcqBCsyQyKALW1D4xsc4GSWZIT9lt3
         lXNGaH+EFSG3O3/VjpPx/c/xA5wkt9/FE70njMhA5xT1q6aJeJDkk9HJPB5B13fwKVcQ
         uXXA==
X-Forwarded-Encrypted: i=1; AJvYcCWZD6hsgInWVueYkExXx2T5+TgpecgRs62d0oR2c/tLzTHavPmXhqD8XcuKeVXqcCllbyQgraaysb0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1vbwpWCIRkk6DSePPLDrhUtlrbGipa+Ha4y7SGnRfS8qfxK7b
	+SQggifJQtvbWW56f4oM1WBUCE2mxafFIGefLRhSUin0x/0TlUMQcnOit3ww7BY=
X-Google-Smtp-Source: AGHT+IFinPVZrq/hLk/0lgYBm9HvM0TRhKieSiVYy09rroN9+LJLpX1N0tWlZzOj1cxmi5mGxUMnJg==
X-Received: by 2002:ac2:5a41:0:b0:53d:a0cf:8101 with SMTP id 2adb3069b0e04-53da0cf81demr687896e87.50.1731491164199;
        Wed, 13 Nov 2024 01:46:04 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54673a8sm18486025e9.0.2024.11.13.01.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 01:46:03 -0800 (PST)
Message-ID: <432f6a9d-3fa5-44c2-9e6e-b66bf57e71f7@linaro.org>
Date: Wed, 13 Nov 2024 09:46:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] mtd: spinand: winbond: Add comment about naming
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-24-miquel.raynal@bootlin.com>
 <71d0cf83-6866-46be-b76f-291a8a6a1346@linaro.org>
Content-Language: en-US
In-Reply-To: <71d0cf83-6866-46be-b76f-291a8a6a1346@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_014607_094018_8086703E 
X-CRM114-Status: GOOD (  13.96  )
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



On 11/11/24 2:38 PM, Tudor Ambarus wrote:
> 
> 
> On 10/25/24 5:15 PM, Miquel Raynal wrote:
>> Make the link between the core macros and the datasheet.
>>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  drivers/mtd/nand/spi/winbond.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
>> index 686e872fe0ff..9e2562805d23 100644
>> --- a/drivers/mtd/nand/spi/winbond.c
>> +++ b/drivers/mtd/nand/spi/winbond.c
>> @@ -18,6 +18,11 @@
>>  
>>  #define W25N04KV_STATUS_ECC_5_8_BITFLIPS	(3 << 4)
>>  
>> +/*
>> + * "X2" in the core is equivalent to "dual output" in the datasheets,
>> + * "X4" in the core is equivalent to "quad output" in the datasheets.
>> + */
> 
> doesn't help great for an outsider like me. Is quad referring to cmd,
> addr or data? Or maybe of all? I need to read the code anyway.

more straight forward would be to use the X-Y-Z terminology in the
comment, where X,Y and Z are the number of IO lines for cmd, address and
data.

>> +
>>  static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
