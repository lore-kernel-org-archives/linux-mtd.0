Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16D5CF319D
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fiGCmE/nAQ2/NUaAy4n2jLOaAfY1nylL20yLoOAOfJA=; b=oxq1dVTQ6bVE+V
	YNXpBdeRSPFjKHl0mBzbaoc4W71hC9G/4H+0zV2bEzFYZC/S/9jr3NyiFJnDpAubAxgqTQNCwSz2S
	s9evWTuRs/T0sHv3tg62VM35jvmYdawrLiQEKyJbLrLs0lgPCpDldMUwWX2EloICsSbnKg8f4SW8K
	XTlz1ENhtq5zS0h/fuZpqfqXqfBT1gxL/Fcra8oF13pQNdJlojHwga50LVVBYUJt6q9PIehg3ciZg
	1F8JTMsKPkgMQ1belJiizDpBp7Ost9BE2FgtkoU7WlcDYCE+v9wdfZtPZoyHdAJHMTQVKBpvZVl4A
	To/dwyTsFV897RcKC9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svtbA-000000050hI-46Ra;
	Wed, 02 Oct 2024 07:16:36 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svtb7-000000050gX-1yYH
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 07:16:35 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-37cc60c9838so283654f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2024 00:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727853391; x=1728458191; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EwkM9xMdO6YNpUr10aG6HmysdgamH0iEBubPoE0QAjw=;
        b=lHVkSoIHdypLGni4rz4XnQ5eUjCwzQ2Jj2Rrp5R4bGq17Cs6jUn7A3QsCslC68l+By
         hwJsRXuspUknIt83gU2z7fLvnoenlOWBwhC9VXjWa1QcXUZZe3PzVChoR6Hn3Vk+F9m9
         Q1zu4jqi/ehU7I8IzDAgGAUNiH3b+OwnY8c+KDr7vrNyRbK5I7qo8y5KcHySkWrrKqqx
         RAhe0IvVwsYtt6KUzBqNl/nw9RBNBNXXvVW+FovdxhGZDJPXpYE9WSKqLMXDaB4G/JXN
         x4HvHqdoggVSj2PE5brBO3y6Aq8VTej2fjdx4qptsFUK08j2HDDTnWgncn3PYzIrC/8a
         13sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727853391; x=1728458191;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwkM9xMdO6YNpUr10aG6HmysdgamH0iEBubPoE0QAjw=;
        b=QfosSKgJ+YHzdlIX7Sdd2i7oyxafL40odyKzdFvsfNOWX+aDM1vr5jkAr35v4eNRYk
         ZYL9/FBHn8o4Ay62PnypkS9i9KanhNFSJt68j0uRDRMsv8Upr8n9w6z+ZjN1QDYK5gjU
         YvF95ENS5ph10Q7AHJnLXc9vh/Ov7kRV4Jnb9LE/72R3xddHJ21SrtMbg8Wk8LDXiXtY
         yfV37twi3/y9KwDTV/B4941EMMlr1amM/Tg90ZN/zY3gJ0/T1oKBBLcFlb7eD6ywWsyS
         UvpeJr3riV0fSWSKedjoKX86+APlYKBcDwlRHWwhQD2If1PKLJJFMSNuCF+nqrUZgL6L
         /wzA==
X-Forwarded-Encrypted: i=1; AJvYcCWgvTW6BgJa41eDrjdMhrdZyw16Q8WHFdVcA1nL2IolwqcIDvGG9h/RLSZby9KZxI6MipfqqKgwYjQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yys11yGobW9GnTvzoSkBp0Mb0kdLbC7bDXzm0cviv9R3/0lU3YM
	8tELHHVK7f/PcPgkS/H+YCzVz4kYFe1VkR3pxskzIUr3DQhcMjArmva3q58kpwY=
X-Google-Smtp-Source: AGHT+IHhMja+RznaA2PmsCPeItzGZVOftxTsWc3L0eheoPujf3oCzA5nRin1fHFVNYt9yQ5nwMxKlg==
X-Received: by 2002:adf:e44c:0:b0:371:8685:84c with SMTP id ffacd0b85a97d-37cfb9ddc04mr1183978f8f.15.1727853390994;
        Wed, 02 Oct 2024 00:16:30 -0700 (PDT)
Received: from [10.11.12.174] ([82.76.204.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6587sm13300708f8f.47.2024.10.02.00.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 00:16:30 -0700 (PDT)
Message-ID: <28ac1c39-5592-4e5c-8fce-53489e0135ee@linaro.org>
Date: Wed, 2 Oct 2024 10:16:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/6] mtd: spi-nor: add Octal DTR support for Macronix
 flash
To: AlvinZhou <alvinzhou.tw@gmail.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org
Cc: chengminglin@mxic.com.tw, leoyu@mxic.com.tw,
 AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
 <20240926141956.2386374-2-alvinzhou.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20240926141956.2386374-2-alvinzhou.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_001633_558580_6FB44E7C 
X-CRM114-Status: GOOD (  26.69  )
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



On 26.09.2024 17:19, AlvinZhou wrote:
> From: AlvinZhou <alvinzhou@mxic.com.tw>
> 
> Create Macronix specify method for enable Octal DTR mode and
> set 20 dummy cycles to allow running at the maximum supported
> frequency for Macronix Octal flash.
> 
> Use number of dummy cycles which is parse by SFDP then convert
> it to bit pattern and set in CR2 register.
> Set CR2 register for enable octal DTR mode.
> 
> Use Read ID to confirm that enabling/disabling octal DTR mode
> was successful.
> 
> Macronix ID format is A-A-B-B-C-C in octal DTR mode.
> To ensure the successful enablement of octal DTR mode, confirm
> that the 6-byte data is entirely correct.
> 
> Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 91 ++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index ea6be95e75a5..f039819a5252 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,24 @@
>  
>  #include "core.h"
>  
> +#define MXIC_NOR_OP_RD_CR2	0x71		/* Read configuration register 2 opcode */
> +#define MXIC_NOR_OP_WR_CR2	0x72		/* Write configuration register 2 opcode */
> +#define MXIC_NOR_ADDR_CR2_MODE	0x00000000	/* CR2 address for setting spi/sopi/dopi mode */
> +#define MXIC_NOR_ADDR_CR2_DC	0x00000300	/* CR2 address for setting dummy cycles */
> +#define MXIC_NOR_REG_DOPI_EN	0x2		/* Enable Octal DTR */
> +#define MXIC_NOR_REG_SPI_EN	0x0		/* Enable SPI */
> +
> +/* Convert dummy cycles to bit pattern */
> +#define MXIC_NOR_REG_DC(p) \
> +	((20 - (p)) >> 1)

This is unfortunate as we convert dummy cycles to bytes in mtd and then
we convert back from bytes to cycles in spi. I had an attempt fixing
this in the past, but couldn't allocate more time for spinning another
version for the patch set.

I won't block the patch set for this, but if someone cares to fix it,
would be great to take over.

> +
> +/* Macronix write CR2 operations */

I'll drop this comment when applying, as I can already see what the
macro is doing from its name.

> +#define MXIC_NOR_WR_CR2(addr, ndata, buf)			\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(MXIC_NOR_OP_WR_CR2, 0),	\
> +		   SPI_MEM_OP_ADDR(4, addr, 0),			\
> +		   SPI_MEM_OP_NO_DUMMY,				\
> +		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
> +
>  static int
>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>  			    const struct sfdp_parameter_header *bfpt_header,
> @@ -185,6 +203,78 @@ static const struct flash_info macronix_nor_parts[] = {
>  	}
>  };
>  
> +static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
> +{
> +	struct spi_mem_op op;
> +	u8 *buf = nor->bouncebuf, i;
> +	int ret;
> +
> +	/* Use dummy cycles which is parse by SFDP and convert to bit pattern. */
> +	buf[0] = MXIC_NOR_REG_DC(nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].num_wait_states);
> +	op = (struct spi_mem_op)MXIC_NOR_WR_CR2(MXIC_NOR_ADDR_CR2_DC, 1, buf);
> +	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	/* Set the octal and DTR enable bits. */
> +	buf[0] = MXIC_NOR_REG_DOPI_EN;
> +	op = (struct spi_mem_op)MXIC_NOR_WR_CR2(MXIC_NOR_ADDR_CR2_MODE, 1, buf);
> +	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	/* Read flash ID to make sure the switch was successful. */
> +	ret = spi_nor_read_id(nor, 4, 4, buf, SNOR_PROTO_8_8_8_DTR);

can we use nor->addr_nbytes for the second argument? Please test and
confirm. No need to resend for this, just confirm and I can amend when
applying.

What about the third argument, the number of dummy nbytes. Can we get
the cycles needed for READID from somewhere in SFDP?

Looks good.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
