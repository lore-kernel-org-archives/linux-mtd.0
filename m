Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39169C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:17:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B16D205C9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VePZWZN/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CghccxBU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B16D205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=w1rMkkD4KmjE0/oE+JlLN48aL7DuTauGjs6gi6pmMLk=; b=VePZWZN/R2P5j4RaykunSba9dH
	nk9bHORAasoSVQO8ES6VgYiGEV8vp2QkoEDz2IUY0OsfrGwARHdA4kOU3VNCnZmUm34i4/emhCpDX
	IpbjSGp+E3q5nP08tIVxMESRZfWPnPSSv3M8aaru3Ozxb/g0pMYAi2rljymMYe2xaEMXfCRSW305h
	zqiaYb1BwmJ0wIq0CsMDkN3JsZ5ms3gFPXYUzz3hbDVl5kTe3k0cGgaT7C2hgfDasw3X9OYxLPOKb
	X0v7k6v+Thy2F/4F2FjHs1VKxFYeIHMf0QTPtm8TpE4XKrY8DolnNJKyzh0wRlQ/R8AuT34VABGsJ
	MCUNnGdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2VjT-0004oj-N1; Tue, 27 Aug 2019 07:17:35 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2VjQ-0004oE-W9
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 07:17:34 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R7HS4E109122;
 Tue, 27 Aug 2019 02:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566890248;
 bh=UvGr58rtN03eIkHD4DvxAdBSblKpfOjPOmb9gQbbkUs=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=CghccxBUAQ+f5RSa3NhMri+VWSg7VKMUqNedP6W4SJm8SzYpkSx8NsvOwU1dVaSpe
 hgJQzI9y8kywKUiYUBEAcpuE8FEiwIMh4CtMOiG2XfjCpQvpm8WJmD3Q3i5xLdDRuB
 lyCEqpLNPQxkEc5EhHlkVYlWUbGMkLdiBajY80jU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R7HSGv104197
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 02:17:28 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 02:17:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 02:17:28 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R7HPlF088245;
 Tue, 27 Aug 2019 02:17:26 -0500
Subject: Re: [RESEND PATCH v3 15/20] mtd: spi-nor: Add s3an_post_sfdp_fixups()
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-16-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1f4e039a-3cb0-f1c6-1947-bf7289f93da6@ti.com>
Date: Tue, 27 Aug 2019 12:48:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826120821.16351-16-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_001733_119487_020F2CB3 
X-CRM114-Status: GOOD (  20.26  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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



On 26/08/19 5:39 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> s3an_nor_scan() was overriding the opcode selection done in
> spi_nor_default_setup(). Set nor->setup() method in order to
> avoid the unnecessary call to spi_nor_default_setup().
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

> v3: no changes, rebase on previous commits
> 
>  drivers/mtd/spi-nor/spi-nor.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 2aca56e07341..edf1c8badac9 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2718,7 +2718,8 @@ static int spi_nor_check(struct spi_nor *nor)
>  	return 0;
>  }
>  
> -static int s3an_nor_scan(struct spi_nor *nor)
> +static int s3an_nor_setup(struct spi_nor *nor,
> +			  const struct spi_nor_hwcaps *hwcaps)
>  {
>  	int ret;
>  
> @@ -4530,6 +4531,11 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
>  	nor->mtd.erasesize = nor->info->sector_size;
>  }
>  
> +static void s3an_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	nor->params.setup = s3an_nor_setup;
> +}
> +
>  /**
>   * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
>   * after SFDP has been parsed (is also called for SPI NORs that do not
> @@ -4551,6 +4557,9 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
>  		break;
>  	}
>  
> +	if (nor->info->flags & SPI_S3AN)
> +		s3an_post_sfdp_fixups(nor);
> +
>  	if (nor->info->fixups && nor->info->fixups->post_sfdp)
>  		nor->info->fixups->post_sfdp(nor);
>  }
> @@ -4899,12 +4908,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		return -EINVAL;
>  	}
>  
> -	if (info->flags & SPI_S3AN) {
> -		ret = s3an_nor_scan(nor);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	/* Send all the required SPI flash commands to initialize device */
>  	ret = spi_nor_init(nor);
>  	if (ret)
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
