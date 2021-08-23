Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA190C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 22:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C752613AD
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 22:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C752613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tYXKIin61BVwkLq98sKcV9DCvMFUHqCWKSlresjECY=; b=4gBCjtcWLPi/gCl0uuwq2e0ujW
	NiJpJh67gm80tB0YvPzdPswIOkHPAS4Hu0sHQuHi3jfn5YO3Vwgzvb17oQGYSZPygGSuekuKB0PXj
	eArn5LjaoTs8qTd619gqJb/NHjX9JuExh7zX2cUyj4l5ZUQOP4pW9orRHSN7Kv6n+i+/f7BOe1JnE
	t1xSNdi+fRWg6nN3nR7Sb9bne0hA0Crpl0ccgkkxg9oQqHGOQcLqjiGNJtwJ9Qy7SPbBj1svMUKHT
	2kBUhsqhHAqJyEi7BAhod0+zWB+yeZitcU5ghyzt+n+uDkwi2BZ4YJgBAnclu8cDryvpmKrzM35/S
	sLM2HK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIIgD-000tbv-Hk; Mon, 23 Aug 2021 22:44:33 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIIft-000tVD-6F; Mon, 23 Aug 2021 22:44:17 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 07A3622205;
 Tue, 24 Aug 2021 00:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1629758649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3OBgM+j2zSKit7QGiNewBuQGSeMMG2FJxj5V3CXpUz0=;
 b=PaJ1vC4RB2J/RNaNHEzttQm1dvrtlnb/Ek+RjzkcoLvsW4KHqyDYq1TJwOhtnYCu/EijXd
 hXDG2rvtwqgzyhzXRFhF49hiuk6UwE9TO2ZTD9XyFGfKWeq9R7uYMUv/8bchDQys1AFyf0
 HLPgXgnUaMX4+eVShuGx2es4RLxtB0E=
MIME-Version: 1.0
Date: Tue, 24 Aug 2021 00:44:08 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 04/35] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
In-Reply-To: <20210727045222.905056-5-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-5-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <afaa6337b35c79dc39dff5a821fb449b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_154413_450018_A7543D0D 
X-CRM114-Status: GOOD (  16.47  )
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

Am 2021-07-27 06:51, schrieb Tudor Ambarus:
> MX25L12835F define SFDP, while MX25L12805D does not.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Testd-by: Heiko Thiery <heiko.thiery@gmail.com>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>

Same remarks as patch #3.

-michael

> # cat 
> /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0
> .0/spi-nor/sfdp | xxd -p
> 53464450000101ff00000109300000ffc2000104600000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> 083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
> ffffffffffff003600279df9c06485cbffffffffffff
> 
>  drivers/mtd/spi-nor/macronix.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c 
> b/drivers/mtd/spi-nor/macronix.c
> index 68f6ac060bc6..fba85efafb47 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,24 @@
> 
>  #include "core.h"
> 
> +static int mx25l12835f_post_bfpt_fixups(struct spi_nor *nor,
> +				const struct sfdp_parameter_header *bfpt_header,
> +				const struct sfdp_bfpt *bfpt)
> +{
> +	/*
> +	 * Macronix has a bad habit of reusing flash IDs: MX25L12835F 
> collides
> +	 * with MX25L12805D. MX25L12835F defines SFDP tables, while the older
> +	 * variant does not.
> +	 */
> +	nor->name = "mx25l12835f";
> +
> +	return 0;
> +}
> +
> +static struct spi_nor_fixups mx25l12835f_fixups = {
> +	.post_bfpt = mx25l12835f_post_bfpt_fixups,
> +};
> +
>  static int mx25l3233f_post_bfpt_fixups(struct spi_nor *nor,
>  				const struct sfdp_parameter_header *bfpt_header,
>  				const struct sfdp_bfpt *bfpt)
> @@ -70,8 +88,10 @@ static const struct flash_info macronix_parts[] = {
>  	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
>  	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
> -	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K |
> -			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> +	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP 
> |
> +			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
> +		/* ID collision with mx25l12835f. */
> +		.fixups = &mx25l12835f_fixups },
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>  	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
>  			      SECT_4K | SPI_NOR_DUAL_READ |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
