Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136D9C25B75
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+Si0tV4z4XHoGqzk/vKmSNVlRlj+YskHBZ2A6yYIac=; b=XJULr0qfvtU29b
	9UL9sWLi4iyyclUj4LyrA/k2PIEBqKuP+fvf/y/95V+MzmFYkJI0bqlC3W/+44ZYY0NRDM+9VDRTc
	rbW3z8x+UYECgtcHW27TjUysinDbRUf95gZEeIRwGMgoA+qTMFGDq52dpSCylOPhGu0G0f69lQSZ2
	iWsYAgL1w2mtSsm1ynu2f1zSu4RieJz/+nm4DliU7U9iq33/ftTecrPCNdUXMExeUBBmO61e2enzU
	Ds38wYpVkhN5pZUlyxjxfJhUTo2ZqxCr/vvOv1KakxnfmhoZhw8nXy/R3O2opLqHffn0BiEufyekj
	I15SdWI+yM83rtKLeMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFETq-0000000A9Y1-2uYk;
	Thu, 06 Jun 2024 14:52:42 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFETn-0000000A9Ww-3L2x
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 14:52:41 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-57a2ed9af7dso1580658a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 07:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717685558; x=1718290358; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGCRKwKRmXUWhTx00oNcButD2nQ+Saa5TZxkHFCVpsQ=;
        b=eraYIRuBDxxyCEhMsBhUIdrUKhUkVqo2LbRitVnWxGro1uD73IxOA7LvrmePKxWZ8Q
         +1jnfSZiHJeDfMpT8/bsdO0z+hPPHSccQ8mCzbo/4vIBZHc9te1IE9KFgXKVZCoMkxKd
         teHJRhPIvNdhl93Li7cQFxgjhtx8m19DY72AQbRTmbudKANYjsqosU6EjmLh6N8WtxXR
         uGmpMDbXZ93uv8CP72ue2INBty2psLxXA6Gbqx9QdFugsBRHCV7tQYBkKdl9z/b9XxJe
         rMbYW/ngazWrOZ9vyjXkF7P1srUi93rt+IOk+DfInqZUG8vFkVSiv82RSqVvd1S2Trcn
         zkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717685558; x=1718290358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGCRKwKRmXUWhTx00oNcButD2nQ+Saa5TZxkHFCVpsQ=;
        b=EfZuSO2mywOIavXpp+ZAvV9e41GxU0TpFKu7r5h3SJqS5KCYNcA2ANLCZ7Jb1ZSfyf
         S0wnrAHOa75DiQUprgCYH46L38L1nwNdpX7vc4PxATFyM+LTNWqGvWE+PRh39hOqkh70
         xHzCd0ejhp1n6vxzvQgrSYEK3yMPembG0Nbkh/fXEPbWroUn5zQd1GSx8FWZWQWsq3a8
         /z7zByH5G6YVn3yqvGduJTcb9ng3mBv8O84yX4+5ij//abC8xdlzizYDvaPrH6BQzEyj
         V+BF6rLZeWckBA4dkEK0IQpFEhtm82C7wvTPfs1anEfDQQJ8B4BlwyiiIxxlSI2AMMXi
         1h0A==
X-Gm-Message-State: AOJu0YxY1oWgUuYnYifdj/HDBMQwi5CCKPZpSnX1CJ7ixzpAbcqTKiT3
	jh8/wJI5nrGQzBwOb1dAr66x8tmchlBd1LKkOAtEaja6PhfrwdHhlR1eSbecuEI=
X-Google-Smtp-Source: AGHT+IHqQQw7O0OBRYnOeA/8BGBR9rC3YntBdKFGChqnPpJwodZEx81cRjSeCp8zfYk3krebBnLanQ==
X-Received: by 2002:a50:bb03:0:b0:57a:1c44:581c with SMTP id 4fb4d7f45d1cf-57a8bc91223mr4966328a12.32.1717685557803;
        Thu, 06 Jun 2024 07:52:37 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.17])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae202341sm1197473a12.70.2024.06.06.07.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 07:52:37 -0700 (PDT)
Message-ID: <48719b0f-1a7f-47f9-948a-c981a0a29b41@linaro.org>
Date: Thu, 6 Jun 2024 15:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: core: add flag for doing optional
 SFDP
To: Michael Walle <mwalle@kernel.org>, Esben Haabendal <esben@geanix.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
 <20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com>
 <a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org>
 <D1SZKLZBDDBA.1Z7ZD4UEOX05F@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D1SZKLZBDDBA.1Z7ZD4UEOX05F@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_075239_870747_87F9A293 
X-CRM114-Status: GOOD (  22.74  )
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



On 6/6/24 14:59, Michael Walle wrote:
> On Thu Jun 6, 2024 at 3:31 PM CEST, Tudor Ambarus wrote:
>> On 6/3/24 14:09, Esben Haabendal wrote:
>>> A dedicated flag for triggering call to
>>> spi_nor_sfdp_init_params_deprecated() allows enabling optional SFDP read
>>> and parse, with fallback to legacy flash parameters, without having dual,
>>> quad or octal parameters set in the legacy flash parameters.
>>>
>>> With this, spi-nor flash parts without SFDP that is replaced with a
>>> different flash NOR flash part that does have SFDP, but shares the same
>>> manufacturer and device ID is easily handled.
>>>
>>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>>> ---
>>>  drivers/mtd/spi-nor/core.c | 3 ++-
>>>  drivers/mtd/spi-nor/core.h | 1 +
>>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index 3e1f1913536b..1c4d66fc993b 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -2933,7 +2933,8 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
>>>  
>>>  	spi_nor_manufacturer_init_params(nor);
>>>  
>>> -	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
>>> +	if (nor->info->no_sfdp_flags & (SPI_NOR_TRY_SFDP |
>>
>> I don't like that we update deprecated methods. The solution though is
>> elegant.
> 
> I actually had the same concern. But currently there is no
> non-deprecated way to handle this case, right?
> 
> Right now we have the following cases:
>  (1) pure SFDP parsing
>  (2) non-SFDP flashes with static configuration only
>  (3) legacy implementation, where the magic flags decide whether we
>      use SFDP
> 
> Which case is eventually used depends on the ID of the flash -
> assuming there will only be IDs which either fall into (1) *or* (2).
> That assumption is clearly wrong :)
> 
> I'd propose a new case in spi_nor_init_params()
>  (4) try SFDP with a fallback to the static flags from the
>      flash_info db.
> 

that's not that bad, but I would avoid doing it if it's not common. You
also have to update the core a bit, you can't use no_sfdp_flags &
TRY_SFDP, it's misleading. Does it worth it?

I won't oppose too much, but to me it feels that we're trying to keep
alive a dead man.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
