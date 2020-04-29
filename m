Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3F1C83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:15:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83EE0206F0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:15:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HM/GVU0M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83EE0206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OV8xpjWZbRab8/geKDy4piq0NPVgWEY52as3sc3r7Vg=; b=HM/GVU0MRbdVgg
	yTS0fiAH5dqXC/ry7ab7RCcHPZKCgQDVNrGZJeD2JKdLb+9OqARignf1olBMpaUSVIhQgvUHmCtNo
	/inyQ5cIOrWhOMd4aAqs/fgwN9eo4VksMlj85wN2ChWbbVgFE4XDFWdZkmaPsivv9ScaTBn0m7zQd
	xKR3uNoxB0Xsq97PgWGXEklvuk8L5nPl36bajC4hnK5fkZ4k7wQ0L7UTbHqydpQfQlTRIB7twW/eN
	nCliEuESl0+i9QbsFUMcptW3KM/0h9nFVrUzJWMuaIga7RToN6Wckj2CSNRQd9og2EgcD+Ee2+4JV
	3qXD29uwu/mwj6i5OgBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTpMj-0005P0-Qe; Wed, 29 Apr 2020 16:15:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTpMf-0005OO-To
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 16:15:15 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8DBF32A068C;
 Wed, 29 Apr 2020 17:15:12 +0100 (BST)
Date: Wed, 29 Apr 2020 18:15:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 09/11] mtd: rawnand: Expose monolithic
 read/write_page_raw() helpers
Message-ID: <20200429181509.657aa2e5@collabora.com>
In-Reply-To: <20200429155540.22048-10-miquel.raynal@bootlin.com>
References: <20200429155540.22048-1-miquel.raynal@bootlin.com>
 <20200429155540.22048-10-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_091514_235733_3E530F42 
X-CRM114-Status: GOOD (  20.92  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 29 Apr 2020 17:55:38 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> The current nand_read/write_page_raw() helpers are already widely used
> but do not fit the purpose of "constrained" controllers which cannot,
> for instance, separate command/address cycles with data cycles.
> 
> Workaround this issue by proposing alternative helpers that cannot be
> used by controller drivers instead.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 60 ++++++++++++++++++++++++++++++++
>  include/linux/mtd/rawnand.h      |  8 +++--
>  2 files changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 15a9189b2307..2e525cb5a4e4 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -2629,6 +2629,39 @@ int nand_read_page_raw(struct nand_chip *chip, uint8_t *buf, int oob_required,
>  }
>  EXPORT_SYMBOL(nand_read_page_raw);
>  
> +/**
> + * nand_monolithic_read_page_raw - Read raw page data without ECC in one go

Maybe

"Read the full page (data + OOB) with ECC engine disabled"

?

> + * @chip: nand chip info structure
> + * @buf: buffer to store read data
> + * @oob_required: caller requires OOB data read to chip->oob_poi
> + * @page: page number to read
> + */
> +int nand_monolithic_read_page_raw(struct nand_chip *chip, u8 *buf,
> +				  int oob_required, int page)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	unsigned int size = mtd->writesize;
> +	u8 *read_buf = buf;
> +	int ret;
> +
> +	if (oob_required) {
> +		size += mtd->oobsize;
> +
> +		if (buf != chip->data_buf)
> +			read_buf = nand_get_data_buf(chip);
> +	}
> +
> +	ret = nand_read_page_op(chip, page, 0, read_buf, size);
> +	if (ret)
> +		return ret;
> +
> +	if (buf != chip->data_buf)
> +		memcpy(buf, read_buf, mtd->writesize);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(nand_monolithic_read_page_raw);
> +
>  /**
>   * nand_read_page_raw_syndrome - [INTERN] read raw page data without ecc
>   * @chip: nand chip info structure
> @@ -3636,6 +3669,33 @@ int nand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
>  }
>  EXPORT_SYMBOL(nand_write_page_raw);
>  
> +/**
> + * nand_monolithic_write_page_raw - Raw page write in one go

Maybe we should have a consistent description for those helpers:

"Write the full page (data + OOB) with ECC engine disabled"

?

> + * @chip: NAND chip info structure
> + * @buf: data buffer
> + * @oob_required: must write chip->oob_poi to OOB
> + * @page: page number to write
> + */
> +int nand_monolithic_write_page_raw(struct nand_chip *chip, const u8 *buf,
> +				   int oob_required, int page)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	unsigned int size = mtd->writesize;
> +	u8 *write_buf = (u8 *)buf;
> +
> +	if (oob_required) {
> +		size += mtd->oobsize;
> +
> +		if (buf != chip->data_buf) {
> +			write_buf = nand_get_data_buf(chip);
> +			memcpy(write_buf, buf, mtd->writesize);
> +		}
> +	}
> +
> +	return nand_prog_page_op(chip, page, 0, write_buf, size);
> +}
> +EXPORT_SYMBOL(nand_monolithic_write_page_raw);
> +
>  /**
>   * nand_write_page_raw_syndrome - [INTERN] raw page write function
>   * @chip: nand chip info structure
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index d40ad19ba0f6..0da10e99cf39 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1328,13 +1328,17 @@ int nand_read_oob_std(struct nand_chip *chip, int page);
>  int nand_get_set_features_notsupp(struct nand_chip *chip, int addr,
>  				  u8 *subfeature_param);
>  
> -/* Default read_page_raw implementation */
> +/* Default read_page_raw implementations */

Well, nand_monolithic_read_page_raw() is not the default :p. Just drop
the "Default " and it should be good.

>  int nand_read_page_raw(struct nand_chip *chip, uint8_t *buf, int oob_required,
>  		       int page);
> +int nand_monolithic_read_page_raw(struct nand_chip *chip, uint8_t *buf,
> +				  int oob_required, int page);
>  
> -/* Default write_page_raw implementation */
> +/* Default write_page_raw implementations */

Ditto.

>  int nand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
>  			int oob_required, int page);
> +int nand_monolithic_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
> +				   int oob_required, int page);
>  
>  /* Reset and initialize a NAND device */
>  int nand_reset(struct nand_chip *chip, int chipnr);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
