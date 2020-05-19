Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDB4C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 08:48:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04ABD207E8
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 08:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dj/X4vnq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04ABD207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nKHbGn+HqECUDHFaACez+lCFQgMTjYrLdPH415nRio=; b=dj/X4vnqgZK5h4
	nV3maYLewfAnvigYUOxr6+xkJNkdJy44xOvZwi9MJgwZj/F8k0ChYRl//NEvprlVnmbzA8L9XHMw9
	dSV780V3dY+UlN1gXmjUTXzuA1bnZj9OEeGcJFH54gsOmt+koJr/z+Qn5Kld3BgTx3/E9TjRLYkYw
	LhvagEyE2awzBAQU/6PvWsS3BcikQtehWV5ZDJE9UVDpg0u2YoZK5cIyOz/XB/rlc+FH9DkK8tw68
	KJhz5HhChbEQFVlZxYYp6as35vCqPj7nNA/w+1qXrg+IPuuzVGiKcxAa6N3RMi6jASbrmOmQrejPv
	MKvFT4mSstYEK9hJFjYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaxvR-0000vy-7v; Tue, 19 May 2020 08:48:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaxvN-0000vb-AY
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 08:48:34 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F2E7F2A1DDF;
 Tue, 19 May 2020 09:48:31 +0100 (BST)
Date: Tue, 19 May 2020 10:48:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>
Subject: Re: [PATCH v5 4/8] mtd: rawnand: Add nand_extract_bits()
Message-ID: <20200519104827.6cb3010d@collabora.com>
In-Reply-To: <20200519074549.23673-5-miquel.raynal@bootlin.com>
References: <20200519074549.23673-1-miquel.raynal@bootlin.com>
 <20200519074549.23673-5-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_014833_496651_FE565BB0 
X-CRM114-Status: GOOD (  19.38  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 19 May 2020 09:45:45 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> There are cases where ECC bytes are not byte-aligned. Indeed, BCH
> implies using a number of ECC bits, which are not always a multiple of
> 8. We then need a helper like nand_extract_bits() to extract these
> syndromes from a buffer.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 42 ++++++++++++++++++++++++++++++++
>  include/linux/mtd/rawnand.h      |  4 +++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 65e9b2fa2fc5..14387b967e8b 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -274,6 +274,48 @@ static int check_offs_len(struct nand_chip *chip, loff_t ofs, uint64_t len)
>  	return ret;
>  }
>  
> +/** nand_extract_bits - Copy unaligned bits from one buffer to another one

It should be

/**
 * nand_extract_bits - Copy unaligned bits from one buffer to another

Once addressed you can add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

If someone reads that and has enough energy, it'd be great to have a
generic bitcpy() function (looks like the fbdev [1] subsystem has a
private implementation too).

> + * @dst: destination buffer
> + * @dst_off: bit offset at which the writing starts
> + * @src: source buffer
> + * @src_off: bit offset at which the reading starts
> + * @nbits: number of bits to copy from @src to @dst
> + *
> + * Copy bits from one memory region to another (overlap authorized).
> + */
> +void nand_extract_bits(u8 *dst, unsigned int dst_off, const u8 *src,
> +		       unsigned int src_off, unsigned int nbits)
> +{
> +	unsigned int tmp, n;
> +
> +	dst += dst_off / 8;
> +	dst_off %= 8;
> +	src += src_off / 8;
> +	src_off %= 8;
> +
> +	while (nbits) {
> +		n = min3(8 - dst_off, 8 - src_off, nbits);
> +
> +		tmp = (*src >> src_off) & GENMASK(n - 1, 0);
> +		*dst &= ~GENMASK(n - 1 + dst_off, dst_off);
> +		*dst |= tmp << dst_off;
> +
> +		dst_off += n;
> +		if (dst_off >= 8) {
> +			dst++;
> +			dst_off -= 8;
> +		}
> +
> +		src_off += n;
> +		if (src_off >= 8) {
> +			src++;
> +			src_off -= 8;
> +		}
> +
> +		nbits -= n;
> +	}
> +}
> +
>  /**
>   * nand_select_target() - Select a NAND target (A.K.A. die)
>   * @chip: NAND chip object
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 0f45b6984ad1..45dd57e2a223 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1412,6 +1412,10 @@ int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
>  void nand_select_target(struct nand_chip *chip, unsigned int cs);
>  void nand_deselect_target(struct nand_chip *chip);
>  
> +/* Bitops */
> +void nand_extract_bits(u8 *dst, unsigned int dst_off, const u8 *src,
> +		       unsigned int src_off, unsigned int nbits);
> +
>  /**
>   * nand_get_data_buf() - Get the internal page buffer
>   * @chip: NAND chip object

[1]https://elixir.bootlin.com/linux/latest/source/drivers/video/fbdev/amifb.c#L2598

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
