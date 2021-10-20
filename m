Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0054C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:25:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C023C60524
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C023C60524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuSrQXXHPJFSBdHHwPx53lNxWfQNl7wx7HRwvWpty/o=; b=OP0JPIrMTVfAOW
	1Rd1x+ytIJkmFS6pf0vm4IqIH2P+yIkSy+GrrPjCeM8BTloKYcHumHwRd318s5koRw4Pf1H+cU1bd
	6OobE4TagSvwmli+LEEDzmp3D7u+3VGnZbWA8xrqeQarad4nhXItmJqcL7BbUI45v6zV3Ui0RWWMu
	wIE095FLSVo4NDo0pJdW7oLMqkNjv+epTVcwvik7kMF1Arzgy/jqN1W8QQYb/GtZJ3sZT+lEbboZj
	eMtVztd4ce3CTSxxT7L5sPw5xly63DfkgZoXVIioFCAuDYp8Ktbs0tcIrUgBBIz4zrdPM57zwXjyF
	GGCgR9vNjo938XL+mzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md5y3-003cS0-Q3; Wed, 20 Oct 2021 07:24:56 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md5x6-003c8B-35
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 07:23:57 +0000
Received: from skn-laptop (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id 831C1C7E64;
 Wed, 20 Oct 2021 07:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1634714633; bh=0fOWElFyi9S8CRUIgE+h4zZ2mGvEzLj6N86KS3DiB/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Il8ZPG8eyyLejQX+QKApPZoXan+T7mBumIEfY/TgOZQqY64VM15HsJPZIt/a7WAMq
 aUD0FasIY+BzK/hOMvx/5JaUuhqf7h4SC1LAGkaSCLrdOcNVA6++pc0ThwB0o/Q4Pv
 gG6QHGr8eHa3VdcFslwiMESihf7DTuE+Q/II/OyfimAr5nONILXL4fO9c2eNjfpQWQ
 q6cNJnJHufcHDDBGRaADKUOD/QmGEciU0OB4Lm1A8cWGzlbAPrDuYomN74N/f4erDX
 Jr8XPTYwiq92VqC+lhnupdpelsuZQOUEpG3m7hU0zIS37L5E6rm/7FHFg3/1Blb8uW
 9RrPa5ARJmEhg==
Date: Wed, 20 Oct 2021 09:23:52 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: core: protect access to mtd devices while in
 suspend
Message-ID: <20211020072352.7fnano7wm5l4bfi6@skn-laptop>
References: <20211011115253.38497-1-sean@geanix.com>
 <20211011160546.707b737b@collabora.com>
 <20211015082206.244a2316@xps13>
 <20211019180800.3v7emokse6lkpjvk@skn-laptop>
 <20211020085250.030ef244@collabora.com>
 <20211020090058.58af1087@collabora.com>
 <20211020091228.136fde6e@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020091228.136fde6e@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_002356_323612_178B2A6E 
X-CRM114-Status: GOOD (  17.96  )
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

On Wed, Oct 20, 2021 at 09:12:28AM +0200, Miquel Raynal wrote:
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
> 
> Nice idea.
> 
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

Could be a nice idea, but it doesn't work...
gpmi-nand.c calls nand_create_bbt() after this have run ;)

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
