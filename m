Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5D4C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:08:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EB8B60249
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EB8B60249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5io56Kdam+rm+A9ONca0QtoQwI49qu+l+2FYQVNGtvM=; b=HajgIyrOWhM+G9J2zKG7NydcAc
	YciYuKgg1P9K0R2ffmOMImVGPuebqItyuuihd4ZYUHw5arfqLITkZVYV9xys6PrPlSvWAigCII6Rh
	gzxStvNRFFMtWtse0qP9m/sc1xdUTx+F3rIXzAFoIC8xNNUrrqfhiVqHoCFjy308mvi6j39xC65Uo
	NQVDiLZnddplPqHF/IW4Xnz1mYa89OHz5xolgDrFUxYSC9otEllgjQnEEfaR63EO4PZ9dj/dVEtka
	2y/l5mMTDO9FA0IuhP0DeOPR58Gz4P/6PF7FfSSFc/LHXuZIpL7LB2geRhhQIrP3ozijVxErTzdbR
	YixnHjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtKe-00Alt8-Ux; Fri, 22 Oct 2021 12:07:33 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtKO-00Almw-D9; Fri, 22 Oct 2021 12:07:17 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 152AC221E1;
 Fri, 22 Oct 2021 14:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1634904433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJp9xk8Y6l4kfOWVSVljpS9QfBsuvhmUrD8MhgkcCoQ=;
 b=RS0hgIsw/OV2wl4PDNkafYUp928q3Rry3l605JCNQNC3YFRgZBYy6OBK/AUONyibRJY9I/
 vp2hvvROISKhC17o7WhF2VMQdWQxGsQW4A7uxo6cJYlCEw78T00JMq0oURnoq4clrXmufc
 /rdOaOr2u3BDd71EPTJ5M+1VcnHKfvo=
MIME-Version: 1.0
Date: Fri, 22 Oct 2021 14:07:13 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 24/35] mtd: spi-nor: core: Fix spi_nor_flash_parameter
 otp description
In-Reply-To: <20210727045222.905056-25-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-25-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <31cf795a9c93ee3dc5fb23f15d32ca41@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_050716_634340_DC38068F 
X-CRM114-Status: GOOD (  12.37  )
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
> Update the description of the otp member of the
> struct spi_nor_flash_parameter.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 7fb0cfabe85a..501d9212ba9b 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -250,7 +250,7 @@ struct spi_nor_otp {
>   *                      higher index in the array, the higher 
> priority.
>   * @erase_map:		the erase map parsed from the SFDP Sector Map 
> Parameter
>   *                      Table.
> - * @otp_info:		describes the OTP regions.

whoops.

Reviewed-by: Michael Walle <michael@walle.cc>

> + * @otp:		SPI NOR OTP info.
>   * @octal_dtr_enable:	enables SPI NOR octal DTR mode.
>   * @quad_enable:	enables SPI NOR quad mode.
>   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
> @@ -262,7 +262,6 @@ struct spi_nor_otp {
>   *                      e.g. different opcodes, specific address 
> calculation,
>   *                      page size, etc.
>   * @locking_ops:	SPI NOR locking methods.
> - * @otp:		SPI NOR OTP methods.
>   */
>  struct spi_nor_flash_parameter {
>  	u64				size;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
