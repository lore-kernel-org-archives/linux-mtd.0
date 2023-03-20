Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F49FC7618E
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 11:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gV1WZhRhTJyff5V/ICuPJdOATQkK4s4VBSp54Xp0MG4=; b=2JSbneJ5/iPElj5/97fprV9i/8
	8Xx5THOA3t10Jf4+zb7+u2DW27eYBXo+93ZfrffcQP7rYLrf4FrNW6L6eEZ1LxE+faBJlM3tLtukB
	v+J1IId1PN1DlgiJlGPmITGVNbWwb+hvBqNdYx8wbfHnSGb8rzdzAQF27uJuWWyhIqmZ3fh9sEBjD
	SNBlCZpX7Qz6aqslD3QsnW9eeLEdDOCWtWCCKSlrCsdJxs0+zncVQ3GtrgjGRd5XIZvy700FONJmc
	DIz84i0WCzq7vYlX0C4A4Y/554gK04gj6QAcwH0PbBIP/+6lqxakJe8YXAHO434lWxzH1qq4NFrf9
	Q0y71CHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDVx-008nJB-1V;
	Mon, 20 Mar 2023 11:17:21 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDVv-008nIC-1P
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 11:17:20 +0000
Received: by mail-lf1-x12b.google.com with SMTP id j11so14370293lfg.13
        for <linux-mtd@lists.infradead.org>; Mon, 20 Mar 2023 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679311035;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ej94/Kf2ayKOl6sKdGGXBuRfCzrbNUluAKCrcQl4uhk=;
        b=Paq1Nb1dMp5o7Dyu01KCmuQXi3oB5mpg9LhhVSJbc3sC+twHW6ToaOkz+z5qEzlOaz
         x2LYSuN3aFEGPn2oHu2dpgysVwWj8ibnP4Vvnq95K/sPKSWBn7Ct0Hvdmcy1tDCiVLdz
         8rMVK5DnWUA1Qz/6UlzH/QX7Wl/pr9jlbdsADNgp/ojY8tLuadUH+NPlijOeTRwGebgv
         +EzVNqGOLqdRiaAuOUmTuRLtjSiLfMQD9grSS+iG5HtePGjdxox4hhw6b8dTVhG/dpUj
         A1QJuK+1I0i1G3vCevqUk84kqbW4naazNsfOQEkxDbeFegvXmERSGvwDBb96xgwGblL4
         2TRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679311035;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ej94/Kf2ayKOl6sKdGGXBuRfCzrbNUluAKCrcQl4uhk=;
        b=1uhhgJk/pD1dKdPshSdMr53Kz2bNtcG8T0ziWTjG6bwGEjuE/9bDLakAEQLEAtamZo
         EGyFEQ9IwjMEUf8s5kRSaAVLddCclIVtCEhaqB16v/GKAqNIzRHlqwVpBUPP7+sZLihM
         kj+LMG+oizvURsSp0KKox7YSbeSDQ/DsxXfXTtp0/JyxvoBvqoDyThswOKpKla1UoxeA
         jip4ldWy1f8Nv/fmR0GqUwpR/05tXZCCy0e1g5wkdhNX/6bdpXHHwfi0G0lMfb/6YcjS
         Y5CP1FehGSY9dKdW3dCPAn+wlSDsb1OVjwqLMtwpY+KifCbvtngupavQ1uOkh/gNdEbY
         zgPA==
X-Gm-Message-State: AO0yUKUCuBN/q86+RN4NpDxtKYm+1ZSb9/uSb1downAmu1r0+Lkp4mdc
	/FG5CipZ9H1Qnl7Bhr3n+6JkjI/FQsw=
X-Google-Smtp-Source: AK7set/6gIrJkEJd8x0fd4KIbu1vcZ6uLTqeW1zak/FyYb/MyipjrMXnntss2zuqRo+erctGJdp4Xg==
X-Received: by 2002:ac2:5443:0:b0:4e1:13fa:bf07 with SMTP id d3-20020ac25443000000b004e113fabf07mr5961309lfn.43.1679311034859;
        Mon, 20 Mar 2023 04:17:14 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id u4-20020ac251c4000000b004db1a7e6decsm1655427lfm.205.2023.03.20.04.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 04:17:14 -0700 (PDT)
Message-ID: <b12a0baf-b7a0-80a2-fe78-08b3b227e0c5@gmail.com>
Date: Mon, 20 Mar 2023 12:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v2] mtd: Avoid printing error messages on probe deferrals
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
References: <20230307192506.439532-1-miquel.raynal@bootlin.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230307192506.439532-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_041719_492502_3BC0529D 
X-CRM114-Status: GOOD (  20.27  )
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

On 7.03.2023 20:25, Miquel Raynal wrote:
> There is no reason to complain about probe errors in case of deferrals.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> Changes in v2:
> * Use of dev_err_probe().
> 
>   drivers/mtd/mtdcore.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 0feacb9fbdac..e4e102585021 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -536,12 +536,11 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>   	mtd->nvmem = nvmem_register(&config);
>   	if (IS_ERR(mtd->nvmem)) {
>   		/* Just ignore if there is no NVMEM support in the kernel */
> -		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP) {
> +		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP)
>   			mtd->nvmem = NULL;
> -		} else {
> -			dev_err(&mtd->dev, "Failed to register NVMEM device\n");
> -			return PTR_ERR(mtd->nvmem);
> -		}
> +		else
> +			return dev_err_probe(&mtd->dev,	PTR_ERR(mtd->nvmem),
> +					     "Failed to register NVMEM device\n");

Even one more improvement request possibility and request from me:
"Failed to register NVMEM device: %d\n"

>   	}
>   
>   	return 0;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
