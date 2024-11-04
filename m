Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5010D111B0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2024 06:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGA1LrRZkUi4yUxp3jDq7uJZm1Z5Ih+ify8CpniLw/o=; b=MezT9SKJN7UGHU
	PzKKBjTCCMsjmG2jsc2F/fk80XTc603EE3Ri3GH56HAmS1YYmzTOIbhl2Ey92gykWHa+ZX7s70ot8
	6TQF1bael9DpGKbt7dV0aV9mhBMmAC44l58bGn/BajZYzFqfpLEkNarnjtQ0VYzDjALPrGPWvzbx7
	tJ4O7PNZMOW3RhVh/aaGhZAsznI3d2h7bXKE3i0bzB7ykFAcGLhEww8pfKmoE8rEgImOiDknHgesR
	2adeYxOSyA2l8smAmphrEuQjBhLw85fb1DKbC/lKf6papS4h9HApaFeRTbMkz/iJdRIg8Gn/HZlmM
	xcdFFpDugU8CYgyvzWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7r2K-0000000CoUg-2Lmv;
	Mon, 04 Nov 2024 06:58:04 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7r2H-0000000CoUE-3Ntg
	for linux-mtd@lists.infradead.org;
	Mon, 04 Nov 2024 06:58:03 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9a850270e2so643966666b.0
        for <linux-mtd@lists.infradead.org>; Sun, 03 Nov 2024 22:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730703479; x=1731308279; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uThArOGSFE57krQRUMDraU1QLts27MJWPFmXg/jVzao=;
        b=BS8Nsks0O/7KrSZLIiPNf0wHwiPSgjIhoI8F1r78kn33Riu8fxzkt1xOyhiGFa1fUy
         d9J9NLshuSNSc0CjU3TJcAbaj363m9EPAL80rDElDvf1XUDlVaf+PExUoX3EmUNtodwV
         dFZfKrhh4WhfP+k2KJSPR9gyM3T39+jHsEDGud22s/y8wtwM+ln5woW+jqhwFDm1Rctj
         bKbZavhWE6Y5ST2Za8ovsMdKeECsXd+2B2Hcw7qj51L7VQlTdDCevOmbCyZmfqMGN3Dm
         AVh4kotfaFUgWwa8voctQCQWDt3wPC+q2EPT2iiD1XUXhRI3ARDhb6OYESk443cI3iNM
         LEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730703479; x=1731308279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uThArOGSFE57krQRUMDraU1QLts27MJWPFmXg/jVzao=;
        b=l70o5Dqj1L0FWKVkVNzo0eHmmKyRnaz0wylbeQQ6e/McBh+GMZdYIfJiyy4F6GNsLe
         RcvffeL2EG0VfnkSdms97Mg54TVrLaHt7dzhIvXl8c7EiT1Myi1cB9mGvZxftMtjRTpK
         TxeXsdFifvn1HcnLn28AWO1zWHI1vVc7PGOiB/7WAxz7ppDuu2S0TxYJVPT7E2qH4eE/
         OeBPiOx9jQt5vGQzi63a2SkASfehfkzGgzFjy6rQoWcoKh0VCHKg2UkEtrBpUZswmS/V
         Mbbh6BkJq1J4HOlT/JNKOMsKBWTsoMyHxPtmkh2vc+hOVAwPNTXA0UX9pC8/LBeX1CU6
         zwcw==
X-Forwarded-Encrypted: i=1; AJvYcCVXL7y3Ps8tWpyI3zp90Yfw7FAOfKC5PtCfcquRtT8MNVVeCupH9+yQAGy135AjZ7L1pwSscHhqbYI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcvkQS/tmGjpK1uM192zCHkapVAAY/y2j86MHWFtjWzbua6Q6A
	6O4W7pQbs/1o0iPQGoXEhpQktg3/qF9xbPlQcASLB51AGwJTCC6Nbz2jNziFtDA=
X-Google-Smtp-Source: AGHT+IHLXK4gEkLEnHzWZ+cB+wkZBRPe7wOaRk4G7SgrwXJKrL1Hs1gkERB9uAnQeROLxS1qFQqIYg==
X-Received: by 2002:a17:907:3f23:b0:a9a:55de:11f4 with SMTP id a640c23a62f3a-a9e658bc988mr946437466b.54.1730703479261;
        Sun, 03 Nov 2024 22:57:59 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c53d6sm513811066b.68.2024.11.03.22.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2024 22:57:58 -0800 (PST)
Message-ID: <97e61bf9-8539-414e-88fc-2d8b451057b1@linaro.org>
Date: Mon, 4 Nov 2024 06:57:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: spi-nor: xmc: Add support for XM25LU64C The
 device is produced by Wuhan Xinxin Semiconductor Manufacturing Corp. (XMC)
 and found on some routers from Chinese manufactures.
To: Ssunk <ssunkkan@gmail.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, hhlee@google.com, roccochen@google.com
References: <20241103142126.3406-1-ssunkkan@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241103142126.3406-1-ssunkkan@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_225801_895984_BE433A09 
X-CRM114-Status: GOOD (  15.89  )
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

Hi,


On 11/3/24 2:21 PM, Ssunk wrote:
> The data sheet can be found here:
> https://www.xmcwh.com/uploads/954/XM25LU64C%20_%20Ver1.4.pdf

you probably won't need a flash entry at all because it seems that this
flash supports SFDP. The flash can be initialized solely based on its
SFDP tables. Have you tried probing the flash without this patch?

> 
> Signed-off-by: Kankan Sun <ssunkkan@gmail.com>
> ---
> V1 -> V2: Removed redundant Signed-off-by information
> V2 -> V3: cc more maintainer
> 
>  drivers/mtd/spi-nor/xmc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
> index d5a06054b0dd..83e83c1c1266 100644
> --- a/drivers/mtd/spi-nor/xmc.c
> +++ b/drivers/mtd/spi-nor/xmc.c
> @@ -19,6 +19,11 @@ static const struct flash_info xmc_nor_parts[] = {
>  		.name = "XM25QH128A",
>  		.size = SZ_16M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id = SNOR_ID(0x16, 0x41, 0x17),
> +		.name = "XM25LU64C",
> +		.size = SZ_8M,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	},
>  };
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
