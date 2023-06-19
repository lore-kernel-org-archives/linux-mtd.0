Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0187FEB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VNIa8P5Q5htjis0h8pAap9l6Y97xwVxgfkyVAMQRrI=; b=Cng4bffjV0CR7b
	ehkePtUuPtn9Z2eEYNKfAOe78eeRvM7nZhMx1EzDn/Ie/8ApdGseeMfDgPpBBDt8Dj67u7zAgIyzw
	+EBNgeU1lhPqkGDXw766bUQ0XDIn2Y7YxtJ9OAnOkW3LPG40PQFtbbOTb2QaJbtgfz6oUxWNtb9Vj
	IhoNzuLGK7Yxz9W8fFfifPC6XyP+xXrWBl+ymbghhth7kcpRbHR0MwCPRdU/FRs0QFG0Kzd/7sSat
	dx9zDMl/wpCpAInexBWAYhlm0U6HUaC7pCMzjq94cPFvMAaJ/k0wXEzXixfBdVVOeZ6PCnzaoqvpT
	kBYjC+NqR5f4SQK4HdAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBA88-007o4p-1d;
	Mon, 19 Jun 2023 08:20:56 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBA85-007o3v-2X
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 08:20:55 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9889952ed18so154877566b.3
        for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2023 01:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687162851; x=1689754851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Ydqf2Qhba0Kxs4rfFMaqLMhy7yZvC6klgrVP3pCFfM=;
        b=MlFqw0zahGRBJkmGasGfJQ8XP7WZ3+pdU9HTj8enis/SMZuENaYjaPdHjM9Ic/dzfG
         IrJYoBVk8qYz04Bk8qMtRPWb7irM1EbH2JwiVh36hSIckesda0YKPvgozcRgQVHXBRH1
         poK6HD/epqq51QhKbIAiPrLCEmRxIg2MbbDmvHBRExbWeBfxjj02enyxrd5KfDvXJGOv
         I1YdgWYkU98rx/iL2gqd8Ahhcul3dBExDLI2RuAdfZlA5IGR/1nIIIuhZ7fcMtU1tnzs
         GhCuG5ASl8acaQ8UbsaA5tlcA0C88BKJJ8AO52h4rXWMlgG31XEwmUw8OlfFf2pB048Q
         P7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687162851; x=1689754851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ydqf2Qhba0Kxs4rfFMaqLMhy7yZvC6klgrVP3pCFfM=;
        b=g/IHG94Nxw+naE+GDLJwVGZChZSbyWlfbLpWgIZtDXVgh8qKUnO0AQQ4mUVnbmoJ4e
         Fx+TQDxAqw0yHXpG2i4TgRAOpwfk5EVPcPCASIi24erwZxiUraHqorNZ3DdQVY8NTV1o
         FtL9e4szRI+hb0QrvbaRFMXI9OyrIPivBAtbAvwESfATYEpyJz9H15RFizWTsE0j42rJ
         S0vxLa6fep9XSlP8OToV4iGv7auuKU0jsmqXoIkCLH49wdW2XRYgHegc75Hy1cRbGSmL
         TwtP+SDljo6bWLJZ/vzbtSYN+43AkX66BhTi8SdO0hvr4Sewps8azcIZfc5sLhS7r650
         XRaQ==
X-Gm-Message-State: AC+VfDw8PCjvqsr8fGqvjXKQXLygT7wI+MIx+XOOF9HgiAboSTvF1cWI
	eVeD7iJ0dRDHB3fhg+WA+oqWMg==
X-Google-Smtp-Source: ACHHUZ7SZ02JMKf//Q+YjndqIaZXmFgc0Td/2rIG1lBqBgoEx5T0mU/hMUJFr0fbH9/SmIXy6Jr4lA==
X-Received: by 2002:a17:907:987:b0:987:6372:c31f with SMTP id bf7-20020a170907098700b009876372c31fmr5111745ejc.37.1687162850945;
        Mon, 19 Jun 2023 01:20:50 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.157])
        by smtp.gmail.com with ESMTPSA id v22-20020a1709063bd600b0098314c30e8fsm4840913ejf.46.2023.06.19.01.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 01:20:50 -0700 (PDT)
Message-ID: <b065c5f0-5712-5b46-7f99-aad673531b6e@linaro.org>
Date: Mon, 19 Jun 2023 09:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Drop redundant information on the
 sst26vf flash series
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230616140822.2789638-1-miquel.raynal@bootlin.com>
 <20230616140822.2789638-3-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230616140822.2789638-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_012053_832225_DA518882 
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



On 6/16/23 15:08, Miquel Raynal wrote:
> It seems like the whole sst26vf flash series share the exact same
> properties, beside the final size due to a lower/higher number of blocks
> in the final die. As the intermediate version fully supports SFDP
> parsing, we assume the others as well.

I think the changes are fine, but I'm not going to queue things
that are not tested. I saw too many things to rely on assumptions.
All these will be changed one at a time when we have hw on our hands.

> 
> Drop the redundant information and use the PARSE_SFDP flag instead.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/sst.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 48970d2f78fa..467154176dd6 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -109,17 +109,17 @@ static const struct flash_info sst_nor_parts[] = {
>  	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> -	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
> +	{ "sst26vf016b", INFO(0xbf2641, 0, 0, 0)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ)
> +		PARSE_SFDP
>  		.fixups = &sst26vf_nor_fixups },
>  	{ "sst26vf032b", INFO(0xbf2642, 0, 0, 0)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>  		PARSE_SFDP
>  		.fixups = &sst26vf_nor_fixups },
> -	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
> +	{ "sst26vf064b", INFO(0xbf2643, 0, 0, 0)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		PARSE_SFDP
>  		.fixups = &sst26vf_nor_fixups },
>  };
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
