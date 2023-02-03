Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7923BC05027
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ElRTdvfT3BI/Q0mAsXhfY76qLBRYf06JgYeKWUWT1w=; b=TBFeOGhQ5Z6kns
	BcVxp1490/xg6aDhcsPfqH9BMW2Ar96WMFZbu0L1ZMfZmTey+I2XFQRB2QsjxWhA42bNBXbJ2N3ZK
	2w6+T21mPpd4lqIWQ3uzLswJIREu+AHObV/R2KTiW5J2l+/VCHtSN/vN9i9ftFQzkRyXP//QMAQZF
	Xkfryhr3iNeVkwwiGPsNFNEt1iTC0fRhVBjHklc/P3VBnDIp/d70ho3hijnzZ4nQCogkHPFvATKTK
	stOkzgH4O/Tuus4Qpt95XZPxj5ei/fdignC3Xi4zbxECAYS469mHV8OLTnmvAVU2L9R7WE62OCsDy
	tJ81KhLQ7L/AWs5IqJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0PX-003Acr-Rm; Fri, 03 Feb 2023 18:03:44 +0000
Received: from smtp-out-05.comm2000.it ([212.97.32.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0PR-003AZx-QH
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 18:03:42 +0000
Received: from [127.0.0.1] (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-05.comm2000.it (Postfix) with ESMTPSA id 679B2825212;
	Fri,  3 Feb 2023 19:03:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1675447409;
	bh=1e1zTUm8LJ1468M+MCVvNHC+igU9Ui/Ap+g337V7zh0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=x2HLwrv1g7MPphRssInEW4IW6piw2jzRtBenAqs+RP8a7QkVbQvxfX4nni3dA9lBC
	 dH2BqnyPq3vB4HTAVun4YtuUlRpopFs4jrbc2O9HsfY8kMcVYfDfyxQJWp4YoQTlES
	 k3G+VGxJ4UjlQqdmJ22NfsJHnUEpx7fcDGbJNunXe6ntxy/Wq4F+GHe/k2y4NNuFwe
	 rCOqIqG3IRFEa5n8MxceVASaa4UzkYkTi8tx10DM3KZBBvsbLPXkJ8uaCxOdu9qSEb
	 sEV3tY2Kh0cgUVZCcP1Sex5AglDEl9cZ8rg4LcPVv6qXjN1uATZbiqNO7m9L8bo81i
	 Q21M+amblfLiw==
Date: Fri, 03 Feb 2023 19:03:27 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marex@denx.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>, u-boot@lists.denx.de
Subject: Re: [PATCH v4] mtd: parsers: ofpart: add workaround for #size-cells 0
User-Agent: K-9 Mail for Android
In-Reply-To: <20230203161202.76f3b057@xps-13>
References: <20230124104444.330913-1-francesco@dolcini.it> <Y8/7k1HHjJbHvWDB@kroah.com> <Y9GZ8c9VDXC582IA@francesco-nb.int.toradex.com> <Y9JBTgmA8WX03QzK@kroah.com> <20230126101204.245ace0d@xps-13> <Y9ufjoLLnFvxG6/2@francesco-nb.int.toradex.com> <20230203161202.76f3b057@xps-13>
Message-ID: <04A414CC-7CB6-45E0-B4EA-1489D51E9425@dolcini.it>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_100338_525534_C2A8DC7C 
X-CRM114-Status: GOOD (  47.15  )
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



Il 3 febbraio 2023 16:12:02 CET, Miquel Raynal <miquel.raynal@bootlin.com> ha scritto:
>Hi Francesco,
>
>francesco@dolcini.it wrote on Thu, 2 Feb 2023 12:33:34 +0100:
>
>> On Thu, Jan 26, 2023 at 10:12:04AM +0100, Miquel Raynal wrote:
>> > gregkh@linuxfoundation.org wrote on Thu, 26 Jan 2023 10:01:02 +0100:
>> >   
>> > > On Wed, Jan 25, 2023 at 10:06:57PM +0100, Francesco Dolcini wrote:  
>> > > > Hello Miquel, Greg and all
>> > > > 
>> > > > On Tue, Jan 24, 2023 at 04:38:59PM +0100, Greg Kroah-Hartman wrote:    
>> > > > > On Tue, Jan 24, 2023 at 11:44:44AM +0100, Francesco Dolcini wrote:    
>> > > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
>> > > > > > 
>> > > > > > Add a mechanism to handle the case in which partitions are present as
>> > > > > > direct child of the nand controller node and #size-cells is set to <0>.
>> > > > > > 
>> > > > > > This could happen if the nand-controller node in the DTS is supposed to
>> > > > > > have #size-cells set to 0, but for some historical reason/bug it was set
>> > > > > > to 1 in the past, and the firmware (e.g. U-Boot) is adding the partition
>> > > > > > as direct children of the nand-controller defaulting to #size-cells
>> > > > > > being to 1.
>> > > > > > 
>> > > > > > This prevents a real boot failure on colibri-imx7 that happened during v6.1
>> > > > > > development cycles.
>> > > > > > 
>> > > > > > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
>> > > > > > Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
>> > > > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>> > > > > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > > > > > ---
>> > > > > > I do not expect this patch to be backported to stable, however I would expect
>> > > > > > that we do not backport nand-controller dts cleanups neither.
>> > > > > > 
>> > > > > > v4:
>> > > > > >  fixed wrong English spelling in the comment
>> > > > > > 
>> > > > > > v3:
>> > > > > >  minor formatting change, removed not needed new-line and space. 
>> > > > > > 
>> > > > > > v2:
>> > > > > >  fixup size-cells only when partitions are direct children of the nand-controller
>> > > > > >  completely revised commit message, comments and warning print
>> > > > > >  use pr_warn instead of pr_warn_once
>> > > > > >  added Reviewed-by Greg
>> > > > > >  removed cc:stable@ and fixes tag, since the problematic commit was reverted
>> > > > > > ---
>> > > > > >  drivers/mtd/parsers/ofpart_core.c | 19 +++++++++++++++++++
>> > > > > >  1 file changed, 19 insertions(+)
>> > > > > > 
>> > > > > > diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
>> > > > > > index 192190c42fc8..e7b8e9d0a910 100644
>> > > > > > --- a/drivers/mtd/parsers/ofpart_core.c
>> > > > > > +++ b/drivers/mtd/parsers/ofpart_core.c
>> > > > > > @@ -122,6 +122,25 @@ static int parse_fixed_partitions(struct mtd_info *master,
>> > > > > >  
>> > > > > >  		a_cells = of_n_addr_cells(pp);
>> > > > > >  		s_cells = of_n_size_cells(pp);
>> > > > > > +		if (!dedicated && s_cells == 0) {
>> > > > > > +			/*
>> > > > > > +			 * This is a ugly workaround to not create
>> > > > > > +			 * regression on devices that are still creating
>> > > > > > +			 * partitions as direct children of the nand controller.
>> > > > > > +			 * This can happen in case the nand controller node has
>> > > > > > +			 * #size-cells equal to 0 and the firmware (e.g.
>> > > > > > +			 * U-Boot) just add the partitions there assuming
>> > > > > > +			 * 32-bit addressing.
>> > > > > > +			 *
>> > > > > > +			 * If you get this warning your firmware and/or DTS
>> > > > > > +			 * should be really fixed.
>> > > > > > +			 *
>> > > > > > +			 * This is working only for devices smaller than 4GiB.
>> > > > > > +			 */
>> > > > > > +			pr_warn("%s: ofpart partition %pOF (%pOF) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.\n",
>> > > > > > +				master->name, pp, mtd_node);    
>> > > > > 
>> > > > > This is a driver, always use dev_*() calls, not pr_*() calls so that we
>> > > > > know what is being referred to exactly.    
>> > > > 
>> > > > Is this reasonable here? Where can I get the struct device?    
>> > > 
>> > > Walk back up the call chain, there has to be a device somewhere
>> > > controlling this, right?
>> > >   
>> > > > In general this file uses only pr_* debug API and messages are about OF
>> > > > nodes/properties, not about a device.    
>> > > 
>> > > OF nodes and properties are part of a device's properties :)  
>> > 
>> > Yes but the warning comes from a wrong DT description, hence it felt
>> > better suited to warn against the node name which is easily identifiable
>> > in a text file and must be fixed rather than the device which is a pure
>> > software component.
>> > 
>> > Anyway, Francesco, please show us the resultant line and if it feels
>> > meaningful enough we'll take the dev_warn approach.  
>> 
>> So, I tried, but I guess I failed.
>> 
>> Both
>> 
>>   dev_warn(&mtd_get_master(master)->dev, ...);
>> 
>> and
>> 
>>   dev_warn(&master->dev, ...);
>> 
>> are NULL.
>
>mtd->dev (in raw NAND) is populated by the controller drivers, so the
>master mtd device is pointing to the bus "struct device" in its
>dev.parent field. This happens at the end of the probe of the
>controller, after setting the dev entry, so we expect the name of the
>controller to appear.
>
>> (null): gpmi-nand: ofpart partition /soc/nand-controller@33002000/partition@0 (/soc/nand-controller@33002000) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.
>
>Second field looks right, first field does not (bus or class id?) I
>have no idea why it has not been populated at this point (end of the
>controller probe). But it's not a big deal, at least we have the device
>name, so it's ok for me.

If I understand correctly you are fine with the current patch v4 that just print (on colibri-imx7)


gpmi-nand: ofpart partition /soc/nand-controller@33002000/partition@0 (/soc/nand-controller@33002000) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.

Correct? Do you want a v5 with the reviewed-by greg removed or you remove it yourself?

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
