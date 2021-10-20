Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1776AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:01:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBA73610E6
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBA73610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFvOLFcH+ICd1WNwD4Cn52jlPbnRNfqOElhheu0tBwE=; b=D0aaHlUAOTXNr2
	UdCF3xhPPyTK20uOR/IaIKImyxJqIV1JM/e8qQzeGHPO1kS/pWxqqFERRjEK9S2TV/VeUo6Fe3RCN
	/FpYT1riD1qkXA/vMck/5mBFYYtFd9rWIiawNrWzT7igHkLP9QhuMy7M3HTFKncEWb/DVQbrI7tDa
	wxtet6AFQzuP2dGGs3T/cGyTYe0SS+dO3KK+9HTzK2kWqL1BwBOIZicYx7PvenqC5U0h36Oqk8AM2
	MrY74dzRebiP2Sz7L5mt3JBvbOuIGAi9B650GFJvFm2hjoMfF027jgxuJBUZMKvZmtQv77b2vtxPE
	sFAHQcMwl+H9hz3SaGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md5b2-003WeZ-1j; Wed, 20 Oct 2021 07:01:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md5ay-003Wdr-Dw
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 07:01:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 681251F43E4F;
 Wed, 20 Oct 2021 08:01:02 +0100 (BST)
Date: Wed, 20 Oct 2021 09:00:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: core: protect access to mtd devices while in
 suspend
Message-ID: <20211020090058.58af1087@collabora.com>
In-Reply-To: <20211020085250.030ef244@collabora.com>
References: <20211011115253.38497-1-sean@geanix.com>
 <20211011160546.707b737b@collabora.com>
 <20211015082206.244a2316@xps13>
 <20211019180800.3v7emokse6lkpjvk@skn-laptop>
 <20211020085250.030ef244@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_000104_775201_DA717451 
X-CRM114-Status: GOOD (  38.12  )
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

On Wed, 20 Oct 2021 08:52:50 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Tue, 19 Oct 2021 20:08:00 +0200
> Sean Nyekjaer <sean@geanix.com> wrote:
> 
> > On Fri, Oct 15, 2021 at 08:22:06AM +0200, Miquel Raynal wrote:  
> > > Hi Sean,
> > > 
> > > boris.brezillon@collabora.com wrote on Mon, 11 Oct 2021 16:05:46 +0200:
> > >     
> > > > On Mon, 11 Oct 2021 13:52:50 +0200    
> > 
> > [ ... ]
> >   
> > >     
> > > > > One (small) issue still present. gpmi_nand.c uses the rwsem before it's
> > > > > initialized. Seems cumbersome to have every mtd/nand driver to call
> > > > > init_waitqueue_head() and init_rwsem(). Could we somehow move the call
> > > > > to mtd_set_dev_defaults() before nand_create_bbt()?      
> > > > 
> > > > I have a nasty trick for that one, but I'm not sure Miquel will like it
> > > > (actually, I don't like it either, but it's so simple compared to the
> > > > other options we have that I'm tempted to go for this approach until
> > > > someone has time to invest in a cleaner solution :-)):
> > > > 
> > > > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > > > index 3d6c6e880520..a9ac2d528a4d 100644
> > > > --- a/drivers/mtd/nand/raw/nand_base.c
> > > > +++ b/drivers/mtd/nand/raw/nand_base.c
> > > > @@ -6222,8 +6222,6 @@ static int nand_scan_tail(struct nand_chip *chip)
> > > >         mtd->_sync = nand_sync;
> > > >         mtd->_lock = nand_lock;
> > > >         mtd->_unlock = nand_unlock;
> > > > -       mtd->_suspend = nand_suspend;
> > > > -       mtd->_resume = nand_resume;
> > > >         mtd->_reboot = nand_shutdown;
> > > >         mtd->_block_isreserved = nand_block_isreserved;
> > > >         mtd->_block_isbad = nand_block_isbad;
> > > > @@ -6269,6 +6267,13 @@ static int nand_scan_tail(struct nand_chip *chip)
> > > >         if (ret)
> > > >                 goto err_free_secure_regions;
> > > >  
> > > > +       /*
> > > > +        * Populate the suspend/resume hooks after the BBT has been scanned to
> > > > +        * avoid using the suspend lock and resume waitqueue which are only
> > > > +        * initialized when mtd_device_register() is called.
> > > > +        */
> > > > +       mtd->_suspend = nand_suspend;
> > > > +       mtd->_resume = nand_resume;
> > > >         return 0;    
> > > 
> > > I'm fine with this as long as it is documented for now.
> > >     
> > 
> > Hi Boris and Miquel,
> > 
> > gpmi-nand.c sets NAND_SKIP_BBTSCAN so we won't get there and populate
> > suspend resume hooks :(
> > Guess there is other drivers that does the same thing...  
> 
> This should fix the issue:
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 3d6c6e880520..c92b17f66994 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -6222,8 +6222,6 @@ static int nand_scan_tail(struct nand_chip *chip)
>         mtd->_sync = nand_sync;
>         mtd->_lock = nand_lock;
>         mtd->_unlock = nand_unlock;
> -       mtd->_suspend = nand_suspend;
> -       mtd->_resume = nand_resume;
>         mtd->_reboot = nand_shutdown;
>         mtd->_block_isreserved = nand_block_isreserved;
>         mtd->_block_isbad = nand_block_isbad;
> @@ -6262,13 +6260,21 @@ static int nand_scan_tail(struct nand_chip *chip)
>  
>         /* Check, if we should skip the bad block table scan */
>         if (chip->options & NAND_SKIP_BBTSCAN)
> -               return 0;
> +               goto out;
>  
>         /* Build bad block table */
>         ret = nand_create_bbt(chip);
>         if (ret)
>                 goto err_free_secure_regions;
>  
> +out:
> +       /*
> +        * Populate the suspend/resume hooks after the BBT has been scanned to
> +        * avoid using the suspend lock and resume waitqueue which are only
> +        * initialized when mtd_device_register() is called.
> +        */
> +       mtd->_suspend = nand_suspend;
> +       mtd->_resume = nand_resume;
>         return 0;
>  
>  err_free_secure_regions:

Actually, this version is even cleaner:

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3d6c6e880520..98c39b7f6279 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6222,8 +6222,6 @@ static int nand_scan_tail(struct nand_chip *chip)
        mtd->_sync = nand_sync;
        mtd->_lock = nand_lock;
        mtd->_unlock = nand_unlock;
-       mtd->_suspend = nand_suspend;
-       mtd->_resume = nand_resume;
        mtd->_reboot = nand_shutdown;
        mtd->_block_isreserved = nand_block_isreserved;
        mtd->_block_isbad = nand_block_isbad;
@@ -6261,14 +6259,20 @@ static int nand_scan_tail(struct nand_chip *chip)
                goto err_free_interface_config;
 
        /* Check, if we should skip the bad block table scan */
-       if (chip->options & NAND_SKIP_BBTSCAN)
-               return 0;
-
-       /* Build bad block table */
-       ret = nand_create_bbt(chip);
-       if (ret)
-               goto err_free_secure_regions;
+       if (chip->options & NAND_SKIP_BBTSCAN) {
+               /* Build bad block table */
+               ret = nand_create_bbt(chip);
+               if (ret)
+                       goto err_free_secure_regions;
+       }
 
+       /*
+        * Populate the suspend/resume hooks after the BBT has been scanned to
+        * avoid using the suspend lock and resume waitqueue which are only
+        * initialized when mtd_device_register() is called.
+        */
+       mtd->_suspend = nand_suspend;
+       mtd->_resume = nand_resume;
        return 0;
 
 err_free_secure_regions:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
