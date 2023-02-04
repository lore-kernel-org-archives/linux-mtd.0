Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DE5C636CC
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Feb 2023 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xwpJLusSp5aeSmgNRnFjbwo0yGSwcXX8cifbTGi074=; b=p2m9ALIUBuyhpi
	GmPza1xaML+poC3CFfZv0X7G28LCqBESRNtRsTmf/rj4DjUItX9DcrrEf1w4CzqsDEs83IX6M3VO/
	P9+VyljKWnAa+zmJWoAZJrwjCd4Qtnz9pS5su2/6e+MOxP28Xsqon9M70h96fc/z5CdVae70IQdsS
	a/1II5fCaQnl8E6RRxM+r8JzMi0W4XB+m4nQ0w45A0NccD6m3dipvmtv3YRZWDeMAtrDO5KiMZ+JP
	XtrUY5z6zPP9moZvV4ZnacZrsiH0KMOzZUsfUH0WNVgXY1D3HUSdJSVfq04EtnqdwbyVLmGMRrVHM
	Gt+tVOa0mCKQJUvLRTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pODln-004iCf-7g; Sat, 04 Feb 2023 08:19:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pODli-004iC0-CM
	for linux-mtd@lists.infradead.org; Sat, 04 Feb 2023 08:19:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 175E4B8016A;
	Sat,  4 Feb 2023 08:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A27C433D2;
	Sat,  4 Feb 2023 08:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675498763;
	bh=z7chSMgmcdO9xM8PJ9gCesn3rlWWQ7VuAE05FXdORP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=128U/Tfhoj9p5Li13LQWhmZ0nLjscF0mLMifp03DiNbUAlDgzuMPNMqiKBAWOpS0C
	 rArhY8mrofnjulGCgrOpEUi7ULcbwix4IS0UhxDjboS2P+LQD3d9xK8F+5Favc6bRh
	 112VNh0wYMCDrmDk8YQ32bbliLDBmkGdX52T2QM0=
Date: Sat, 4 Feb 2023 09:19:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marex@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	u-boot@lists.denx.de
Subject: Re: [PATCH v4] mtd: parsers: ofpart: add workaround for #size-cells 0
Message-ID: <Y94VBzkX0kPsnGWc@kroah.com>
References: <20230124104444.330913-1-francesco@dolcini.it>
 <Y8/7k1HHjJbHvWDB@kroah.com>
 <Y9GZ8c9VDXC582IA@francesco-nb.int.toradex.com>
 <Y9JBTgmA8WX03QzK@kroah.com>
 <20230126101204.245ace0d@xps-13>
 <Y9ufjoLLnFvxG6/2@francesco-nb.int.toradex.com>
 <20230203161202.76f3b057@xps-13>
 <04A414CC-7CB6-45E0-B4EA-1489D51E9425@dolcini.it>
 <20230203191623.5535e8e2@xps-13>
 <5083B8FA-1BAE-49F8-BAE8-C301427532B0@dolcini.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5083B8FA-1BAE-49F8-BAE8-C301427532B0@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_001930_763955_3DFCE941 
X-CRM114-Status: GOOD (  56.69  )
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

On Fri, Feb 03, 2023 at 07:37:03PM +0100, Francesco Dolcini wrote:
> 
> 
> Il 3 febbraio 2023 19:16:23 CET, Miquel Raynal <miquel.raynal@bootlin.com> ha scritto:
> >Hi Francesco,
> >
> >francesco@dolcini.it wrote on Fri, 03 Feb 2023 19:03:27 +0100:
> >
> >> Il 3 febbraio 2023 16:12:02 CET, Miquel Raynal <miquel.raynal@bootlin.com> ha scritto:
> >> >Hi Francesco,
> >> >
> >> >francesco@dolcini.it wrote on Thu, 2 Feb 2023 12:33:34 +0100:
> >> >  
> >> >> On Thu, Jan 26, 2023 at 10:12:04AM +0100, Miquel Raynal wrote:  
> >> >> > gregkh@linuxfoundation.org wrote on Thu, 26 Jan 2023 10:01:02 +0100:
> >> >> >     
> >> >> > > On Wed, Jan 25, 2023 at 10:06:57PM +0100, Francesco Dolcini wrote:    
> >> >> > > > Hello Miquel, Greg and all
> >> >> > > > 
> >> >> > > > On Tue, Jan 24, 2023 at 04:38:59PM +0100, Greg Kroah-Hartman wrote:      
> >> >> > > > > On Tue, Jan 24, 2023 at 11:44:44AM +0100, Francesco Dolcini wrote:      
> >> >> > > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >> >> > > > > > 
> >> >> > > > > > Add a mechanism to handle the case in which partitions are present as
> >> >> > > > > > direct child of the nand controller node and #size-cells is set to <0>.
> >> >> > > > > > 
> >> >> > > > > > This could happen if the nand-controller node in the DTS is supposed to
> >> >> > > > > > have #size-cells set to 0, but for some historical reason/bug it was set
> >> >> > > > > > to 1 in the past, and the firmware (e.g. U-Boot) is adding the partition
> >> >> > > > > > as direct children of the nand-controller defaulting to #size-cells
> >> >> > > > > > being to 1.
> >> >> > > > > > 
> >> >> > > > > > This prevents a real boot failure on colibri-imx7 that happened during v6.1
> >> >> > > > > > development cycles.
> >> >> > > > > > 
> >> >> > > > > > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> >> >> > > > > > Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
> >> >> > > > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> >> >> > > > > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> >> > > > > > ---
> >> >> > > > > > I do not expect this patch to be backported to stable, however I would expect
> >> >> > > > > > that we do not backport nand-controller dts cleanups neither.
> >> >> > > > > > 
> >> >> > > > > > v4:
> >> >> > > > > >  fixed wrong English spelling in the comment
> >> >> > > > > > 
> >> >> > > > > > v3:
> >> >> > > > > >  minor formatting change, removed not needed new-line and space. 
> >> >> > > > > > 
> >> >> > > > > > v2:
> >> >> > > > > >  fixup size-cells only when partitions are direct children of the nand-controller
> >> >> > > > > >  completely revised commit message, comments and warning print
> >> >> > > > > >  use pr_warn instead of pr_warn_once
> >> >> > > > > >  added Reviewed-by Greg
> >> >> > > > > >  removed cc:stable@ and fixes tag, since the problematic commit was reverted
> >> >> > > > > > ---
> >> >> > > > > >  drivers/mtd/parsers/ofpart_core.c | 19 +++++++++++++++++++
> >> >> > > > > >  1 file changed, 19 insertions(+)
> >> >> > > > > > 
> >> >> > > > > > diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
> >> >> > > > > > index 192190c42fc8..e7b8e9d0a910 100644
> >> >> > > > > > --- a/drivers/mtd/parsers/ofpart_core.c
> >> >> > > > > > +++ b/drivers/mtd/parsers/ofpart_core.c
> >> >> > > > > > @@ -122,6 +122,25 @@ static int parse_fixed_partitions(struct mtd_info *master,
> >> >> > > > > >  
> >> >> > > > > >  		a_cells = of_n_addr_cells(pp);
> >> >> > > > > >  		s_cells = of_n_size_cells(pp);
> >> >> > > > > > +		if (!dedicated && s_cells == 0) {
> >> >> > > > > > +			/*
> >> >> > > > > > +			 * This is a ugly workaround to not create
> >> >> > > > > > +			 * regression on devices that are still creating
> >> >> > > > > > +			 * partitions as direct children of the nand controller.
> >> >> > > > > > +			 * This can happen in case the nand controller node has
> >> >> > > > > > +			 * #size-cells equal to 0 and the firmware (e.g.
> >> >> > > > > > +			 * U-Boot) just add the partitions there assuming
> >> >> > > > > > +			 * 32-bit addressing.
> >> >> > > > > > +			 *
> >> >> > > > > > +			 * If you get this warning your firmware and/or DTS
> >> >> > > > > > +			 * should be really fixed.
> >> >> > > > > > +			 *
> >> >> > > > > > +			 * This is working only for devices smaller than 4GiB.
> >> >> > > > > > +			 */
> >> >> > > > > > +			pr_warn("%s: ofpart partition %pOF (%pOF) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.\n",
> >> >> > > > > > +				master->name, pp, mtd_node);      
> >> >> > > > > 
> >> >> > > > > This is a driver, always use dev_*() calls, not pr_*() calls so that we
> >> >> > > > > know what is being referred to exactly.      
> >> >> > > > 
> >> >> > > > Is this reasonable here? Where can I get the struct device?      
> >> >> > > 
> >> >> > > Walk back up the call chain, there has to be a device somewhere
> >> >> > > controlling this, right?
> >> >> > >     
> >> >> > > > In general this file uses only pr_* debug API and messages are about OF
> >> >> > > > nodes/properties, not about a device.      
> >> >> > > 
> >> >> > > OF nodes and properties are part of a device's properties :)    
> >> >> > 
> >> >> > Yes but the warning comes from a wrong DT description, hence it felt
> >> >> > better suited to warn against the node name which is easily identifiable
> >> >> > in a text file and must be fixed rather than the device which is a pure
> >> >> > software component.
> >> >> > 
> >> >> > Anyway, Francesco, please show us the resultant line and if it feels
> >> >> > meaningful enough we'll take the dev_warn approach.    
> >> >> 
> >> >> So, I tried, but I guess I failed.
> >> >> 
> >> >> Both
> >> >> 
> >> >>   dev_warn(&mtd_get_master(master)->dev, ...);
> >> >> 
> >> >> and
> >> >> 
> >> >>   dev_warn(&master->dev, ...);
> >> >> 
> >> >> are NULL.  
> >> >
> >> >mtd->dev (in raw NAND) is populated by the controller drivers, so the
> >> >master mtd device is pointing to the bus "struct device" in its
> >> >dev.parent field. This happens at the end of the probe of the
> >> >controller, after setting the dev entry, so we expect the name of the
> >> >controller to appear.
> >> >  
> >> >> (null): gpmi-nand: ofpart partition /soc/nand-controller@33002000/partition@0 (/soc/nand-controller@33002000) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.  
> >> >
> >> >Second field looks right, first field does not (bus or class id?) I
> >> >have no idea why it has not been populated at this point (end of the
> >> >controller probe). But it's not a big deal, at least we have the device
> >> >name, so it's ok for me.  
> >> 
> >> If I understand correctly you are fine with the current patch v4 that just print (on colibri-imx7)
> >
> >Well, yes I was fine with it, but no that's not what I meant.
> >
> >AFAIS, using dev_warn() starts with "(null): gpmi-nand:" while pr_warn
> >started with "gpmi-nand:", so for me the main and relevant information
> >is present, that's all what I care about.
> >
> >Greg cared about the API used so I believe he would prefer us to use
> >dev_warn().
> >
> >It is unusual to apply a patch on which someone active in the community
> >answered negatively as long as his concerns can be addressed, so I
> >would like Greg to either state that he is fine with the pr_warn or you
> >to send a v5 using dev_warn() and him to send his R-by back.
> 
> Perfect, I understand and agree.
> 
> I was somehow puzzled because changing to dev_warn() on this specific warning message while the whole file already uses pr_warn() just to get a "(null):" prefix in the logs seems a little pointless to me.

Yeah, if the whole rest of the file is this way, a pr_warn() is fine for
now to solve the real problem.  You can resolve the use of dev_warn()
later in a follow-on patch once the (null) issues get resolved (as
that's obviously not ok...)

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
