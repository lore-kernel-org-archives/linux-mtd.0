Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4FDC38A2A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 11:50:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE28120735
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 11:50:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XSkzhf6s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE28120735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFbG1xxmg8Kdb885JGWbm9K+sNo87jFR2e9eXaPGr94=; b=XSkzhf6sQh//M3
	rFGpLlBivt2ucIirZimJJyggVSwsy3QBx5zLU/0Id6FNPenh/ieORDnit3rMqb/UjW+KyFfn8d64X
	7vtnWX4L68BKKTHRpe5RbozyngWoOmoh7zsLOxpMzOR2pHLWxWeM/2m9oZjRWVQRbf9rpelF5Spnk
	od9fZq+eBkYWrYoN//yR+DPHdhymeUgx5mWX6up//WsqBTtcd5ZfpWpmIbY/fp/+Bk4l1/oNmYcm8
	8j803kR/4NkU429sqHLgWzDccOTJI8OgvHK5hHWybCOc/ixf1S0ffH/q9B4OsrggUGddwVIyeGf08
	DBm1JDq8jnrrgUIP4j5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWf2V-0006iu-VI; Thu, 07 May 2020 11:50:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWf2R-0005kz-UU
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 11:50:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8139C2A01F7;
 Thu,  7 May 2020 12:50:02 +0100 (BST)
Date: Thu, 7 May 2020 13:49:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 4/8] mtd: rawnand: Add nand_extract_bits()
Message-ID: <20200507134959.38bbcdc4@collabora.com>
In-Reply-To: <20200507110034.14736-5-miquel.raynal@bootlin.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
 <20200507110034.14736-5-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_045004_147817_E7BC9DF6 
X-CRM114-Status: GOOD (  18.34  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu,  7 May 2020 13:00:30 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> There are cases where ECC bytes are not byte-aligned. Indeed, BCH
> implies using a number of ECC bits, which are not always a multiple of
> 8. We then need a helper like nand_extract_bits() to extract these
> syndromes from a buffer.

Do you plan to send a patch to make the GPMI driver use this helper?

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 31 +++++++++++++++++++++++++++++++
>  include/linux/mtd/rawnand.h      |  4 ++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 25d298938aa9..b236e1bdddaf 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -224,6 +224,37 @@ static int check_offs_len(struct nand_chip *chip, loff_t ofs, uint64_t len)
>  	return ret;
>  }
>  
> +/* Copy unaligned bits from one buffer to another one (no overlap) */
> +void nand_extract_bits(u8 *dst, const u8 *src, unsigned int src_off,
> +		       unsigned int nbits)
> +{
> +	unsigned int dst_off = 0, tmp, n;
> +
> +	src += src_off / 8;
> +	src_off %= 8;
> +
> +	while (nbits) {
> +		n = min3(8 - dst_off, 8 - src_off, nbits);
> +
> +		tmp = (*src >> src_off) & GENMASK(n - 1, 0);
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
> index 406e9ff0f45c..734564232545 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1404,6 +1404,10 @@ int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
>  void nand_select_target(struct nand_chip *chip, unsigned int cs);
>  void nand_deselect_target(struct nand_chip *chip);
>  
> +/* Bitops */
> +void nand_extract_bits(u8 *dst, const u8 *src, unsigned int src_off,
> +		       unsigned int nbits);
> +
>  /**
>   * nand_get_data_buf() - Get the internal page buffer
>   * @chip: NAND chip object


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
