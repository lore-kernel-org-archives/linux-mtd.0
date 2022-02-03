Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19E9C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Feb 2022 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6oxI/8kM+nXDFGLWka5AFL56ro4sSvFVFhYtZrMfFI=; b=GTvasfHIRKmS/T
	wKFO6CI2pzlLx6bA8pC99ERXmh//4pie/SOcf0S9zvN2AUH7fm7lpwJku8ueQyScJ3L9ba76Ci2+v
	noXM6wh9JYWKhkzxHJGRp17D/+P9mLu5kk/oZkF4yER9jD6ggVXFAz1ZRtRX9aTQzpkq7TPKftM2Z
	L6gmQuP2E2MrvrtXlIdovPmJZZSnY5N89qux0JZbiIJ8ZH0hBmYS5Anod/R/35EKDcnm66ubOPlSM
	IRRLQ2JEOrpWaEK6vs8AFgtPFt8xlIAVuefwcCbVLeHWWoHRhffBmeLyuA5Jef0O1vb3HF6oSj+TY
	uodM59CquQaIxpshfEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFXsQ-000ROL-1T; Thu, 03 Feb 2022 08:54:02 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFXsN-000RMa-TY
 for linux-mtd@lists.infradead.org; Thu, 03 Feb 2022 08:54:01 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 78ACF22236;
 Thu,  3 Feb 2022 09:53:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643878435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVS0qm0IGvLP0RLoeiWHS+ZuPSKmy2366honWam++Sw=;
 b=vfLQyXTnIzO6oDSu94tGUQv4jIKeI5/xfBKJiA494DBGTOGffprhUphctRRPICCHSLmdc5
 RfJARce5GG3aX/ky0dBfu8G1AxQw/122S/4b18icGZJnOGSc8zOwrlDoflL7ARhZAXwQc8
 XGIEVcJaktIntFD9KKViN+k0JDRhG3Q=
From: Michael Walle <michael@walle.cc>
To: broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v2 3/3] mtd: mchp48l640: Add SPI ID table
Date: Thu,  3 Feb 2022 09:53:51 +0100
Message-Id: <20220203085351.15694-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202143404.16070-4-broonie@kernel.org>
References: <20220202143404.16070-4-broonie@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_005400_154145_EB100818 
X-CRM114-Status: GOOD (  17.99  )
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
>  drivers/mtd/devices/mchp48l640.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
> index 231a10790196..b9cf2b4415a5 100644
> --- a/drivers/mtd/devices/mchp48l640.c
> +++ b/drivers/mtd/devices/mchp48l640.c
> @@ -359,6 +359,15 @@ static const struct of_device_id mchp48l640_of_table[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mchp48l640_of_table);
>  
> +static const struct spi_device_id mchp48l640_spi_ids[] = {
> +	{
> +		.name = "48l640",
> +		.driver_data = (kernel_ulong_t)&mchp48l640_caps,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, mchp48l640_spi_ids);
> +
>  static struct spi_driver mchp48l640_driver = {
>  	.driver = {
>  		.name	= "mchp48l640",
> @@ -366,6 +375,7 @@ static struct spi_driver mchp48l640_driver = {
>  	},
>  	.probe		= mchp48l640_probe,
>  	.remove		= mchp48l640_remove,
> +	.id_table	= mchp48l640_spi_ids,
>  };
>  
>  module_spi_driver(mchp48l640_driver);

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
