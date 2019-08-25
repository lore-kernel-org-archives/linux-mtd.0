Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A89C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:36:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF872070B
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:36:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pk5KcCWf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF872070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFXN8jcuP4/aVZ+xOWTcMQCSnnTsvMUvUMsEiBP4S24=; b=pk5KcCWfRK2zZW
	xJNhRLjp++Kf+ASXF8sKOfVb9o0+i/Y2k6io+WQLxrsPSOl0limETBiEDEGo5AJyEk5Uo890zTQS/
	l5WHf0AgoFhSkT+g7sWW1G1vJgLPxIxr8xrThbghZtdc06JAZFqB89sab0x258WhcPxQ9/4Dnz4hL
	ASYimxPbMVN13UD8SgyepVGS+FdoxxiNl+WAxwvQ38FJTTXt4I4vYimTRhW3nJFIxMePJvmMT0wkJ
	EGBciYL/OqWXOrtXFkNGMNZWenj2EVe6J4ZuRPq1iK9nHCuhNPW3A+snt2aH8ktufWkequQDzn1y9
	4vnGyb1Zj73tpOaG3xgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1rl3-00039D-SI; Sun, 25 Aug 2019 12:36:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1rl1-00038r-HZ
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 12:36:32 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CA4A628A1AB;
 Sun, 25 Aug 2019 13:36:29 +0100 (BST)
Date: Sun, 25 Aug 2019 14:36:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 5/6] mtd: spi-nor: Add s3an_post_sfdp_fixups()
Message-ID: <20190825143626.2ad09b8f@collabora.com>
In-Reply-To: <20190824120650.14752-6-tudor.ambarus@microchip.com>
References: <20190824120650.14752-1-tudor.ambarus@microchip.com>
 <20190824120650.14752-6-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_053631_714804_5B92D74D 
X-CRM114-Status: GOOD (  17.78  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 24 Aug 2019 12:07:16 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> s3an_nor_scan() was overriding the opcode selection done in
> spi_nor_default_setup(). Set nor->setup() method in order to
> avoid the unnecessary call to spi_nor_default_setup().
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

I guess you checked that nothing in the S3AN init was relying on things
done in the default_setup() implementation.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 17e6c96f9f9a..5e16f293a83b 100644
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
> @@ -4546,6 +4547,11 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
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
> @@ -4567,6 +4573,9 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
>  		break;
>  	}
>  
> +	if (nor->info->flags & SPI_S3AN)
> +		s3an_post_sfdp_fixups(nor);
> +
>  	if (nor->info->fixups && nor->info->fixups->post_sfdp)
>  		nor->info->fixups->post_sfdp(nor);
>  }
> @@ -4932,12 +4941,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
