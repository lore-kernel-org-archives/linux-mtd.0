Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE7CC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 07:05:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A38E206F4
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 07:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l5p9c1c+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A38E206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObotXXGs6HBc9VqP1u9BquFjo7Y5/kjyslsukLYD7Wg=; b=l5p9c1c+yFrB4Z
	N1v/giVjXYVBO+sBX66/lsS6b3U8TR8NVyEuiBOBMrxenb9SJzJAO+rxcCsKpQ1Yag0uFavyVZYR7
	ccPEN7LYErxJ/O0kkNlY688oWjqY09krdUWKNJWIGPA2qyiDJRBfTX1Q4VmTZOOAdmmvtFM3I79VA
	NT1F8MHJsWwnxYeeUbLyZ0dGPsOIHEt3bAc3PN3G4sty1pJjNpUbqfhj9u765aeX+E6C5dFSFU2nP
	ut6golACBbX8veBeyL+jRQ8YCml+GYUzp49e8w/Zy1hbDAshW9WM0YPqKkXbfgajJRzf3evbksvAv
	QT2OqEQ3WIcZozmVXvfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZUOm-0001vm-M5; Fri, 15 May 2020 07:04:48 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZUOj-0001uS-6J; Fri, 15 May 2020 07:04:47 +0000
X-Originating-IP: 42.109.214.107
Received: from localhost (unknown [42.109.214.107])
 (Authenticated sender: me@yadavpratyush.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id AD1D820002;
 Fri, 15 May 2020 07:04:39 +0000 (UTC)
Date: Fri, 15 May 2020 12:34:36 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v1 2/2] spi: nor: update page program settings for
 is25wp256 using post bfpt fixup
Message-ID: <20200515070436.hk5ho7ygluqznpcq@yadavpratyush.com>
References: <1589457051-5410-1-git-send-email-sagar.kadam@sifive.com>
 <1589457051-5410-3-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589457051-5410-3-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_000445_369479_04A49D18 
X-CRM114-Status: GOOD (  16.67  )
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
Cc: aou@eecs.berkeley.edu, vigneshr@ti.com, tudor.ambarus@microchip.com,
 richard@nod.at, anup.patel@wdc.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, paul.walmsley@sifive.com,
 miquel.raynal@bootlin.com, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sagar,

On 14/05/20 04:50AM, Sagar Shrikant Kadam wrote:
> During SFDP parsing it is seen that the IS25WP256d device is missing 4BAIT
> (4-Byte address instruction table), due to which it's page program
> capacity doesn't get correctly populated and the device gets configured
> with 4-byte Address Serial Input Page Program i.e. SNOR_PROTO_1_1_1
> even though it can work with SNOR_PROTO_1_1_4.
> 
> Here using the post bfpt fixup hooks we update the page program
> settings to 4-byte QUAD Input Page program operations.
> 
> The patch is tested on HiFive Unleashed A00 board and it benefits
> few seconds of average write time for entire flash write.
> 
> QUAD Input Page Program operations:
> > time mtd_debug write /dev/mtd0 0 33554432 rd32M
> Copied 33554432 bytes from rd32M to address 0x00000000 in flash
> real    0m 32.85s
> user    0m 0.00s
> sys     0m 31.79s
> 
> Serial Input Page Program operations:
> > time mtd_debug write /dev/mtd0 0 33554432 rd32M
> Copied 33554432 bytes from rd32M to address 0x00000000 in flash
> real    0m 35.87s
> user    0m 0.00s
> sys     0m 35.42s
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  drivers/mtd/spi-nor/issi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index ffcb60e..9eb6e82 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -23,6 +23,22 @@ is25lp256_post_bfpt_fixups(struct spi_nor *nor,
>  		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
>  		nor->addr_width = 4;
>  
> +	/*
> +	 * On IS25WP256d device 4-Byte address instruction table doesn't
> +	 * get populated and so the device get's configured with 4-byte
> +	 * Address Serial Input Page Program i.e. SNOR_PROTO_1_1_1 even
> +	 * though it supports SNOR_PROTO_1_1_4, so priorotize QUAD write
> +	 * over SINGLE write if device id table holds SPI_NOR_QUAD_READ.
> +	 */
> +	if (strcmp(nor->info->name, "is25wp256") == 0) {

Instead of doing this, wouldn't it make more sense to have a separate 
fixup hook for is25wp256? Does this device also need the above address 
width fixup? If it does, maybe that can be split into a separate 
function, and used by both the fixups?

> +		if (nor->info->flags & SPI_NOR_QUAD_READ) {
> +			params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
> +			spi_nor_set_pp_settings
> +				(&params->page_programs[SNOR_CMD_PP_1_1_4],
> +				 SPINOR_OP_PP_1_1_4,
> +				 SNOR_PROTO_1_1_4);
> +		}
> +	}
>  	return 0;
>  }

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
