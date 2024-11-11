Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8321AD2E9FF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/oNgB4umhDEgKvGM5/3ccvtKI8NRQhSK/Xc/4VbXF7o=; b=IolRrnbNS7AkQG
	QPQNzXYNDqLv2aFOW12HTRt9whNWHznyunlMoSBF7fDh49u9reX8wCwSv5Cu62B0l6rItDEZmhLP7
	GLd4ZzsrPQnvLFbXIU4qrk6aQ8JoWxtn1IRHw7pKtikHUyIBu4Gk84+FPT/NmMLHFMN+0/LAUdY78
	PJVBQZbEYlucihc+9lqCB+USTpgG5eSbm1PowAdK93znYIowo/wY9X/zhaUHZmDXSnQxPwU80PM6Z
	U/PjtKCg8BdePiMRISP/HScFhBpFXWXVcyrK1Dft7HArMEUZxCWCQtUQVkMC9k7sVCAEXJlGee8pD
	/jxi1Wp2h5OPwdWLNPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVbF-00000000MAn-42nd;
	Mon, 11 Nov 2024 14:41:05 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVbE-00000000MAM-0O5p
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 14:41:05 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a9e8522c10bso713223666b.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 06:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731336061; x=1731940861; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBaJwCIVHki56Jj+IDVKoZSEhH2XbB/0VEF5wM/pZg8=;
        b=l5xZox5zAVHC/Jij5U+OeZwsuZrKQXMPZr2qnYL2M8KM9yZ+wkun3d6yV52RDXJj+Z
         Sq5BMngzClINQt6ISpoow1rodOhXaxwkqF/M+eCviQRkprTx8uLjkJNWul6sEpDT/GcW
         f4Ze7N0pEX2loxplzWB2K+MJu9zEKim44necfCKxjnzpgvbzTgBxQXPfTLdtuK+g+OHl
         dbdrL2o+cg6jP2mj5xa9MmVcnvbyLUG2EmDrvvi+j8i22YIqBjcmY233N6wOLHJ0PGte
         OLacAMlYD9hMvK/g3/Y1vricKf8A+0Xpgau+G1lm72D2ZgD+6tA8jgsvVIXUF89DiVeD
         VtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731336061; x=1731940861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBaJwCIVHki56Jj+IDVKoZSEhH2XbB/0VEF5wM/pZg8=;
        b=LB/neqpLFEa6SCWRuqaWkBsg7rJN/5MbYunBAviK32zmW7C2HxCXOH+cXPBICQTF53
         XfAqfAyJsfQtA1RQmngGHNmjSKh8kIH4ekhyrSUVEHAW4zAUQ8OkLDmoOHONd5PMfPV+
         exg7OkTNGcYk4q38sj5MMLoC7n0u8ihzjzhKlv/M8xy1eres791YquO/bu8b61jFDOB0
         JWULDbSm2hPH2AfgB+2EQJczkhGKhsFsKKdjaXbMwGTus+71cK4g6J/cJ2deNbMW2SAd
         SlSp1fU2/nO+Owj+h0TIUWgOb0Yt2bKlB6Toe4R6be++gEazK7fdIk9CGGTDzF9ic2HK
         zwjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVxHT0uMXBbVmh7HwoGNAUEVsWoJwomCM7gBg1gDbCNCwpv4fjR6ircXSYmPeEX/YpwvEwx3SfNJQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0hE9gBYpS+9dFFQ78PzsMwCeMLql4S1JDVHZsxPsitd9HPJrW
	ZjWpzdilwE/5HmkeRD47FBinLshi/2nLcarw8D9s33HSTJDlq1HJXuoPgOwv1qw=
X-Google-Smtp-Source: AGHT+IERR516a4JtGNjcPgZ6V5U2luo4u3jxHu/GNHpqpdnYAcnjwD7hi7RJrs07N2gkwQYHmYO93w==
X-Received: by 2002:a17:907:3ea1:b0:a9a:ca:4436 with SMTP id a640c23a62f3a-a9eec9bf48emr1269661866b.13.1731336061502;
        Mon, 11 Nov 2024 06:41:01 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a176a6sm599070066b.16.2024.11.11.06.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 06:41:00 -0800 (PST)
Message-ID: <6029a01f-dc4d-4a35-ad21-fd17e3fed9fc@linaro.org>
Date: Mon, 11 Nov 2024 14:40:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/24] mtd: spinand: winbond: Add support for DTR
 operations
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
 <20241025161501.485684-25-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-25-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_064104_179491_C2976DCB 
X-CRM114-Status: GOOD (  13.48  )
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



On 10/25/24 5:15 PM, Miquel Raynal wrote:
> W25N01JW and W25N02JW support many DTR read modes in single, dual and
> quad configurations.
> 
> DTR modes however cannot be used at 166MHz, as the bus frequency in
> this case must be lowered to 80MHz.

ha, what's the benefit then? Aren't we better of with non dtr modes
then? 80 MHz * 2 < 166 MHz?

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/spi/winbond.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
> index 9e2562805d23..77897a52b149 100644
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -24,10 +24,15 @@
>   */
>  
>  static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
> +		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_DTR_OP(0, 8, NULL, 0, 80 * HZ_PER_MHZ),
> +		SPINAND_PAGE_READ_FROM_CACHE_X4_DTR_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_DTR_OP(0, 4, NULL, 0, 80 * HZ_PER_MHZ),
> +		SPINAND_PAGE_READ_FROM_CACHE_X2_DTR_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_DTR_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0, 54 * HZ_PER_MHZ));
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
