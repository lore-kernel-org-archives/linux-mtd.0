Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD643C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:54:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A67B21726
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jo6wW/v/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rd976lg+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A67B21726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jB6EAKyBZhM3WYYpYppPNdOYK76wwUasl8H8klEcgkg=; b=jo6wW/v/sam7YE
	eoP06yMip1hIgygYxvGZ0XX5vxdls9MDyyRlTx8PjhHqF8t3KnAto9T9uR1hO+RGx+TMu71y/WwPp
	g0iR4AHFBEtXxxCI7z9cSStixjmKOOtxjwTO/lBGguisgQbPVE4jDWzbPruZARWZvsfHTpXmxBml4
	A4F8OdTo+EAVLu8FV25RY5d5SeM29P14X5FmQllnpWIQ3jkDGfrYrapMcymab7xP5iMi4wFjq7r9P
	K942U0tXusW9nqeYWLlAISi04Wyer2pxsqsVrVwMCHz3jQe96d/lorN+kpmzkdvzpgafIbwUh9D0K
	PhD6q7TIyu0KxdKXvPpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glzJq-0000d6-42; Tue, 22 Jan 2019 16:54:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glzJm-0000ZL-EK
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 16:54:32 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9602021726;
 Tue, 22 Jan 2019 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548176069;
 bh=4RZo0xAGt2BUOvMe7/Yqt7lZQz8r2WPCxuk0w9WOhi8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rd976lg+qrCD/lGmXupQLjRrKE+5Busqk6SPFj0SAaxxzh1gjsmMzx4btqoqhbL+S
 hywk0ZYam2s/+4Kt464EJMPV8JHT8n2FBS8qcuEIuVktFcs3xyWEnSLgS7xSR8zMwt
 IHg0ZIV1k9MiWidoDbQV7B2aPM30oRofW9RzH/pA=
Date: Tue, 22 Jan 2019 17:54:20 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190122175346.602894e4@bbrezillon>
In-Reply-To: <20190122145632.17547-1-sr@denx.de>
References: <20190122145632.17547-1-sr@denx.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_085430_883229_8745C9F4 
X-CRM114-Status: GOOD (  19.82  )
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

On Tue, 22 Jan 2019 15:56:32 +0100
Stefan Roese <sr@denx.de> wrote:

> Add support for GigaDevice GD5F1GQ4UC SPI NAND chip.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Chuanhong Guo <gch981213@gmail.com>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>

You forgot to Cc me on this one ;-).

> ---
> Frankly, I'm a bit unsure, if these new ooblayout_foo functions are 
> needed for this device. I was unable to find a datasheet for the
> already supported devices (GD5F1G/2G/4GQ4xA), so I couldn't compare
> the OOB area values here with the ones for my SPI NAND chip.

Looks like it's using a different layout.

> 
> I'm also not 100% sure, if I should use NAND_ECCREQ(8, 2048) or
> NAND_ECCREQ(8, 512) for this device.

Given the size reserved to store ECC bytes I'd say 8bits/512bytes.
There's an easy way to validate that => nandbiterrs (in mtd-utils).

> 
> So comments welcome.
> 
> Thanks,
> Stefan
> 
>  drivers/mtd/nand/spi/gigadevice.c | 39 +++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
> index e4141c20947a..a9d256fa2577 100644
> --- a/drivers/mtd/nand/spi/gigadevice.c
> +++ b/drivers/mtd/nand/spi/gigadevice.c
> @@ -57,6 +57,31 @@ static int gd5fxgq4xa_ooblayout_free(struct mtd_info *mtd, int section,
>  	return 0;
>  }
>  
> +static int gd5f1gq4u_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				   struct mtd_oob_region *region)
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
> +static int gd5f1gq4u_ooblayout_free(struct mtd_info *mtd, int section,
> +				    struct mtd_oob_region *region)
> +{
> +	if (section)
> +		return -ERANGE;
> +
> +	/* Reserve 2 bytes for the BBM. */
> +	region->offset = 2;

According to the datasheet, the BBM is only one byte large.

> +	region->length = 62;
> +
> +	return 0;
> +}
> +
>  static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
>  					 u8 status)
>  {
> @@ -86,6 +111,11 @@ static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout = {
>  	.free = gd5fxgq4xa_ooblayout_free,
>  };
>  
> +static const struct mtd_ooblayout_ops gd5f1gq4u_ooblayout = {
> +	.ecc = gd5f1gq4u_ooblayout_ecc,
> +	.free = gd5f1gq4u_ooblayout_free,
> +};
> +
>  static const struct spinand_info gigadevice_spinand_table[] = {
>  	SPINAND_INFO("GD5F1GQ4xA", 0xF1,
>  		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
> @@ -114,6 +144,15 @@ static const struct spinand_info gigadevice_spinand_table[] = {
>  		     0,
>  		     SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
>  				     gd5fxgq4xa_ecc_get_status)),
> +	SPINAND_INFO("GD5F1GQ4UC", 0xd1,
> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 1, 1, 1),
> +		     NAND_ECCREQ(8, 2048),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_variants,
> +					      &update_cache_variants),
> +		     0,
> +		     SPINAND_ECCINFO(&gd5f1gq4u_ooblayout,
> +				     gd5fxgq4xa_ecc_get_status)),

The gd5fxgq4xa_ecc_get_status() func does not work for this chip.
Something like that should do the trick:

#define GD5F1GQ4U_ECC_STATUS_MASK	GENMASK(6, 4)

static int gd5f1gq4u_ecc_get_status(struct spinand_device *spinand,
				    u8 status)
{
	unsigned int nbitflips;

	nbitflips = (status & GD5F1GQ4U_ECC_STATUS_MASK) >> 4;
	if (!nbitflips)
		return 0;

	nbitflips += 2;
	if (nbitflips > 8)
		return -EBADMSG;

	return nbitflips
}

>  };
>  
>  static int gigadevice_spinand_detect(struct spinand_device *spinand)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
