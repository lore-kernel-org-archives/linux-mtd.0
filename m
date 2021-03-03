Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FAFC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 23:24:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 125D364F14
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 23:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 125D364F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PnSLfen5gvVZbp+yykHj+3nyqzKn1l3HGCMD/oUOAZ4=; b=nTEy22LDyisuhvhcMYhvAdtlN
	okIVjY76g9Rhn5l+khJiIAegP/fgO1dqdqu1T5KjZ7RobPTCaifFeurnNJZ1T2UryNUVHWK0Z2s15
	BhKcK69zaaG33qwcJNQ1alEh1XkmauMhCVG3zJMLZgQMVvHnRhg7C+B/VEfmTDiDrX2LmmYP5mLym
	VKKXm/5BrWv/iDnnx3W+ELzuRETs5eJZ9C7VmVQ2n2HBRY00RmiRPYD4uIgpshhKTTPFIPiRufASs
	DLj9oGO5/j4l9oiTsKzaMG15sM3nO4mXVPg+Hihz3TwDEWhmafWwtu/HqaL4W+30fB263OSAsxn9n
	lTpn3NRLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHapf-006w7F-Mz; Wed, 03 Mar 2021 23:23:08 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHUJ4-005ajm-EK
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 16:25:07 +0000
Received: by mail-pg1-x52d.google.com with SMTP id a4so16718976pgc.11
 for <linux-mtd@lists.infradead.org>; Wed, 03 Mar 2021 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=22eXr4vra9rpNLE/QH49970c8CJamZsqZaJDgMguOGY=;
 b=zwOu6m3orveqn59Tt2XlOGKTkxS48WAQZPw4kWeQvhK6XMR0H+x90PdKrt3pGc8Qln
 oRf+yvUCG6NOwWmhpo5uSyggwkVsTS6Z/vfivSOoTD5WqzIspXLsdxlfOQl8O0KAX/I8
 aR+biKBFc+efxM+Eft+65xnHA+WvA5Hfv0o0O1nLx6NVFa9vvHXhQqHOxchBQ1xEe3op
 CKXWJGJBCtUqIwbqAPjpj0ZqugBbNHED1F32BilMX6cNAe4q7T+rMZTNlMCJL7ADZiCQ
 Ut2W1k1HI6sTsLn4UVbnVnG9pgl8K3YFmix1ziOTI01S8pqyQsG1b9kmpVPwGYZC90hc
 PoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=22eXr4vra9rpNLE/QH49970c8CJamZsqZaJDgMguOGY=;
 b=BVX0X3MgmSlzkhy5Bj/eP57wqvnpNcMsvmeHKeqW7BrieT3Ql9grBj1I6wCJellbvf
 RedtDqX7xfGxiqHaLW4IrwV4OjZIkEiKS09G0YB2nmleFGdzH7TZ5n3X8YqkDBiivWyO
 vXPnsvHe2laMsAquAFat4fVdBt3m+2jFWOOsn5lwdQC6oiOy5Fk5rxIb9XPmm0G2PQcJ
 P3kkrnrj5IMJcG1eRbrQplPXSiw+moANcW8oCKSvmft0H1TwGLYR8Iz52LD20sw6b3Cj
 KM09QfOzGB1ZC84FfcB4MM1S19GacvuF4+GTF+ot8VrAzQuuFPjX0J8Ra/9NURhcDltv
 tdOw==
X-Gm-Message-State: AOAM532rPqfqw8lbW3bbqxKcjR0G4Fs00NTpAxAmo9z30xXMSa1m/TNV
 v6lbEb6SO7gSm4xpKosFUjtAxQKT3GM/
X-Google-Smtp-Source: ABdhPJxPltBTg/gxSy7GFFkRDGCXfCeGVfBIAL5O6cYLXxhbKHlmaS2zoPg1WReewfw/cE+YpkTawA==
X-Received: by 2002:a63:5962:: with SMTP id j34mr23432991pgm.331.1614788699065; 
 Wed, 03 Mar 2021 08:24:59 -0800 (PST)
Received: from thinkpad ([2409:4072:1d:4075:f412:a448:6d6c:cb4d])
 by smtp.gmail.com with ESMTPSA id r31sm17993312pgm.11.2021.03.03.08.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 08:24:58 -0800 (PST)
Date: Wed, 3 Mar 2021 21:54:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baruch Siach <baruch@tkos.co.il>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: qcom: incompatible with spi-nor 4k sectors
Message-ID: <20210303162452.GA4319@thinkpad>
References: <71e3fe832d35bd34a7da87146ba7d52f89278665.1614780732.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71e3fe832d35bd34a7da87146ba7d52f89278665.1614780732.git.baruch@tkos.co.il>
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

On Wed, Mar 03, 2021 at 04:12:12PM +0200, Baruch Siach wrote:
> Partition size and offset value are in block size units, which is the
> same as 'erasesize'. But when 4K sectors are enabled erasesize is set to
> 4K. Bail out in that case.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/mtd/parsers/qcomsmempart.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> index 808cb33d71f8..f851574e1b52 100644
> --- a/drivers/mtd/parsers/qcomsmempart.c
> +++ b/drivers/mtd/parsers/qcomsmempart.c
> @@ -65,6 +65,13 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	int ret, i, numparts;
>  	char *name, *c;
>  
> +	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS)
> +			&& mtd->type == MTD_NORFLASH) {
> +		pr_err("%s: SMEM partition parse is incompatible with 4K sectors\n",

s/parse/parser

With that and the fixes tag,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> +				mtd->name);
> +		return -EINVAL;
> +	}
> +
>  	pr_debug("Parsing partition table info from SMEM\n");
>  	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
>  	if (IS_ERR(ptable)) {
> -- 
> 2.30.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
