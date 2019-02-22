Return-Path: <SRS0=6jNp=Q5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F0CC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Feb 2019 14:31:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E66BC2075C
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Feb 2019 14:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="enly9MDE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wv9KWK/o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E66BC2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPFLdbmzQc5u5bzi+sp3VxOofYqCdp2NVsIg7O0Ifyo=; b=enly9MDEPxumTS
	LdIsqGpskhUn9maBq9UV0usMyAHUSPJKA9MNphqP+dpOm1yLNnGL2rPR9XPYoZ0fczL3+CMoSq889
	AImYnaEzVAOKIf30xujEe9ob4GFiJmhZGY419BsqrHRy2ZRb97BIIyRj2hHhg2mAX7hSbmIIXAP40
	5tKHXRCoZ/Guk8yy1we46gv/FrOipc6i21QElM/o2vmHJ+/zzC8MLut3L9iBA+gN5Knj6gbhNTUDC
	XmfO2CfNqN0seHeSVu2UKGD8nqZwzOEyT9jEXIMHB+jK84bc/RWmTZYoZP/6UOqJSnXIg7N5YGv+P
	2RlliXFRKdWKC225iV6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxBrS-0006o0-A2; Fri, 22 Feb 2019 14:31:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxBrJ-0006g2-D2; Fri, 22 Feb 2019 14:31:26 +0000
Received: from localhost (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C23092075A;
 Fri, 22 Feb 2019 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550845884;
 bh=HL49hZAxMP/99w8YtG8NWrPe6qV9pzNVvj4o4CDkbcM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wv9KWK/oeG7tK9WURRl5jS5eA8MJhhjRtRS+Lq7KTRbM4HNelOV2TJqIbV1IFfeZb
 FSPwVDaXjJ433Mf7hwKybYooe11oMr1pa8PFHzSLDx8Pg5jbtS+kU2zxJhFRQ/HiRo
 Q0xeHE04wXchOotWt5o4R5cifrYjiJInOHcPqIj4=
Date: Fri, 22 Feb 2019 15:31:17 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RFC PATCH 21/27] mtd: spinand: Fix typo in comment
Message-ID: <20190222153117.6b4a2d04@kernel.org>
In-Reply-To: <20190221125806.28875-9-miquel.raynal@bootlin.com>
References: <20190221125806.28875-1-miquel.raynal@bootlin.com>
 <20190221125806.28875-9-miquel.raynal@bootlin.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_063125_459277_3AFE83F6 
X-CRM114-Status: GOOD (  17.21  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 21 Feb 2019 13:58:00 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> One comment in the SPI-NAND core is not very clear, fix it to ease the
> understanding of what the block does.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/spi/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index ab41b9434d87..9c8a5ee626cd 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1032,7 +1032,7 @@ static int spinand_init(struct spinand_device *spinand)
>  
>  	/*
>  	 * Right now, we don't support ECC, so let the whole oob
> -	 * area is available for user.
> +	 * area available for the user.
>  	 */
>  	mtd->_read_oob = spinand_mtd_read;
>  	mtd->_write_oob = spinand_mtd_write;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
