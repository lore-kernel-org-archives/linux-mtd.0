Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF65DECAAD3
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 07:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qV8AzMGKo3lPrDDkpj2CRcaELdlhLj8zRuthwrhSdiA=; b=ULWWDdZf5nOggloslGyGZCM7Nb
	f949Kixu+WZ/ewa8i/CgEb122y6FO8hGcwtJW/8o6GrTI5m7xy4VfzjCVOv4LRI8q6yjRAIwh/MXa
	LSEAuZSiUdGSQo5NP3hTqdFUTOtUGEMXSde27Qj+kAA4qn36JyV1zlL2viv1Er/aeC9nKXoxIFzk+
	Pv31NUCRSFi5nfH+Ma37OQbnHi9IKlptK3Ay7phN3km19G0Q8Gy0JccFe+fVKw0bO4j7Ez9il1rth
	1uVMXlBTBRPLOEX6+doh5C7jCPW/MGddmDDe9XAKPlFagb8DomjPWa9k8jCkGMB0aQqnyBzYlBQTW
	PXBq9/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTeZu-00AIB9-2S; Thu, 01 Sep 2022 07:25:30 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTeZj-00AI1s-J2
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2022 07:25:21 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id BFD40380;
	Thu,  1 Sep 2022 09:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662017114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=usPeztQRdocqtwofmqSKCvio+ehx4NgkCjGeGASpOdo=;
	b=c7xw5qzfElZ/zMte45xDnNhm0P1LV1yg/22i8KuWStSmERvgPsuQWl98O/3dg98G5bC9x0
	hZB1efBNjK5utZWy6B2qZbssBeH7Lt0DQ62NBfaMhDIP+zyjCzGiRKOobbRrJ99TBpeooS
	xvAfjMTzufbV+vQHv7y5tZytx+hxk/ggvIDDHb3w9Vee27vk5G1d4nlhkntq5SWuNZnpcv
	ZCw8MvpnhPQR72uogxBDlh0bhPl1zEEJ+Uf/qWpXET1JgeSGflZoKwCsTeNsY7A5CWxDhc
	R43A6FKreY5XuE2P2PjtRd0bY7SImTvUMw+S4AogGxO9N9QcXGtej4N9ctNrmA==
MIME-Version: 1.0
Date: Thu, 01 Sep 2022 09:25:14 +0200
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Fix index value for SCCR dwords
In-Reply-To: <20220901071904.27622-1-Takahiro.Kuwano@infineon.com>
References: <20220901071904.27622-1-Takahiro.Kuwano@infineon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d240e5aa87964d8e85d8684c60db1c27@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_002519_824444_7DA97FB6 
X-CRM114-Status: GOOD (  12.40  )
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

Am 2022-09-01 09:19, schrieb tkuw584924@gmail.com:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Array index for SCCR 22th DOWRD should be 21.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

This should have a fixes tag. Otherwise it looks good.

-michael

> ---
>  drivers/mtd/spi-nor/sfdp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 2257f1b4c2e2..681e5e78724c 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1222,7 +1222,7 @@ static int spi_nor_parse_sccr(struct spi_nor 
> *nor,
> 
>  	le32_to_cpu_array(dwords, sccr_header->length);
> 
> -	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
> +	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[21]))
>  		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
> 
>  out:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
