Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94CBC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:13:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F19160EBD
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 07:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F19160EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXDosubV816opRkSCe4AwIgnDmLCSEXM30hitvZ9oS8=; b=pACabx7ohG9ML7
	9OMy2JqgbE2R3Tybv5b4u4Qc8bQVCNB13SOAST1oveYEuCqWb2O9iNMgR9kpEo4GHZfGKgrKZO8sI
	zi5VDXRQhKn8wZdiI1yClG+GXu6pwljegyI4MXJqI2htS28fbP/3Jil5xKeB+ezMDZI01DUXke9qF
	4xjTZ+fSdL6ow3wGjsLR7q/45qZIaTmuBu5mmWGiNrGJzYfsWRijGGbGW6tmu9AujjkGSk+O2M0P2
	QEZQLjcunzsFycFLJy+e8bCTU6Ot7sOJclHpQNVMYa55tvDFifMtG/VFHRwRxQ7JmIEAeeQ8JzTaV
	JUHEqpor7+z8C86IFq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md5mM-003XTU-L3; Wed, 20 Oct 2021 07:12:50 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md5mD-003XRt-V8
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 07:12:44 +0000
Received: from skn-laptop (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id 16648C7E51;
 Wed, 20 Oct 2021 07:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1634713957; bh=7RKzYEKUzqJxN+fJSiMpNqB5gjIFZdyRqNN4Bv+4fwI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=iFwKrzXu/BKR0++MdzRg3GQKEoToCQbpY5xMsOnExv9bWYKIzxnDL5XqdeBnm3Bfs
 0+44H87Vb0VB9SkExkVlC6YtjdD7cLkL5qMpBqh8/04a/uo8pmJLW/16gqs/sjjit+
 i4F5FqZ0AAjHgOHKa9OlS/GJZmZFvf81hXnUGy7th6oGqMnvgBG9hZo+swaKt1tRCn
 QEwFDKwq/XhJ+qAs4vw4zz0M/E5pW/RGLZeHFDQu97CCSNKpDCJ8PnG1Z8okFG1sC7
 2gvKNCljbn35bdNgVNHSndZUi44TR2mfKH4oLKNoa70VZPSeGEl/9Y53upTNuW7eC1
 974DJtjWXJX3Q==
Date: Wed, 20 Oct 2021 09:12:35 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: core: protect access to mtd devices while in
 suspend
Message-ID: <20211020071235.in3omswo2jqrahrd@skn-laptop>
References: <20211011115253.38497-1-sean@geanix.com>
 <20211011160546.707b737b@collabora.com>
 <20211015082206.244a2316@xps13>
 <20211019180800.3v7emokse6lkpjvk@skn-laptop>
 <20211020085250.030ef244@collabora.com>
 <20211020090058.58af1087@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020090058.58af1087@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_001242_719894_AC920049 
X-CRM114-Status: GOOD (  22.24  )
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

On Wed, Oct 20, 2021 at 09:00:58AM +0200, Boris Brezillon wrote:
> On Wed, 20 Oct 2021 08:52:50 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 

[ ... ]
> > > 
> > > Hi Boris and Miquel,
> > > 
> > > gpmi-nand.c sets NAND_SKIP_BBTSCAN so we won't get there and populate
> > > suspend resume hooks :(
> > > Guess there is other drivers that does the same thing...  
> 
> Actually, this version is even cleaner:
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 3d6c6e880520..98c39b7f6279 100644
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
> @@ -6261,14 +6259,20 @@ static int nand_scan_tail(struct nand_chip *chip)
>                 goto err_free_interface_config;
>  
>         /* Check, if we should skip the bad block table scan */
> -       if (chip->options & NAND_SKIP_BBTSCAN)
> -               return 0;
> -
> -       /* Build bad block table */
> -       ret = nand_create_bbt(chip);
> -       if (ret)
> -               goto err_free_secure_regions;
> +       if (chip->options & NAND_SKIP_BBTSCAN) {
> +               /* Build bad block table */
> +               ret = nand_create_bbt(chip);
> +               if (ret)
> +                       goto err_free_secure_regions;
> +       }
>  
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

Why is the gpmi-nand.c and other drivers set NAND_SKIP_BBTSCAN and then
call nand_create_bbt() directly?

To me it looks like legacy leftover...

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
