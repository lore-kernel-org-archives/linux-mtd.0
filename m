Return-Path: <SRS0=nVbp=KU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF596C2B9F8
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 03:56:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F22F61260
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 03:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F22F61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0Hb2F41S5+kjQoOK0n9CF8zcCnEbJqqkcHh+jduQJA=; b=X4WazK83yy1aRP
	LFaLLUzrm/vY0xgN2AZ6GCG6bMOHwJWh8R/MEqI78B8iSbRnee8rzOUHsnzcdu9g0CjzYZot/LWWy
	Z0mZxGexIlR0MOUfoBWizDteiljAHIJ8ALlnEEFqh5Cd9wGn5Op1w5ZMYfimyOi+3kujQYQP/+p5A
	sdjL9Q4uqXfjLPADRApKH6/GpAe7QLI9m9ERmjYlqAgBusUU0SlQZAIiihxBt0YqENtahCSrnpU1X
	a3EPnJyFOvGEZ5mWr9QiWltUrN2zv3l7bSNwxEZEzEUoUYLok2Peha2x8zU3zlUE/0bvARG1XkZvm
	WZX+9H5W+k1dmg9KuY/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llOAz-003EqG-Sj; Tue, 25 May 2021 03:56:18 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llNtp-003AcB-7S
 for linux-mtd@lists.infradead.org; Tue, 25 May 2021 03:38:34 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 66-20020a9d02c80000b02903615edf7c1aso5437267otl.13
 for <linux-mtd@lists.infradead.org>; Mon, 24 May 2021 20:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=l5R619Q1zWvoFWxXu9dLdrHOdI9Uxbo2XfaR/PsqP/w=;
 b=IerDmGwEhA8080Vgc39jnga4/cCYN+pcVLDsHy0yqapQfvzIs14sDM7W2+uLZ6t/Me
 H3D7i/ZoUgC0XoVw4sLROZ1ylqiZentIDBvs5EajzQT0XUnDH2tOvaYGcc3uMwAnuDgH
 hP4YnEYc8IVq0UTIMH9cSIhmxawddEmXoojv2++HQkR/UaMM1HOf+HqgHmyxwkvGC0rb
 c9mZXcv1hZDoH88sGbb461aDbg28xTgvqQsvo27ntxDW7KJLUq9VxA2qOdGGXW6P2GSU
 OoqMsT3CPxyDMxKqw1Y3axUY8zx5wqvphGcnbC42z0Jqqi0ssMRarmZYXco7NGyGQJki
 sVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l5R619Q1zWvoFWxXu9dLdrHOdI9Uxbo2XfaR/PsqP/w=;
 b=oYeKtI+qgulrUEFNE7K+6judqXu/3cppg79tNSA/UXAUeWaSEoe98BvJkbTiiJac79
 b68m023K3BM49DMXvI7ZmXlMmir5WhL9eGG8Mk3SenebmupQrUjoTdgBpL7RIRpGpdor
 BxkWLMHFj2IR1/aXe4B5O2UNhSEgu/WJuAmDZqfGGO+npcBRcXlihFn1G440bS1mtW3H
 KPQmJQkwKqqfSoF7U8+pTo72YaLPAs9RqXzn1u7kuFWdQuoK9xIZY9iUmzrHhlTy6jE9
 9+dEgBcQpwz4bR1cL+QOZxaE7L/c98YFbBQXIyvWPrpa11cpQJkQEv+sb19xZiyF7pFZ
 FNSw==
X-Gm-Message-State: AOAM533KPJkohH2g7bta6kaGPJbG68JrVyGG9kHgmbHOVxLkD0iQuhCu
 T2N6L9XmzaMO1shFPVG/VrnYoQ==
X-Google-Smtp-Source: ABdhPJy+tUAVjYl81RpF00SVIPiVQYnS4lBr2iISxLqCvTBDx3I+NrN/q07EivJanpGKT10snnedyA==
X-Received: by 2002:a9d:6255:: with SMTP id i21mr21299550otk.284.1621913911778; 
 Mon, 24 May 2021 20:38:31 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x24sm3499384otq.34.2021.05.24.20.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 20:38:31 -0700 (PDT)
Date: Mon, 24 May 2021 22:38:29 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: qcom: Fix leaking of partition name
Message-ID: <YKxxNY8d/M1fXWr9@yoga>
References: <20210525001449.10386-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525001449.10386-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_203833_317071_C7BF7A4B 
X-CRM114-Status: GOOD (  21.56  )
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

On Mon 24 May 19:14 CDT 2021, Ansuel Smith wrote:

> Partition name are already allocated and defined by the ptable struct.
> Skip reallocation of name variable and directly lowercase the name in
> the ptable struct. The name variable was duplicated but never freed.
> The leak was found using kmemleak.
> 

We know that SMEM_AARM_PARTITION_TABLE is accessed by at least the modem
firmware, so I don't think we should change it in place.

I think the appropriate solution is to implement the "cleanup" operation
in struct mtd_part_parser.

Regards,
Bjorn

> Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/mtd/parsers/qcomsmempart.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> index d9083308f6ba..3d083f0815f8 100644
> --- a/drivers/mtd/parsers/qcomsmempart.c
> +++ b/drivers/mtd/parsers/qcomsmempart.c
> @@ -62,8 +62,8 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	struct smem_flash_ptable *ptable;
>  	size_t len = SMEM_FLASH_PTABLE_HDR_LEN;
>  	struct mtd_partition *parts;
> -	int ret, i, numparts;
> -	char *name, *c;
> +	int i, numparts;
> +	char *c;
>  
>  	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS)
>  			&& mtd->type == MTD_NORFLASH) {
> @@ -125,17 +125,11 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  		if (pentry->name[0] == '\0')
>  			continue;
>  
> -		name = kstrdup(pentry->name, GFP_KERNEL);
> -		if (!name) {
> -			ret = -ENOMEM;
> -			goto out_free_parts;
> -		}
> -
>  		/* Convert name to lower case */
> -		for (c = name; *c != '\0'; c++)
> +		for (c = pentry->name; *c != '\0'; c++)
>  			*c = tolower(*c);
>  
> -		parts[i].name = name;
> +		parts[i].name = pentry->name;
>  		parts[i].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
>  		parts[i].mask_flags = pentry->attr;
>  		parts[i].size = le32_to_cpu(pentry->length) * mtd->erasesize;
> @@ -149,14 +143,6 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	*pparts = parts;
>  
>  	return numparts;
> -
> -out_free_parts:
> -	while (--i >= 0)
> -		kfree(parts[i].name);
> -	kfree(parts);
> -	*pparts = NULL;
> -
> -	return ret;
>  }
>  
>  static const struct of_device_id qcomsmem_of_match_table[] = {
> -- 
> 2.31.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
