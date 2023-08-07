Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BA7C41513
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 06:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epuJ5Ka9LaJVVBPcM+m9IORg+eXNcXQ8O5XInzrvz7E=; b=nvh/dNB6di8la+/undqUXUJ7YX
	U3h+xv/fi40CSU2s3XU9yUN+CPsUbOeLl88MGZS70wTQL6/RiL1itNRneWgK4WShs5juwtJh3SL5Z
	6ZUbzUT3ucVcbIqzjCykbI4Ep7PMtM8wLveMBMSHl53jKt0jNbFcY8kps/XAe2F4rNSkNexvllTgI
	nITwvHNcKY5H+V1GmuEWu/8cZYTGDKkuJNM8s1lfWhQQjUNGuQVquwJRjlj70ix/i/3REKNBrr8ZA
	StE5/WIbOLQ1yIgk1oKfiSRRgIH87Avg+yMSZwyCUqcvFgVNz9550dJnRVMAbOEMoYXZ6oMZE8ocO
	C6KNOtlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qStuz-00GHay-0e;
	Mon, 07 Aug 2023 06:40:41 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qStuv-00GHZp-2z
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 06:40:39 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 62CEB5D1;
	Mon,  7 Aug 2023 08:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1691390432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ByWaRzM3MTOGAtWP0yAvEswK+kbitSfCP88xMeDAYEg=;
	b=0ytufyTAYzkVQYBsl1pHg35v/S3GeznRNiU1aYqB6bwI6x95SRp1X1/fahAT233tDZzmQZ
	wu4Nf8x4ALcrIFuYuajGI/HRH9+3u59+fbga7X2ZnlaY7mvEF3heeDLkirtdp0sBqQsdy7
	AOlL4iIbk6417zaLx7tbbbZAF5cudkQu/9Pm3hZ0hlKUxJaA8vwLhSnIS/gMnL9dDggJqA
	Li3HNQrxmhwy/Z/6Z9hBAQ9gkbVJtjZ7XfDzazloN/0dXuMrPYeD5EJue6q4kdTKJVTvhM
	VlkuQnB4m2EymdMwqNYRXj/XKHAK/qWqN+VCoaxF9iHZAEybXmixaKC2qw7UTA==
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 08:40:32 +0200
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v3 3/5] spi: spi-mem: Allow specifying the byte order in
 DTR mode
In-Reply-To: <20230804095409.278419-4-jaimeliao.tw@gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-4-jaimeliao.tw@gmail.com>
Message-ID: <49a226a128a908c4d99238246bbd09b2@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_234038_351250_2AD565BD 
X-CRM114-Status: GOOD (  23.85  )
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

Am 2023-08-04 11:54, schrieb Jaime Liao:
> From: JaimeLiao <jaimeliao@mxic.com.tw>

This doesn't match..

> 
> There are NOR flashes (Macronix) that swap the bytes on a 16-bit
> boundary when configured in Octal DTR mode. The byte order of
> 16-bit words is swapped when read or written in Octal Double
> Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
> modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
> 8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
> Swapping the bytes may introduce some endianness problems. It can
> affect the boot sequence if the entire boot sequence is not handled
> in either 8D-8D-8D mode or 1-1-1 mode. So we must swap the bytes
> back to have the same byte order as in STR modes. Fortunately there
> are controllers that could swap the bytes back at runtime,
> addressing the flash's endiannesses requirements. Provide a way for
> the upper layers to specify the byte order in Octal DTR mode.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

.. this. If you pick up a patch from another author, you should
keep the author of the patch.

-michael

> ---
>  drivers/spi/spi-mem.c       | 3 +++
>  include/linux/spi/spi-mem.h | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index edd7430d4c05..fd6b1c69ab9b 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -171,6 +171,9 @@ bool spi_mem_default_supports_op(struct spi_mem 
> *mem,
>  	if (op_is_dtr) {
>  		if (!spi_mem_controller_is_capable(ctlr, dtr))
>  			return false;
> +		if (op->data.dtr_swab16 &&
> +		    !(spi_mem_controller_is_capable(ctlr, dtr_swab16)))
> +			return false;
> 
>  		if (op->cmd.nbytes != 2)
>  			return false;
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 8e984d75f5b6..9da6d53a29a3 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -89,6 +89,8 @@ enum spi_mem_data_dir {
>   * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or 
> not
>   * @data.buswidth: number of IO lanes used to send/receive the data
>   * @data.dtr: whether the data should be sent in DTR mode or not
> + * @data.dtr_swab16: whether the byte order of 16-bit words is swapped 
> when read
> + *		     or written in Octal DTR mode compare to STR mode
>   * @data.ecc: whether error correction is required or not
>   * @data.dir: direction of the transfer
>   * @data.nbytes: number of data bytes to send/receive. Can be zero if 
> the
> @@ -120,6 +122,7 @@ struct spi_mem_op {
>  	struct {
>  		u8 buswidth;
>  		u8 dtr : 1;
> +		u8 dtr_swab16 : 1;
>  		u8 ecc : 1;
>  		enum spi_mem_data_dir dir;
>  		unsigned int nbytes;
> @@ -290,10 +293,13 @@ struct spi_controller_mem_ops {
>  /**
>   * struct spi_controller_mem_caps - SPI memory controller capabilities
>   * @dtr: Supports DTR operations
> + * @dtr_swab16: Supports swapping bytes on a 16 bit boundary when 
> configured in
> +		Octal DTR
>   * @ecc: Supports operations with error correction
>   */
>  struct spi_controller_mem_caps {
>  	bool dtr;
> +	bool dtr_swab16;
>  	bool ecc;
>  };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
