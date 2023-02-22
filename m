Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3DDC636D6
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Feb 2023 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fi6Box9aYddJpkMm+o3NM09BuXW0Vvp8We+deVvLgK0=; b=C0PXRui1Zi0LPu
	SSLngrsu1uQ9q8LLtbV8Cz15N1ixApDELYdFKOzOWkyH3h19lAkXkakv9wxmX5taPmq616HQLGMFw
	J6FBoee/OQUPYg1DQX0pHLWiItYaxILKK+WAMJDOe+9awJ7h/UNVlXDHr9LB7PRjEafQD3TW1XZkX
	66a4aHZct5GABZVh8Ady0jEpCLJoL4tcfyV5CnRIUFZmPUwoco5EQWDRgsIJzUktMZtUIG/4+vOrS
	woBfOIFyKcasFI+LtKEB+vsoVS9vzsrrBtQ8wUWdG4mH9T7mGvp/9iMwRDjFkXC9k3mV4SIMR33Sv
	ePA5km886CnE0pyIiY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqSK-00CkKP-FL; Wed, 22 Feb 2023 14:50:52 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqSH-00CkJ5-Pq
	for linux-mtd@lists.infradead.org; Wed, 22 Feb 2023 14:50:51 +0000
Received: by mail-ed1-x535.google.com with SMTP id h16so31588732edz.10
        for <linux-mtd@lists.infradead.org>; Wed, 22 Feb 2023 06:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyGJcM/CNYvxVDjRCxgWwJCXDNBvesm1g6l5GuMQqYI=;
        b=uVCabMD3nUeKBlq607KTwdWZCTtyG2226qHGszeCUD4k5oF67RX8d8G6AdJVTdopAu
         mcS/MsdkJ1+1uBgq5w+Pr6aM1cyVH/aI+4MkzcgG7QlloQjU/oeCQjST9bxOl62XuGLl
         RYrbXHbfw/PsgCvq4lADzLPrz8B8zur3FkrkXCfOoqVheuRfr/his2Sron2TLRQ16Uqc
         eYceDypckN6AnmJwB4K5VGdj7NS+jcTywNE2G42F+yAcnWEBLhWz6BbB3FzlmcUlKPh8
         E2VaOknSRWp9tcQtYZv9w/0dQCuCtfeDNF5lz/PEXWbncKXlA5YrjnW8vZMZDpQXrLFp
         iXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyGJcM/CNYvxVDjRCxgWwJCXDNBvesm1g6l5GuMQqYI=;
        b=QGzWoZ3kqdx3xJ3h6D6UF7JEhAWvStO2dBlRiNWOfUtjgwgrgDLUpkZZxNMkk4tSev
         CcwlkSjbefrNO0/5nsVSuEBiC3Vzks91TVB3rZ/LXML0ClgI+6kgl1HB4BDGrG+rqekY
         /N+VzP74T0K063dBRGmfslPpZrqH7+4uPKn7o3rESfLRB1OL8illjsv6lxEhKsJHBp12
         WIHANKAkxuSOczB6NdLpIXGBGjqdpvrVpJGR91qjtiflRI9ZeuGl4JgR14LOuWb5Xt+i
         QE4Pnbze19lcjuqI0y5QMG8n441bmNudXKQeJtUHpevjjA22PLOCiHfVD5u54ZDvix0u
         t+4A==
X-Gm-Message-State: AO0yUKXwJ2j2MglFKWDYX6k+gVFA3Dokp13Xa+P2ME0nh+1E2wu7yXRM
	90AVMAyICHq1WMZV+9P2KbVGww==
X-Google-Smtp-Source: AK7set9K8rHF8R28ZBg/MGbro/2Anb89o6p8DNRcxlldZn2zsldpgxzumJ+25sW15VyUtq16CZbrdQ==
X-Received: by 2002:a17:906:c7ce:b0:87b:dac0:b23b with SMTP id dc14-20020a170906c7ce00b0087bdac0b23bmr17096543ejb.55.1677077444345;
        Wed, 22 Feb 2023 06:50:44 -0800 (PST)
Received: from [192.168.0.109] ([82.77.80.204])
        by smtp.gmail.com with ESMTPSA id gw20-20020a170906f15400b008ea5f4fab5fsm256953ejb.145.2023.02.22.06.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 06:50:43 -0800 (PST)
Message-ID: <d87efbd8-5290-b462-beb3-c2d3be267ade@linaro.org>
Date: Wed, 22 Feb 2023 14:50:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] mtd: spi-nor: fix shift-out-of-bounds in
 spi_nor_set_erase_type()
Content-Language: en-US
To: Andrea Righi <andrea.righi@canonical.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Cristian Birsan <cristian.birsan@microchip.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230221111346.34268-1-andrea.righi@canonical.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230221111346.34268-1-andrea.righi@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_065049_883811_EF5141BF 
X-CRM114-Status: GOOD (  18.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

This should be fixed by:
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=spi-nor/next&id=f0f0cfdc3a024e21161714f2e05f0df3b84d42ad

Which base did you use?

Cheers,
ta

On 2/21/23 11:13, Andrea Righi wrote:
> It seems that according to JEDEC JESD216B Standard erase size needs to
> be a power of 2, but sometimes we set the size to 0 (e.g., in
> spi_nor_parse_4bait()) causing UBSAN warnings like the following:
> 
>    UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2026:24
>    shift exponent 4294967295 is too large for 32-bit type 'int'
>    Hardware name: Dell Inc. XPS 13 9300/077Y9N, BIOS 1.11.0 03/22/2022
>    Call Trace:
>     <TASK>
>     show_stack+0x4e/0x61
>     dump_stack_lvl+0x4a/0x6f
>     dump_stack+0x10/0x18
>     ubsan_epilogue+0x9/0x3a
>     __ubsan_handle_shift_out_of_bounds.cold+0x61/0xef
>     spi_nor_set_erase_type.cold+0x16/0x1e [spi_nor]
>     spi_nor_parse_4bait+0x270/0x380 [spi_nor]
>     spi_nor_parse_sfdp+0x47f/0x610 [spi_nor]
> 
> Fix by checking if size is a power when setting struct
> spi_nor_erase_type, otherwise consider size, mask and shift as invalid.
> 
> Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories")
> Reported-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> ---
>   drivers/mtd/spi-nor/core.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d67c926bca8b..3c5b5bf9cbd1 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2019,11 +2019,17 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
>   void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
>   			    u8 opcode)
>   {
> -	erase->size = size;
>   	erase->opcode = opcode;
>   	/* JEDEC JESD216B Standard imposes erase sizes to be power of 2. */
> -	erase->size_shift = ffs(erase->size) - 1;
> -	erase->size_mask = (1 << erase->size_shift) - 1;
> +	if (likely(is_power_of_2(size))) {
> +		erase->size = size;
> +		erase->size_shift = ffs(erase->size) - 1;
> +		erase->size_mask = (1 << erase->size_shift) - 1;
> +	} else {
> +		erase->size = 0u;
> +		erase->size_shift = ~0u;
> +		erase->size_mask = ~0u;
> +	}
>   }
>   
>   /**

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
