Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60CDC4167D
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 03:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0iuz4VexSzYNmbIDWjDvZt9A+/i0+QqElblXYo8HbE=; b=KoZOJ4v1N3HnEt
	PH31Xo9jUntDe1gzhLxXNSqqL7h9Bh108jUiDSSA4jvA5BWE08k0llHUnjG97JjqA/u728qWR6NJ4
	x49c0FVoQQmBp93yXROF4vdcSPUKTqfYcxr9qRHznYeBiPzCFg0kZNf/dOBsg7mvdteI8oLg8wRZo
	Sroh6fOVKDb4x6DCpmDyqjmXfatcbe+FU27W+EEq0VICFZxtTDweT0RFoVPb7VupCUxO6ONb4Ilb0
	1n3f0mz9sFnscUl5uM3JC5DOG4rs6DaS8L8Ne4psgsiE4hPp24CvNvwvQMkpoXsNRD95KBXwNg8hm
	3Yj02n/Mr9sjj1ODgSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCtdL-00Adsk-0z;
	Tue, 12 Dec 2023 03:40:35 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCtdE-00AdqD-1n
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 03:40:31 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-55193d5e8cdso7342a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 19:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702352424; x=1702957224; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1QeTvXs/spJN+MKNWgyjyZ+WcgnVS3XBxnAHa/Q8K5Q=;
        b=pcVOUZW31Po1O3+r+2glayjXbg+WsZEh0AiFxI0ToPfknrSePmT4d1dFAwc9myATMp
         gKulf1YPCEsl0ct4eCG8740foHHSgQClBgnVusrIMu+a6MzKChjt6Th/1CDmlrvVbiPm
         MZ298rC80rEm08jwowT+9k7yNkWKS/7f2vxXmlnx5BLuLKDSAo3gLkC051ti78JmMFpx
         GvlgYv5wEZmY6J+Wz6VxyIQwwRCRBSMvFEkdWTs7SSauqqbnpQTlFufNkUwfKFDCNFFT
         WSopz9m6zP6mnD28BaMTZ4QhfpaBhJw0HQgKL0emAu7kTqrQAKwldl4aliKdj7jxchsr
         ttDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702352424; x=1702957224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1QeTvXs/spJN+MKNWgyjyZ+WcgnVS3XBxnAHa/Q8K5Q=;
        b=J+MwuN5Ai6E8BenhJ9Uifkgnafw1JXexJDQrCoh7DxDZZJCFDaFBYIRpZd9eR05k3h
         hue2w/nK0xNKx7x4ce+YnvsEa0IrLAsKv2z8KwSWkWFdE+OGt9SZ/Ykin6z5/rWpTNHu
         f7w/5smm5V8Urj4eXbvnJeHUGJzFNBo3Ps2mWMFCRGlc4RuR8G6qjej+feWEgDsKrjvN
         4KMC6qHvxKd9xH4/9jWnIz2hKfKkkvuozTa0ptHtUDH58pu24GeRjUwf02CG/xZo90UX
         mF8TITf2F+f49Ca564KGXqIELIfdslbNzoGP3OQ88n4VaZSow/9m7tLBRwP3uwOcUdWs
         wmlA==
X-Gm-Message-State: AOJu0YwuTD2TMasmUicTiYSQ42IDb+G68nBH15bRS91I5Os+ikNFCJbf
	ARXVW5ZVr63FPYhteMj6T0xuNw==
X-Google-Smtp-Source: AGHT+IHqC3V6IeSxKMs1C96jTf0qQIRK+0T0n3uSY/6VaxnPBs5Z/6gKg6yhQdvLSvYe0RiH1uva6A==
X-Received: by 2002:a17:907:961f:b0:a1d:530c:af06 with SMTP id gb31-20020a170907961f00b00a1d530caf06mr3440201ejc.65.1702352424071;
        Mon, 11 Dec 2023 19:40:24 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id kw20-20020a170907771400b00a1dc4307ed5sm5566217ejc.195.2023.12.11.19.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 19:40:23 -0800 (PST)
Message-ID: <611d17e0-c965-4218-9152-5bd93f92ed45@linaro.org>
Date: Tue, 12 Dec 2023 03:40:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: rawnand: rockchip: Rename a structure
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, kernel test robot <lkp@intel.com>
References: <20231211150704.109138-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231211150704.109138-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_194028_616745_554B835A 
X-CRM114-Status: GOOD (  17.17  )
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



On 12/11/23 15:07, Miquel Raynal wrote:
> Robots are unhappy with the ecc_cnt_status structure because the kernel
> doc says it should be called rk_ecc_cnt_status. In general, it is
> considered a better practice to prefix all symbols in a file with the
> same prexif, and thus it seems more relevant to rename the structure
> rather than changing the kernel doc header.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312102130.geZ4dqyN-lkp@intel.com/
> Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/nand/raw/rockchip-nand-controller.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
> index 596cf9a78274..ab1a9e8687e0 100644
> --- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
> +++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
> @@ -98,7 +98,7 @@ enum nfc_type {
>   * @high: ECC count high bit index at register.
>   * @high_mask: mask bit
>   */
> -struct ecc_cnt_status {
> +struct rk_ecc_cnt_status {
>  	u8 err_flag_bit;
>  	u8 low;
>  	u8 low_mask;
> @@ -144,8 +144,8 @@ struct nfc_cfg {
>  	u32 int_st_off;
>  	u32 oob0_off;
>  	u32 oob1_off;
> -	struct ecc_cnt_status ecc0;
> -	struct ecc_cnt_status ecc1;
> +	struct rk_ecc_cnt_status ecc0;
> +	struct rk_ecc_cnt_status ecc1;
>  };
>  
>  struct rk_nfc_nand_chip {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
