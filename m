Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C04C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 13:29:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E9520850
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 13:29:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J7k7tPov"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49E9520850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+FAk6dC+XyezuCQoUXAAsJZ2h0h6Rjf6GXH2RuxkC8=; b=J7k7tPovn/3Ui9
	qWKcbgHomf2Ta6MFWBSOgQ1wBmxffXCGA87jN4lo/fS0L2CyzTVM6WIdKI+3T6G/5UuMjXsnO7kTy
	KejkzrlHLR+gnmodzP3BFq0ZkAYXpWKcwmSpICLzBaGf/alPRqbXzOEWmqKxXPLtiWHfPcDg7hH49
	ztNQu5gk91O+Sn/uzrWYnfW5YigBJMUuTBTfmNBDLrmUwtnDAEJw+jNS4nU1B0ysxhylB0xlIeevm
	bjQkKTzUMLNwP2mDjVQnvsKEaRImdXcU1bjEPFKQBsjZ7otyj5ffLuZ6HWiuh2Ne5NsplL7aveW0q
	3lJHZ46tdYQEQcb3rOEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1sZb-0008L4-Vr; Sun, 25 Aug 2019 13:28:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1sZ4-0007qv-QA
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 13:28:16 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 647A0289C85;
 Sun, 25 Aug 2019 14:28:13 +0100 (BST)
Date: Sun, 25 Aug 2019 15:28:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 4/5] mtd: spi-nor: Move clear_sr_bp() to 'struct
 spi_nor_flash_parameter'
Message-ID: <20190825152810.6fcac067@collabora.com>
In-Reply-To: <6485db42-4449-cc9b-8e09-0ad89b259a8b@microchip.com>
References: <20190823155325.13459-1-tudor.ambarus@microchip.com>
 <20190823155325.13459-5-tudor.ambarus@microchip.com>
 <20190825150927.5374b1ea@collabora.com>
 <6485db42-4449-cc9b-8e09-0ad89b259a8b@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_062815_212506_20163F9A 
X-CRM114-Status: GOOD (  26.24  )
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

On Sun, 25 Aug 2019 13:19:57 +0000
<Tudor.Ambarus@microchip.com> wrote:

> On 08/25/2019 04:09 PM, Boris Brezillon wrote:
> > On Fri, 23 Aug 2019 15:53:41 +0000
> > <Tudor.Ambarus@microchip.com> wrote:
> >   
> >> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>
> >> All flash parameters and settings should reside inside
> >> 'struct spi_nor_flash_parameter'. Move clear_sr_bp() from
> >> 'struct spi_nor' to 'struct spi_nor_flash_parameter'.
> >>
> >> Rename clear_sr_bp()/disable_block_protection() to better indicate
> >> what the function does.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >>  drivers/mtd/spi-nor/spi-nor.c | 47 +++++++++++++++++++++++++++++++++----------
> >>  include/linux/mtd/spi-nor.h   |  5 ++---
> >>  2 files changed, 38 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> >> index 6bd104c29cd9..15b0b1148bf3 100644
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -4477,20 +4477,45 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
> >>  	return nor->params.quad_enable(nor);
> >>  }
> >>  
> >> +/**
> >> + * spi_nor_disable_block_protection() - Disable the write block protection
> >> + * during power-up.
> >> + * @nor:                pointer to a 'struct spi_nor'
> >> + *
> >> + * Some spi-nor flashes are write protected by default after a power-on reset
> >> + * cycle, in order to avoid inadvertend writes during power-up. Backward
> >> + * compatibility imposes to disable the write block protection at power-up
> >> + * by default.
> >> + *
> >> + * Return: 0 on success, -errno otherwise.
> >> + */
> >> +static int spi_nor_disable_block_protection(struct spi_nor *nor)
> >> +{
> >> +	if (!nor->params.disable_block_protection)
> >> +		return 0;
> >> +
> >> +	/*
> >> +	 * In case of the legacy quad enable requirements are set, if the
> >> +	 * configuration register Quad Enable bit is one, only the the
> >> +	 * Write Status (01h) command with two data bytes may be used to clear
> >> +	 * the block protection bits.
> >> +	 */
> >> +	if (nor->params.quad_enable == spansion_quad_enable)
> >> +		nor->params.disable_block_protection =
> >> +			spi_nor_spansion_clear_sr_bp;  
> > 
> > Hm, doesn't look right to adjust the function pointer just before
> > calling it. Can't we move that logic earlier (when doing the
> > default/manufacturer specific init)? Also, as I said in one of my  
> 
> No, we can't move it earlier to ->default_init() because the pointer to
> quad_enable() function can be modified later on, when parsing SFDP. This should
> stay here, after the quad_enable() method is known, so after the
> spi_nor_init_params() call.
> 
> 
> > previous emails, I'd prefer to have this hook moved to
> > spi_nor_locking_ops and just have a flag to reflect when block
> > protection can be disabled.  
> 
> yes, I agree, will move.

That won't work: ->locking_ops is const, meaning that you can't update
individual fields (which I consider a good thing). As I see it, the
locking scheme is a package that describe how to lock/unlock blocks, be
it individually, by groups or globally. I really hope we can take this
decision on a per-manufacturer basis, but I fear it might actually be a
per-chip thing.

> 
> >   
> >> +
> >> +	return nor->params.disable_block_protection(nor);
> >> +}
> >> +
> >>  static int spi_nor_init(struct spi_nor *nor)
> >>  {
> >>  	int err;
> >>  
> >> -	if (nor->clear_sr_bp) {
> >> -		if (nor->quad_enable == spansion_quad_enable)
> >> -			nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
> >> -
> >> -		err = nor->clear_sr_bp(nor);
> >> -		if (err) {
> >> -			dev_err(nor->dev,
> >> -				"fail to clear block protection bits\n");
> >> -			return err;
> >> -		}
> >> +	err = spi_nor_disable_block_protection(nor);
> >> +	if (err) {
> >> +		dev_err(nor->dev,
> >> +			"fail to unlock the flash at init (err = %d)\n", err);
> >> +		return err;
> >>  	}
> >>  
> >>  	err = spi_nor_quad_enable(nor);
> >> @@ -4635,7 +4660,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >>  	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
> >>  	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
> >>  	    nor->info->flags & SPI_NOR_HAS_LOCK)
> >> -		nor->clear_sr_bp = spi_nor_clear_sr_bp;
> >> +		nor->params.disable_block_protection = spi_nor_clear_sr_bp;
> >>  
> >>  	/* Parse the Serial Flash Discoverable Parameters table. */
> >>  	ret = spi_nor_init_params(nor);
> >> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> >> index 17787238f0e9..399ac34a529d 100644
> >> --- a/include/linux/mtd/spi-nor.h
> >> +++ b/include/linux/mtd/spi-nor.h
> >> @@ -480,6 +480,7 @@ struct spi_nor;
> >>   * @page_programs:	page program capabilities ordered by priority: the
> >>   *                      higher index in the array, the higher priority.
> >>   * @quad_enable:	enables SPI NOR quad mode.
> >> + * @disable_block_protection: disables block protection during power-up.
> >>   */
> >>  struct spi_nor_flash_parameter {
> >>  	u64				size;
> >> @@ -490,6 +491,7 @@ struct spi_nor_flash_parameter {
> >>  	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
> >>  
> >>  	int (*quad_enable)(struct spi_nor *nor);
> >> +	int (*disable_block_protection)(struct spi_nor *nor);
> >>  };
> >>  
> >>  /**
> >> @@ -535,8 +537,6 @@ struct flash_info;
> >>   * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
> >>   * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
> >>   *			completely locked
> >> - * @clear_sr_bp:	[FLASH-SPECIFIC] clears the Block Protection Bits from
> >> - *			the SPI NOR Status Register.
> >>   * @params:		[FLASH-SPECIFIC] SPI-NOR flash parameters and settings.
> >>   *                      The structure includes legacy flash parameters and
> >>   *                      settings that can be overwritten by the spi_nor_fixups
> >> @@ -578,7 +578,6 @@ struct spi_nor {
> >>  	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
> >>  	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
> >>  	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
> >> -	int (*clear_sr_bp)(struct spi_nor *nor);
> >>  	struct spi_nor_flash_parameter params;
> >>  
> >>  	void *priv;  
> > 
> >   


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
