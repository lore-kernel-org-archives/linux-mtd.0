Return-Path: <SRS0=IAjr=6J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BB9C55186
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 08:26:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE872071C
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 08:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rxlJNcbT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE872071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qw6kYbuHjrY4hc9wGaGpOE7zRVtE+1qDCTP+Uall8wI=; b=rxlJNcbTWRTUHI
	dmX8BGstxAnK+jtMVprRayGxwNodI6jB+XcC8Tsm2GwM4b+tbC4Pn3SnrymusOlnLVRmtr0+rgC3+
	hKU84iS2OItyJfS3bgbXiA7KvKaraa+iXcM77All/P4UI59nO/aT/IUgzNSQRTgw7+fxsjz2PrPqZ
	vgR/ASe4BaOgQIBAMYdHcw0Dbi6YOJhzHY8uuNhkE/KYSuA/xuQ5CzpMDaj1hwJSxSm51k5FNtwn8
	UvS2OGXqaqwIs+0fqXqR6JClGNI7YpCPhY25ULKWZvp8ncEOKLtGS2zEcI/2Yf6anh8cfMxwd2Bmx
	fd1DM3Je9y89pQZ6tcUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSG8h-00058X-0h; Sat, 25 Apr 2020 08:26:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSG8e-000570-Bs
 for linux-mtd@lists.infradead.org; Sat, 25 Apr 2020 08:26:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CC1D92A2E93;
 Sat, 25 Apr 2020 09:26:14 +0100 (BST)
Date: Sat, 25 Apr 2020 10:26:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 7/9] mtd: rawnand: onfi: Drop a useless parameter
 page read
Message-ID: <20200425102612.7f90efc8@collabora.com>
In-Reply-To: <20200424164042.26572-8-miquel.raynal@bootlin.com>
References: <20200424164042.26572-1-miquel.raynal@bootlin.com>
 <20200424164042.26572-8-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_012616_534670_AFA50152 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 24 Apr 2020 18:40:40 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> During detection the logic on the NAND bus is:
> 
>     /* Regular ONFI detection */
>     1/ read the three NAND parameter pages
> 
>     /* Extended parameter page detection */
>     2/ send "read the NAND parameter page" commands without reading
>        actual data
>     3/ move the column pointer to the extended page and read it
> 
> If fact, as long as there is nothing happening on the NAND bus between
> 1/ and 3/, the operation 2/ is redundant so remove it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_onfi.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
> index 6576b841bc56..2fc71b7c361f 100644
> --- a/drivers/mtd/nand/raw/nand_onfi.c
> +++ b/drivers/mtd/nand/raw/nand_onfi.c
> @@ -47,12 +47,10 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
>  	if (!ep)
>  		return -ENOMEM;
>  
> -	/* Send our own NAND_CMD_PARAM. */
> -	ret = nand_read_param_page_op(chip, 0, NULL, 0);
> -	if (ret)
> -		goto ext_out;
> -
> -	/* Use the Change Read Column command to skip the ONFI param pages. */
> +	/*
> +	 * Use the Change Read Column command to skip the ONFI param pages and
> +	 * ensure we read at the right location.
> +	 */
>  	ret = nand_change_read_column_op(chip,
>  					 sizeof(*p) * p->num_of_param_pages,
>  					 ep, len, true);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
