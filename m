Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0C5C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDywEmY5C6sfg62d+oFyDBH28M5DT/KQAqn+oc3gVKE=; b=GLyBBQpHwbw0Ra
	s2Hqmjl6Zn4tTyJ0fjuoYE6Cob2B1gAmgXVg0JVq9fvwAlh0oStVq7GKmhpiX/dgP4zGhF7K0E02a
	2tVl4KqMke/YtP8G9aoRRKizXyaSsHWTZ4JyEr+/J1CFRlbK86AHX9zncCxMvKF5To+NYxTj6Di2/
	0QStFnKAOq21X68SxCEKvRh+xfVo/Ogz6n7zVjaTX1rOWT3VN1J3wSBusB0aBln1dNgScpOp4ZKjF
	QCpOhA2HAYjZolokY3Jz4aVQP4hVYk+vjkOMVLqd96ppnB/x/kdqefWykprGHO/HCbApRxJi9LqAH
	RB6lvAKxoK7N0EmzL9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNClb-0000000E3Fe-2u6A;
	Fri, 28 Jun 2024 14:39:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNClY-0000000E3EE-24df
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 14:39:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-424ad991cbbso6005655e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2024 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719585594; x=1720190394; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5fX1MMnIpDBOm77iDLoe1RG1qLzLS5Do9mpyDQwOVT4=;
        b=IGLTNp76T8ZGnucGZCIg/n5jmT81Fp8WBY1x8hJqaMqpO1LxyeK6SJ7xN4Hqchz4/l
         +IgyY+KF78w/PgjRpi/WPqSpNsvLHwLg1aK/mYPKug7gE/uDN480PbpLNc/v2BHYKnNz
         3fLf2RtTL0KZSCzx+P+1sGUX16/MXPgKEM8389srsQpSbvlid/6BGiN5KEOui+MUNhzT
         +t1y1PHadhDBsFIGQkVdvH1jYTjKjVkLQGw/7G0nST0kHpP/XVtdslkbYyxazMl/qN4R
         da2J11bjTZomBBuHB3IpHfNMNrra0b1G83ES3mK6Yw5Y3xeDVGnz4EswS9qs7gObrQcA
         CX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719585594; x=1720190394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fX1MMnIpDBOm77iDLoe1RG1qLzLS5Do9mpyDQwOVT4=;
        b=SU+Svc5HiIC2LwtYy4l2asG6jJNY00HY6jonHPK4TK7aWzU9r71exVf/Dneb5FvXWQ
         po8RN4ydMnPMkDC9Q7icFkTuu5toDCRV7DPtcuaBcJOul6zI+HXOm1Q6ANEVeL3ifAaX
         0Fqxx427bLnviLIsoyNVwaEYSD8z/sMhOY2XARNZBxtHcUyGoiU4onviDhjWCdB98Gye
         dDTgZB84h75DJSMXTxW7+dYgOYPLSVq/w+K1lwwLMEN0ui/xVg4rn5UVOyS359OpQyVY
         sywTgluZ2OuYMJ27ja2FDZlrET1VuqZecMczkJEZvUIyFMtb7tZTaL4p5doKisR2zPq8
         QOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsAfQQI60thtTpAL9sTPynh0ku0lnOfP9xs9L+fLZpJULTRMujwt5zkqyBxoH01OidDUfDUqQSEkgk+JQqB0o8LHNtbjHdNvfnN05zQQ==
X-Gm-Message-State: AOJu0YzalwPikGmCLwVNuhs/CXq1asPS0AbhMQzjyYCFAeLWEyHvjz34
	gGSXGDG6woC2LYw32/KCdKRT/huNjtAGVc+QVDlmqIkTssDd9src7nL8NSXnYwhxabBf2XLdnpf
	Fuio=
X-Google-Smtp-Source: AGHT+IFiwW/g9bMvX363nZWYpupjIfTEXXcoSHzUKGy6GKc+YaQcE+dP2/YqcheNmOHdUbTm/7lcFw==
X-Received: by 2002:a05:600c:4da1:b0:425:65c5:9af4 with SMTP id 5b1f17b1804b1-42565c59c70mr28348295e9.41.1719585594358;
        Fri, 28 Jun 2024 07:39:54 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b061006sm37150835e9.22.2024.06.28.07.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 07:39:53 -0700 (PDT)
Message-ID: <aa4df0e5-bbd4-46f7-8e58-b42a8c909327@linaro.org>
Date: Fri, 28 Jun 2024 15:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Add generic functions for accessing the SPI-NOR chip.
To: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Erez Geva <ErezGeva2@gmail.com>
References: <20240628140328.279792-1-erezgeva@nwtime.org>
 <20240628140328.279792-2-erezgeva@nwtime.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240628140328.279792-2-erezgeva@nwtime.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_073956_724564_C658FB47 
X-CRM114-Status: GOOD (  16.01  )
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

Hi, Erez,

On 6/28/24 3:03 PM, Erez Geva wrote:
> From: Erez Geva <ErezGeva2@gmail.com>
> 
> Functions:
> 
>  - Send a opcode
> 
>  - Read a register
> 
>  - Write a register
> 

Please describe your changes. You may want to re-read:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#submitting-patches-the-essential-guide-to-getting-your-code-into-the-kernel

> Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
> ---
>  drivers/mtd/spi-nor/core.c | 130 +++++++++++++++++++++++++++----------
>  drivers/mtd/spi-nor/core.h |  27 +-------
>  2 files changed, 99 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 028514c6996f..0f267da339a4 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -354,53 +354,134 @@ int spi_nor_write_any_volatile_reg(struct spi_nor *nor, struct spi_mem_op *op,
>  }
>  
>  /**
> - * spi_nor_write_enable() - Set write enable latch with Write Enable command.
> + * _nor_send_cmd() - Send instruction without address or data to the chip.
>   * @nor:	pointer to 'struct spi_nor'.
> + * @opcode:	Command to send
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -int spi_nor_write_enable(struct spi_nor *nor)
> +static inline int _nor_send_cmd(struct spi_nor *nor, u8 opcode)

and my review stops here. Why did you think it is good to introduce a
_nor* method and not an spi_nor* one?

I'm not going to review the rest of the patches. Please send a v2 that
convinces me to spend more than 2 minutes on it.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
