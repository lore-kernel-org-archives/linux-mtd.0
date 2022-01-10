Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF440C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMFQch3YkMPSGYzn4ieigB9sHmUe7GshmvZo9hdpuEw=; b=O/YX7NzbeZuA1yTdGgJcdRdvRB
	lQxO/tqo5u+EqwaZQshw6iinCKuEVazBjpN7V8swVBjAAHmxCfsBdl3ay+CN8gtsNlizA2wJgAgKB
	B6X00xfwaLPPxE7ooUZiSXqf9qn9H1ase/i2VeWR5KjRc4fB0qKEOU1BImeaOF1QT/Bkwq5yv4zZf
	w/Nox2S4Za7c4A6TFH1coR9GDQLKy4sSzr9UO1ZQfTpu9+JaZ/G9tiUqfWB9DGER0JSUHuXlgJOV/
	hTiCDPA+/w6uiQWuPijkGx1DcdwSt9QOK3SHDVMGQKxj16N6E7TPhJGIwuXvID2o28fkO65XlbfSG
	vKmishdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wJc-00BzGi-4Y; Mon, 10 Jan 2022 15:10:32 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wJZ-00BzEu-Mc
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 15:10:31 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6B6DC22239;
 Mon, 10 Jan 2022 16:10:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1641827425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XqbUeFSqsZFEDKOfae+exL8OedQU2w5DkolQaaFkuY=;
 b=cngTIyt20rM2M2mfFcW1T+/m1ts3nd+XolwWok0dzAfwrb/bJPHL/JNtW5FbXiO+aCKb8t
 cG1GcQLlkZaujjcnjfPVftm4asZ41/EJjAwmOkKDGLeCsobUctR+n5wS8iMLb+34wBpxaS
 fRjQnAzVOhIK5+CIhAup/2eXDAlNP4g=
MIME-Version: 1.0
Date: Mon, 10 Jan 2022 16:10:22 +0100
From: Michael Walle <michael@walle.cc>
To: Dhananjay Phadke <dphadke@linux.microsoft.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for w25q512jvm
In-Reply-To: <20220109044418.4657-1-dphadke@linux.microsoft.com>
References: <20220109044418.4657-1-dphadke@linux.microsoft.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <262a03e185c29583450180e3dc8c4e6c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_071029_958081_9FE7EA1C 
X-CRM114-Status: GOOD (  15.46  )
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

Hi,

Am 2022-01-09 05:44, schrieb Dhananjay Phadke:
> Add support for Winbond 64MB W25Q512JV-DTR NOR flash.
> Use PARSE_SFDP flag to init parameters during SFDP parsing.
> 
> Signed-off-by: Dhananjay Phadke <dphadke@linux.microsoft.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c
> index 675f32c136b3..ebc826e21f76 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -118,6 +118,8 @@ static const struct flash_info winbond_parts[] = {
>  		.fixups = &w25q256_fixups },
>  	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512)
>  		PARSE_SFDP },
> +	{ "w25q512jvm", INFO(0xef7020, 0, 64 * 1024, 1024),

OTP_INFO(256, 3, 0x1000, 0x1000)

should enable OTP support, could you please test this using the 
flash_otp_{dump,info,erase,write} tools and add that line?

> +		PARSE_SFDP },
>  	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
