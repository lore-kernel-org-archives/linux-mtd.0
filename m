Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62258C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B673B218A2
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k/Ni09t8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iSUtQ6g/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pjpm+TV4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B673B218A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GWUdxdG/oQzlhwtUchdgNH3q9FIsaSNKcbSaa5Fz8M=; b=k/Ni09t8kbU8GJ
	ccpvnBdFZYYlEcGXGYS1f8GvBI3n+SQPbrOZVcIhWC66vfqz8P++o3pwnfQP7IDHZWi5/lRMZK8PM
	V8Zak1+1aHYAqv65IwC6X3PxogU5CteuLYNvrd+f2vgd0hN7XdKNRLE2B4mjGu0VqJK/pEkavc/gj
	BMR6UqHit9N+km3tQKWXqfkhp6FKbcOloca06L75XSYWUsZ8ehQZ/WGPdziLBFDFLkZ875L6R47Rf
	Bl50xMn/ttHUs7TmU1ncHAuCskw+Uf+rm3f3ahL9+a+vfLC+DwjRP+zfRI8f8jlKIixFQRn9PTddm
	/fhkXEKy4qEUp2/y7zQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmh1I-00048P-Kb; Thu, 24 Jan 2019 15:34:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmh1H-0003yZ-82
 for linux-mtd@bombadil.infradead.org; Thu, 24 Jan 2019 15:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kpJOmqD+WjfZDEuJNKUsp4WpNBUU/kArduC/229iDvg=; b=iSUtQ6g/2Xmlf0i5W7J6QiWVz6
 Px0D0hzod8hcfyZFiRzElS3e07rNVcwaQ3WJ/WNAZq4XpEV7SvUWm6YqftXHe3d++oNw5L3j2rADH
 y3TlzaQch7uIZd/srFiR/ZDmXlL8EHIzhSGBE72Z411D7KeC3zxqUd3fX9YRXs6/D+15ACEOZYHJ9
 VcV/CTSObJZ9W+ruQfaI8gpAmGF5I87aRCvwH/raNhgwlkgwsCCMwWnJf1ZNcE6QHgMGRrF4z0JQG
 N59PLceMstxia8PAUwhsywU9lLVgNqifEx/FEgwcEYmgWdyJeUEv7GXXfF9C7WVCJXS6nmU/Xt35m
 /UG+AFMw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmgn2-0007HG-Hf
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 15:19:38 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAEFD2184C;
 Thu, 24 Jan 2019 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548343175;
 bh=U0yTaDuYfQO1BPDa5ZdnI6G14lhhTjOAEqpTEQ9/nc0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pjpm+TV4SAwsAf/3lgBIrxaamNlNc9tOHy7EzlKzwagF+1ykYBJ+l/uNAgyOllkPU
 lX9pX2/iVZq2xhbAjNp4bTIs2UtnwSDumWRN5ucInvtzqX85GCHaMAT5U8ZZIvV0VY
 Rv12gopy9O/2IuEKQk1cHe6eN+A+4V1z9eL7w8yQ=
Date: Thu, 24 Jan 2019 16:19:24 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH v2] mtd: spinand: Add support for GigaDevice GD5F1GQ4UExxG
Message-ID: <20190124161924.515fd0a7@bbrezillon>
In-Reply-To: <20190124124806.3902-1-sr@denx.de>
References: <20190124124806.3902-1-sr@denx.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_151936_891620_60BA5089 
X-CRM114-Status: GOOD (  26.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 24 Jan 2019 13:48:06 +0100
Stefan Roese <sr@denx.de> wrote:

> Add support for GigaDevice GD5F1GQ4UExxG SPI NAND chip.

			             ^ Looks like this U could be an x,
as it only encodes the voltage and should not imply functional changes.
The function and macro names should be updated accordingly. Looks good
otherwise:

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Chuanhong Guo <gch981213@gmail.com>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> ---
> v2:
> - Name of NAND device changed to better reflect the real part
> - OOB layout changed to only reserve 1 byte for BBT
> - Use ECC caps 8bits/512bytes instead of 8bits/2048bytes
> - Enhanced ecc_get_status() function to determine and report
>   a more fine grained bit error status
> 
>  drivers/mtd/nand/spi/gigadevice.c | 83 +++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
> index e4141c20947a..0b49d8264bef 100644
> --- a/drivers/mtd/nand/spi/gigadevice.c
> +++ b/drivers/mtd/nand/spi/gigadevice.c
> @@ -12,6 +12,8 @@
>  #define GD5FXGQ4XA_STATUS_ECC_1_7_BITFLIPS	(1 << 4)
>  #define GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS	(3 << 4)
>  
> +#define GD5FXGQ4UEXXG_REG_STATUS2		0xf0
> +
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> @@ -81,11 +83,83 @@ static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
>  	return -EINVAL;
>  }
>  
> +static int gd5fxgq4uexxg_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				       struct mtd_oob_region *region)
> +{
> +	if (section)
> +		return -ERANGE;
> +
> +	region->offset = 64;
> +	region->length = 64;
> +
> +	return 0;
> +}
> +
> +static int gd5fxgq4uexxg_ooblayout_free(struct mtd_info *mtd, int section,
> +					struct mtd_oob_region *region)
> +{
> +	if (section)
> +		return -ERANGE;
> +
> +	/* Reserve 1 bytes for the BBM. */
> +	region->offset = 1;
> +	region->length = 63;
> +
> +	return 0;
> +}
> +
> +static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
> +					u8 status)
> +{
> +	u8 status2;
> +	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQ4UEXXG_REG_STATUS2,
> +						      &status2);
> +	int ret;
> +
> +	switch (status & STATUS_ECC_MASK) {
> +	case STATUS_ECC_NO_BITFLIPS:
> +		return 0;
> +
> +	case GD5FXGQ4XA_STATUS_ECC_1_7_BITFLIPS:
> +		/*
> +		 * Read status2 register to determine a more fine grained
> +		 * bit error status
> +		 */
> +		ret = spi_mem_exec_op(spinand->spimem, &op);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * 4 ... 7 bits are flipped (1..4 can't be detected, so
> +		 * report the maximum of 4 in this case
> +		 */
> +		/* bits sorted this way (3...0): ECCS1,ECCS0,ECCSE1,ECCSE0 */
> +		return ((status & STATUS_ECC_MASK) >> 2) |
> +			((status2 & STATUS_ECC_MASK) >> 4);
> +
> +	case GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS:
> +		return 8;
> +
> +	case STATUS_ECC_UNCOR_ERROR:
> +		return -EBADMSG;
> +
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout = {
>  	.ecc = gd5fxgq4xa_ooblayout_ecc,
>  	.free = gd5fxgq4xa_ooblayout_free,
>  };
>  
> +static const struct mtd_ooblayout_ops gd5fxgq4uexxg_ooblayout = {
> +	.ecc = gd5fxgq4uexxg_ooblayout_ecc,
> +	.free = gd5fxgq4uexxg_ooblayout_free,
> +};
> +
>  static const struct spinand_info gigadevice_spinand_table[] = {
>  	SPINAND_INFO("GD5F1GQ4xA", 0xF1,
>  		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
> @@ -114,6 +188,15 @@ static const struct spinand_info gigadevice_spinand_table[] = {
>  		     0,
>  		     SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
>  				     gd5fxgq4xa_ecc_get_status)),
> +	SPINAND_INFO("GD5F1GQ4UExxG", 0xd1,
> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 1, 1, 1),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_variants,
> +					      &update_cache_variants),
> +		     0,
> +		     SPINAND_ECCINFO(&gd5fxgq4uexxg_ooblayout,
> +				     gd5fxgq4uexxg_ecc_get_status)),
>  };
>  
>  static int gigadevice_spinand_detect(struct spinand_device *spinand)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
