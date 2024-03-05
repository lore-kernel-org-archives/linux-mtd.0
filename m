Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996E8C48BF6
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2024 01:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSXNkjgH4+fcsUnWf2gKtXPeKH2AkNVoYWzR9xf3siQ=; b=4GuGtJreHW/1x5
	qesrBD5eAa6sPrlsJzf6JMvtFI0UZwhwRrLGJvulTcEwd7NlGQnMxRxuVpjy9puXZNIFC40qHAZQj
	z3ftvVGhYV6iAt+dn/9eWH9APYptBQW5yKKO0pVSeWR7yE01nyyfDLB+hixM1xVxMC9i3XE3b1oQ6
	YIXU518xY7dQ5VLyxyP7ZF9+WhMFtBh+GNUBwO0V6t1T9tUm7FZlwPFtc3bB9ylebYX4kOOuJNYI5
	eRvbZqfgJimOVeOoPAlhFFENm3C0VwLeK7wJeIVWG2q034TYzttbwunuwMiG2gUfp8hevoQQOYvBk
	TA/yGgrwHCWPkndJp+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhJKW-0000000BLf2-1iUj;
	Tue, 05 Mar 2024 01:10:52 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhJKN-0000000BLZO-3lNS
	for linux-mtd@lists.infradead.org;
	Tue, 05 Mar 2024 01:10:48 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5dc949f998fso127424a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2024 17:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709601024; x=1710205824; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAgT5gjHKKVhhqkTy/NqFbUddc7Qxj55xxgIVvsYtdY=;
        b=UE7L3k2mEAz6UME0dJ646wNh96KKWreF2gsIDS8kLlGBbSYvTJ07MAT1oQxui0HAuE
         utqWrjrSdzpqvig1SkCh36AnRTr89gnlmiy9hUWRRO5/tcprf0322yLkAgfRkrrSwIsj
         aDa8zgVUyGOyov/kHOGLZdDl4DkBjziM17Vq/j3go4l/m4niUKV7PXlKWr1I0fQiryxB
         IPY7+WJJ8itklqdJEnfQxGB8eTWmFjzQUvUUDEhmFsTSCmr0Ojhe2KEjs9kM29IygYiB
         fqd9FwyDUYTHvTCJsEGuJQBzaD+K6w0EcRG7cuczEwi+MBNkfZwwCn5tIb69uWKPP5A0
         b/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709601024; x=1710205824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAgT5gjHKKVhhqkTy/NqFbUddc7Qxj55xxgIVvsYtdY=;
        b=ahgOyhUDF6KUt4/+vyvB5eFXLhz0qeWJ7iVxRCEt3aS9eHAFf+IcvoHN+v1n2dzLK2
         jMri1yhoDyPX0z9qva6HhkOSMPQCoPWezeoolf1dYsmTcKQH1SiYYd5Kwxt9p5XI5oMA
         KcGsoyvMn/6ahhVqZ4Kr+La+t/tdw+3Cl45uYv7+2WBNgyzgDcHbLXGwe19KFkUJT4ht
         Gy2fx5Ov+UeA/9G9DZ35H3J++KwisdRhjLcHOQEtN1TUjr2ZxO3REYfH+hDPecpSKgND
         R7kaDfrfpEp5EDlmf3BQne1MO85NhEuMYEqUlUUZUsye56lRbhMUfCLxy2ZqeYWCfOD1
         i+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtvEQI8WT2U7QFYvxBEJRUSl9IfxffHXDTndqoc8oGrgxk3PHNkEt+bmFXC8vIMP4bn4JyghuuqqNIus4Un9QIqWCGM8Id5osP2RwYaQ==
X-Gm-Message-State: AOJu0Yyxe/EWhkZ6DJW1S7NSJAqYuFnFAlU/H6YmoMyS8oiwFykGl66u
	MLNyFWEVpNqbsy541mchcEPiVRLtqrTuneG324lmzWGlQHxNRucq
X-Google-Smtp-Source: AGHT+IH/HvrX+GE5jUYMo3nzDfigukx8hBYlI+mfGQ9w5xdleZXK4fK3hZZRv9RdU3a28BezP8jlUw==
X-Received: by 2002:a17:903:1249:b0:1db:4419:e925 with SMTP id u9-20020a170903124900b001db4419e925mr550700plh.1.1709601024432;
        Mon, 04 Mar 2024 17:10:24 -0800 (PST)
Received: from [192.168.0.9] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm9151662plx.144.2024.03.04.17.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 17:10:23 -0800 (PST)
Message-ID: <55e95ba4-419c-4e53-b947-5ee209e43fc4@gmail.com>
Date: Tue, 5 Mar 2024 10:10:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: core: correct type of i
Content-Language: en-US
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: kernel@collabora.com, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240304090103.818092-1-usama.anjum@collabora.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20240304090103.818092-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_171043_998307_A700E366 
X-CRM114-Status: GOOD (  15.20  )
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

Thanks for pointing out and fixing this.

Takahiro

On 3/4/2024 6:01 PM, Muhammad Usama Anjum wrote:
> The i should be signed to find out the end of the loop. Otherwise,
> i >= 0 is always true and loop becomes infinite. Make its type to be
> int.
> 
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes since v1:
> - Make i int instead of u8
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65b32ea59afc6..3e1f1913536bf 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3373,7 +3373,7 @@ static u32
>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>  			     const struct spi_nor_erase_type *erase_type)
>  {
> -	u8 i;
> +	int i;
>  
>  	if (region->overlaid)
>  		return region->size;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
