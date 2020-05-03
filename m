Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0918C28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 15:09:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72C2B208DB
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 15:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BWcB1eI3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72C2B208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGAbPqFKuY/o54FbuTbomjwi6M0Lsb3U+6AJlhuHukY=; b=BWcB1eI3I9uuPK
	AjqWQkEb4IgGO1FQT+rAOlBwhBDW3JkiD8ZW54KmGasIE0whsi2wY+bXAluhaGLoULeRgtraWm+iU
	c/dUVL6Z4Ni5lhGpunubksmiVKdtpjqVQMAF4ZgZSyJeY6OEiG27fXQFGif7ZdhhbaLoxyfhmaWsB
	aUECPukdYR3qAfw167YiaZdJxZu5KeT4v/p5y9/iPv68vQZiWiL9B01o7a8efle3XLjZ4cTx35RkB
	SOcClDz8TS/x9u8uY46LiOv8roppTg2jBHvXn2Cax4LqaFpbRnO9dO1Lt+RrssJte+xbqv8CPjxBX
	n6DyCPO//nulflNCfMKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVGFI-000690-Ak; Sun, 03 May 2020 15:09:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVGFF-00068c-3l
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 15:09:30 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AADC62A0677;
 Sun,  3 May 2020 16:09:27 +0100 (BST)
Date: Sun, 3 May 2020 17:09:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: Add the nand_chip->write_oob hook
Message-ID: <20200503170924.52f9d9d6@collabora.com>
In-Reply-To: <20200503114029.30257-3-miquel.raynal@bootlin.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-3-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_080929_283794_389E644C 
X-CRM114-Status: GOOD (  21.24  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Zoltan Szubbocsev <zszubbocsev@micron.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, tglx@linutronix.de,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun,  3 May 2020 13:40:28 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> With the same approach as for the ->erase hook, in order to solve an
> issue with Micron NANDs, we must be able to overload the write
> operation. With this in mind, we create a ->write_oob hook in the
> nand_chip structure which points by default to the
> currently in use nand_write_oob() helper, renamed
> nand_write_oob_nand() for the parallel with the nand_erase_nand()
> one.

First of all, I must say I hate the hook name. Having mtd->_write_oob()
that writes both OOB and data is confusing, and you're pulling this
confusing name to the raw NAND layer.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/internals.h | 2 ++
>  drivers/mtd/nand/raw/nand_base.c | 8 ++++++++
>  include/linux/mtd/rawnand.h      | 3 +++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index 9d0caadf940e..caf534a6586a 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -81,6 +81,8 @@ int nand_bbm_get_next_page(struct nand_chip *chip, int page);
>  int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
>  int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
>  		    int allowbbt);
> +int nand_write_oob_nand(struct nand_chip *chip, loff_t to,
> +			struct mtd_oob_ops *ops);
>  int onfi_fill_data_interface(struct nand_chip *chip,
>  			     enum nand_data_interface_type type,
>  			     int timing_mode);
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 7c7ac722d88b..f9cf30949f49 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4121,6 +4121,13 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
>  			  struct mtd_oob_ops *ops)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> +
> +	return chip->write_oob(chip, to, ops);
> +}
> +
> +int nand_write_oob_nand(struct nand_chip *chip, loff_t to,
> +			struct mtd_oob_ops *ops)

Hm, what happens next time we have a similar name, do we suffix it with
_nand_nand? :P

> +{
>  	int ret;
>  
>  	ops->retlen = 0;
> @@ -4423,6 +4430,7 @@ static void nand_set_defaults(struct nand_chip *chip)
>  		chip->buf_align = 1;
>  
>  	chip->erase = nand_erase_nand;
> +	chip->write_oob = nand_write_oob_nand;
>  }
>  
>  /* Sanitize ONFI strings so we can safely print them */
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 505c13f7a2ba..7fbbd5d7088f 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1021,6 +1021,7 @@ struct nand_legacy {
>   * @setup_read_retry:	[FLASHSPECIFIC] flash (vendor) specific function for
>   *			setting the read-retry mode. Mostly needed for MLC NAND.
>   * @erase:		Raw NAND erase operation.
> + * @write_oob:		Raw NAND write operation.
>   * @ecc:		[BOARDSPECIFIC] ECC control structure
>   * @buf_align:		minimum buffer alignment required by a platform
>   * @oob_poi:		"poison value buffer," used for laying out OOB data
> @@ -1092,6 +1093,8 @@ struct nand_chip {
>  	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
>  	int (*erase)(struct nand_chip *chip, struct erase_info *instr,
>  		     int allowbbt);
> +	int (*write_oob)(struct nand_chip *chip, loff_t to,
> +			 struct mtd_oob_ops *ops);
>  

Okay, so I'm not sure duplicating the nand_write_oob() logic is the
best option here. I'd rather go for a post write_page() hook.

Note that we probably want a post read_page() hook so we can flag
pages as written by analyzing what's returned to the caller. That would
saves us unneeded writes when the page has been read.

>  	unsigned int options;
>  	unsigned int bbt_options;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
