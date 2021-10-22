Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669A6C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:13:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E28610FF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21E28610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5DxS0L78JZS2lAM1o2fGnr7VrwhPVetk64FnLcXzDQ=; b=f1Of8f/JQHAEnBZjwAwPG5KK0A
	Y2dEM+xKfXZSLhZ7SpdBexar695G+styFIKPa+vh9NDH+sMakZoqCP8CbExyqjpN+mlWGtMQADt7o
	iQGbwrgEj67V3DG1ZwUiEufsaq/HuSUNCmPx1IVy7kcL13FtoqXefUG3OMsM3j017alQf2e2MBj9+
	FsjiJYwp1nmOye4kU20XBRa8ESVbcFl7TD4V9Gj2ZUbRDWYy3hhBKCUKOxdL+lHhx1CBEKWnK1eek
	hxkwqzrkwFg8AW3/kmFFH0Ddl9Cxszckbtqkqgm1BBHG45FBxn1HIi33W4waAIXtwRShw31a/RVHN
	7iRjVJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtQ3-00AnTA-Nz; Fri, 22 Oct 2021 12:13:07 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtPl-00AnNq-BQ; Fri, 22 Oct 2021 12:12:50 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CB086221E1;
 Fri, 22 Oct 2021 14:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1634904767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYfrW7sOTesggE6totyaARdRElszhBOqK9YtA9A/E1Q=;
 b=My2o2TnbyHHDT32FHAj2dzfLmY4q0p6J+OQleRjG/ghIJHpsNJ2kO7zywBfEZQH7P8DbOD
 l61N2w3XJZVEPCwaLpwAghG3ieNmP/WymamvUa4UGVHpuQKLJO6poqDk1MZQ1uiZTu5T5d
 RcZ88EU5XGS9vIBCe3krln1Z5zF7EbY=
MIME-Version: 1.0
Date: Fri, 22 Oct 2021 14:12:46 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 25/35] mtd: spi-nor: core: Move
 spi_nor_set_addr_width() in spi_nor_setup()
In-Reply-To: <20210727045222.905056-26-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-26-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <4375732149fe8c96a85ee119395e7400@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_051249_577401_815291CA 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-07-27 06:52, schrieb Tudor Ambarus:
> spi_nor_setup() configures the SPI NOR memory. Setting the addr width
> is too a configuration, hence we can move the spi_nor_set_addr_width()
> in spi_nor_setup().
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

..

>  static int spi_nor_setup(struct spi_nor *nor,
>  			 const struct spi_nor_hwcaps *hwcaps)
>  {
> +	int ret;
> +
>  	if (!nor->params->setup)
> -		return 0;
> +		return spi_nor_set_addr_width(nor);
> 
> -	return nor->params->setup(nor, hwcaps);
> +	ret = nor->params->setup(nor, hwcaps);
> +	if (ret)
> +		return ret;
> +
> +	return spi_nor_set_addr_width(nor);
>  }

Why not

static int spi_nor_setup(struct spi_nor *nor,
			 const struct spi_nor_hwcaps *hwcaps)
{
	int ret;

	if (nor->params->setup) {
		ret = nor->params->setup(nor, hwcaps);
		if (ret)
			return ret;
	}

	return spi_nor_set_addr_width(nor)
}

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
