Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA40C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Feb 2022 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGypDlz9L0wUsk8KAdeu6N0muE+dyRuLl+LNKGIbh78=; b=c2B57W1GKcdTte
	kQxfkrS4Mgi3jRzsoDPcnLyv4dwkAs4CvSb+vE0HrBbYjWFDI8b7O43Xe67XQ6Lfk1dPFthbicIv5
	4DlrmRmX6xJqe9gNfHY7u+izL49yJaiWoPumk+WTI5lS+tB3EH/TNM2AffqeLbh7mexNmwIuTGSZF
	26NmNLQdMN/k3u1V/T9Hf16NdZNdaaziy0Lo9CD5CxxXmJyKrTbeo5ELSJzCfHTLzRwtJsOpHmTq3
	OWsLfmkS/rHXsmhkC6SCWKqiei5sBgjgUsLV2I+Gk49N3Qset8lLHbBWmYUTnxy8cCKhVfX2k/pZd
	d0y2aWnWsg3m6KhohtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFXr3-000R47-4R; Thu, 03 Feb 2022 08:52:37 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFXr0-000R3Q-St
 for linux-mtd@lists.infradead.org; Thu, 03 Feb 2022 08:52:36 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id AB0AD22236;
 Thu,  3 Feb 2022 09:52:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643878352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCnmzuE+MfmI2h5XBQMnwQG9vNjrFejQSb6MMyGTW4M=;
 b=r3XdcsGDSPgWtEwXtgAsAWNG+w59UTKq+aBP4y4MowQuIpdGmjpo5A7BLjQ09suUJrsfz6
 hf36IoNmGVui4fkaz4I7HUKvtra3KhZOIxsFERpgiYGkmR4ugLysJREAu3b9qfLlTOiCGH
 doHj2JVuXjmhM7RkUbb0wnDX02LdKPM=
From: Michael Walle <michael@walle.cc>
To: broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v2 2/3] mtd: mchp23k256: Add SPI ID table
Date: Thu,  3 Feb 2022 09:52:28 +0100
Message-Id: <20220203085228.15465-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202143404.16070-3-broonie@kernel.org>
References: <20220202143404.16070-3-broonie@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_005235_107208_C64C89E5 
X-CRM114-Status: GOOD (  17.79  )
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
>  drivers/mtd/devices/mchp23k256.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> index a8b31bddf14b..1a840db207b5 100644
> --- a/drivers/mtd/devices/mchp23k256.c
> +++ b/drivers/mtd/devices/mchp23k256.c
> @@ -231,6 +231,19 @@ static const struct of_device_id mchp23k256_of_table[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
>  
> +static const struct spi_device_id mchp23k256_spi_ids[] = {
> +	{
> +		.name = "mchp23k256",
> +		.driver_data = (kernel_ulong_t)&mchp23k256_caps,
> +	},
> +	{
> +		.name = "mchp23lcv1024",
> +		.driver_data = (kernel_ulong_t)&mchp23lcv1024_caps,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, mchp23k256_spi_ids);
> +
>  static struct spi_driver mchp23k256_driver = {
>  	.driver = {
>  		.name	= "mchp23k256",
> @@ -238,6 +251,7 @@ static struct spi_driver mchp23k256_driver = {
>  	},
>  	.probe		= mchp23k256_probe,
>  	.remove		= mchp23k256_remove,
> +	.id_table	= mchp23k256_spi_ids,
>  };
>  
>  module_spi_driver(mchp23k256_driver);

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
