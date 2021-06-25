Return-Path: <SRS0=mYMn=LT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52C2C49EA7
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 10:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7336A61441
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 10:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7336A61441
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W34VcI+NrbL0jD+LjyAP0Pnt4acfSO6H0OKrwKNCeKk=; b=ombs9rpZ9o516j
	HkV/r1OV0WFR8o0WT4hg5sP1mvaumrCJxlGDxYSxoIMAE/yPemKIm1hnA0m+GO4jwBVwek4wGREK9
	nMMGTUiAPs+/ESHPRGMsl4ZswYmFJH/Udv9n2JnXqUij/ogUeyhfQZQfR6RgQN/sOgDj0kOVRRSdO
	L0eKI8UCtE090rCo6IQhnTzbBy6iEUBhcfUTg79R8A1cUGQvVpBZYUy3VTaZbriIVTWAUik96dQT5
	ATrznwhkYtX0qsRU83/S6AgUhVf2PU1QHV6tkbp3e8s1SeHlLhT8Cq3HEZAWlHxBE1eQIaEx5N/gQ
	Mhc5urSobfyickHs4mZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwjAt-0010Gn-8o; Fri, 25 Jun 2021 10:35:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwiUS-000mEN-Do
 for linux-mtd@lists.infradead.org; Fri, 25 Jun 2021 09:51:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A43B961423;
 Fri, 25 Jun 2021 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624614671;
 bh=2W0lvZfpLXORUkM2ExWV3NULyHOTnGAdTs9RY07P/Zw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KN31sqIw5r5LlLnrZQl2eM4nRZoEu2uwdLl0iu4Z3mEiGLQLZMdHiPEphTt+MoCV/
 n3x2oiIVN7iwTX5VzSXEBGHzhkGDBv1p/UdL0OAsH5f3ZCAoYLRNMi0XpHEn/w/xOV
 KIi3HqllKRRejlXFc1zCl9QaK0X0rWUCztYUXSM3xkdXs4ab3HhDm4pBvwnjxvgVaK
 iMtt28zi6QgyDdCCzpoG2T7EcLmsYOGQ1mLrv6dVfY8dtd1Ju+0LxWALjJFXYWC1gS
 sS95QvFYS3Dzy9ailnPmdfPb2tRYN4BbbpUkp9pokfVdYjpMu7ZtxC285tFOBc91Y0
 ddQxsflbSS3ng==
Date: Fri, 25 Jun 2021 15:20:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Add a check in of_get_nand_secure_regions()
Message-ID: <20210625095041.GA4299@thinkpad>
References: <YMtQFXE0F1w7mUh+@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMtQFXE0F1w7mUh+@mwanda>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_025112_598500_F2F7F8F3 
X-CRM114-Status: GOOD (  15.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jun 17, 2021 at 04:37:25PM +0300, Dan Carpenter wrote:
> Check for whether of_property_count_elems_of_size() returns a negative
> error code.
> 
> Fixes: 13b89768275d ("mtd: rawnand: Add support for secure regions in NAND memory")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/mtd/nand/raw/nand_base.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 57a583149cc0..cbba46432e39 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5231,8 +5231,8 @@ static int of_get_nand_secure_regions(struct nand_chip *chip)
>  	int nr_elem, i, j;
>  
>  	nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
> -	if (!nr_elem)
> -		return 0;
> +	if (nr_elem <= 0)
> +		return nr_elem;
>  
>  	chip->nr_secure_regions = nr_elem / 2;
>  	chip->secure_regions = kcalloc(chip->nr_secure_regions, sizeof(*chip->secure_regions),
> -- 
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
