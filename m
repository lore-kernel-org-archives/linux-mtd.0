Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C28C6FD18
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 10:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYHbEVYuAsbs/wKkR7ibAbScFT5iJ2eVIIt76Zmk3kQ=; b=MXJFh2cbIA4P2V
	M5Cu0HWN5AtPv4MgG2YwWsSPKQAj0HJuToGGYmCamPGRiUPJsWLW5jicc5tLXZIiwWHz4VmwA+vYy
	e+E1SpXw3CzpE8CU5VJJ1an9ljxvu/NNT+gGiaZu9hJO9PX3z9e9yI92wFK6aFQku50dof45wtiU1
	ySQwPyUdVvPxC6G980A5Nb0J9czg3uCJHVNN8n7PeDQLEsT8iqFWDznbYSRfWWLuFYoZlF6G0TCQi
	5E3nl98h8AtJHalhXrp5bODyUjD+74R6ZOQFG9jbcze22liGAfuExklOr75pDAV8kWTqvWauG9QoT
	AA2/ZgwPF1fa2icI1EVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBxE-006vMv-2H;
	Fri, 31 Mar 2023 10:25:56 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBxB-006vM0-2d
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 10:25:55 +0000
Received: by mail-ed1-x52c.google.com with SMTP id t10so87536716edd.12
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680258350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhPcZKzZ67n0KKZPj2eL08C3CN1e7cIqv7ArPUwlLgI=;
        b=PJqxBoD3w05ozO6Y92E+86GHvX/eEjYeQz1KTXSVQGSPSm/KnR/kPCWWZbuDQvtTvY
         hZmAgiEkUP3jt8bMdxu1egkrCQLf12IzGSmi/wWnzpsd6LCofVGA0xUu2p/jpmtN31IW
         BKzeY2yYNE0T6PYkUz035ANwXI/SDBBQEufYegWtyepjyBtOgKoalWc1kEIdiPf5ARkW
         Xpe/o9XbIUnQ4MXcEc/lG4aoKPAEb1nUKNo802rbL/mQ9cluKLtkb91BOTF+UfbZugpN
         AW12FlIJskwa1RI/XH3TCTl8EWK1VinMilRsIRTMzEL7eVCZE34SyYO6pdtFvfqA+q0u
         RgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680258350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhPcZKzZ67n0KKZPj2eL08C3CN1e7cIqv7ArPUwlLgI=;
        b=4j7KYVuQcvftE3McsJ2Z9hKw/hoOHOAGMA44M43cEB7BbH5uYvKRI74PzWpZYzmts/
         gmf/J73fzLtxqsonJ/JI2GtKkXQ8kEPtaX2r0v4K5BMDntCoWwxtE7sryD8GD5n7J0rK
         HqyxZ7AeJjImdcFL8tf1GV9YjUmsihUQlUB7s0YaYO/3AOQ+Y9E/CUN15VDgAKFFl3o8
         CYWTIeaxjVYVmwZoLKzDAlfluJ2WQpf0xiI8T5okZxq0Qyljs7eIE3IyL40I356AmE1V
         PngavO4helop3ja4+GCRTFawvgC2HRWXxd73ujqDFGHPiAiRSgJcoXuUrELbdWe+DEZY
         2lFg==
X-Gm-Message-State: AAQBX9c1eKe4hNFkbc+Nz2kgpLfb0JhZI/UtpJY8P6FXsgZFH6fVlbDD
	dqfKykUdkstM3xLq4qvvVX5z5g==
X-Google-Smtp-Source: AKy350YJ4LYzUCv0idOQuBjabxmUfZDfksq/Q4sYfdAXRSpDGqKkm4QdotupyiZSnUq/XKQdu6bMgA==
X-Received: by 2002:aa7:c98b:0:b0:4fe:9374:30d0 with SMTP id c11-20020aa7c98b000000b004fe937430d0mr23651301edt.39.1680258350095;
        Fri, 31 Mar 2023 03:25:50 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id bx20-20020a0564020b5400b004ac54d4da22sm860205edb.71.2023.03.31.03.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:25:49 -0700 (PDT)
Message-ID: <6713b89a-a031-8f32-3de2-12643a8976e1@linaro.org>
Date: Fri, 31 Mar 2023 11:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] mtd: spi-nor: sst: Unlock addition for sst26vf016
Content-Language: en-US
To: nicolas.ferre@microchip.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Cc: Varshini Rajendran <varshini.rajendran@microchip.com>,
 alexandre.belloni@bootlin.com, linux-mtd@lists.infradead.org,
 Guillaume Socquet <guillaume.socquet@microchip.com>
References: <20230331095549.16393-1-nicolas.ferre@microchip.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230331095549.16393-1-nicolas.ferre@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_032553_881455_8BB331B2 
X-CRM114-Status: GOOD (  19.91  )
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

Hi, Nicolas,

On 3/31/23 10:55, nicolas.ferre@microchip.com wrote:
> From: Guillaume Socquet <guillaume.socquet@microchip.com>
> 
> Modify sst26vf016 flash_info struct so when such device is detected by
> the driver it may be unlocked for write operation as sst26vf064.
> 
> Signed-off-by: Guillaume Socquet <guillaume.socquet@microchip.com>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>  drivers/mtd/spi-nor/sst.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 63bcc97bf978..99c8a19493f5 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -110,7 +110,9 @@ static const struct flash_info sst_nor_parts[] = {
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
>  	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
> -		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ)

If I remember correctly this flash has SFDP support. If so, we may be
able to get rid of the "NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ)". You
can check whether the flash defines the SFDP tables or not by dumping
the sfdp sysfs entry. Check the link from below on how to do that.

Also the sector size and nsectors should be superfluous if the SFDP
tables are present.

> +		.fixups = &sst26vf_nor_fixups },
So I'd try:

{ "sst26vf016b", INFO(0xbf2641, 0, 0, 0)
		PARSE_SFDP
		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
		.fixups = &sst26vf_nor_fixups },

We ask people that update or add new flash entries to do an erase,
verify erase, write, read back and compare test. Also to dump the sysfs
entries. Here's how to do that:

https://lore.kernel.org/lkml/97a3b023-b9bc-c34d-45a4-ddd56f47bd76@microchip.com/T/

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
