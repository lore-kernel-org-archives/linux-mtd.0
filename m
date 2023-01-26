Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B0FC05027
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jan 2023 09:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDCTpx+XmJTXWsHY5bfEnKJbgCUlbj35tARO+0LR/ls=; b=BLWxfuYm+1FDiE
	XUMDkKB+seciaiivxYXx0UfnY35fXv88OeL8m8N9081TcJ69Z16mHopnuWk2ho4m9EvmCLnrm3n3I
	ru6PMdSmH41KxAnbrP9cBtkFOntCp0jXQHyPKyMGQqLbzRHS4aLlqdsW1Z9Ty8Vtibvk9kh/vQ8JK
	2AnnzBmTKqUrSjVdwJkJymgk8jGPgAA4OC6fxh1ma1nRCmaqsb7fv20vZzwSjqKLKu/E9+sdcFGEF
	tJO7jsjJzSxPo6OIv1MPRepDhmWTHknRrkTj2LqNg2Y7yW7Dz8B1XQSyPjINQdGDLEcCZrR5qBtAq
	eY6nHEkZnKGmtd4W6VCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKyAM-00ACi2-9F; Thu, 26 Jan 2023 09:03:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKy82-00ABWB-K6
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2023 09:01:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D00F6172A;
	Thu, 26 Jan 2023 09:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F462C4339B;
	Thu, 26 Jan 2023 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674723664;
	bh=lsuNROJqXsQm9nrB/MquRcwvMry/sNCyFZpV//FoQos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8Jb8hgXzwglCk3/wlmRf09XwBu3wlAVl3pqxk0hqJmxPwAU+6PXMlyy2psjkf6Fu
	 DTFuQEDQNik/hlF+IeJq6QqqPmdqqA38aOWfpUy0C15c3MaGOOHm1lCrRtPTYrlAqO
	 9qtfMA153UWFoiKdHar3ldh6KoCoisHpn3BmXbN0=
Date: Thu, 26 Jan 2023 10:01:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marex@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	u-boot@lists.denx.de
Subject: Re: [PATCH v4] mtd: parsers: ofpart: add workaround for #size-cells 0
Message-ID: <Y9JBTgmA8WX03QzK@kroah.com>
References: <20230124104444.330913-1-francesco@dolcini.it>
 <Y8/7k1HHjJbHvWDB@kroah.com>
 <Y9GZ8c9VDXC582IA@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9GZ8c9VDXC582IA@francesco-nb.int.toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_010106_793715_61E47F77 
X-CRM114-Status: GOOD (  37.94  )
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

On Wed, Jan 25, 2023 at 10:06:57PM +0100, Francesco Dolcini wrote:
> Hello Miquel, Greg and all
> 
> On Tue, Jan 24, 2023 at 04:38:59PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Jan 24, 2023 at 11:44:44AM +0100, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > Add a mechanism to handle the case in which partitions are present as
> > > direct child of the nand controller node and #size-cells is set to <0>.
> > > 
> > > This could happen if the nand-controller node in the DTS is supposed to
> > > have #size-cells set to 0, but for some historical reason/bug it was set
> > > to 1 in the past, and the firmware (e.g. U-Boot) is adding the partition
> > > as direct children of the nand-controller defaulting to #size-cells
> > > being to 1.
> > > 
> > > This prevents a real boot failure on colibri-imx7 that happened during v6.1
> > > development cycles.
> > > 
> > > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> > > Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > ---
> > > I do not expect this patch to be backported to stable, however I would expect
> > > that we do not backport nand-controller dts cleanups neither.
> > > 
> > > v4:
> > >  fixed wrong English spelling in the comment
> > > 
> > > v3:
> > >  minor formatting change, removed not needed new-line and space. 
> > > 
> > > v2:
> > >  fixup size-cells only when partitions are direct children of the nand-controller
> > >  completely revised commit message, comments and warning print
> > >  use pr_warn instead of pr_warn_once
> > >  added Reviewed-by Greg
> > >  removed cc:stable@ and fixes tag, since the problematic commit was reverted
> > > ---
> > >  drivers/mtd/parsers/ofpart_core.c | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
> > > index 192190c42fc8..e7b8e9d0a910 100644
> > > --- a/drivers/mtd/parsers/ofpart_core.c
> > > +++ b/drivers/mtd/parsers/ofpart_core.c
> > > @@ -122,6 +122,25 @@ static int parse_fixed_partitions(struct mtd_info *master,
> > >  
> > >  		a_cells = of_n_addr_cells(pp);
> > >  		s_cells = of_n_size_cells(pp);
> > > +		if (!dedicated && s_cells == 0) {
> > > +			/*
> > > +			 * This is a ugly workaround to not create
> > > +			 * regression on devices that are still creating
> > > +			 * partitions as direct children of the nand controller.
> > > +			 * This can happen in case the nand controller node has
> > > +			 * #size-cells equal to 0 and the firmware (e.g.
> > > +			 * U-Boot) just add the partitions there assuming
> > > +			 * 32-bit addressing.
> > > +			 *
> > > +			 * If you get this warning your firmware and/or DTS
> > > +			 * should be really fixed.
> > > +			 *
> > > +			 * This is working only for devices smaller than 4GiB.
> > > +			 */
> > > +			pr_warn("%s: ofpart partition %pOF (%pOF) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.\n",
> > > +				master->name, pp, mtd_node);
> > 
> > This is a driver, always use dev_*() calls, not pr_*() calls so that we
> > know what is being referred to exactly.
> 
> Is this reasonable here? Where can I get the struct device?

Walk back up the call chain, there has to be a device somewhere
controlling this, right?

> In general this file uses only pr_* debug API and messages are about OF
> nodes/properties, not about a device.

OF nodes and properties are part of a device's properties :)

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
