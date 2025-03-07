Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEFDC28B23
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wd+D/0GD/Cs0ya7S0GtprhipBJ8wAK0hARTaJBZEG5E=; b=iTHeJC73s6gKyS
	XIJ8N+EO6O1Gb/6jcgyVCo1h1vgCQ3R8/AfF+60VUWtHEBjek5N7CRvN+MkDzQNUJeeQesL/HmEGd
	8lT7zn6uv6/fSpCvG04KNKHKLGibZIV/xScpY/2kdxcvAv9DxQStM0IvZ7E1CKA6Qj1zmAR9/Eq9j
	r+bEMXh86ulM+8dIW/MA3rq8Rmis6/dyEPAA+aqiEhTdgnYiG0omSDGtzv4xdXXI/gKPdfwsnDLRy
	tyt9m1Q0hJ9c0q0sh6yGx20waN6ugkF9EoJQKsr5BiM0V0BM7H0vEv4bN0MFyHKvJ4Y4eopV+HX+F
	FGxiCmIabKCb8ptv1KRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZuC-0000000EkZe-3PaB;
	Fri, 07 Mar 2025 15:46:32 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZmk-0000000EiNT-0NW3
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 15:38:51 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac0cc83e9adso625005166b.0
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 07:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741361928; x=1741966728; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42vX3c5eYK6+PT3iK03vkSK6URE9IJeYdbtn09gB3H8=;
        b=HasE02gyiQ2CVH3FHgUxMy/iHvagmmzyDVxnlj7SRpl3QYpXOLe5Dwh8KBjOQI6JbY
         EwqAiihAeWzumQfPWw66m/+XnCTY2IlseauK7VwyZueh9IZJDd/IjThy8mHQ6YpRZLwr
         xvs3+mbPSh9sTTgEHsdw7fPBnQYUr+U+W4xCNzMT5EyntCGJ1xrErkRHgUjPK3JiCKzu
         Ot/wuz/xz/fLzlwMdrC75qFy7VEuiW2D1GNmR1QJ8H3reqbydq/ZuYvrWSO8jvPbABBV
         k/4RtqBUzvDh4tiFbcbaPrWzPj6v6ReHmrqM/UdwLv9VQ3y/ndcsMJNUCWVtamYuklUx
         UnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741361928; x=1741966728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42vX3c5eYK6+PT3iK03vkSK6URE9IJeYdbtn09gB3H8=;
        b=kuAiuWia6jnOiUpMpl8izh9/TgafclxXYa4Cd/4DlWW3hgR89NKJloL6wfD0jLpYVO
         2JruC4oSOBYbg9dvHl6/xZt7kko/8bhhb1acpOvbc9YY7oVrv/1AYncL0tnAqkG67gn0
         +HvyJy5qw64hMYhVgJ5n0DxORlF8HOme6F5bucyj8lWZXRgFq+LId+LsebDsp5IpHzjs
         xWhSwrauJ4wf0eWJ/zZm6KSDglq0b9/KIhFGBJOUzqnEAVzW0WcQxLGhfhWZX8+hcp1Z
         l6vB56OXmsqchkADNZzro9yH5IiEyDqDevQzCV5a3/hebaR7T3ano90RY8QakGslYdKJ
         4rYA==
X-Forwarded-Encrypted: i=1; AJvYcCV5K1mLS/nQqvpXY++UVSWnZ5oJMLU8NYjDsCYwRca/rK8NeJ0tVHH1bI8MVQe1BuKmRt6qPUbhIUg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzF6367Zp5JToHGbcAhBqsHrKuAnfBW0kZmKsjDOLHpTGA1EFCT
	jx746IvdZsF2mgxhLHwykRVPcyu7tRQzqbE6c/prHCjoCLGX3GobneIr7wGyOeQ=
X-Gm-Gg: ASbGncuvIJT6AMQcr54tYKM7E8mNC6hRNy0xFRrxm8Q7424WHBLdfTlgVXcbjvURlen
	0zJn+wjSmcZHn9TxOsqBmkkF/t81FxSho4qsLyCK+5Gtu8LW+kw0wj6ZOY9tgPiphJqY0wQWTiw
	axz5nUsauOhNYfPReMQVN2V71/vQeAxVCURLJNkgiWaQMznRTGa0iqQnsWtOC4GduulcJEqReXT
	t4anzFdiVHkI8oHhjh0wd+yfE1rMPRjTlixMdIjRh4ieQBoB4jvAoO56gD9/VsPtNpNy6Sc5wR0
	VSJ5oTpE2Dwr9CyPHBFL2yA0gKMdvrbhTm7/Agh1FLWM77OgcskG4Q==
X-Google-Smtp-Source: AGHT+IFl1WF2/BmG5TpHqJMFXAy3oe958ZC0g+bU1yWwbSxiPj/UEP5KIcg9WYGq23IB0sHLCiTQ7Q==
X-Received: by 2002:a17:907:7293:b0:ac1:ecb0:ca98 with SMTP id a640c23a62f3a-ac22cd6e4ecmr937582966b.26.1741361927638;
        Fri, 07 Mar 2025 07:38:47 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943883csm295717866b.12.2025.03.07.07.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 07:38:47 -0800 (PST)
Message-ID: <9004166e-5535-4024-8114-9fdb217407bb@linaro.org>
Date: Fri, 7 Mar 2025 15:38:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] mtd: spinand: Use more specific naming for the
 reset op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-1-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-1-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_073850_151306_1A2A313F 
X-CRM114-Status: GOOD (  19.40  )
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



On 3/7/25 3:08 PM, Miquel Raynal wrote:
> SPI operations have been initially described through macros implicitly
> implying the use of a single SPI SDR bus. Macros for supporting dual and
> quad I/O transfers have been added on top, generally inspired by vendor
> vendor naming, followed by DTR operations. Soon we might see octal
> and even octal DTR operations as well (including the opcode byte).
> 
> Let's clarify what the macro really means by describing the expected bus
> topology in the reset macro name.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/spi/core.c | 2 +-
>  include/linux/mtd/spinand.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 7a578f3522be93d30a9132cf01831515db77ae38..ea6b48242ad4a4e51c713907ce5cc55022cdb569 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -586,7 +586,7 @@ static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
>  
>  static int spinand_reset_op(struct spinand_device *spinand)
>  {
> -	struct spi_mem_op op = SPINAND_RESET_OP;
> +	struct spi_mem_op op = SPINAND_RESET_1S_0_0_OP;
>  	int ret;
>  
>  	ret = spi_mem_exec_op(spinand->spimem, &op);
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 0da8a1c7740ef5cbbdb2a74858465136638224f4..4f47adbe4566d7813ffd8fbfaddd1a85d88d0208 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -20,7 +20,7 @@
>   * Standard SPI NAND flash operations
>   */
>  
> -#define SPINAND_RESET_OP						\
> +#define SPINAND_RESET_1S_0_0_OP						\
Hi, Miquel,

Have you seen any reset op with address or data? If not, I'm not really
sure whether we shall change the name for these basic operations.

Changing them to 1S-0-0 may also indicate that there are resets with
address or data fields, which I find confusing.

I think the change is good for reads and writes. I'll check further in
the series and let you know.

Cheers,
ta


>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0xff, 1),				\
>  		   SPI_MEM_OP_NO_ADDR,					\
>  		   SPI_MEM_OP_NO_DUMMY,					\
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
