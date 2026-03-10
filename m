Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0418EFCD9F
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+syfHiyK1dj+3UOuE0qUzRW8nXfgz7yEypFxK8wsLR4=; b=PuYkJfHhO/auyH
	gcao9gijvtVBCyxlB5d2YscSvdrHKxO1VLLXXo+s+/Ir66nI/f6DHyErx16U0TxF46nw3pFwutOQT
	BIHyOwbQQUmbgVqAqvZMrfd8jx5LltB/1yVTie0TvkRCZrS8SlTxpAEnXFcvLl8JeFKnNOYInek4I
	0WWipum9FGHVG2xKegEaqOZ7tIAJXcWhRFPAVcWYAGNeh1bK/gZffWm/r9E0MArCYo0i1c73pXJU4
	Yvs3JgyAaNJCpiKgS8BI/cjs8yQh0wAdLnDG72acyAkFpIUtSUjcKkvZVXlEv05FFA8c8Sic2yKTu
	t9ViuAsGqkvZEGIK1XQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztmz-000000098e9-2a91;
	Tue, 10 Mar 2026 09:54:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztmw-000000098dj-3T9c
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 09:54:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-482f454be5bso127375815e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773136445; x=1773741245; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uaM6l1Re0SwCI1I37FqvrdAICNczK52WKIZj/H8uLJU=;
        b=lKNsfQ/eKqmKv9OlZ0S/0BqeCNH01GpE+CQp46Rw8WvJWzbvM9gHlt4qUy0lrXnMtd
         xyae24cnuYK/CBLhkyQFDZqHIi5yqT411gT5molGNIBcB9qfYuhpoTpqnyoDlrtyd8qs
         NHCr8Veguvym4X7hr+lW73ElHma4djB/g6lKTG00lfG2DCalURozpzzk+px8IslWxoaW
         +NFi/m4PcF7Ou96+ex9Sw98C2bETS9mY9Oi7fL4+w4MvUfVPiDelXUnfxGN3sZkRNuLl
         W5UK3WL9iwOHbgyr2Sj8EppkgkMpri8YnA7P2K8Zlat8FL0negr94PHd6cAOuV8Z4XWs
         IDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136445; x=1773741245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uaM6l1Re0SwCI1I37FqvrdAICNczK52WKIZj/H8uLJU=;
        b=G0bOnS8Xvi71iAfzp6z59X2E7Prw+yGvOLoj9YIhnNCGX54fYJXMwC9QOD7L/zGjcl
         6tqsZ56SXxDiQSMJ70p+Ty5pqDrFTR97uDj3tMKrFLrRqASmb4rs7jqJREP0YCIh4+qP
         CpOXyNAbohb7KVOAtVMt1clxLwLKTNtHuXWzXl5o3PWVqiX0ZgylHzwxVWmrE3eT2VAB
         dJ+NWFW3Na66QzIsFOYnWxa28KJOLEchdLNpGZJswEn2n4cb5JowUehx4rcR+Mjvca/v
         hBgUTJ86fScRedDa4NhyHREt5Uj8uzm6rnBNbGqVoN4ijk8CsOweQBSIE+Gk9jL8IrPQ
         iU9w==
X-Forwarded-Encrypted: i=1; AJvYcCXmSbSgK1DOxaRXKjawwUXf+JzcgYQ+N2n8NvQfX0ejlywPOwG4wg7ZACVCqHQCWtcupHMHmLxnufU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw67VY4eBumqXQg/E3CwKGVib08gI9hDSqent5rMNZoIvQ+9AbV
	cknWe7Fiyj0/chZTuQOWx8KryU+XmwNkQ2/X/kCGfJ4liCEv6xC2zr9eR4L4Gg9DS+4=
X-Gm-Gg: ATEYQzy96ScC2VsHGWziJBKs/jnaG3nirLZwBA2cjL2L8IuVFCU4Jj2Lf69/bNXwBVz
	NBce74nFLi6jFG4NuaGscyRyPwWuiDsZM1HNZaUL24EYPB1q02VfCVsbRBCQmYx4bmEori8hTNl
	P+/CveqXzg4k7/FWs5D1otTm4CyyLHfh7+U4nUi3DVoYNXMtllmluhLvk0RbCMmGzJhC0roCKVd
	FW2IWzas67J6iVFoDJzUg71T1ZXxtcIVUpB0vkc7DgA2f4wXDBzZ6SI7uQaVnbyKdfTAtZJCCe7
	Y1hbjwCA2EK64PBq2mnQbwNz9BIEeAip0zozoEtBlN3ItVYn3PVIK0ZLnAfTPImd2FB8Y40LCf2
	5zGM2XaPY2N4/rMt6ZzXYjuDAsTsb8Th3bz3oGzWbXVeXrFR3ZZtiOe0ogoAdj2T3zXY1JHuSNV
	pX8XpUTPIGu0Vg6H+bpajRkBTxwFdiTNE=
X-Received: by 2002:a05:600c:6488:b0:485:38f1:5cec with SMTP id 5b1f17b1804b1-485419c24a8mr40196925e9.7.1773136444886;
        Tue, 10 Mar 2026 02:54:04 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm113391235e9.10.2026.03.10.02.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:54:04 -0700 (PDT)
Message-ID: <230c1e00-25c2-44f7-afa5-a8ccbcf145db@linaro.org>
Date: Tue, 10 Mar 2026 11:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: spi-nor: Rename spi_nor_spimem_check_op()
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Jakub Czapiga <czapiga@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
 <20260108121430.1096844-2-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260108121430.1096844-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_025406_915846_37419339 
X-CRM114-Status: GOOD (  19.27  )
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



On 1/8/26 2:14 PM, Miquel Raynal wrote:
> This helper really is just a little helper for internal purposes, and is
> page operation oriented, despite its name. It has already been misused
> in commit 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support"), so
> rename it to clarify its purpose.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1f2e312feec7..8d91052cc21e 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2345,15 +2345,15 @@ int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
>  }
>  
>  /**
> - * spi_nor_spimem_check_op - check if the operation is supported
> - *                           by controller
> + * spi_nor_spimem_check_page_op - check if a page operation is supported
> + *                                by controller
>   *@nor:        pointer to a 'struct spi_nor'
>   *@op:         pointer to op template to be checked
>   *
>   * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
>   */
> -static int spi_nor_spimem_check_op(struct spi_nor *nor,
> -				   struct spi_mem_op *op)
> +static int spi_nor_spimem_check_page_op(struct spi_nor *nor,
> +					struct spi_mem_op *op)

page is a bit misleading as it can indicate it's used just for page
programs. We need to focus on operations that need address bytes,
reads, pp, page scrub, erase, write/read any register, etc.

Maybe rename it to spi_nor_spimem_check_mem_op?
Or spi_nor_spimem_check_addr_op?

Cheers,
ta
>  {
>  	/*
>  	 * First test with 4 address bytes. The opcode itself might
> @@ -2396,7 +2396,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>  	if (spi_nor_protocol_is_dtr(nor->read_proto))
>  		op.dummy.nbytes *= 2;
>  
> -	return spi_nor_spimem_check_op(nor, &op);
> +	return spi_nor_spimem_check_page_op(nor, &op);
>  }
>  
>  /**
> @@ -2414,7 +2414,7 @@ static int spi_nor_spimem_check_pp(struct spi_nor *nor,
>  
>  	spi_nor_spimem_setup_op(nor, &op, pp->proto);
>  
> -	return spi_nor_spimem_check_op(nor, &op);
> +	return spi_nor_spimem_check_page_op(nor, &op);
>  }
>  
>  /**


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
