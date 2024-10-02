Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADCBCF3199
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMzG7RsKnjDdpdIvCrHah+MTz23wOeRtBpuG+YdLFXg=; b=WiLDNxpcjO8nzN
	d3y5gvSSDIDq2eviUTxUA0gvzMeA0XPsCe+iaWReJ0f0l+rBcTnNHIFtyQtlr4tLtE5Z+VUnYs3nc
	NxjevSIHdmNPcO13GvolF1l0L2aqHXBnfIObDOIpzeRxF49znA6j8VFofgvxdn7OPuC9HBYkRKGgs
	iehrZw+0rKTbnhWtzUkX2lhtoCvYrn/nxa6LuYbbOwFiQdHZn7Hx0iH1RfWuCKaoPxqxcqrsFIjtB
	GLO1u39bsoUYfSeYZztg+pragK4GmPzUbbVRK1y44ZsKD8Ps4pP0iPBL8m5GRAlJa5TDZajGh6Bo2
	0STcMNkcjkLJg6RMT+tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svu2w-000000053fN-1tkg;
	Wed, 02 Oct 2024 07:45:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svu2t-000000053ed-2EIJ
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 07:45:17 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a8d4093722bso945066466b.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2024 00:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727855114; x=1728459914; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FNRdu4560cxyW4H48SPNRuOsXYe3wo5Kz8Tevusjh/Q=;
        b=PedlS/1/zQzhKNBePIjQyQyzswOBhcRRJkBrYknkGKE9+PmnEtLAxt9OWhyh4z5epe
         j42yVaQPSwqmge4Aqn/zZx3EcQsR5Ap+b4SyQDhoFkAnNC/3WCUKBjAVKwSLDVuXVgkf
         vtorhRk/rDB+YVm8BmRbxX8m6HMz3WgOt/wybEhA8DdnoxRNx8CEDTlv3bz9HMDxUbtY
         bEcf2Q9+wFSnFLw7YGm1GTt/LvTyfuI8/wfpmrZzoy23/2/kb6OGR/O5UKrJLTg9lbKy
         qyYLNcMwDbMdBelsnDirpREOEhsVbJwOfPVPegMJ+vKPy9cEUGAddHzT0bm2wTHAU1Bo
         U02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727855114; x=1728459914;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNRdu4560cxyW4H48SPNRuOsXYe3wo5Kz8Tevusjh/Q=;
        b=lx6u4CVRkwds8rVFhcVUtQKipgPXIJ2MROnMrxigov8o2y7uEfc74hGXr0PgXITXL7
         naEnlvEr3eqelpsw4OQ9stFEkwBPe29Aer31AW2KVAxiUEPGExQ3qsNWaE8j99WApybr
         n7YS6d1VlW94tLXtFC1z35BD37LMK5oC6kNW7Ka0wUngyi+KRmEc8x/RdzTTFzTcpTiE
         1STzYHo2+YEfgGxX178WZV41hVH0h0QuoNEWf6SpZXapgImQYP1yUaibWploCnwa2t3f
         1loQwWjJ0ahXJEal7LQn3R1RSB390hVWADnYMnaoWhk9LH75PL6dwg74RQrBDRXOsAYK
         5xRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnVdwpsXmgjHFGzKXpjnHwmuEtdAc1NZExhLOSH0+dsZUCpVOvevK+s3A8gS6QKjDZzMHH+/v99Nk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGBLUysOGWtgsnHKW7Fm4R11pfKgc8q7MOaVaYAxFr3c8f7+vo
	8YQN9dIsPMXMtwPXcoLD8yxI3wWIHiAaZ6O3aKEFjEllh0A2f5v/OUS7fmIJywA=
X-Google-Smtp-Source: AGHT+IHVRBvw4u/Hgc+95QlfN8nSdnQa/vKgvNfz2NepqXg9A9A3Xuj0DuZM4kdWAhwKx81HVNgdGA==
X-Received: by 2002:a17:907:97c4:b0:a93:d6dc:d047 with SMTP id a640c23a62f3a-a98f836ee86mr222771766b.49.1727855113507;
        Wed, 02 Oct 2024 00:45:13 -0700 (PDT)
Received: from [10.11.12.174] ([82.76.204.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c59bdsm815585666b.50.2024.10.02.00.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 00:45:13 -0700 (PDT)
Message-ID: <5e7e0aa4-74b0-4262-8e8b-de86be54f0bc@linaro.org>
Date: Wed, 2 Oct 2024 10:45:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/6] mtd: spi-nor: add support for Macronix Octal
 flash
To: AlvinZhou <alvinzhou.tw@gmail.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org
Cc: chengminglin@mxic.com.tw, leoyu@mxic.com.tw,
 AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
 <20240926141956.2386374-7-alvinzhou.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20240926141956.2386374-7-alvinzhou.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_004515_633730_CA051FAD 
X-CRM114-Status: GOOD (  20.08  )
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
> Adding manufacturer ID 0xC2 at the end of ID table
> to allow manufacturer fixup to be applied for any
> Macronix flashes instead of needing to list each
> flash ID in the ID table.
> 
> Such as macronix_nor_set_octal_dtr function in the
> manufacturer fixup can be applied to any Macronix
> Octal Flashes without the need to add the specific
> ID in the ID table.
> 
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index f039819a5252..1a8ccebdfe0e 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -200,7 +200,9 @@ static const struct flash_info macronix_nor_parts[] = {
>  		.name = "mx25l3255e",
>  		.size = SZ_4M,
>  		.no_sfdp_flags = SECT_4K,
> -	}
> +	},
> +	/* Need the manufacturer fixups, Keep this last */

you have a capital letter in the middle of the sentence.

I'll replace the comment with:

/*

 * This spares us of adding new flash entries for flashes that can be
 * initialized solely based on the SFDP data, but still need the
 * manufacturer hooks to set parameters that can't be discovered at SFDP
 * parsing time.
 */

Which brings me to why you really set this. I remember SFDP contains
tables with sequence of commands for enabling/disabling Octal DTR mode.
Would you please remember me, why you didn't use those SFDP tables and
implemented your own enable/disable methods?

> +	{ .id = SNOR_ID(0xc2) }
>  };
>  
>  static int macronix_nor_octal_dtr_en(struct spi_nor *nor)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
