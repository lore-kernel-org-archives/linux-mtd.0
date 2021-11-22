Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35B9C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 18:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flFp4cwqQGzMDVanuws2ZqpDyhlXF9kp79BIGRDgYdI=; b=HthMRBEc8O112sgMMAq/eJ3P89
	vBr25gE0U01ARmtw4VH6Sx3UJgROgIUxW09Nkh6WkDVukIFow1UZaCZqQ3qz4/dgDz0fbkMZZTfAA
	XH4BfyOcMREiull7/niaiaQtVgSJn5jWo0e+z+WDg2A3yT+KY+edhot64AKSXZXBlAGSs+ujGiouD
	b+y/wP/f6WjHniI3l07Y/NHhmst5c90ntNt6rMoDlYgKEbKHWfRBa4xaEFpLk1CORphkhob+a2vRH
	uPhviu8NBpKYcB4wCc9qMANbp/AWjRnrsXFi4NONWtUnc9MVnW1Aa6Kx1HAek9Qhulh/UQe8fb25v
	LWFnpFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpE93-00HMHh-Qr; Mon, 22 Nov 2021 18:34:25 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpE8o-00HMEn-LK; Mon, 22 Nov 2021 18:34:12 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 369E122246;
 Mon, 22 Nov 2021 19:34:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1637606048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8HXf80+PPk0xE8n4ngVLkTXb3XR0oMNvy5ADXrNxP8=;
 b=Fu9W6D/ss7PZSRXIGwCMkmL0F75UHzm7OpYD7apDSONd0Om4WNcHZdZqNdNBRW/IljS4gy
 l428aOD5bXSEWNCR9jIvn1ms9rx9xwBeRSjihkpUIV0DNq8Wz5SUWpUeoPGkWOQYPIuC83
 DW4Pn/3eCaWa3b2qNfUmWmCEHRnc5J4=
MIME-Version: 1.0
Date: Mon, 22 Nov 2021 19:34:08 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 04/13] mtd: spi-nor: core: Introduce flash_info
 mfr_flags
In-Reply-To: <20211122095020.393346-5-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
 <20211122095020.393346-5-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8cd44e0b20170a4ad53d9d75a7d01446@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_103410_882704_A08AC674 
X-CRM114-Status: GOOD (  10.87  )
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

Am 2021-11-22 10:50, schrieb Tudor Ambarus:
> Used in the manufacturer fixup hooks to differentiate support
> between flashes of the same manufacturer. Not used in the
> SPI NOR core.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Nice!
Reviewed-by: Michael Walle <michael@walle.cc>

> @@ -58,28 +61,46 @@ static const struct spi_nor_fixups sst26vf_fixups = 
> {
>  static const struct flash_info sst_parts[] = {
>  	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
>  	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
> -			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | 
> SPI_NOR_SWP_IS_VOLATILE) },
> +			      SECT_4K | SPI_NOR_HAS_LOCK |
> +			      SPI_NOR_SWP_IS_VOLATILE)
> +		MFR_FLAGS(SST_WRITE) },

Looks a bit odd, but I'm fine with that. Does checkpatch.pl complain, 
though?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
