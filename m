Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EFCC36000
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0UuBsLFMg96078ZTgJ+RY/j6B1ST/MZNmZwk4PUR8I=; b=4Kc/TyDcQkuPhB
	1UyWIrVuvtqmbCZIFQJ6Uq89rCHWTS3loY0hNsVyBBGtrF0lL7dv3iuGxJwx/W8kY4Y+OsPl9cxC2
	4Lww7r96Hc1bgFIQVghWwako7ytXVPmL+H+qX/6WhApOQqqzBd9eKsNtm0kSrwe79QhWu1NfaILs+
	Cxfq+VBf9/jqLJrkzXhYdkqG1MxhG3gAvc6JJ+K+EOFVyCJqLqDk4R3M0feTEvCRSnt388vTLo/nS
	y5b4u+hXUO6PDMd9+RNmE8hZ/X7XX90H68XaJMYQjbuMRdkTIp7rr9TF4Bk5fHNz/Nq4Q+v+A17/r
	tBbWHCMoG8YoxnkfA2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvF27-0000000C7RT-0Vlp;
	Thu, 20 Mar 2025 12:29:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvF0f-0000000C7H9-0AB7
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 12:28:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so4207895e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 05:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742473707; x=1743078507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k9cOgDku+0Amja1d3cYnnljiqdZbZHTap1QLiTDrlbQ=;
        b=AltckUdVWFEu0hxeIGJY9vkNHShyKd8UEKUW8fcvXFVe28sb+oKdoQIE6i7BhahRne
         /SU9zMZswFFn9di75tyG7i8vnPlquAX269RYhcPqymJsHhlq/rRGycboYxCFWkhdcNqD
         wEzAdIiNJQ1g19S6kniOQNbhVRL8czY0mO3L0e4TVoQzYWXiDNctJYlzhZUgB8Odh4io
         GWw6+pX6nN0oFm2keh2J9xt7Hedsob1W/3D7vSgqu34sXNT67KWxH1TuK4rOqYAKOMCR
         s0T6vi/0R0p80woev1j12HRjvCtV9XIfM4g/wAML9tpBCeaZBpOwoL6e2/ty2pWHsb/V
         6/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742473707; x=1743078507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k9cOgDku+0Amja1d3cYnnljiqdZbZHTap1QLiTDrlbQ=;
        b=r1DZi0xkiDmiLlYi2iutP4yGTDqSqkkW3EJ79XJCLYSwtqXyn7qKupdIUSDJL/ReA0
         AyQCVpnH/V9y6/RQ4pKh01H9fQ2nMjP1/HTu5ar3wRGlqiF3qzY/kel3WI/XFhJsc89d
         d++aRhZ8ihPf1LiCcP0bB+d2IgR89BZDq+VCixgdzlYjnhtDcVu6mO6Z/Iv10ACHGcHu
         IARYWd0bJYiC/y3sIay//vvdYvDKPX6ZUlPGMe3zhSKQdAPrV5zx82DdulASoV56hMqB
         8HxrVO/LAy4uHsprg3gFe8MeE/+ma5LRCwK6gJPiFAk2IzZ7N8z/wrU3rgE7ulciddyz
         ZFPg==
X-Forwarded-Encrypted: i=1; AJvYcCWiV7hue8WAJ9wkIJETFl8PndNd/qm/s++tePXWHd+abs124yfm5Y2oeLHKo7agtWtL8x0Itx3JhIo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGUx6s1Rz0bnStqbupe6Pavjv95IFn4yHt0QVgxBad/iKIsXYC
	mG/G9QpYD8zPZnANuoU5V7UbsLhq1NH7rOI/kBuV5stGhRn5DlLvFbEzZEeDgBc=
X-Gm-Gg: ASbGncsAJERu3UjeB6ZGtOdQkBS1MOSP8T4zZ1CrvvX+FibMKQpsMgH1sH4VzODVEei
	4IyITwBNmU8dEVuWzfEvXHl+0t6sN7Q6Wgex7Mh/UIFs5TtHPtLCcPUd1XY67vn3zZVABHIM5LW
	/sl4c5+YTBGg3tgWdcAFXgMx/g+w1Ic3dzZxdpz6ZCLKhyrwPvWBQZqb7I5VdRWGjkC3/4R9All
	1tiZGUhZR7TSwi4zzNOoJ/4rnIAYcSQ+SE3Zyb8yjCCTXusXsYiOexMkqgfNLiwT0guDGEwXFXV
	uaf72W2f8cSTSsw0SgkqV89ByPoOKGGPdI/d+gGPK8ZFzJGEg/dCVMofG6B1WGh2
X-Google-Smtp-Source: AGHT+IHYMw/fKseNAgpR6bEDDF/GOdtjD/avJ+5+yhNRO0ILjtoSbBDdWDvP1ili6k6UrKkFRBtFTA==
X-Received: by 2002:a05:600c:b95:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43d437801e2mr63982575e9.4.1742473707500;
        Thu, 20 Mar 2025 05:28:27 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f376d3sm48539535e9.4.2025.03.20.05.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 05:28:26 -0700 (PDT)
Message-ID: <b6531c3b-b550-48ae-9a57-29a11d9e5cf3@linaro.org>
Date: Thu, 20 Mar 2025 12:28:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/21] mtd: spinand: Use more specific naming for the page
 read op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-6-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-6-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_052829_089634_DBB3D5FB 
X-CRM114-Status: GOOD (  16.86  )
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
> naming, followed by DTR operations. Soon we might see octal
> and even octal DTR operations as well (including the opcode byte).
> 
> Let's clarify what the macro really means by describing the expected bus
> topology in the page read macro name.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/spi/core.c | 2 +-
>  include/linux/mtd/spinand.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 1959e8d9c64be004c71a0d6ac6454fde08e708fa..2ebc802299068ef69068422d1ef6585f63365832 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -372,7 +372,7 @@ static int spinand_load_page_op(struct spinand_device *spinand,
>  {
>  	struct nand_device *nand = spinand_to_nand(spinand);
>  	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
> -	struct spi_mem_op op = SPINAND_PAGE_READ_OP(row);
> +	struct spi_mem_op op = SPINAND_PAGE_READ_1S_1S_0_OP(row);
>  
>  	return spi_mem_exec_op(spinand->spimem, &op);
>  }
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 545531afe2dac593d112065483afd180226cc533..882b635228860f45e52d516421c1fc3b2c723b9b 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -56,7 +56,7 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_NO_DATA)
>  
> -#define SPINAND_PAGE_READ_OP(addr)					\
> +#define SPINAND_PAGE_READ_1S_1S_0_OP(addr)				\

I now see that when all STR you chose to still put S next to the op
fields. 1_1_0_OP is alright too, it's equivalent to 1S-1S-0. Both are
fine for me:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x13, 1),				\
>  		   SPI_MEM_OP_ADDR(3, addr, 1),				\
>  		   SPI_MEM_OP_NO_DUMMY,					\
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
