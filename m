Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF92CF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1EZBOXkuRTN/KkKTEVZKiOnbOeRl9IKlyKSQZxGUzM=; b=qQ3v5ehd1F235T
	R828l7pk6ufWFTG9zhCSlRJMWQEEyEn+woN2S9eG6ORDnJ2z7J6GL4MtVWp9Ndyq7WjtnBg4TruOg
	EnEQslwtHVMxn/hOCfYz9qTyv+eTUr4bAWQFTGkqPxmua2mQFejbkUii3eEw/CuZ90vNxYyV+GD8s
	aWXTw9QQZMqMfjFiTsJEbauWjnsDd/vuoUT7oO4bjGYXfFCCnp6Al8O+O58tbguHIJ2vZYwOxUF0X
	WTdReWPr2oATuXCkiJ01JCHtjSIasgUBvS+BvDZNGvS+u6L+HXLLx7UZ3hUnG+yn7mpkuY22NX2kB
	RRvpW9X7xdYw/1WWgH7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssd1g-0000000GTQd-0pud;
	Mon, 23 Sep 2024 06:58:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sscxN-0000000GSRH-0ZQR
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 06:54:02 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-378f90ad32dso2398275f8f.0
        for <linux-mtd@lists.infradead.org>; Sun, 22 Sep 2024 23:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727074439; x=1727679239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0IrKYwdcplB4PqG5MUDB7kDHEBg4+7QsR9hwNRsCDwA=;
        b=qKBm+r3U4YURgxoSZ6GBLdB2R1VTjqPhZUJ7mM6cZQ85ExKDXNzW+IX8abcu476K/b
         +z0nozwLdDS9Xlzwu2Oxxk60/1q9P1fZRi3PF7MFI8plbuClm7feoT8XRegDDvd+YoyU
         g/ElioCpoYkPGqyLoKhOSjZSUgJ3lKt4E7F4lcOZOrq0NNDV6sHrqQG9rZEWDcRinbil
         SpTAyvgc0mBoLhBRUYvpN8xswRvz+RqZis0yw1v684n5oVkOC4usXrQjXQST2nHrM15J
         RoEil53zmcVw5LOftyb6vykDRK/i+B4D4hi3cQulQeY74z+rGHXp2eVGp/pzhuw6hRif
         t48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727074439; x=1727679239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0IrKYwdcplB4PqG5MUDB7kDHEBg4+7QsR9hwNRsCDwA=;
        b=rsrR8mXcj0jqaJXgck6To4EWwXFIHGk9WLexV0VoFwI2KFg6QHz2fdt8LRfsgaMtO1
         XyTwJM+hQNxwRc9RzEFgCpbtjmUxEpZMLPq67jGqCpFS2zwgtAJV5sJzlzMFVaqwd1dP
         zPZCxBJucpdF+vYGE5Dn1QaOyYy67dyfdu1lwbgG9Xt2/J5RXy0BcGBupXllQ4EhBTNj
         vdQI7QWrpqyKiwjI26gQayS+TepvaMAf2gMQ4KjQCNyrEqQZjiVQqxrq0I5x+M3NpkkK
         utjSobBy18Szdot3K9zIeR6P6HUsh6t2ic9/AnbEAdUSbr36rpoICyS2t4KsSFG7lmJT
         3p2A==
X-Forwarded-Encrypted: i=1; AJvYcCUEKvS431aLLAtqFdfpoGB4H9Pc/cF0CXh44a4KBaKlYOsECrXFtQnneqos4ayOaHjqvYYYQHLpTHU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBU/FDQF8xTLZo0dm+7KD4vQO3/uy1d32cudM95srjI/qplHtN
	/6vmHz0SDc3QdiepwndjKkIlYp/R0DGjGExbfTFcRvoSwJJLCn3XTbgkJSCfKLg=
X-Google-Smtp-Source: AGHT+IEaPMxTl8BZwywGoBhw6tY+/KStLZzFF7wxzFciOYoL1eb6lQA+E2sOa2JobaYCp65dgoUFgA==
X-Received: by 2002:a5d:4f0e:0:b0:374:bf97:ba10 with SMTP id ffacd0b85a97d-37a43154b16mr5364814f8f.25.1727074439272;
        Sun, 22 Sep 2024 23:53:59 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e72e49bfsm23626562f8f.21.2024.09.22.23.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 23:53:58 -0700 (PDT)
Message-ID: <97134efb-398d-4c21-a915-87a5b4f1b29a@linaro.org>
Date: Mon, 23 Sep 2024 07:53:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] mtd: spi-nor: add support for Macronix Octal flash
To: AlvinZhou <alvinzhou.tw@gmail.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org
Cc: chengminglin@mxic.com.tw, leoyu@mxic.com.tw,
 AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>,
 Bough Chen <haibo.chen@nxp.com>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-7-alvinzhou.tw@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240718034614.484018-7-alvinzhou.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_235401_213897_856FDC04 
X-CRM114-Status: GOOD (  17.01  )
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

Hi, Alvin,

I quickly skimmed over the previous 5 patches and they are looking fine.

I don't get this patch however.

On 7/18/24 4:46 AM, AlvinZhou wrote:
> From: AlvinZhou <alvinzhou@mxic.com.tw>
> 
> Adding Manufacture ID 0xC2 in last of ID table because of
> Octal Flash need manufacturer fixup for enabling/disabling
> Octal DTR mode.
> 
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
> +	{ .id = SNOR_ID(0xc2) }
>  };
>  

Could you please elaborate why you need just the manufacturer id here? I
would have expected to see a specific flash entry instead.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
