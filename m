Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5D0C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Oct 2022 06:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvGKUv3fSAs71Hx6khFk6kDmXnv3AvhV3ww0bdPCTt8=; b=VnTzcXRej/0DIp
	XdMq2jbHrIrnwxXDQRZj1kCx537mS4Qw4alSLHbFvKTAFSBeblNB/tTZ73Ama7w8TJKOrdbjR1jbE
	iHA3WIFjF9JhnPvYwecqr6q1nFrjY8IVSmkeW/Tso7s12ynmdKPD7lOtHGhcEViRZriQ+5GMbxojX
	JiS487xb4P4dhYVH1gzbU5fMeU6Smp2aIjnBiTtry5Tk7VjkbeH+gwZO4zz1sVx3pF0cO/peSih3P
	tInxjkjxEvOYT8NidUfYSwX8scfuJTlM7+cJJstaiYQ1oXKmQBsBxqq1P+b4sH7kYs4J61UrIh1IX
	GmzzecBFDn0gSR2rXfrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofbNT-008e84-4j; Tue, 04 Oct 2022 06:26:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofbNP-008e70-JU
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2022 06:26:01 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F1BD6602295;
	Tue,  4 Oct 2022 07:25:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664864753;
	bh=SKezE7CWPgfXm3/Tax16ki0ozvuZApf+OIft4DuG+TM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d5A3QyxXIONb9g6i9SwSEDngbB3UVE68WGCDh6Eqf1TvYBaE4WPlbOPZDrBZsdbal
	 e76ze1NblpyWg3cdAk2YWNkjWt6Fg7/h1KEg/YKTB55AzC0K9zA9gejwc5tC2+SFPx
	 BBe71DW3+g/e7Z7/dxB+HUuFta6LX8qNSI7im0JdaYeA48A3ufeH732YysQSIYwpyc
	 PtKmb5jWiCtCCX8y+r35dzMDgayFKIPkQaDrZ0Gi2wx/MQFZKzkV9KkAN5xF8VjGgC
	 SVMgr/ZQuoY7LfH1NYJK0zm6nliJ/f6itWWK/lqKDEeEOxZPs6andwiYeOVE6w1bxu
	 RHI+hWP6DKM0A==
Date: Tue, 4 Oct 2022 08:25:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, Tony O'Brien
 <Tony.OBrien@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: Use correct logic for
 nand-keep-config
Message-ID: <20221004082550.1c819fc8@collabora.com>
In-Reply-To: <482a4114-eeb1-2303-2896-8e480abda876@alliedtelesis.co.nz>
References: <20220927024728.28447-1-chris.packham@alliedtelesis.co.nz>
	<482a4114-eeb1-2303-2896-8e480abda876@alliedtelesis.co.nz>
Organization: Collabora
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_232559_837673_03133C28 
X-CRM114-Status: GOOD (  28.23  )
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

On Mon, 3 Oct 2022 21:46:31 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi All,
> 
> On 27/09/22 15:47, Chris Packham wrote:
> > From: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
> >
> > Originally the absence of the marvell,nand-keep-config property caused
> > the setup_data_interface function to be provided. However when
> > setup_data_interface was moved into nand_controller_ops the logic was
> > unintentionally inverted. Update the logic so that only if the
> > marvell,nand-keep-config property is present the bootloader NAND config
> > kept.
> >
> > Fixes: 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops")
> > Signed-off-by: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>  
> 
> Just following up on this. I know things have probably been busy with 
> the 6.0 release but it's been a week so I figured I'd give this a bump.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> > ---
> >
> > Notes:
> >      I think this is a bug that's been lurking for 4 years or so. I'm not
> >      sure that's particularly long in the life of an embedded device but it
> >      does make me wonder if there have been other bug reports about it.
> >      
> >      We noticed this because we had a bootloader that used maxed out NAND
> >      timings which made the time it took the kernel to do anything on the
> >      file system longer than we expected.
> >
> >   drivers/mtd/nand/raw/marvell_nand.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> > index 2455a581fd70..b248c5f657d5 100644
> > --- a/drivers/mtd/nand/raw/marvell_nand.c
> > +++ b/drivers/mtd/nand/raw/marvell_nand.c
> > @@ -2672,7 +2672,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
> >   	chip->controller = &nfc->controller;
> >   	nand_set_flash_node(chip, np);
> >   
> > -	if (!of_property_read_bool(np, "marvell,nand-keep-config"))
> > +	if (of_property_read_bool(np, "marvell,nand-keep-config"))
> >   		chip->options |= NAND_KEEP_TIMINGS;
> >   
> >   	mtd = nand_to_mtd(chip)  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
