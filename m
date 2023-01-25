Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A0AC54E94
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 21:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlqWE+KVxEQIMR58TkYOXg8VNVz5YNvvWL3BYp4icLE=; b=aQf5DshiDE3RtM
	ec1BloNhUkjrTmD5X8HnN+i/ehJxkvFwf3nV9AUilFvE7nEzaf9+AcGHygTAIdLaYAD5Q+TaFQ1v0
	H241NtRkv3/OR8s1JOZxwSz7hydOlnE77OrwWxSOlX5PwQXKraBXoIGWnBmdZEIJfaaJdbCN8k5pz
	XBaOGgp6zsdWI8dP10dSbKyWT0LnQan9OZ6ehkHLfrfyvnLYU1FyRs9skYv42f75MosQ833Wnck/h
	9v6XzLlt7sLXvUWVjeObk1rejW0qEwO3B65/14dw64y3JEEgoQNBPkX+MIQYgkb7vEh8eAXP4eccg
	wZxOUjgKEsR/Nyr9A8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmzQ-008o4z-P6; Wed, 25 Jan 2023 21:07:28 +0000
Received: from smtp-out-03.comm2000.it ([212.97.32.66])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmzL-008ntQ-IM
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2023 21:07:27 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-03.comm2000.it (Postfix) with ESMTPSA id F126CB42CB2;
	Wed, 25 Jan 2023 22:07:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1674680823;
	bh=YA1owfDBS96L7G518IG8UnBdMZb6XdHmxtms9cJlADk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JBKurt+sTObJAHIJ4XMWYkL7KbXfGAWY++aLlw7ztMlGJg/S9kbytQsmoFSB+MGf0
	 NcChnwANqWClTrej5VymUJtWIAvRDcC8irLNRmh8JRzp/4BaNu0MbrybtvqlMz7Hsc
	 gNit7cYzhWgYnml3+wPEv3m/Wi66cjkpjg83sXRXAMLEhs/G1hyzXhad18jP8tIipi
	 gvJroD3nMqWACtlLHW2PLUrCZWezR7yAX0S40ltZ4EEPVIYOiqm6FKOFgEzua9gEr+
	 S+GY4VqWTVXjPCvHAf8GbqP2ZTPXKFNY7VvYU14MQWIvaiZPWFnwGUhltuU5OqP3ty
	 EVDYhWcx9ydtA==
Date: Wed, 25 Jan 2023 22:06:57 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	u-boot@lists.denx.de
Subject: Re: [PATCH v4] mtd: parsers: ofpart: add workaround for #size-cells 0
Message-ID: <Y9GZ8c9VDXC582IA@francesco-nb.int.toradex.com>
References: <20230124104444.330913-1-francesco@dolcini.it>
 <Y8/7k1HHjJbHvWDB@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8/7k1HHjJbHvWDB@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_130723_935046_8C2035EC 
X-CRM114-Status: GOOD (  34.61  )
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

Hello Miquel, Greg and all

On Tue, Jan 24, 2023 at 04:38:59PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Jan 24, 2023 at 11:44:44AM +0100, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Add a mechanism to handle the case in which partitions are present as
> > direct child of the nand controller node and #size-cells is set to <0>.
> > 
> > This could happen if the nand-controller node in the DTS is supposed to
> > have #size-cells set to 0, but for some historical reason/bug it was set
> > to 1 in the past, and the firmware (e.g. U-Boot) is adding the partition
> > as direct children of the nand-controller defaulting to #size-cells
> > being to 1.
> > 
> > This prevents a real boot failure on colibri-imx7 that happened during v6.1
> > development cycles.
> > 
> > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> > Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > I do not expect this patch to be backported to stable, however I would expect
> > that we do not backport nand-controller dts cleanups neither.
> > 
> > v4:
> >  fixed wrong English spelling in the comment
> > 
> > v3:
> >  minor formatting change, removed not needed new-line and space. 
> > 
> > v2:
> >  fixup size-cells only when partitions are direct children of the nand-controller
> >  completely revised commit message, comments and warning print
> >  use pr_warn instead of pr_warn_once
> >  added Reviewed-by Greg
> >  removed cc:stable@ and fixes tag, since the problematic commit was reverted
> > ---
> >  drivers/mtd/parsers/ofpart_core.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
> > index 192190c42fc8..e7b8e9d0a910 100644
> > --- a/drivers/mtd/parsers/ofpart_core.c
> > +++ b/drivers/mtd/parsers/ofpart_core.c
> > @@ -122,6 +122,25 @@ static int parse_fixed_partitions(struct mtd_info *master,
> >  
> >  		a_cells = of_n_addr_cells(pp);
> >  		s_cells = of_n_size_cells(pp);
> > +		if (!dedicated && s_cells == 0) {
> > +			/*
> > +			 * This is a ugly workaround to not create
> > +			 * regression on devices that are still creating
> > +			 * partitions as direct children of the nand controller.
> > +			 * This can happen in case the nand controller node has
> > +			 * #size-cells equal to 0 and the firmware (e.g.
> > +			 * U-Boot) just add the partitions there assuming
> > +			 * 32-bit addressing.
> > +			 *
> > +			 * If you get this warning your firmware and/or DTS
> > +			 * should be really fixed.
> > +			 *
> > +			 * This is working only for devices smaller than 4GiB.
> > +			 */
> > +			pr_warn("%s: ofpart partition %pOF (%pOF) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.\n",
> > +				master->name, pp, mtd_node);
> 
> This is a driver, always use dev_*() calls, not pr_*() calls so that we
> know what is being referred to exactly.

Is this reasonable here? Where can I get the struct device?

In general this file uses only pr_* debug API and messages are about OF
nodes/properties, not about a device.

> I take back my "reviewed-by" line above, please fix this up to not need
> pr_warn, but to use dev_warn() instead.

Francesco

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
