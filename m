Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3A8C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 08:17:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD27421738
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 08:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i4/Au5/q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD27421738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxShsgpA1y8fV9WX03QIP2z4n75KPO7Jgkw2fmPwQOw=; b=i4/Au5/qgpATVn
	ZnQ8zPNA+VX0XYKIH/gF0EHikcZJjsmckvRBoX/g20eWESQUbtiJ4vnZa84MK8P9BIsiMPjXHV3Os
	rvkWD6HGoNNwUHMHQxutyxZWCJZQk6u5KqmRFbpRa3wDskVmz5QQ0Bc29YkXv1Qsrr3t9pR6mrvar
	lTacA67A7hFzg1Ks/8W+9azJaG19f29nwuyY5rDDOQCw+wAE32mnlHYF6LtATOldTgY5wHYZAUhS0
	dw/32l8eE4uieIchbgvPk5Gmgst0gO9tpnlWpPRXMtN4oLgMx3/D5VQdkCsh2pgilwEmEcUyjBw0R
	o4xAtD8TcQOT02oAcGeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCK2P-0001RO-3T; Fri, 05 Apr 2019 08:17:25 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCK2L-0001QA-WD
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 08:17:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id AFDE46091849;
 Fri,  5 Apr 2019 10:17:19 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id hViIECzABTgy; Fri,  5 Apr 2019 10:17:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DA99C609184D;
 Fri,  5 Apr 2019 10:17:17 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6pli4el6vDt9; Fri,  5 Apr 2019 10:17:17 +0200 (CEST)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 716FC6091849;
 Fri,  5 Apr 2019 10:17:17 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] MAINTAINERS: MTD Git repository is hosted on kernel.org
Date: Fri, 05 Apr 2019 10:17:16 +0200
Message-ID: <1646294.Tf0yIsZSBV@blindfold>
In-Reply-To: <20190405080342.26330-1-miquel.raynal@bootlin.com>
References: <20190405080342.26330-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_011722_187443_33FFDE8D 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Freitag, 5. April 2019, 10:03:42 CEST schrieb Miquel Raynal:
> Because of the slowness of the infradead.org server, Linus requested
> that we send him PRs from another domain. We moved our Git repository
> to kernel.org and maintain the following branches:
> * Fixes based on the last -rc: mtd/fixes
> * Next branch based usually on -rc1: mtd/next, nand/next, spi-nor/next.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes in v2:
> * Drop nand/fixes and spi-nor/fixes, we won't use them.
> 
> 
>  MAINTAINERS | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 383915d69a51..ef6a56141344 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10004,8 +10004,8 @@ M:	Vignesh Raghavendra <vigneshr@ti.com>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> -T:	git git://git.infradead.org/linux-mtd.git master
> -T:	git git://git.infradead.org/linux-mtd.git mtd/next
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mtd/
>  F:	drivers/mtd/
> @@ -10617,8 +10617,7 @@ R:	Richard Weinberger <richard@nod.at>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> -T:	git git://git.infradead.org/linux-mtd.git nand/fixes
> -T:	git git://git.infradead.org/linux-mtd.git nand/next
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
>  S:	Maintained
>  F:	drivers/mtd/nand/
>  F:	include/linux/mtd/*nand*.h
> @@ -14603,8 +14602,7 @@ M:	Tudor Ambarus <tudor.ambarus@microchip.com>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> -T:	git git://git.infradead.org/linux-mtd.git spi-nor/fixes
> -T:	git git://git.infradead.org/linux-mtd.git spi-nor/next
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
>  S:	Maintained
>  F:	drivers/mtd/spi-nor/
>  F:	include/linux/mtd/spi-nor.h
> 

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
