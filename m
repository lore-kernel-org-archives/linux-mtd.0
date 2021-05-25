Return-Path: <SRS0=nVbp=KU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F1EC4707F
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 23:17:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38EFE61042
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 23:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38EFE61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/LDkAMTgmaFPcCM+hJVLZho9VSqeSTfslfPZwl9xd0=; b=IaPQFYixMbJ1Vb
	rEr9YiogyzZsRsqV/ZF76ZVNvQH+n/b2HrtJuqTfjlUvhtpFfaMNYoR2xBiNO6JLa9lnAULimEwwE
	q31oKRugFudtzeqnVLz8GPywhCo08pKLhPzR5T16a4SfReGL7XiCMlEAWsp7P8KlYAoHMghpFaNEG
	/tFrAP5jteaeZlewpFH12I4ldEfSbCGeBp4zWI57yCZZ7McxXoi9rouuUffUsqgq3HNIFeBLgvQCQ
	dcYZ1mV6Zdb6kqkugX4aV1+qVZFIDB7QCRywF0Qf5lsLC/W0mV7Kia2qQwOhUZ5HYUorYsJqJBgQM
	QV4O3vCFJXgux0J0EboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llgHn-0097a1-Mr; Tue, 25 May 2021 23:16:31 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llgHk-0097Yy-Qg
 for linux-mtd@lists.infradead.org; Tue, 25 May 2021 23:16:30 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so19075145otk.5
 for <linux-mtd@lists.infradead.org>; Tue, 25 May 2021 16:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kRJQsbr4UUik0+tRstjeKX41a8OCpXExPGyFvaZBojo=;
 b=S6AlfPL+fzQsW5ZhJXqX6HilwyQpM0VVd4UGRsd4EWTTxINvJTxex+kdlEBu5CBzG0
 +RBWxaHB9Py9EK54p3ps7VTypiJ6pHMwQYh7BmaylgxU8ZABz9+D65de+m3xN1nscyrK
 HJ/+vT70ggO8bet/hswCbgsbyKw6B1NftmW5ZSdGbonrGR5Wie8cpKaXwZ+fwGDd/fGA
 OMECgWdd4S94g23go+HyKqjV/hL5lzgMNfZPTvvj2sAaanAm8skW31heVNujm4w8Vuh1
 1nmJQ5mPfD0EKlBHJeydrnKSBci/2AwD0Z1+EFR43V3pLT48sGCSOJI1uxfg4RUmkaBz
 gOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kRJQsbr4UUik0+tRstjeKX41a8OCpXExPGyFvaZBojo=;
 b=O6JjD+Pn/1Ao0CKd/A5rLnn/BgITe3oD5mIDGuJEkgaXme9f/flDAYCU8akkvRyp5L
 Iw6GUC8CiKXzt9fuTPAPPi1EQfqgTu6+kW+OKbP7BWD8O0ZRToSdOrEXnXRUO8NNWZxi
 7frIp+7aDM4I1F9un6KPsFp2YKHHMbYLIPCz4yq8ngFzj+btQ2Nf5sl69biwdsX44lEH
 wVxoGsVIajKyTp2eC5gMniEcMAfNnSbv213NldiMtsdehXkrZBzl206XWlzE53L8erUx
 JpIY4cbz1dncamK7UeydAvTWmTwTVXRZf25ZbICFu9Nah/2igESy7ZBV7pCpbSicUR5G
 Uulg==
X-Gm-Message-State: AOAM532tZ6PgogsIid8X1V9Z+ddrf7lQlyqncZZU3gENFvfLcJ7YbGyf
 Pdipxzj3dJn7J7IrJSREh2LsQA==
X-Google-Smtp-Source: ABdhPJw9o+Oklb8frPMTtU40dTfwPoeGJOz2hCTCxQw/e0eWfUHbRnHaeS2PfEOGSn57ftpNNrXmBg==
X-Received: by 2002:a9d:728b:: with SMTP id t11mr73613otj.230.1621984587274;
 Tue, 25 May 2021 16:16:27 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id i17sm1237661oou.37.2021.05.25.16.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 16:16:26 -0700 (PDT)
Date: Tue, 25 May 2021 18:16:24 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: parsers: qcom: Fix leaking of partition name
Message-ID: <YK2FSM5UDZhGQN0n@yoga>
References: <20210525230931.30013-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525230931.30013-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_161628_929154_FEB4C09C 
X-CRM114-Status: GOOD (  21.41  )
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

On Tue 25 May 18:09 CDT 2021, Ansuel Smith wrote:

> Add cleanup function as the name variable for the partition name was
> allocaed but never freed after the use as the add mtd function
> duplicate the name and free the pparts struct as the partition name is
> assumed to be static.
> The leak was found using kmemleak.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/mtd/parsers/qcomsmempart.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> index d9083308f6ba..06a818cd2433 100644
> --- a/drivers/mtd/parsers/qcomsmempart.c
> +++ b/drivers/mtd/parsers/qcomsmempart.c
> @@ -159,6 +159,15 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	return ret;
>  }
>  
> +static void parse_qcomsmem_cleanup(const struct mtd_partition *pparts,
> +				   int nr_parts)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr_parts; i++)
> +		kfree(pparts[i].name);
> +}
> +
>  static const struct of_device_id qcomsmem_of_match_table[] = {
>  	{ .compatible = "qcom,smem-part" },
>  	{},
> @@ -167,6 +176,7 @@ MODULE_DEVICE_TABLE(of, qcomsmem_of_match_table);
>  
>  static struct mtd_part_parser mtd_parser_qcomsmem = {
>  	.parse_fn = parse_qcomsmem_part,
> +	.cleanup = parse_qcomsmem_cleanup,
>  	.name = "qcomsmem",
>  	.of_match_table = qcomsmem_of_match_table,
>  };
> -- 
> 2.31.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
