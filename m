Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF96FC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 07:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ce9UR72VvebWbcKlrrhjGvzfyXWD+F7kz3n2yXcndoU=; b=jJ7VCdtUPK+ClO
	F0eFml30v+FrWmV5ybQMlSYcH0/lLRuqCJ/s746j9Y9uXn9y6QqhsfkUhXOu97HYc6rkUyOX1J/q4
	4twoap6yj3Ssea/sPyr/bxiYNIuwylDbw4MLTySzUW7qs9O+t6fSecekvhwhauTFKtM/bIRhlbqLY
	fQUpX2059zkaGpwQ3e4+tAQ66xhgs9dsOr/2JrFnaeOSacUjw2a4zHtOSO93XRFLjItWaKSaGuvyI
	Xr60CfQQGzsOyPfNnKRurhn7Vr6yS8kuMtvsukxF54cJA4zbwN00qUkX4LC3TeO+HjnrdYCzTmCb4
	RwygxBKZp8i+kerNlLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqY2-00Bmzu-Vz; Wed, 08 Jun 2022 07:56:15 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqXz-00BmyI-U9
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2022 07:56:13 +0000
Received: by mail-ed1-x534.google.com with SMTP id b8so9263973edj.11
        for <linux-mtd@lists.infradead.org>; Wed, 08 Jun 2022 00:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=e377dIK01bQpCsvQ/4egzTZtaT4RGsrxUQOEdWsyApk=;
        b=ftu/koAVje0hAZzBq03SovgGhqPcybjdzbMUK/QUfHKYbZsaBZh+x1mMsuqM7qDx+H
         +6hbccn9zCTxGUMILVD6o1VqkdTB9Bgr0NE3Lwrn4ONQ2UTuE7/nXszRWN2gcSfzLhm2
         g1DxWxhn9QgZ7+sUejh+9gKa3RLoZpKdV/o0CxFfcVt+m0nXRs85LBFIBYyyF55OWp/n
         pkaZgxhGNrJ5NDklDjBR8xejF5AFEoJSJtkgA2/gG5BgCh8eq22Mxr1rm+/OeaAEc8LH
         yOOM6s/1B/U0zN5YMwJC31w2d3oyQ/ueHTzPvZ/PHs2WBLReZMLRMTYzr6YbEdgLrspL
         dceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e377dIK01bQpCsvQ/4egzTZtaT4RGsrxUQOEdWsyApk=;
        b=7a77HUrnV2+njgNWLw1W1G1n/qXR6umVuBFPe5bHrJzbl3l6p7ljfUFBl4prW9aJSo
         Jz658tFm/lcjQ++WFLvigzox0ebq944nsJ78IPU0J1SE6nMGNf5QalxHjCr8H3R6wWvz
         KygTkkxhFN2DFR8/OIvohZmj8a/EtA03W2Ukm2x6QfOV3N6xRYOtvzzIa48D69+25tbE
         k5gGxC6JZyhhfI9PcmnfrfC/t6wcF/ebe+AwlQlMt+Chd+3NIyLB6+CZl1L/NXR3El6S
         Tp4pUMs9rgh7C70Ih3pv6Nz9C0S/hykFM85chBrdx+79ZnU1K49AaWyGJdo+kFdrH7Pl
         luWg==
X-Gm-Message-State: AOAM531yP6WpUAJLasoCBnyHa6eW+uFGogljGwLuU5CfYS+gpZJzhbSf
	+WeA9rTBp6TLy411jcg7V31TZbJEfk0m+8vulD8=
X-Google-Smtp-Source: ABdhPJxXTiuQUzzJ3xiYKoz4RduqjVMBkcw2XEObhPUXmb6/T6/3JNjaYcU9EEXpK/0u1dozz+tSCQ==
X-Received: by 2002:aa7:c744:0:b0:42d:f68f:13de with SMTP id c4-20020aa7c744000000b0042df68f13demr37452475eds.294.1654674968482;
        Wed, 08 Jun 2022 00:56:08 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id i14-20020a17090685ce00b00706287ba061sm8640365ejy.180.2022.06.08.00.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 00:56:08 -0700 (PDT)
Message-ID: <24d99380-eaa4-1ecf-c135-d007793c425a@sigma-star.at>
Date: Wed, 8 Jun 2022 09:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] mtd-utils: nanddump: fix writing big images on 32bit
 machines
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
References: <20220608075114.1977454-1-s.hauer@pengutronix.de>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20220608075114.1977454-1-s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_005612_325328_F93C3D50 
X-CRM114-Status: GOOD (  18.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master

Thanks,

David

On 6/8/22 09:51, Sascha Hauer wrote:
> When writing a full 4GiB NAND to a file end_addr becomes 0x100000000.
> With that writing out the first page to the file doesn't happen
> because size_left is calculated to 0x100000000 - 0 = 0x100000000
> which is then truncated to 32bit and becomes zero. Fix this by
> using an appropriate 64bit type for size_left.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>   nand-utils/nanddump.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
> index d7fc320..47539f5 100644
> --- a/nand-utils/nanddump.c
> +++ b/nand-utils/nanddump.c
> @@ -499,7 +499,7 @@ int main(int argc, char * const argv[])
>   			}
>   		} else {
>   			/* Write requested length if oob is omitted */
> -			size_t size_left = end_addr - ofs;
> +			long long size_left = end_addr - ofs;
>   			if (omitoob && (size_left < bs))
>   				err = ofd_write(ofd, readbuf, size_left);
>   			else

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
