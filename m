Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FF2C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 22:43:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E836F613A6
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 22:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E836F613A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Laornpz5U1En1ISA+YQJSwEq8red/vjDcf3yCuJW6Is=; b=nfrDBjadWpKAKbAvBfW053MO3U
	iBZ1bzYFD6xtS3Fj7P/viGvwEa4X6jWX55lmX7A073QL5mvlXjpdTenWhtYCDUhC712LeUCBS1JR3
	yfmuPFurAi5csMexlGzZOFct8Nz+F18mjan/SbGuXWuXQpnbFJN/2Gnioma/C/g1CZuU5KDoqobMO
	JPrCzyeBQ9gkMjMSlCbkwbU6dJglwHa+tQNxe8jO3CSroA2hXzS9OXnJVuz8oIIWhvxyCWej00GLE
	5kt8gJsDrFedCXp+imNhwsr44bjw7d0BotcF0m9cc4cbJ/MYjy/zJ4DaQ+pfLn+Ke9rGTu5OOKy7f
	U0xt5K0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIIeL-000t8K-C0; Mon, 23 Aug 2021 22:42:37 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIIe5-000t5Z-5t; Mon, 23 Aug 2021 22:42:25 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DCAAE22205;
 Tue, 24 Aug 2021 00:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1629758538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXFGOuK55cilePuDC53/orJ4q8m3JwybPQciry/4uQQ=;
 b=YBrgivNcb2/HISdKsu5Pv6YA2wNak2ye7LcbR9rq59OEj1BPfscXRACvHB9Ft00MlW6zX+
 eTy6ahTtIGOe8Hbc//Q92rJamhxhZ2yrITLADrpsoN5cMc7IyXC+h16L71VQZosxVaeXSi
 qhb526G+nyHxSINiovOfWnmVO01MzCk=
MIME-Version: 1.0
Date: Tue, 24 Aug 2021 00:42:17 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 03/35] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
In-Reply-To: <20210727045222.905056-4-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-4-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e41e5aa88846c87d041e3c3ea7845202@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_154221_607885_EF2E35E2 
X-CRM114-Status: GOOD (  24.32  )
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
> Macronix has a bad habbit of reusing flash IDs. While MX25L3233F 
> supports
> RDSFDP opcode, MX25L3205D does not support it and does not recommend
> issuing opcodes that are not supported ("It is not recommended to adopt
> any other code not in the command definition table, which will 
> potentially
> enter the hidden mode.").
> 
> We tested the RDSFDP on the MX25L3205D and the conclusion is that the
> flash didn't reply anything. Given that it is unlikely that RDSFDP will
> cause any problems for the old MX25L3205D, differentiate between the 
> two
> flashes by parsing SFDP.
> 
> Tested MX25L3233F. Generated a 256 Kbyte random data and did an erase,
> write, read back and compare test. The flash uses for reads
> SPINOR_OP_READ_1_4_4 0xeb, for erases SPINOR_OP_BE_4K 0x20, and for 
> writes
> SPINOR_OP_PP 0x02.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> root@sama5d2-xplained:~# find / -iname spi-nor
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor
> /sys/devices/platform/ahb/ahb:apb/f8000000.spi/spi_master/spi0/spi0.0/spi-nor
> /sys/bus/spi/drivers/spi-nor
> root@sama5d2-xplained:~# ls -al
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor
> total 0
> drwxr-xr-x 2 root root    0 Mar  9 14:51 .
> drwxr-xr-x 6 root root    0 Mar  9 14:50 ..
> -r--r--r-- 1 root root 4096 Mar  9 14:51 jedec_id
> -r--r--r-- 1 root root 4096 Mar  9 14:51 manufacturer
> -r--r--r-- 1 root root 4096 Mar  9 14:51 partname
> -r--r--r-- 1 root root    0 Mar  9 14:51 sfdp
> root@sama5d2-xplained:~# cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
> c22016
> root@sama5d2-xplained:~# cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
> macronix
> root@sama5d2-xplained:~# cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
> mx25l3233f
> root@sama5d2-xplained:~# cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> > mx25l3233f-sfdp
> root@sama5d2-xplained:~# hexdump mx25l3233f-sfdp

use xxd if possible and the sha1sum/md5sum is missing.

> 0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
> 0000010 00c2 0401 0060 ff00 ffff ffff ffff ffff
> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> 0000030 20e5 fff1 ffff 01ff eb44 6b08 3b08 bb04
> 0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
> 0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
> 0000060 3600 2650 f99c 6477 cffe ffff ffff ffff
> 0000070
> 
>  drivers/mtd/spi-nor/macronix.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c 
> b/drivers/mtd/spi-nor/macronix.c
> index 27498ed0cc0d..68f6ac060bc6 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,24 @@
> 
>  #include "core.h"
> 
> +static int mx25l3233f_post_bfpt_fixups(struct spi_nor *nor,
> +				const struct sfdp_parameter_header *bfpt_header,
> +				const struct sfdp_bfpt *bfpt)
> +{
> +	/*
> +	 * Macronix has a bad habit of reusing flash IDs: MX25L3233F collides
> +	 * with MX25L3205D. MX25L3233F defines SFDP tables, while the older
> +	 * variant does not.
> +	 */
> +	nor->name = "mx25l3233f";
> +
> +	return 0;
> +}
> +
> +static struct spi_nor_fixups mx25l3233f_fixups = {
> +	.post_bfpt = mx25l3233f_post_bfpt_fixups,
> +};
> +
>  static int
>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>  			    const struct sfdp_parameter_header *bfpt_header,
> @@ -39,7 +57,10 @@ static const struct flash_info macronix_parts[] = {
>  	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
>  	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
>  	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
> -	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
> +	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SPI_NOR_PARSE_SFDP 
> |
> +			      SECT_4K)
> +		/* ID collision with mx25l3233f. */
> +		.fixups = &mx25l3233f_fixups },

Shouldn't we use mx25l3205d_fixups as name here? What if there are more
flashes with the same id. Using the name of the colliding flash here
doesn't really scale.

-michael

>  	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
