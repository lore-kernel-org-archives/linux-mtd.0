Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2975CA9EC3
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 11:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69703208C0
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 11:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UpnHNxfN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69703208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bF8cb5+9qVLNIrTwOm3VMuQ4gkx8bc3N2D+UZStUJGc=; b=UpnHNxfN/XGfaI
	jfTPHrbUi3v5Ioi8HEnKM9UhyDRlvzijUwgzGmpiFayvKlwFMTG7QvLprY/4lR6GaCM1xvOzQ9Ly/
	LQ2js1sLfU0Q3Q/9AxStOxC68GUFNf5+UJlhkATw7+kzEOv3paAQiyXWxj/SwOlAQeBNy8LmSQUVM
	az7J0alK/3EYdFqDQDspvbcYZf/ylQkg0ZQCozSoWVtXUNsuk4ofCy84ZyzTurectZ2f07Jt9sneC
	s+BxvH9aptycc8X94dLBhpIp/dW3+xaLGIZDauCX0r9onKz29JrastmRMUeAzR+ZMhpRXee2tQ4Aj
	qXgueQndVcnxO3BD7ETw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ8Fa-0006ir-5U; Thu, 31 Oct 2019 11:04:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ8DT-0004ss-34
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 11:02:12 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 18CD8290601;
 Thu, 31 Oct 2019 11:02:07 +0000 (GMT)
Date: Thu, 31 Oct 2019 12:02:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v3 12/32] mtd: spi-nor: Void return type for
 spi_nor_clear_sr/fsr()
Message-ID: <20191031120204.5bd60bde@collabora.com>
In-Reply-To: <20191029111615.3706-13-tudor.ambarus@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-13-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_040211_297635_34D7F45A 
X-CRM114-Status: GOOD (  14.23  )
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

On Tue, 29 Oct 2019 11:17:07 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> spi_nor_clear_sr() and spi_nor_clear_fsr() are called just in case
> of errors. The callers didn't check their return value, make them
> of type void.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 4a1ecf452a39..e5ed9012cd50 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -654,7 +654,7 @@ static int s3an_sr_ready(struct spi_nor *nor)
>  	return !!(nor->bouncebuf[0] & XSR_RDY);
>  }
>  
> -static int spi_nor_clear_sr(struct spi_nor *nor)
> +static void spi_nor_clear_sr(struct spi_nor *nor)
>  {
>  	if (nor->spimem) {
>  		struct spi_mem_op op =
> @@ -690,7 +690,7 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
>  	return !(nor->bouncebuf[0] & SR_WIP);
>  }
>  
> -static int spi_nor_clear_fsr(struct spi_nor *nor)
> +static void spi_nor_clear_fsr(struct spi_nor *nor)
>  {
>  	if (nor->spimem) {
>  		struct spi_mem_op op =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
