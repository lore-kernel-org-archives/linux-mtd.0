Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAC8C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 01:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Vk7QybA0u9HzFZXQ81/ebS52p2zKlbthbGGr3YtYV4=; b=v4q4Tm+6Cj4SYL
	rBtH+BdMci2+YIkQSifmLgiX5dkmj00z0sJMXbrCd2z7PbKK50hHxnOCYzloRAYKSFi58hLHiOjxo
	8EtU1YFoEVHSIfN9BX0EGpt02kbZca7WzxOrKh8k20wCs40GyVPr6aWihg2RPrFNCh7bRA/mmCvrI
	UResVC3NUjZpCr2Z9QEjVMQXlws9dolYliJLDRw7Wnk2nTqzZ41qET3dn2BUVzyZiFy28e2hu/xNo
	rRsj40MFypfXLxk7HYZsP4I6dSMYok0MYhws1tnD7KWsZyeJbzzm28q/G6Kt+TazuO16iD1h5B6ch
	sy/XO7pJWXGqg30SQYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1f7p-00G0pW-FJ; Mon, 27 Dec 2021 01:48:33 +0000
Received: from perseus.uberspace.de ([95.143.172.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1f7l-00G0nU-B3
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 01:48:31 +0000
Received: (qmail 20248 invoked by uid 988); 27 Dec 2021 01:48:20 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Message-ID: <f132a19f-d57e-af69-4da4-5c5c54a4c6ac@david-bauer.net>
Date: Mon, 27 Dec 2021 02:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] mtd: spi-nor: fix reading/writing of MX25L6405D
Content-Language: de-DE
To: vincent@systemli.org, linux-mtd@lists.infradead.org
References: <20211227013542.1240124-1-vincent@systemli.org>
Cc: tudor.ambarus@microchip.com
From: David Bauer <mail@david-bauer.net>
In-Reply-To: <20211227013542.1240124-1-vincent@systemli.org>
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-3) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.1
Received: from unknown (HELO unkown) (::1)
 by perseus.uberspace.de (Haraka/2.8.28) with ESMTPSA;
 Mon, 27 Dec 2021 02:48:19 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_174829_715155_B27EFF25 
X-CRM114-Status: GOOD (  18.63  )
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

Hi Nick,

On 12/27/21 02:35, vincent@systemli.org wrote:
> From: Nick Hainke <vincent@systemli.org>
> 
> Macronix MX25L6405D supports locking with four block protection bits in
> its status register. Furthermore, the chip will not work with the "16-bit
> Write Status (01h) Command". Add flash-specific fixup that disables the
> SNOR_F_HAS_16BIT_SR flag.

As briefly noted on IRC - all Macronix flash chips do seem to
only have one status register. So removing the SNOR_F_HAS_16BIT_SR
flag in macronix_default_init is probably the better fix.

Best
David

> 
> Tested on Nanostation M2 XM.
> 
> Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on
> lock()/unlock()")
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> Signed-off-by: Nick Hainke <vincent@systemli.org>
> ---
>   drivers/mtd/spi-nor/macronix.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 27498ed0cc0d..6dd148e9f660 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,15 @@
>   
>   #include "core.h"
>   
> +static void mx25l6405d_default_init_fixups(struct spi_nor *nor)
> +{
> +	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
> +}
> +
> +static struct spi_nor_fixups mx25l6405d_fixups = {
> +	.default_init = mx25l6405d_default_init_fixups,
> +};
> +
>   static int
>   mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>   			    const struct sfdp_parameter_header *bfpt_header,
> @@ -41,7 +50,9 @@ static const struct flash_info macronix_parts[] = {
>   	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
>   	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>   	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
> -	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
> +	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K |
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
> +		.fixups = &mx25l6405d_fixups },
>   	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
>   	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64,
>   			      SECT_4K | SPI_NOR_DUAL_READ |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
