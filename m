Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA9AC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:37:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A43B2245C
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A43B2245C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=66OokPsfeknV2c5eGEvN89NT1K3GA4KkcHiAhAIzZd4=; b=a1gkB2Wj2JlxJyFhZ9rCbtAKq
	Cnn7O1n6lz5mZAovbzrMXS9SDzXJ7t0Jjro5ZuUAVgaXbP8S5yZCCkQvbd7Hluf0w8MhFxH69JR03
	4AMk0D579u52R5mRSAPbB7Hs4JQr2YBWqVbsNJaaUyGU9eX2c79irZKIsLyOIF6gfE7VJHdIlKNyw
	4K2PYyvmNk0Vi7rs4GKJFNtMOI7aupMZ8x4kEodqyVYdtgwuVu4CSrReRxXlMU+41PCxGiH4Ip8o8
	CXxFuvF/ho41y0iSsodOOM5+GglJ7CTJ1nqs6xkXVxW7SPWJCNAr31cIjlXxh71OMG3R0f0DdhgSq
	DidJwONSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Aqb-0001ji-LK; Wed, 20 Jan 2021 10:36:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2AqY-0001jD-Pb
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 10:36:19 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 69AB81F455F2;
 Wed, 20 Jan 2021 10:36:17 +0000 (GMT)
Date: Wed, 20 Jan 2021 11:36:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: omap: Use ECC information from the
 generic structures
Message-ID: <20210120113614.6c5cb1e4@collabora.com>
In-Reply-To: <20210120101750.1163-3-miquel.raynal@bootlin.com>
References: <20210120101750.1163-1-miquel.raynal@bootlin.com>
 <20210120101750.1163-3-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_053618_919831_FCF94C18 
X-CRM114-Status: GOOD (  30.66  )
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
 Richard Weinberger <richard@nod.at>, ladis@triops.cz,
 linux-mtd@lists.infradead.org, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 20 Jan 2021 11:17:50 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> The OMAP driver may leverage software BCH logic to locate errors while
> using its own hardware to detect the presence of errors. This is
> achieved with a "mixed" mode which initializes manually the software
> BCH internal logic while providing its own OOB layout.
> 
> The issue here comes from the fact that the BCH driver has been
> updated to only use generic NAND objects, and no longer depend on raw
> NAND structures as it is usable from SPI-NAND as well. However, at the
> end of the BCH context initialization, the driver checks the validity
> of the OOB layout. At this stage, the raw NAND fields have not been
> populated yet while being used by the layout helpers, leading to an
> invalid layout.
> 
> The solution here is to use the fields from the generic ECC structures
> which have already been updated and will always be valid instead of
> the raw NAND ones.
> 
> Note: I don't know which commit exactly triggered the error, but the
> entire migration to a generic BCH driver got merged in one go, so this
> should not be a problem for stable backports.
> 
> Reported-by: Adam Ford <aford173@gmail.com>
> Fixes: 80fe603160a4 ("mtd: nand: ecc-bch: Stop using raw NAND structures")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/omap2.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
> index fbb9955f2467..fd09b2a30abb 100644
> --- a/drivers/mtd/nand/raw/omap2.c
> +++ b/drivers/mtd/nand/raw/omap2.c
> @@ -1866,18 +1866,20 @@ static const struct mtd_ooblayout_ops omap_ooblayout_ops = {
>  static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
>  				 struct mtd_oob_region *oobregion)
>  {
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_device *nand = mtd_to_nanddev(mtd);
> +	unsigned int nsteps = nanddev_get_ecc_nsteps(nand);
> +	unsigned int ecc_bytes = nand->ecc.ctx.total / nsteps;

I'd recommend adding a helper for that one too
(nanddev_ecc_bytes_per_step()?).

This being said, I think you're better off applying v1 (which is
self-contained) and keeping this refactor for the next release.

>  	int off = BADBLOCK_MARKER_LENGTH;
>  
> -	if (section >= chip->ecc.steps)
> +	if (section >= nsteps)
>  		return -ERANGE;
>  
>  	/*
>  	 * When SW correction is employed, one OMAP specific marker byte is
>  	 * reserved after each ECC step.
>  	 */
> -	oobregion->offset = off + (section * (chip->ecc.bytes + 1));
> -	oobregion->length = chip->ecc.bytes;
> +	oobregion->offset = off + (section * (ecc_bytes + 1));
> +	oobregion->length = ecc_bytes;
>  
>  	return 0;
>  }
> @@ -1885,7 +1887,9 @@ static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
>  static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
>  				  struct mtd_oob_region *oobregion)
>  {
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_device *nand = mtd_to_nanddev(mtd);
> +	unsigned int nsteps = nanddev_get_ecc_nsteps(nand);
> +	unsigned int ecc_bytes = nand->ecc.ctx.total / nsteps;
>  	int off = BADBLOCK_MARKER_LENGTH;
>  
>  	if (section)
> @@ -1895,7 +1899,7 @@ static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
>  	 * When SW correction is employed, one OMAP specific marker byte is
>  	 * reserved after each ECC step.
>  	 */
> -	off += ((chip->ecc.bytes + 1) * chip->ecc.steps);
> +	off += ((ecc_bytes + 1) * nsteps);
>  	if (off >= mtd->oobsize)
>  		return -ERANGE;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
