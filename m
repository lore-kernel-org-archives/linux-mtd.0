Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BAFC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Dec 2022 07:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+UN2h4X6iR848Q+9tLje8BP5SioiorJ/Y8zXYs0gwg=; b=Tgjagppa1G0LKI
	CtIJkjA1/9xZCcVWCHcB8ilck7VX6pFsnBn1vsQum6DL0aVejfwN+beJkSYYZCw1OKGDzVohCSITN
	M83JXZtx1XiR6dGki4HJIR85a47U3NVWUYW5xIBc37qE5DBH+40cEwhVEb+FeeIb0jNg78xV0GZXz
	JkhvGQuxtqNxQ98pTiuFx/a2kto/1sRYv8hKRuRpypLJXTQzeCs6tbeGIKBS7yX+VdL6qRUpkxyPx
	SZPrPWVR9qj8xorSpbshLOd7ZPt7KMh1Vjk/yRcInWdQWLKCe1exsm4M4sfLQ4gQmJGYCb7FSIHoW
	pXyzbZaPyEm4au9rJcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cY9-004o2c-RV; Fri, 23 Dec 2022 07:33:02 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cY4-004o08-PW
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2022 07:32:58 +0000
Received: by mail-ed1-x530.google.com with SMTP id c17so6012070edj.13
        for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2022 23:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+AiTWCgFexub6hxtJlHiBMnj71ReDBQPW/c0G5lqak=;
        b=z75NVwxb+aISerj9qMkSjmHGSxMUYlFlHVETPbROubl/T+HOm6VVcHy5I0htObf0vw
         9zI3RB984a12WBP31Up1/1vT+7AfcQQX7wvXnFzjAUSGg8VJJ58c/aJyxtcwZcmv4kYQ
         iYw9TMzjJ+t4Ueql/s8+5V6pgLTObfuP+uazwTbF34mzTRbjqAgMBsib6bSQNBX3RhMP
         W+3x5Dy5ProFshRWZG4YIVf/GEWqEGAYnT54v442XPGzKVtUEigSje0ZuG7wgSj/tme8
         zzRQNAAJA7lXwdSViZl6u3ohH6nf6xxv6emk5zqPTU/KCzD2AlS5OqfQTnNYQ7hGmH4f
         irJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+AiTWCgFexub6hxtJlHiBMnj71ReDBQPW/c0G5lqak=;
        b=c2kvWH9rG0h+1rqPpjGYuhFjiWKZNZlv5j+35wVGdefrZiWuhnlLGnsL4Rvn57Q6CW
         WrNkJCX7EASvEWWoxpIUzj7PPDe63XOli8ejrBQJPekF/UglP1HbTg4ETx/rl0wv2Wxx
         NjtPp0pS7gzK4g2qY2zB5orWu38Ra7v3zobiRRgUzpCl2zbKkyex/kixvlb7a8vaf23c
         ejUoLYXk1Lxs/1pOZ9YVeuF0Ah01FIsuZcgzjDegWpbodiiu4LPwdK1oMlyEFV4U7cIN
         ag9EAp6caEQ+gtmzaahhLTef8w+AIjXY3qjGE5AA/nWIhd3Fw700T6Qr2otXCSsOG8q4
         3hTQ==
X-Gm-Message-State: AFqh2kql3v5eqqoUyVrudYRS1fXEEEdrB+e3/r4RDIgsniYLEUozVYdm
	mvxNTAqPR0qexePJqfH1s3xnew==
X-Google-Smtp-Source: AMrXdXuLHGDYeNLTyWD8hKoCNuzrSszRBHBSl1NfnmDGdsold/gPsJF4Ulck1S2OOiaYROZ5ybuT1w==
X-Received: by 2002:a05:6402:1f06:b0:46f:a6ea:202 with SMTP id b6-20020a0564021f0600b0046fa6ea0202mr9159552edb.37.1671780772899;
        Thu, 22 Dec 2022 23:32:52 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id u24-20020aa7d0d8000000b0046776f98d0csm1180022edo.79.2022.12.22.23.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 23:32:52 -0800 (PST)
Message-ID: <c6f3590f-78bb-d004-9381-1000f2e27334@linaro.org>
Date: Fri, 23 Dec 2022 09:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] mtd: spi-nor: sfdp: Fix index value for SCCR dwords
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
 <d73012e2a3185d96b8a9fcd9523af54867d50e89.1671684805.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <d73012e2a3185d96b8a9fcd9523af54867d50e89.1671684805.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_233256_883127_8B67F81E 
X-CRM114-Status: GOOD (  14.14  )
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



On 23.12.2022 09:21, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Array index for SCCR 22th DOWRD should be 21.
> 

don't forget to cc stable:
https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

> Fixes: 981a8d60e01f ("mtd: spi-nor: Parse SFDP SCCR Map")
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> ---
>   drivers/mtd/spi-nor/sfdp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 8434f654eca1..5df2fcba5483 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1228,7 +1228,7 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
>   
>   	le32_to_cpu_array(dwords, sccr_header->length);
>   
> -	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
> +	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[21]))
>   		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
>   
>   out:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
