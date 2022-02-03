Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8CDC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Feb 2022 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=395aBc12PJzD1oJ2kXjC2iGzXlh+CBuSsrpbk0OgQgI=; b=wfkRE5kGOc+Pui
	9vdjmJXp122kaXWe5PGt6L2Q8IXkiiEo5OFtyvVCFrZ4OiiEJFCxxwheBsrLbNMOItRjxraSLD8p5
	BTxJce0ZF7bD95gi17wXHS5OIeqG8ybMttXWQk7QVZj4W0Tjv+Mea5X5Ut38OnwUE7UmPzQm1YMXq
	rfNh4MuvdyWAi5xEw0tf+iMkd+yNQNpNVmsH9W7E0OYqKXYa0XAnP5dyDQ9ZPedq18pRuHI7AvQT5
	Ljhbh6g0mbzYatKtlOJM52ITz3rGFao0gZjV744JzeaDLWmvQHn9oWdXYl9hRlZpxIPm4pqLw8v6w
	fDkg7aF5vi/lUMewgsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFXpd-000Qqw-7P; Thu, 03 Feb 2022 08:51:09 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFXpV-000Qq5-MK
 for linux-mtd@lists.infradead.org; Thu, 03 Feb 2022 08:51:07 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0BFDB22236;
 Thu,  3 Feb 2022 09:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643878256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWLyTzLiCMTyrA2bS62veID143vK3igfjly1sr6XYuE=;
 b=sJe7sNI5SnBLTsc1++xJ09Uj3yfCkCrs79MM8NHmF3O+3hpvvdGaA/b/hgGw15gjWKZ12M
 IxscW7cQh3rBa2w/zxdj7ur/1vPXFdXPkfeoZmfZpZ/mTHQILDoevcPOj4WHKor7gRpuvP
 hV9CHTgpS1XqWsIvb3VmaHm5+V3hV+g=
From: Michael Walle <michael@walle.cc>
To: broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v2 1/3] mtd: dataflash: Add SPI ID table
Date: Thu,  3 Feb 2022 09:50:44 +0100
Message-Id: <20220203085044.15177-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202143404.16070-2-broonie@kernel.org>
References: <20220202143404.16070-2-broonie@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_005102_438975_B4E6CA0C 
X-CRM114-Status: GOOD (  18.47  )
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

> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so ensure that
> module autoloading works for this driver by adding an id_table listing the
> SPI IDs for everything.
> 
> Fixes: 96c8395e2166 ("spi: Revert modalias changes")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/mtd/devices/mtd_dataflash.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
> index 734878abaa23..3ae18cbf5cd1 100644
> --- a/drivers/mtd/devices/mtd_dataflash.c
> +++ b/drivers/mtd/devices/mtd_dataflash.c
> @@ -112,6 +112,13 @@ static const struct of_device_id dataflash_dt_ids[] = {
>  MODULE_DEVICE_TABLE(of, dataflash_dt_ids);
>  #endif
>  
> +static const struct spi_device_id dataflash_spi_ids[] = {
> +	{ .name = "at45", },
> +	{ .name = "dataflash", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(spi, dataflash_spi_ids);
> +
>  /* ......................................................................... */
>  
>  /*
> @@ -938,6 +945,7 @@ static struct spi_driver dataflash_driver = {
>  
>  	.probe		= dataflash_probe,
>  	.remove		= dataflash_remove,
> +	.id_table	= dataflash_spi_ids,
>  
>  	/* FIXME:  investigate suspend and resume... */
>  };
> -- 
> 2.30.2

Looks like a duplicate of 27a030e872925.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
