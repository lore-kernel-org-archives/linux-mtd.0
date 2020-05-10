Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01AFC38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 12:30:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4060E2080C
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 12:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NULxQjUw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4060E2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKvOVfZrzLi56y+V9hVaiagBb5z/Gq1ScOKa2Zb6448=; b=NULxQjUwk8lcNQ
	SxDYnR6Ugrs2GskJzB7dlbAg56mM+v4PLHs3kz42DyNpIZm98l2k7rG8GlYEYaY13vjCi9uTvlok7
	juPESzrkSqN/nfWJJLFHOXuGg5GSEyc3tcCtwxm8QiCVjFjPqCNhUe64M7uEiP/J7Qzl/uNCDH2Ll
	/B/LDAopSL5BaImrcMiVuLdVilD7qA+6NNuOgWKt9dWykqGis2bLI+IiPdhofIaiPieCQ50TAMcYG
	fs5mub830/zuW+gdmS3YcGUElwNhBTQcm02hUpBGExZ3diTrnbCE1TBR11FYvIWL1WphlzFsHBpd/
	M8oiZU7EEX+vC9Gmvo9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXl62-0004mK-QV; Sun, 10 May 2020 12:30:18 +0000
Received: from smtprelay0209.hostedemail.com ([216.40.44.209]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXl5s-00036F-47
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 12:30:14 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id A5222837F24F;
 Sun, 10 May 2020 12:30:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: care08_74ee8b8fc775e
X-Filterd-Recvd-Size: 1873
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Sun, 10 May 2020 12:30:03 +0000 (UTC)
Message-ID: <0bb52429f245717698a2600da094a00977859c79.camel@perches.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Remove Piotr Sroka and mark Cadence
 NFC as orphaned
From: Joe Perches <joe@perches.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org
Date: Sun, 10 May 2020 05:30:02 -0700
In-Reply-To: <20200510122430.19105-1-miquel.raynal@bootlin.com>
References: <20200510122430.19105-1-miquel.raynal@bootlin.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_053008_296388_3B6C52AA 
X-CRM114-Status: GOOD (  11.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 2020-05-10 at 14:24 +0200, Miquel Raynal wrote:
> Piotr's address is bouncing, remove him from MAINTAINERS and mark the
> driver he was maintaining, Cadence's, as orphaned.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1f2c83ead00b..fdd6e96a689b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3749,9 +3749,8 @@ F:	Documentation/devicetree/bindings/media/cdns,*.txt
>  F:	drivers/media/platform/cadence/cdns-csi2*
>  
>  CADENCE NAND DRIVER
> -M:	Piotr Sroka <piotrs@cadence.com>
> +S:	Orphan
>  L:	linux-mtd@lists.infradead.org
> -S:	Maintained
>  F:	Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
>  F:	drivers/mtd/nand/raw/cadence-nand-controller.c

Please don't change the relative locations.
L should still comes first, then S



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
