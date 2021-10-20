Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5CAC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:30:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB52D60FC3
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB52D60FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqTnZjpUmzbzWRcNl6PCwMakfwmGZ8LBiAVXWO03Rws=; b=YR4vh3udnOcEsR
	qP29B4bAcjC96aucSwvF4n8E9UAkky9BfxmeRl2FzOWP1vg3gtOT2H0dWh9S5u0zHyVG1tQxxV2Fy
	8qhPB8TnEBFIDQrPdcWdfcVg6qW5C3NfvqKXuuwDRPcRuF6aFMCiuNPtieYD1UBvJGQogLLNGfx8s
	Ob/l9VZSmr/xPnFrVUUnz7bRFBbHTDnGQtPUkA7OOKtTEaSq8dr5a6M1buwrnNV/YNwufqBYL+MIw
	6ii9VR8Clgunw9PvDa9qEGh4+kBo6UJNMXZY+gE0aUHiP9F7Ah8JsBIN0GM1nNciDEPm7zLOZlRnP
	NHZJFBZPoQIao7bO+H0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md63L-003eYa-Tn; Wed, 20 Oct 2021 07:30:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md63B-003eV3-Sy
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 07:30:15 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 559111F421E2;
 Wed, 20 Oct 2021 08:30:10 +0100 (BST)
Date: Wed, 20 Oct 2021 09:30:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: core: protect access to mtd devices while in
 suspend
Message-ID: <20211020093007.0edb4ee4@collabora.com>
In-Reply-To: <20211020071235.in3omswo2jqrahrd@skn-laptop>
References: <20211011115253.38497-1-sean@geanix.com>
 <20211011160546.707b737b@collabora.com>
 <20211015082206.244a2316@xps13>
 <20211019180800.3v7emokse6lkpjvk@skn-laptop>
 <20211020085250.030ef244@collabora.com>
 <20211020090058.58af1087@collabora.com>
 <20211020071235.in3omswo2jqrahrd@skn-laptop>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_003014_127382_AA3D463A 
X-CRM114-Status: GOOD (  29.31  )
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

On Wed, 20 Oct 2021 09:12:35 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> On Wed, Oct 20, 2021 at 09:00:58AM +0200, Boris Brezillon wrote:
> > On Wed, 20 Oct 2021 08:52:50 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >   
> 
> [ ... ]
> > > > 
> > > > Hi Boris and Miquel,
> > > > 
> > > > gpmi-nand.c sets NAND_SKIP_BBTSCAN so we won't get there and populate
> > > > suspend resume hooks :(
> > > > Guess there is other drivers that does the same thing...    
> > 
> > Actually, this version is even cleaner:
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index 3d6c6e880520..98c39b7f6279 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -6222,8 +6222,6 @@ static int nand_scan_tail(struct nand_chip *chip)
> >         mtd->_sync = nand_sync;
> >         mtd->_lock = nand_lock;
> >         mtd->_unlock = nand_unlock;
> > -       mtd->_suspend = nand_suspend;
> > -       mtd->_resume = nand_resume;
> >         mtd->_reboot = nand_shutdown;
> >         mtd->_block_isreserved = nand_block_isreserved;
> >         mtd->_block_isbad = nand_block_isbad;
> > @@ -6261,14 +6259,20 @@ static int nand_scan_tail(struct nand_chip *chip)
> >                 goto err_free_interface_config;
> >  
> >         /* Check, if we should skip the bad block table scan */
> > -       if (chip->options & NAND_SKIP_BBTSCAN)
> > -               return 0;
> > -
> > -       /* Build bad block table */
> > -       ret = nand_create_bbt(chip);
> > -       if (ret)
> > -               goto err_free_secure_regions;
> > +       if (chip->options & NAND_SKIP_BBTSCAN) {
> > +               /* Build bad block table */
> > +               ret = nand_create_bbt(chip);
> > +               if (ret)
> > +                       goto err_free_secure_regions;
> > +       }
> >  
> > +       /*
> > +        * Populate the suspend/resume hooks after the BBT has been scanned to
> > +        * avoid using the suspend lock and resume waitqueue which are only
> > +        * initialized when mtd_device_register() is called.
> > +        */
> > +       mtd->_suspend = nand_suspend;
> > +       mtd->_resume = nand_resume;
> >         return 0;
> >  
> >  err_free_secure_regions:  
> 
> Why is the gpmi-nand.c and other drivers set NAND_SKIP_BBTSCAN and then
> call nand_create_bbt() directly?

Dunno, but there's a nand_boot_init() call between the nand_scan() and
nand_create_bbt() calls, so I guess it has to do with something done in
this function...

> 
> To me it looks like legacy leftover...

If I were you, I wouldn't take the risk to change that in the same
patch series. The suspend/resume changes are already quite invasive,
so let's try to keep it as small/simple as possible.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
