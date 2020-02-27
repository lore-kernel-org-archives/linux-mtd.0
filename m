Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C05C35DF9
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 18:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF403246A6
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 18:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QYyvS/CE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF403246A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wd7CMFtFyY6OUE2nFMOeJbyqgpADPDRmXybJqkbkfjI=; b=QYyvS/CERh1+JQ
	oO7SQjCyqH+NxT8dhUJDorPHd/zi6GJp4S2DlR6IglciXYTEU+Xc4GLdRy0Msvn6PxOgRxbt05tKs
	XBwXzdeFUTMEvGqvwIeq/A9ieBOyyA9w24p5tGroKSNBusPyTrprP498PxLQoCVmNt3QD7yxfuynW
	JcFH7VfDGzcWLs6TuFTG1W3SlWS9JpsXZmkBYVCZyRQ7+ayEeajjN/Lssu+QZi2hqZ7hq0olkC+zQ
	2AH3EX6GAAF1w6GHUnsKGh0KZH1D3cdMI6Qc7OmfMbNmEF+7oFcF4j35kSbjMZo7DpXZHG9dMcOql
	F6qoJbqeiMhE39qP8lGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Nnx-0007Jg-Sg; Thu, 27 Feb 2020 18:22:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7NnY-0006w7-Kb
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 18:22:14 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 20FFE29645A;
 Thu, 27 Feb 2020 18:22:11 +0000 (GMT)
Date: Thu, 27 Feb 2020 19:22:09 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH v4 1/5] mtd: spinand: micron: Generalize the OOB layout
 structure and function names
Message-ID: <20200227192209.77d637a4@collabora.com>
In-Reply-To: <20200206202206.14770-2-sshivamurthy@micron.com>
References: <20200206202206.14770-1-sshivamurthy@micron.com>
 <20200206202206.14770-2-sshivamurthy@micron.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_102212_806077_B7D3263F 
X-CRM114-Status: GOOD (  16.30  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu,  6 Feb 2020 21:22:02 +0100
shiva.linuxworks@gmail.com wrote:

> From: Shivamurthy Shastri <sshivamurthy@micron.com>
> 
> In order to add new Micron SPI NAND devices, we generalized the OOB
> layout structure and function names.
> 
> Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/spi/micron.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> index 7d7b1f7fcf71..c028d0d7e236 100644
> --- a/drivers/mtd/nand/spi/micron.c
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -34,38 +34,38 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
>  		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
>  		SPINAND_PROG_LOAD(false, 0, NULL, 0));
>  
> -static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, int section,
> -					struct mtd_oob_region *region)
> +static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *region)
>  {
>  	if (section)
>  		return -ERANGE;
>  
> -	region->offset = 64;
> -	region->length = 64;
> +	region->offset = mtd->oobsize / 2;
> +	region->length = mtd->oobsize / 2;
>  
>  	return 0;
>  }
>  
> -static int mt29f2g01abagd_ooblayout_free(struct mtd_info *mtd, int section,
> -					 struct mtd_oob_region *region)
> +static int micron_8_ooblayout_free(struct mtd_info *mtd, int section,
> +				   struct mtd_oob_region *region)
>  {
>  	if (section)
>  		return -ERANGE;
>  
>  	/* Reserve 2 bytes for the BBM. */
>  	region->offset = 2;
> -	region->length = 62;
> +	region->length = (mtd->oobsize / 2) - 2;
>  
>  	return 0;
>  }
>  
> -static const struct mtd_ooblayout_ops mt29f2g01abagd_ooblayout = {
> -	.ecc = mt29f2g01abagd_ooblayout_ecc,
> -	.free = mt29f2g01abagd_ooblayout_free,
> +static const struct mtd_ooblayout_ops micron_8_ooblayout = {
> +	.ecc = micron_8_ooblayout_ecc,
> +	.free = micron_8_ooblayout_free,
>  };
>  
> -static int mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
> -					 u8 status)
> +static int micron_8_ecc_get_status(struct spinand_device *spinand,
> +				   u8 status)
>  {
>  	switch (status & MICRON_STATUS_ECC_MASK) {
>  	case STATUS_ECC_NO_BITFLIPS:
> @@ -98,8 +98,8 @@ static const struct spinand_info micron_spinand_table[] = {
>  					      &write_cache_variants,
>  					      &update_cache_variants),
>  		     0,
> -		     SPINAND_ECCINFO(&mt29f2g01abagd_ooblayout,
> -				     mt29f2g01abagd_ecc_get_status)),
> +		     SPINAND_ECCINFO(&micron_8_ooblayout,
> +				     micron_8_ecc_get_status)),
>  };
>  
>  static int micron_spinand_detect(struct spinand_device *spinand)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
