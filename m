Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601E3C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 03:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkQ+AHZk6nxy56VGE7e0yBfJ7gK/jya5VMAibth5SSI=; b=HRgEf82AeByVhQ
	uIanOADC5P79mDKrlZXXduFqIeZCAeAc6YZKzC+6atJk+UAOZPg44UanifS1oU8IoNgSH+XEfJbw3
	K2+KohExQIfegF4h3lZfImOxQdcUw8VgfJKACMVutNpsf4vw5By8tO07+PCLURX+srxo+YIue/iA0
	OyKWfJ/WXr12L07YvIASTNjD+KFWkLI8Yb9Mgon+OgwnSPOarjyAo1Q2S8DFg3/UCzEU+JvovYtk3
	wGl+jt3IBU4dhTxGr2jq6yD5p4zUUuQPVQiB5SoYfoR58gp4L8brIqv26V0OMmTMflsFvTGIB0RQR
	u0HLff4jiJc2aq22t94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCtec-00Ae5o-1c;
	Tue, 12 Dec 2023 03:41:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCtea-00Ae4n-0i
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 03:41:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso25724205e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 19:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702352510; x=1702957310; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otCq73PAP//VShNSkGXqD+y69yaTjz78g2LtzHfSpc0=;
        b=QPT2edpy9HLZrdDeCWSE3yssrj8se+xmXj/zGD4B4u8n5Yy4X/c2itOc2DhGkPMPrj
         +SHZPq477IA75OAMf1s+XsvdffX3bNBR7ZtmaWXh6o09IqSg3j0TiSkG6tg6xUPxLaFc
         taQsTZ14fEDO1x5j4NvA5LGFfHbS7vXSXjmgjT4U8QFvv9IqbGi0k84br2x0a9eCku05
         YebbLu7enuRmaebwozEF+ScOOEXEb9tQMyUTVQ9URzREtYtTHCtAg2fDXg46vVu2Bcib
         ayUvEi/BbYTTo2qTqC/lluooxtzRY2HjIkhA3xnAxtblw/fqf9iHgs7UWi+N1jb6C89L
         dENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702352510; x=1702957310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otCq73PAP//VShNSkGXqD+y69yaTjz78g2LtzHfSpc0=;
        b=B1rnXUSlqnNz4GIC1d7VUcK/HIEcwVMxNgyzonqMTKfhuWihTK9W/WNnPQ6hGcD0XQ
         ubhN79CaTr2ywI79hYxinc21kislHO77HbklIohOBpXhune1OfCTHD6fQmycVK5GaW+X
         NLTGL6hmndiHxPqqSPC3H0P6JpWPDEeu7Wci/LJq5EoaorKwjpk2DDGOZuo9OmC8gLuM
         cm2Eu2RVJJNt7nX3MrwIBXKH97xU8RcrJPYZFK+7QaIPAqOefFIqdc3jyTGN1DwN1FQ3
         Cbi0ure+1JX8rMd13nVZCPBGoMYenPuEhNye6PnbuFbTmWUveYOhBCc4FRvQNjVgy8sV
         HjiQ==
X-Gm-Message-State: AOJu0YzreqWjnLU+R1lKOT5/8zIpQTgqkZsua8Or6zRrv21drB22C5eq
	4VqEYOkCf1o4HO4yZ5r3eaiIguA/VFij4JdKM7U=
X-Google-Smtp-Source: AGHT+IHF+JVx1cCLIPXYbQFJMEmp4zrThkoHJA41ehZZfki9vIk22eEH5YgFpqVVdutmj6nuh8Nxiw==
X-Received: by 2002:a05:600c:2296:b0:40c:6bf:a924 with SMTP id 22-20020a05600c229600b0040c06bfa924mr2583480wmf.78.1702352510032;
        Mon, 11 Dec 2023 19:41:50 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id kw20-20020a170907771400b00a1dc4307ed5sm5566217ejc.195.2023.12.11.19.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 19:41:49 -0800 (PST)
Message-ID: <fe0a16e9-a1f9-424e-a06d-f717f65e0fd7@linaro.org>
Date: Tue, 12 Dec 2023 03:41:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: rawnand: rockchip: Add missing title to a kernel
 doc comment
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>
References: <20231211150704.109138-1-miquel.raynal@bootlin.com>
 <20231211150704.109138-2-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231211150704.109138-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_194152_268002_F0376C83 
X-CRM114-Status: GOOD (  13.63  )
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
> All fields of the nfc_cfg structure are documented but the name, which
> leads to a W=1 warning. Add a title.
> 
> Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/nand/raw/rockchip-nand-controller.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
> index ab1a9e8687e0..7baaef69d70a 100644
> --- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
> +++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
> @@ -108,6 +108,7 @@ struct rk_ecc_cnt_status {
>  };
>  
>  /**
> + * struct nfc_cfg: Rockchip NAND controller configuration
>   * @type: NFC version
>   * @ecc_strengths: ECC strengths
>   * @ecc_cfgs: ECC config values

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
