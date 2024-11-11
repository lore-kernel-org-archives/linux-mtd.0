Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F36D12D49
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m45RVmfiZ+wcUs+v3g0YUZj4plLbntrZX6FLIW01yZQ=; b=0Sw5FkWDJFPT9F
	7rLGok48aZczR+X5pfOx/lzhTUghFeXCAzwFHBxYCj1asHPIr50DOLy4xOmPG4yAdRZJcZDve/kYV
	8G9GIhX8kPvyr92QEXsmF25aMePWm3ezvdq2U1BRuja7HIJStHvgepsgmwC8bpUhW273p+MbuZ2Mk
	F1ZDJgGL88K1rDkaSApM6b8Ps7e1EdAXpnBDBLd8EmLSizR8pVzcdKFFrS36r4LcljseZ1D4uF1Y3
	nA8tXad6C4I8p4mwhrE77N4SOOGpHZeSzjgI/NW11CHXShYuquK/A0WIjqvwbl6wTjGGph9qWwXDm
	TNpQYLkr0KmD2OdR51ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVFH-00000000INA-1JPA;
	Mon, 11 Nov 2024 14:18:23 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVEb-00000000IHg-0gnf
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 14:17:43 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so3507772f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 06:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731334659; x=1731939459; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8X0PxEOLnM4Tfl8Ycc2hMSna6q9pPCn74dzWrTBOosY=;
        b=AvlPUYZ/mubdBESmzJW2GiLmG7BAxFzE1TSKZrGJpll39++Lz5xnesh3tLSB3JO0ub
         0dQab28u7Tz5i1AtcQO24+58PyTgQJuYXe0ZYw5w5aAuYlCbweqsvlntyN4uneJztj4b
         nUDgvra/bqZk02zrCOiJXCsPzJIdGtOA7Mu1ngbX9q4wl5wXvBdwTlTk8cVyJ9Nj1FTI
         MOXFvEkFzqQDfwDR3Bmm0/hw4pWbJzaLGa9aqPEXebWNrSxIXMt+vtYWdm9ZlnoXRT1L
         rNtKhq88cq7c3+mGaVxLv/M4bNxYdU2t9hKes9kh3+i091mPYZZI9kTozp94B3E8CkmX
         VJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731334659; x=1731939459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8X0PxEOLnM4Tfl8Ycc2hMSna6q9pPCn74dzWrTBOosY=;
        b=JMUn60SXlZxMsSTX/ANOQIqRZn2a6/8tYZ6j8qt31ZDbB6rM21OxLvjhEio4jEfoIw
         Qc1FndfS2U2nf8P2IJcNi6txT7vpBZCt/LPjygSS/NLr2cQusl/ZNtRCG+8TdyYqaKRS
         UvmmUZvCLBFFV2m6HJo3D/uRk0dzl/LtOg8UQORkGlGEYuZfSQtKMVgVxGlzziWeGYWu
         GFWECTQmes3r7igyFxY2FLaEhXl8iIOcLZ2GP7BWvM2niRy73Un0DkL4BC5ezz2Sj0Ve
         97vixSkDag8Qr2zlXkCjV6dX7mXG0e8XWbskubQ53zZLcL8egvwZWJXCK6XNCmy5iWp+
         HnTA==
X-Forwarded-Encrypted: i=1; AJvYcCUDtTlfWrC8LD1tsu/1qG/Fv+uXcFcjKMil2eKsjNd0aB6MlELRoq1BQCNB64Qvr5AsNGqWOdvZtPQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4wS/Ja77gJVWWBHsuqj4TLxU88XaJL/OgioG/DvfmBbsImRXL
	xCxg23kH9s4bqivoWwIRjYfyx1rtmU++c9fb+m0ZzO5RijHsauayKJTYCLYXu2I=
X-Google-Smtp-Source: AGHT+IEfypfvfuhGwuCh2moR9U66zwgs3XzdAI100KcZp5oMFUAapog0JepiMKaoUqHLkllprnqFZg==
X-Received: by 2002:a05:6000:1546:b0:37c:d4f8:3f2e with SMTP id ffacd0b85a97d-381f1835b9bmr8731830f8f.55.1731334658861;
        Mon, 11 Nov 2024 06:17:38 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea93esm12841976f8f.66.2024.11.11.06.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 06:17:38 -0800 (PST)
Message-ID: <6e037ce3-1755-4cb5-9124-4b32773fbba4@linaro.org>
Date: Mon, 11 Nov 2024 14:17:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] mtd: spinand: Add an optional frequency to read
 from cache macros
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-19-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-19-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_061741_242104_947F303A 
X-CRM114-Status: GOOD (  18.23  )
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



On 10/25/24 5:14 PM, Miquel Raynal wrote:
> While the SPINAND_PAGE_READ_FROM_CACHE_FAST_OP macro is supposed to be
> able to run at the highest supported frequency, it is not the case of

what do you mean by highest supported frequency? Is it the max freq
between the ones supported by the controller, pcb and flash?

> the regular read from cache, which may be limited in terms of maximum
> frequency. Add an optional argument to this macro, which will be used to
> set the maximum frequency, if any.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/mtd/spinand.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 3730cdf914f8..6064029c5e05 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -62,11 +62,12 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_NO_DATA)
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_OP(addr, ndummy, buf, len) \
> +#define SPINAND_PAGE_READ_FROM_CACHE_OP(addr, ndummy, buf, len, ...) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),				\
>  		   SPI_MEM_OP_ADDR(2, addr, 1),				\
>  		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
> -		   SPI_MEM_OP_DATA_IN(len, buf, 1))
> +		   SPI_MEM_OP_DATA_IN(len, buf, 1),			\
> +		   __VA_OPT__(SPI_MEM_OP_MAX_FREQ(__VA_ARGS__)))
>  
>  #define SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(addr, ndummy, buf, len) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),			\

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
