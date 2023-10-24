Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE42C00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nTxow7iMYPl3Op7Lbbf7j+pFIEWxWsVIq6MeQWUu0k=; b=TRTkaPJU9Ms130n1B1FzhLVsri
	AnzQTHOcckvy845r8jXOFdMI439lxWSeDSf5KTG7pEQBpL+orsQH4BGZiOIVWGzHy+/V3x7rC8mmx
	xXawmag6wbV4J24QDYkD2MJm1UdIYKawahaSI4lkDpFTDMIjmlP8+UIjC6g5vtwzqBp9tBBPmfoyY
	/7QM3HK9pbVr48dHqubTKe7BJmzgKvifn3z+325lzo1gabpCo9Lvr4M9NgzdgpUMTKwcnlr/Kt8YU
	/OZS60aIUSNmAfFGGDaGSYwJUuGChhFIYLrVQHihx7laN7YfST/9+8txc2mQpFq77iXXFMZC0fH+9
	T4abiJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDGZ-009FrU-2t;
	Tue, 24 Oct 2023 08:59:59 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDGW-009Fpc-1g
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 08:59:58 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2992E133;
	Tue, 24 Oct 2023 10:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1698137990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqGqaIFtGkF5J02xsc7tMyJ4K90Kq7KYiL/pwEQrR8A=;
	b=P19fH+nc6zNGHO+8hat2XBGJCy1s0Bc3pRhGCdjL/AjBOS2bGL69m6+p1IO749fclu25CL
	cDtYBYZLAZvHnJX8S/6iV8aTjboMOiC1lRzzVSdGfrVxDw4+rkgpNe0yDrANYH5FpfPpkA
	ifUlCGqFJEOm9SW6y/bGZX3/8A2nf8l8JJ9zo8ORlxAnHJx4Om1+yBD0ZQ5AjB6Zdyfi6E
	I6XHCX8CvhHzS5tu/DNtPa4zK0GKHCvKRJH7aSGRblMmYVxaZ7buV7/ZoPN0DByGplndGq
	AqZvLZqUXU2YFZcooc+zrkZUCwtGtbXojoxBLago26fh4NrBjIcU6sdqNiJJ7g==
MIME-Version: 1.0
Date: Tue, 24 Oct 2023 10:59:50 +0200
From: Michael Walle <michael@walle.cc>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 mika.westerberg@linux.intel.com
Subject: Re: [PATCH v2] mtd: spi-nor: Improve reporting for software reset
 failures
In-Reply-To: <20231024074332.462741-1-acelan.kao@canonical.com>
References: <20231024074332.462741-1-acelan.kao@canonical.com>
Message-ID: <4c11d06931f9b4e29c0e8feafc18e763@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_015956_812644_A3F3A22F 
X-CRM114-Status: GOOD (  17.33  )
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

[+Mika]


> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> When the software reset command isn't supported, we now report it as an
> informational message(dev_info) instead of a warning(dev_warn).
> This adjustment helps avoid unnecessary alarm and confusion regarding
> software reset capabilities.
> 
> v2. only lower the priority for the not supported failure
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/mtd/spi-nor/core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1b0c6770c14e..76920dbc568b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3252,7 +3252,10 @@ static void spi_nor_soft_reset(struct spi_nor 
> *nor)
> 
>  	ret = spi_mem_exec_op(nor->spimem, &op);
>  	if (ret) {
> -		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +		if (ret == -ENOTSUPP)

It bothers me that we use ENOTSUPP here. We should really use 
EOPNOTSUPP.
The core uses EOPNOTSUPP everywhere except for the intel things.

Please have a look at changing that to EOPNOTSUPP. See also:
https://lore.kernel.org/linux-mtd/85f9c462-c155-dc17-dc97-3254acfa55d2@microchip.com/


> +			dev_info(nor->dev, "Software reset enable command doesn't support: 
> %d\n", ret);

I'm not sure this is helpful. It's only the intel SPI controller which
does magic things (instead of just issuing our commands). Mika, do you
know wether your controller will do a reset on it's own? I presume so,
because AFAIR you have some kind of high level controller which also 
does
SFDP parsing and read opcode handling on their own.

> +		else
> +			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
>  		return;
>  	}
> 
> @@ -3262,7 +3265,10 @@ static void spi_nor_soft_reset(struct spi_nor 
> *nor)
> 
>  	ret = spi_mem_exec_op(nor->spimem, &op);
>  	if (ret) {
> -		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +		if (ret == -ENOTSUPP)
> +			dev_info(nor->dev, "Software reset command doesn't support: %d\n", 
> ret);

I'd leave that as is, because how are the chances that the first one is
supported and the second command, isn't?
When working with the intel controller, we'll return early after the
first spi_mem_exec_op().

-michael

> +		else
> +			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
>  		return;
>  	}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
