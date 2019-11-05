Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DA4C010DF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 12:37:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A302190F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 12:37:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NqQhX1yi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="diACuOPt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7A302190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oCT07Oau0e0kRhnHi0+s3A8g21TFFUGlQ1mQnC1aHM=; b=NqQhX1yiULHnmu
	TfqxLJcpv5vSlhn5S9PugqzChNGGS3k3zLqSzgTZc2JRgR1MNJUARnDpSpNa9AuJjK/KizBtPRJ/q
	ocNruj51Vf+HlaPAKIkNvuh+nTiMJOPN9mKvcmPollVNpmYKlCqoGfsuSNW8AgKjfTfVbFY/xsbPy
	EnAbdL6Ha3/cCtIFV/S5bVOuvB1mJ+2v087D42i7u5qCgmc1FT90f2+NVHb9FEZaEly1bnI1R1zE5
	aV6lyA8oD7r4OzzptCIZGvhXvwC2UwLGEue/OARNuTxQVWXVfQnawhS27UMyJM0roTHaO/gOJtrzX
	VeRduzoPKvABI3BYuVMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRy5Q-0007vf-9f; Tue, 05 Nov 2019 12:37:28 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRy5M-0007v2-Fh
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 12:37:25 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5CbLMS048959;
 Tue, 5 Nov 2019 06:37:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1572957441;
 bh=cCmaD8eE1fK00Mnm1DnRD4gZ7GKdETqTugixTFFcrzg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=diACuOPt/3Wh00a89YIc7Lb+EGZsAPs7USi6bPr+jRWny31oN8C2rM0UtOd8zbNWV
 TVkOA1GsSZmHBDMHJKmSew2EDEkX1CdEkyqDExZvzRY1kcocVyYaZfVxvSaQVdVUu+
 rVQJR8dQiWBVlSBpAaeOZeRkttQ5e3Bko/BW0Lmo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5CbLr8094660;
 Tue, 5 Nov 2019 06:37:21 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 06:37:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 06:37:06 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5CbI4m052932;
 Tue, 5 Nov 2019 06:37:19 -0600
Subject: Re: [PATCH v4 12/20] mtd: spi-nor: Print debug message when the read
 back test fails
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
 <20191102112316.20715-13-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <9474c875-94a1-3d19-ddab-b90d352967a9@ti.com>
Date: Tue, 5 Nov 2019 18:07:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191102112316.20715-13-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_043724_566008_95E3B905 
X-CRM114-Status: GOOD (  16.63  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/11/19 4:53 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Demystify where the EIO error occurs.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

I think this is a small enough change that can be squashed into previous
patch itself

>  drivers/mtd/spi-nor/spi-nor.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 8f5e9833081b..725dab241271 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -974,7 +974,12 @@ static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 status_new)
>  	if (ret)
>  		return ret;
>  
> -	return (nor->bouncebuf[0] != status_new) ? -EIO : 0;
> +	if (nor->bouncebuf[0] != status_new) {
> +		dev_dbg(nor->dev, "SR: read back test failed\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
>  }
>  
>  /**
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
