Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE22C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 13:22:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B8120850
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 13:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HlDppdE7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B8120850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFRp20XEkADiFqVAs0FrnjL/gQb5W3ec1YDam4sbWPQ=; b=HlDppdE7BQ8B69
	tHeZfsLLDV0rCRnNQ719OWDbaAXPJEzjHGFxbJM3LkhgasoZecmHbAWV7eMIiVD6+UaNDYzsQh2bu
	aGSBP6lEhNiX/u8IheyqApPjT3R9D3Xnq3iVdHb44Xo4yprt68AqcFuFvkap4IoGGA4fyIaUICss0
	iSSqXfjqnLdf65QYGzLwf4G47SoBUrSXNitCgiTOapKwxgrh/r/K6OaOy3xO35CvXu4Q0Gdbjinku
	QuIdoyPESn9Wx2eQ5bAy5XY+R/dnXekkYEjvkFkrr8NwAHo+fchrdSTbe3r2bPPbHtGYqQdvMeKCu
	xzfMA21GV7En6oNT/5aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1sTf-0002Wd-20; Sun, 25 Aug 2019 13:22:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1sTc-0002WJ-1t
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 13:22:37 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1067E289C85;
 Sun, 25 Aug 2019 14:22:34 +0100 (BST)
Date: Sun, 25 Aug 2019 15:22:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 7/7] mtd: spi-nor: Rework the disabling of block
 write protection
Message-ID: <20190825152231.165de3d7@collabora.com>
In-Reply-To: <836fcecd-766c-c7e3-74aa-06a148b146f8@microchip.com>
References: <20190824120027.14452-1-tudor.ambarus@microchip.com>
 <20190824120027.14452-8-tudor.ambarus@microchip.com>
 <20190825142421.35d31a9b@collabora.com>
 <836fcecd-766c-c7e3-74aa-06a148b146f8@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_062236_365635_C079AFD6 
X-CRM114-Status: GOOD (  25.91  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 25 Aug 2019 12:57:35 +0000
<Tudor.Ambarus@microchip.com> wrote:

> On 08/25/2019 03:24 PM, Boris Brezillon wrote:
> > On Sat, 24 Aug 2019 12:00:48 +0000
> > <Tudor.Ambarus@microchip.com> wrote:
> >   
> >> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>
> >> Get rid of MFR handling and implement specific manufacturer
> >> default_init() fixup hooks.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >>  drivers/mtd/spi-nor/spi-nor.c | 30 ++++++++++++++++++++----------
> >>  1 file changed, 20 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> >> index fc9e14777212..f4e9fcca619f 100644
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -4146,6 +4146,16 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
> >>  	return err;
> >>  }
> >>  
> >> +static void atmel_set_default_init(struct spi_nor *nor)
> >> +{
> >> +	nor->params.disable_block_protection = spi_nor_clear_sr_bp;
> >> +}
> >> +
> >> +static void intel_set_default_init(struct spi_nor *nor)
> >> +{
> >> +	nor->params.disable_block_protection = spi_nor_clear_sr_bp;  
> > 
> > That's weird: you can unlock blocks but locking is not
> > explicitly flagged as supported (SNOR_F_HAS_LOCK is not set). Is that
> > expected?  
> 
> Yes. Manufacturers have different methods for locking/unlocking blocks of
> memory. Right now we support just the stm/sr locking operations. sst26vf064b for
> example, uses dedicated registers for reading/writing which blocks are
> protected, and not the Status Register.
> 
> The reason for having disable_block_protection(), is that some spi-nor flashes
> are write protected by default after a power-on reset cycle, in order to avoid
> inadvertent writes during power-up. Backward compatibility imposes to disable
> the write block protection at power-up by default, so that you can erase/write
> the memory without having to send an unlock-all command. Which is bad in my
> opinion and that's why I proposed https://patchwork.ozlabs.org/patch/1133278/.
> 
> Even if sst26vf064b does not yet have the lock ops implemented (SNOR_F_HAS_LOCK
> is not set), I would like to be able to interact with it, so to disable the
> block protection at power-up. This flash, and others, support a Global Unlock
> Command which unlocks the entire memory array in a single cycle. We can't
> determine who supports this command purely by manufacturer type, and it's not
> discoverable through SFDP, so we'll have to add a nor->info flag for it:
> UNLOCK_GLOBAL_BLOCK (see https://patchwork.ozlabs.org/patch/1152606/).
> 
> In conclusion, even if SNOR_F_HAS_LOCK is not set (the locking ops are not
> implemented), we can still have disable_block_protection() mechanisms to unlock
> the entire flash at power-up.

Hm, okay, but what about those atmel/intel chips that support
SR_BP-based global unlock? Shouldn't they also support SR_BP-based
locking/unlocking?

> 
> >   
> >> +}
> >> +
> >>  static void macronix_set_default_init(struct spi_nor *nor)
> >>  {
> >>  	nor->params.quad_enable = macronix_quad_enable;
> >> @@ -4173,6 +4183,14 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
> >>  {
> >>  	/* Init flash parameters based on MFR */
> >>  	switch (JEDEC_MFR(nor->info)) {
> >> +	case SNOR_MFR_ATMEL:
> >> +		atmel_set_default_init(nor);
> >> +		break;
> >> +
> >> +	case SNOR_MFR_INTEL:
> >> +		intel_set_default_init(nor);
> >> +		break;
> >> +
> >>  	case SNOR_MFR_MACRONIX:
> >>  		macronix_set_default_init(nor);
> >>  		break;
> >> @@ -4760,18 +4778,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >>  	if (info->flags & SPI_S3AN)
> >>  		nor->flags |=  SNOR_F_READY_XSR_RDY;
> >>  
> >> -	if (info->flags & SPI_NOR_HAS_LOCK)
> >> +	if (info->flags & SPI_NOR_HAS_LOCK) {  
> > 
> > If this flag implies SR_BP-based locking we should really rename it into
> > SPI_NOR_HAS_SR_BP_LOCK to avoid any confusion.  
> 
> Not only SR-based locking, should be a general flag that indicates that locking
> ops are supported whichever they are. I would keep the SPI_NOR_HAS_LOCK and let
> the manufacturer set its locking ops using the ->default_init() hook.

Okay, sounds good as long as the locking scheme is selected on a
per-manufacturer basis, not a per-chip basis.

> 
> >   
> >>  		nor->flags |= SNOR_F_HAS_LOCK;
> >> -
> >> -	/*
> >> -	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
> >> -	 * with the software protection bits set.
> >> -	 */
> >> -	if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
> >> -	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
> >> -	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
> >> -	    nor->info->flags & SPI_NOR_HAS_LOCK)
> >>  		nor->params.disable_block_protection = spi_nor_clear_sr_bp;
> >> +	}
> >>  
> >>  	/* Init flash parameters based on flash_info struct and SFDP */
> >>  	spi_nor_init_params(nor);  
> > 
> >   


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
