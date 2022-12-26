Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E0CC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WlM9EBigM6xi0KJu/QhD2mmsQJxJMSOUyQK3VHqwvQ=; b=xlnqEWgvp4Q2In
	rSYWIbLeR3Mg0X10jXsQ7/Z+tXbz7e1Nc0zb2h0u7vJ3p3SD+ygYOhocBx0pIDSsG8xdMrA8RBJ1J
	1Z8dlcBQMndHBbyh+3vLK6qsGIBoN5fw4LoWFmpC5RYh9QYcaRxXYEzXZ9UaWQgiVuIRRYzD6qanL
	LmVp64fg42weBpSw7rN3uK/CUxIklnihTbaq0Dy3oTOFnzDJs2LoBqJxB9UEgM9uOKxp6tVjGxbOJ
	4W3lcHCi312oomyxnK8hcFUxVitxZCpiNzDFW18/0koBVF21aNewoUscacbOVFYQlIxnC7xU7e3a5
	w1H5Lkc4YK14HqZZ2m1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9icv-002daa-0o; Mon, 26 Dec 2022 08:14:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ics-002dZa-5P
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 08:14:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id ja17so7192621wmb.3
        for <linux-mtd@lists.infradead.org>; Mon, 26 Dec 2022 00:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCzfV2lLowmRKBZqSSSq8cPnJcFs213oEz2XICgnZKc=;
        b=cOGXV/QWMiQVc+KPExY63omHWJJq1GkeAne7IvJqVDDeJzUsD45+0QWfbck6xSoukW
         OusS1CrZj3uXvPTl3b83aHMJBjzZLi8vqUi7vmT1W9OyEUAhRkM1Z5b/qqB451v4dVB3
         S4To/CWEnSeyDunVqRxMSXEtI9hXhBpmGgK9mPvK/K2VXQYAOd2oZFCKyg5AGD0/Tlkv
         dI6aqOsEbzyYPxUeFNqWgL4cu4UBX8+zwUnTz1dKUcBUcwublooXLdzLzu2bRictfsR4
         C15Z9JXUv8EAeDL3bA5uVTwsr2y2TQyd9kXyoQNLyrVRD7Q1fDMM9ESekFNRhOVV5K2w
         2H6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nCzfV2lLowmRKBZqSSSq8cPnJcFs213oEz2XICgnZKc=;
        b=2yu9la0cg0gH6tHTkCRlAEI+PcFaf26EBVlj6uBX4I+L/bwHcRquZGL5st74LCaAJj
         +NVDKOw6AjPt0z7nQspCgxBX+pMczw+z3LyUMhxph5UFcrK49DBjGZNbqR6extNxR/EJ
         VG2dbG942kwEcZF8Z8rkofaE1zGHMJLIzf6APndwZsHkpTAnjFpjbtKk+1uO5PWHR5cF
         vTfIxnvZDniWpoNEeN9UPwn12rVWDRbIV9Pj1RTKJShE8A01wsBC2q+349jqwSasMgPw
         TDbT5+o2G6ZMlzE0nsSRTEoyh7LlWqoB3FJ5ok18xDI2FLx80KUFbczry/2XPlEdjDQK
         O29A==
X-Gm-Message-State: AFqh2kqVHzBURpVkDYnwSgS91PIJQwQxIJfwLX3aOQpnv9suoTL28kmA
	Jw3xfpnMOTCPh1brAbGbJ3Z0LfXF5alFJZM5
X-Google-Smtp-Source: AMrXdXvjwRaGm8hynHIBmBXlnUP4P/nQ1RZiieHLQyJyFU8CAmKYL5GOHlO/UzmI8sLK2KAxvOLYog==
X-Received: by 2002:a05:600c:1d8e:b0:3d6:e23:76a2 with SMTP id p14-20020a05600c1d8e00b003d60e2376a2mr12126175wms.34.1672042464004;
        Mon, 26 Dec 2022 00:14:24 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id l42-20020a05600c1d2a00b003d23928b654sm19693519wms.11.2022.12.26.00.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 00:14:23 -0800 (PST)
Message-ID: <b35ef623-4914-7bb5-5dde-181f6fe5856e@linaro.org>
Date: Mon, 26 Dec 2022 10:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/3] mtd: spi-nor: Add additional octal-mode page
 program flags to be checked during SFDP 4BAIT parsing
Content-Language: en-US
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20221202135539.271936-1-nathan.morrison@timesys.com>
 <20221202135539.271936-3-nathan.morrison@timesys.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20221202135539.271936-3-nathan.morrison@timesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_001426_296269_6AC944CF 
X-CRM114-Status: GOOD (  17.05  )
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



On 02.12.2022 15:55, Nathan Barrett-Morrison wrote:
> This adds some support for automatically searching a chip's SFDP table for:
you can drop ":"
> 
and this new line
> program commands: 1S-1S-8S, 1S-8S-8S
> 
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> ---
>   drivers/mtd/spi-nor/sfdp.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index e4e87815ba94..e1b7547bf81e 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1089,6 +1089,14 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>   		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_4_4],
>   					SPINOR_OP_PP_1_4_4_4B,
>   					SNOR_PROTO_1_4_4);
> +	if (pp_hwcaps & SNOR_HWCAPS_PP_1_1_8)
> +		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_1_8],
> +					SPINOR_OP_PP_1_1_8_4B,
> +					SNOR_PROTO_1_1_8);
> +	if (pp_hwcaps & SNOR_HWCAPS_PP_1_8_8)
> +		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_8_8],
> +					SPINOR_OP_PP_1_8_8_4B,
> +					SNOR_PROTO_1_8_8);

Why did you choose to not add support for reads as well?

>   
>   	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
>   		if (erase_mask & BIT(i))

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
