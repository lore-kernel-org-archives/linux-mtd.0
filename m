Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6426CA9EC3
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 11:14:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A732A2087F
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 11:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n2Psncbt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A732A2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7A9pgs/QjoWavdyvadi0//hQDe5l3sqKlr9/RRxbV90=; b=n2PsncbtQGj3TC
	XxYdZkeWk6343Vjgd0mvEQ7gAbKEk7NFBjiEg8+nfhPheFflr2R5zTuOChE7OuRmMxQBMFGMNvYR4
	3dNDIWHhIQUs+mVTgMLHCJejRlDGLEnKgJlTCgy8smeXWAuZ/4XRCqpbqtzjJi9gp8TcQFAIBq/Rb
	EHsXXtinkr+MpTtR9wkEm561B51hLMMGMi5kHbSynmuhm+DBILkaLayf52ir9Z5GbZGKYR59iHapq
	iyayPAmFUPgHI5bwaPKQLanUxsxaMF+0J0GjkM9rBrwPQGoCUt1duUo3AE+y3F87BiB3cu0u+GI6H
	0ccU58XlYFh2j8BhiB1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ8PO-0003gu-Tu; Thu, 31 Oct 2019 11:14:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ8PL-0003g8-Be
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 11:14:28 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B990728F256;
 Thu, 31 Oct 2019 11:14:25 +0000 (GMT)
Date: Thu, 31 Oct 2019 12:14:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v3 16/32] mtd: spi-nor: Rename label as it is no longer
 generic
Message-ID: <20191031121423.4c7d2684@collabora.com>
In-Reply-To: <20191029111615.3706-17-tudor.ambarus@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-17-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_041427_530740_A5FC2F7E 
X-CRM114-Status: GOOD (  15.72  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 29 Oct 2019 11:17:13 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Rename 'sst_write_err' label to 'out' as it is no longer generic for
> all the errors in the sst_write() method, and may introduce confusion.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 21f01fdcfa16..ed7c233a7208 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2705,7 +2705,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>  
>  	ret = spi_nor_write_enable(nor);
>  	if (ret)
> -		goto sst_write_err;
> +		goto out;
>  
>  	nor->sst_write_second = false;
>  
> @@ -2716,11 +2716,11 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		/* write one byte. */
>  		ret = spi_nor_write_data(nor, to, 1, buf);
>  		if (ret < 0)
> -			goto sst_write_err;
> +			goto out;
>  		WARN(ret != 1, "While writing 1 byte written %i bytes\n", ret);
>  		ret = spi_nor_wait_till_ready(nor);
>  		if (ret)
> -			goto sst_write_err;
> +			goto out;
>  
>  		to++;
>  		actual++;
> @@ -2733,11 +2733,11 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		/* write two bytes. */
>  		ret = spi_nor_write_data(nor, to, 2, buf + actual);
>  		if (ret < 0)
> -			goto sst_write_err;
> +			goto out;
>  		WARN(ret != 2, "While writing 2 bytes written %i bytes\n", ret);
>  		ret = spi_nor_wait_till_ready(nor);
>  		if (ret)
> -			goto sst_write_err;
> +			goto out;
>  		to += 2;
>  		nor->sst_write_second = true;
>  	}
> @@ -2745,32 +2745,32 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>  
>  	ret = spi_nor_write_disable(nor);
>  	if (ret)
> -		goto sst_write_err;
> +		goto out;
>  
>  	ret = spi_nor_wait_till_ready(nor);
>  	if (ret)
> -		goto sst_write_err;
> +		goto out;
>  
>  	/* Write out trailing byte if it exists. */
>  	if (actual != len) {
>  		ret = spi_nor_write_enable(nor);
>  		if (ret)
> -			goto sst_write_err;
> +			goto out;
>  
>  		nor->program_opcode = SPINOR_OP_BP;
>  		ret = spi_nor_write_data(nor, to, 1, buf + actual);
>  		if (ret < 0)
> -			goto sst_write_err;
> +			goto out;
>  		WARN(ret != 1, "While writing 1 byte written %i bytes\n", ret);
>  		ret = spi_nor_wait_till_ready(nor);
>  		if (ret)
> -			goto sst_write_err;
> +			goto out;
>  
>  		actual += 1;
>  
>  		ret = spi_nor_write_disable(nor);
>  	}
> -sst_write_err:
> +out:
>  	*retlen += actual;
>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
>  	return ret;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
