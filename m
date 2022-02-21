Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ED8C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50TNgOVm37gje146VcrUNkJLWx9zO20AGwd40AeVPB8=; b=u1O7AsPhFppy5D
	LU9UPhueTvA3VH0KD9TH0AhCLIoYpgiDKnCdzOoKh44UX+ftbQjTRv4OB7up0/8gPOaunvTJxYAlb
	8EG3c4bP97BG9h9Sj1vBJFtAJ3F6H8f1qjWn0U3rM/l2mP5Wu5hg+3rlqd9uyY67Ggy7MLGn34kBk
	X2/WHASLVtpaqPbUOA8m3bD/Oi+mFah80sXzw+wzySyZA+f0B/b+cUAJpb3bet8yCPLneCvmm4SPd
	dMc+DSSzGcf09h+WTy0ZeQ0yacbbruiQApvePVn0lJCZxDPLjQPChsHzyzf6vnSBVzOKPkIbpHTgk
	C+Y3mlzvWt9rfOOFGL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3Jj-0043bR-Gh; Mon, 21 Feb 2022 07:41:07 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3Je-0043Z9-Sv
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 07:41:04 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso14788568pjl.4
 for <linux-mtd@lists.infradead.org>; Sun, 20 Feb 2022 23:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lH8QqqX3ozBsd2B7qQFlTmT4R+1hyoS0GxD0+GxHAm4=;
 b=DPg1FWrVg0L7+dmIhjoxzH5eB5GIwwhIfLT6bdDujNnFXEG22E51P6/iKJN3GQj/Jh
 5klRdTyo5twDSFCq9ATU3iEVpibaxvDvxypyq8RGSv0AgYUW5bhvP2U+6dJAUXeJyn64
 SwPT1kV2/jPzEqSjVbbacPeG39aw/u5hu3IjeiSd8nsV6gOUbX75oH5MJwWH0+ZEerLX
 C2hRmZfxR4/W+ITPp7ieAJDfSWUBGvpvuIXpE/u6qexOUYvEK0IL0JtD0aPcXw5obZM/
 el/L9hExsNDQlaBbtA/nMUrRFd4EylmKhkXQk7+RorH3Lq5EBFZBgCJCN4cwRiLNTErI
 KQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lH8QqqX3ozBsd2B7qQFlTmT4R+1hyoS0GxD0+GxHAm4=;
 b=R/6fsthcnVyMdJw6UOInmQ3Y8mgoNeob1BKY3q9BKWKSI6Mhx0dkKnB13eSO5jGi1c
 HsaOOAiKWfMEiA9aYlWGz3VTvE7bOJMvCgM/cMzooMQbhs3ry6nm9cNzjlmJwJTWzlHC
 pBae74uJpyWbUJlTwEB/WwcRAQVXwFENqxFGCgPllfOFKrQ+R/8IWPSPyLeq8rZKerq6
 cnEWxgr7kfohjRvUFxD5w6b/bjlh25SeDEPNzLWNxldms3O2OEbvBpqJj+/hCHk6fx/K
 B8KZPKB7xWVvbE1OaezBMwJtYB/1HbAlFjiWg5CCVk/3Ux/zM+5Fc6iOCCDOf5QkGjXG
 UkOw==
X-Gm-Message-State: AOAM533h2HyCS1u9//NnfCh4xnOgPXjjxccA+Rct6bCSszBcyieZXojG
 qz+Wi071IUOkC5WgD9KQysm2lPw0+2s=
X-Google-Smtp-Source: ABdhPJwH9UhaiDtcbbxPsD83urvWYcqr9ZvfqfYpuFwIkn/WQ+xa7qCHm35KAYgnborVR7uWDwX6/Q==
X-Received: by 2002:a17:902:e845:b0:14f:9de8:8b43 with SMTP id
 t5-20020a170902e84500b0014f9de88b43mr7293268plg.39.1645429261393; 
 Sun, 20 Feb 2022 23:41:01 -0800 (PST)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 bo5-20020a17090b090500b001b9dc0e399dsm6690493pjb.9.2022.02.20.23.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 23:41:00 -0800 (PST)
Message-ID: <2e40f311-d04a-899b-acef-a8194006d8cf@gmail.com>
Date: Mon, 21 Feb 2022 16:40:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/3] mtd: spi-nor: core: Add helpers to read/write any
 register
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@microchip.com>, p.yadav@ti.com,
 michael@walle.cc, Takahiro.Kuwano@infineon.com
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com, zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw,
 Bacem.Daassi@infineon.com
References: <20220210023334.408926-1-tudor.ambarus@microchip.com>
 <20220210023334.408926-2-tudor.ambarus@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20220210023334.408926-2-tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_234102_977616_465461C8 
X-CRM114-Status: GOOD (  16.92  )
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

On 2/10/2022 11:33 AM, Tudor Ambarus wrote:
> There are manufacturers that use registers indexed by address. Some of
> them support "read/write any register" opcodes. Provide core methods that
> can be used by all manufacturers. SPI NOR controller ops are intentionally
> not supported as we intend to move all the SPI NOR controller drivers
> under the SPI subsystem.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 41 ++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.h |  4 ++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 7d5e3acb0ae7..d394179689e6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -307,6 +307,47 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>  	return nor->controller_ops->write(nor, to, len, buf);
>  }
>  
> +/**
> + * spi_nor_read_reg() - read register to flash memory
> + * @nor:        pointer to 'struct spi_nor'.
> + * @op:		SPI memory operation. op->data.buf must be DMA-able.
> + * @proto:	SPI protocol to use for the register operation.
> + *
> + * Return: zero on success, -errno otherwise
> + */
> +int spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		     enum spi_nor_protocol proto)
> +{
> +	if (!nor->spimem)
> +		return -EOPNOTSUPP;
> +
> +	spi_nor_spimem_setup_op(nor, op, proto);
> +	return spi_nor_spimem_exec_op(nor, op);
> +}
> +
> +/**
> + * spi_nor_write_reg() - write register to flash memory
> + * @nor:        pointer to 'struct spi_nor'
> + * @op:		SPI memory operation. op->data.buf must be DMA-able.
> + * @proto:	SPI protocol to use for the register operation.
> + *
> + * Return: zero on success, -errno otherwise
> + */
> +int spi_nor_write_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		      enum spi_nor_protocol proto)
> +{
> +	int ret;
> +
> +	if (!nor->spimem)
> +		return -EOPNOTSUPP;
> +
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +	spi_nor_spimem_setup_op(nor, op, proto);
> +	return spi_nor_spimem_exec_op(nor, op);
> +}
> +
>  /**
>   * spi_nor_write_enable() - Set write enable latch with Write Enable command.
>   * @nor:	pointer to 'struct spi_nor'.
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index cbfb4fa7647f..c728454b5424 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -578,6 +578,10 @@ ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
>  			  u8 *buf);
>  ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>  			   const u8 *buf);
> +int spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		     enum spi_nor_protocol proto);
> +int spi_nor_write_reg(struct spi_nor *nor, struct spi_mem_op *op,
> +		      enum spi_nor_protocol proto);
>  int spi_nor_erase_sector(struct spi_nor *nor, u32 addr);
>  
>  int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);

Thank you for introducing these helpers.
I revised my S25HL/HS-T series on top of this and confirmed that is
working correctly.

Tested-By: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
