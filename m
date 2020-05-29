Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAACC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 09:42:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2D022074D
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 09:42:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="INITt/k0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2D022074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/96rbEwx8DVzrL8gIr56jPs+YfIsKmdt76wLFqp78tw=; b=INITt/k0zg6C0s
	7pTZ61j5cXEVvEkOs25kavZUF3fV7zHmz5UQUolfNK3NGnCXo55WDM76U7Sm2URM1EK6UgYDqXFFl
	FhnWSgJRhkjKRtph7KXEMzZ47b01XWNR5UYwKVu/2eBqBCbc4QsKI2u0X+ZaTHueiFEBWcbI9XhAe
	um35n83SVECelJ4LHL8dLpoOd9fNMMak9OXts6iNDnDrhP9gVGbSmFcKnTIS8c4bSBfNPSh9zRKBz
	wYNHAC8W2Cumjjsnjj03rjDAoU5AvmCMTouNvYLZi3nn/CAHknhPfHrV6jnbilp4srg01fWYu0+w4
	DMupkXg2Gw2Abi6q70Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jebWs-00043i-AA; Fri, 29 May 2020 09:42:18 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jebWo-00042f-Sh
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 09:42:16 +0000
X-Originating-IP: 42.109.222.225
Received: from localhost (unknown [42.109.222.225])
 (Authenticated sender: me@yadavpratyush.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A530DC0007;
 Fri, 29 May 2020 09:42:07 +0000 (UTC)
Date: Fri, 29 May 2020 15:12:02 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v4 7/7] mtd: spi-nor: macronix: Add Octal 8D-8D-8D
 supports for Macronix mx25uw51245g
Message-ID: <20200529094202.7vjs7clhykncivux@yadavpratyush.com>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
 <1590737775-4798-8-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590737775-4798-8-git-send-email-masonccyang@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_024215_195852_B5B07605 
X-CRM114-Status: GOOD (  20.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, boris.brezillon@collabora.com, miquel.raynal@bootlin.com,
 matthias.bgg@gmail.com, linux-mtd@lists.infradead.org, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29/05/20 03:36PM, Mason Yang wrote:
> Macronix mx25uw51245g is a SPI NOR that supports 1-1-1/8-8-8 mode.
> 
> Correct the dummy cycles to device for various frequencies
> after xSPI profile 1.0 table parsed.
> 
> Enable mx25uw51245g to Octal DTR mode by executing the command sequences
> to change to octal DTR mode.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 55 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 96735d8..6c9a24c 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,57 @@
>  
>  #include "core.h"
>  
> +#define MXIC_CR2_DUMMY_SET_ADDR 0x300
> +
> +/* Fixup the dummy cycles to device and setup octa_dtr_enable() */
> +static void mx25uw51245g_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +	int ret;
> +	u8 rdc, wdc;
> +
> +	ret = spi_nor_read_cr2(nor, MXIC_CR2_DUMMY_SET_ADDR, &rdc);
> +	if (ret)
> +		return;
> +
> +	/* Refer to dummy cycle and frequency table(MHz) */
> +	switch (params->dummy_cycles) {
> +	case 10:	/* 10 dummy cycles for 104 MHz */
> +		wdc = 5;
> +		break;
> +	case 12:	/* 12 dummy cycles for 133 MHz */
> +		wdc = 4;
> +		break;
> +	case 16:	/* 16 dummy cycles for 166 MHz */
> +		wdc = 2;
> +		break;
> +	case 18:	/* 18 dummy cycles for 173 MHz */
> +		wdc = 1;
> +		break;
> +	case 20:	/* 20 dummy cycles for 200 MHz */
> +	default:
> +		wdc = 0;
> +	}

I don't get the point of this. You already know the fastest the 
mx25uw51245g flash can run at. Why not just use the maximum dummy 
cycles? SPI NOR doesn't know the speed the controller is running at so 
the best it can do is use the maximum dummy cycles possible so it never 
falls short. Sure, it will be _slightly_ less performance, but we will 
be sure to read the correct data, which is much much more important.

Is it possible to have two chips which have _exactly_ the same ID but 
one supports say 200MHz frequency but the other doesn't? Without that, 
we can just enable the maximum and move on.

> +
> +	if (rdc != wdc)
> +		spi_nor_write_cr2(nor, MXIC_CR2_DUMMY_SET_ADDR, &wdc);
> +
> +	if (params->cmd_seq[0].len) {
> +		params->octal_dtr_enable = spi_nor_cmd_seq_octal_dtr;
> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
> +		params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;

Same comment as above. We are in the mx25uw51245g fixup hook. We already 
know if the flash supports 8D mode or not from the datasheet. What is 
the need to discover it from SFDP?

> +
> +	} else {
> +		params->octal_dtr_enable = NULL;
> +		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_8_8_8_DTR;
> +		params->hwcaps.mask &= ~SNOR_HWCAPS_PP_8_8_8_DTR;
> +	}
> +}
> +
> +static struct spi_nor_fixups mx25uw51245g_fixups = {
> +	.post_sfdp = mx25uw51245g_post_sfdp_fixups,
> +};
> +
>  static int
>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>  			    const struct sfdp_parameter_header *bfpt_header,
> @@ -84,6 +135,10 @@
>  			      SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048,
>  			      SPI_NOR_QUAD_READ) },
> +	{ "mx25uw51245g", INFO(0xc2813a, 0, 64 * 1024, 1024,
> +			      SECT_4K | SPI_NOR_4B_OPCODES |
> +			      SPI_NOR_OCTAL_DTR_READ)
> +			      .fixups = &mx25uw51245g_fixups },
>  };
>  
>  static void macronix_default_init(struct spi_nor *nor)

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
