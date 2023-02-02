Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE90CC61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Feb 2023 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFUZZgplzevUgpeuDNcaXQKWKoiujPHLg3K63CU1grU=; b=pL4V3vV2NA57xL
	/knEn8CyAaWCT58zg3VjXQR1sxYD3bRrBGDlX5Q5zll9FYNtXdTgsC8p8cEIG8LEUuwN1WynKdD9P
	S/DhhI+Tt4+9AcWgwah2ZxQIx5/Cjq+eJasGhs/3IZpl2dGq3aA5yYGsumaQoNca0ygC9rS+7VXQ4
	njwEAgvAXmMeRzbb9vEdhTNEY+549qIDHX3Txqy/KDhWoFS+vldV65KyZfWUxuFq3U8aQ6XjmQQbE
	8/pwl53FXwKuTLbW8CLykEnYC5bTP0F8OzZPFbISJmINmZGPzVV/ZXx/+t23AMMqZNVnZw8m48WNV
	83DPPb22Y3/idb7bPyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXwr-00FdZ5-Du; Thu, 02 Feb 2023 11:40:13 +0000
Received: from smtp-out-05.comm2000.it ([212.97.32.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXwn-00FdXw-8Z
	for linux-mtd@lists.infradead.org; Thu, 02 Feb 2023 11:40:11 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-05.comm2000.it (Postfix) with ESMTPSA id 45325821D3F;
	Thu,  2 Feb 2023 12:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1675337620;
	bh=Ti+s+G1LvjvGobyKqqI92/2t3LJn4dwjsT7IuvtNa5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xj7edZC+NxdinWh71n52mtVyPlJUGvjMjWZWmto88BE4JXHWmirgK1lS88VruOjMn
	 kEErYKPQThFV0CRvrWT7xKGpq74qRmZoT/wld5uw7GmaRTHdpaSiS4sCfbL95W9/OY
	 Q3awdsfSaBJSQQVYg6OHEk5LgounbhWZubRswQE8OJOeYBHLD3sO7qi5T+H1ICLXkh
	 kSD5c/rcKc4gxrvtO2SMaR2YjANFyNJtkeoh04gp4OB+GpI2gJAdccsFn3jdkgNFhh
	 dy/BD7Ig3a9X1kfDjF54kba1pvizE0Jh1ri++YiyB4vVTCQPBPt9U8l9pGNoR6L2GB
	 zy+1L9WOSJwWg==
Date: Thu, 2 Feb 2023 12:33:34 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marex@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	u-boot@lists.denx.de
Subject: Re: [PATCH v4] mtd: parsers: ofpart: add workaround for #size-cells 0
Message-ID: <Y9ufjoLLnFvxG6/2@francesco-nb.int.toradex.com>
References: <20230124104444.330913-1-francesco@dolcini.it>
 <Y8/7k1HHjJbHvWDB@kroah.com>
 <Y9GZ8c9VDXC582IA@francesco-nb.int.toradex.com>
 <Y9JBTgmA8WX03QzK@kroah.com>
 <20230126101204.245ace0d@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230126101204.245ace0d@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_034009_628181_FC0623A7 
X-CRM114-Status: GOOD (  43.30  )
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

On Thu, Jan 26, 2023 at 10:12:04AM +0100, Miquel Raynal wrote:
> gregkh@linuxfoundation.org wrote on Thu, 26 Jan 2023 10:01:02 +0100:
> 
> > On Wed, Jan 25, 2023 at 10:06:57PM +0100, Francesco Dolcini wrote:
> > > Hello Miquel, Greg and all
> > > 
> > > On Tue, Jan 24, 2023 at 04:38:59PM +0100, Greg Kroah-Hartman wrote:  
> > > > On Tue, Jan 24, 2023 at 11:44:44AM +0100, Francesco Dolcini wrote:  
> > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > 
> > > > > Add a mechanism to handle the case in which partitions are present as
> > > > > direct child of the nand controller node and #size-cells is set to <0>.
> > > > > 
> > > > > This could happen if the nand-controller node in the DTS is supposed to
> > > > > have #size-cells set to 0, but for some historical reason/bug it was set
> > > > > to 1 in the past, and the firmware (e.g. U-Boot) is adding the partition
> > > > > as direct children of the nand-controller defaulting to #size-cells
> > > > > being to 1.
> > > > > 
> > > > > This prevents a real boot failure on colibri-imx7 that happened during v6.1
> > > > > development cycles.
> > > > > 
> > > > > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> > > > > Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
> > > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > ---
> > > > > I do not expect this patch to be backported to stable, however I would expect
> > > > > that we do not backport nand-controller dts cleanups neither.
> > > > > 
> > > > > v4:
> > > > >  fixed wrong English spelling in the comment
> > > > > 
> > > > > v3:
> > > > >  minor formatting change, removed not needed new-line and space. 
> > > > > 
> > > > > v2:
> > > > >  fixup size-cells only when partitions are direct children of the nand-controller
> > > > >  completely revised commit message, comments and warning print
> > > > >  use pr_warn instead of pr_warn_once
> > > > >  added Reviewed-by Greg
> > > > >  removed cc:stable@ and fixes tag, since the problematic commit was reverted
> > > > > ---
> > > > >  drivers/mtd/parsers/ofpart_core.c | 19 +++++++++++++++++++
> > > > >  1 file changed, 19 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
> > > > > index 192190c42fc8..e7b8e9d0a910 100644
> > > > > --- a/drivers/mtd/parsers/ofpart_core.c
> > > > > +++ b/drivers/mtd/parsers/ofpart_core.c
> > > > > @@ -122,6 +122,25 @@ static int parse_fixed_partitions(struct mtd_info *master,
> > > > >  
> > > > >  		a_cells = of_n_addr_cells(pp);
> > > > >  		s_cells = of_n_size_cells(pp);
> > > > > +		if (!dedicated && s_cells == 0) {
> > > > > +			/*
> > > > > +			 * This is a ugly workaround to not create
> > > > > +			 * regression on devices that are still creating
> > > > > +			 * partitions as direct children of the nand controller.
> > > > > +			 * This can happen in case the nand controller node has
> > > > > +			 * #size-cells equal to 0 and the firmware (e.g.
> > > > > +			 * U-Boot) just add the partitions there assuming
> > > > > +			 * 32-bit addressing.
> > > > > +			 *
> > > > > +			 * If you get this warning your firmware and/or DTS
> > > > > +			 * should be really fixed.
> > > > > +			 *
> > > > > +			 * This is working only for devices smaller than 4GiB.
> > > > > +			 */
> > > > > +			pr_warn("%s: ofpart partition %pOF (%pOF) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.\n",
> > > > > +				master->name, pp, mtd_node);  
> > > > 
> > > > This is a driver, always use dev_*() calls, not pr_*() calls so that we
> > > > know what is being referred to exactly.  
> > > 
> > > Is this reasonable here? Where can I get the struct device?  
> > 
> > Walk back up the call chain, there has to be a device somewhere
> > controlling this, right?
> > 
> > > In general this file uses only pr_* debug API and messages are about OF
> > > nodes/properties, not about a device.  
> > 
> > OF nodes and properties are part of a device's properties :)
> 
> Yes but the warning comes from a wrong DT description, hence it felt
> better suited to warn against the node name which is easily identifiable
> in a text file and must be fixed rather than the device which is a pure
> software component.
> 
> Anyway, Francesco, please show us the resultant line and if it feels
> meaningful enough we'll take the dev_warn approach.

So, I tried, but I guess I failed.

Both

  dev_warn(&mtd_get_master(master)->dev, ...);

and

  dev_warn(&master->dev, ...);

are NULL.


(null): gpmi-nand: ofpart partition /soc/nand-controller@33002000/partition@0 (/soc/nand-controller@33002000) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.

while the current v4 is just:

gpmi-nand: ofpart partition /soc/nand-controller@33002000/partition@0 (/soc/nand-controller@33002000) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.

on a colibri-imx7.

Any advice?

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
