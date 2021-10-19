Return-Path: <SRS0=PxVx=PH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C6AC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 18:08:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A93C560FC2
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 18:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A93C560FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IPcyBK8AiNN/KE6InRXMXJXND+lcU8cKlgUeJMgxbE=; b=i43H4aVGbcda2x
	rpgbySSQqxnc7dYWKTrXfmhBL4GRC4hsu0mWG+6RPCwqFL+TZH0flHwF8h/drMea8nX+LuKJRdFxm
	20y8J+x1rgnr9g9mJ/Z+j+8vtINHOz00HD7uKn0pV9QklZOLtV/A9K4i4ZW4pULaryKdS014IpkoL
	bz2KKIXkIKMjuWlhEqw2oeDbAESpccvXuzPICn6+J8Qkw1Ikb39iBbwEkorPYhruxpuOZnE2FS1UK
	X9A2WpOB0Jkl0p87ccDNa5VH5fpX1AzusmT/rijcXPI9NhHv54irK9WM+/mAeNzG8d5ECfPVTMxm5
	BXKkUaloGytdKsUtX2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mctX1-002NGM-MV; Tue, 19 Oct 2021 18:08:12 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mctWx-002NCW-Sv
 for linux-mtd@lists.infradead.org; Tue, 19 Oct 2021 18:08:10 +0000
Received: from skn-laptop (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id 206B0C7C23;
 Tue, 19 Oct 2021 18:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1634666882; bh=8waxH/oQcvaRnTQ2ApGJbr/EejSwOZrzxuX1qzke3+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=O1a+El+xqcnXBbE58uwmQbdGIKtkDZrkC2VcwDQaG5gYHu9jRC/CCqAMOn5L5GCB9
 n5LPIwojT+v0IxTGJffg27qQ6ylHLF9n6I395ZVLuVj85QWXbiAddoH0tDX3bhbJ7A
 CZkLFoBNLuYHNv33q4/kA2JXIYN++iKLSbEbsuWLlSmPUZ0JGgTm+OVY1Iv2IcKQtI
 6iZlNb6SI3VEEtX0cVhREiTz2+fskM8B/do2mnsTajEd9ORt+amSbpvlQCNcycHHrG
 D8v0NKaCb7dK9v7K40LxBlPcoP5XayJcDaHK6Jo7FoeIFeNFq82olHCdM0JD1hwPDF
 3Vll6d4ekoy5Q==
Date: Tue, 19 Oct 2021 20:08:00 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: core: protect access to mtd devices while in
 suspend
Message-ID: <20211019180800.3v7emokse6lkpjvk@skn-laptop>
References: <20211011115253.38497-1-sean@geanix.com>
 <20211011160546.707b737b@collabora.com>
 <20211015082206.244a2316@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015082206.244a2316@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_110808_535746_3F6D1C02 
X-CRM114-Status: GOOD (  29.09  )
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

On Fri, Oct 15, 2021 at 08:22:06AM +0200, Miquel Raynal wrote:
> Hi Sean,
> 
> boris.brezillon@collabora.com wrote on Mon, 11 Oct 2021 16:05:46 +0200:
> 
> > On Mon, 11 Oct 2021 13:52:50 +0200

[ ... ]

> 
> > > One (small) issue still present. gpmi_nand.c uses the rwsem before it's
> > > initialized. Seems cumbersome to have every mtd/nand driver to call
> > > init_waitqueue_head() and init_rwsem(). Could we somehow move the call
> > > to mtd_set_dev_defaults() before nand_create_bbt()?  
> > 
> > I have a nasty trick for that one, but I'm not sure Miquel will like it
> > (actually, I don't like it either, but it's so simple compared to the
> > other options we have that I'm tempted to go for this approach until
> > someone has time to invest in a cleaner solution :-)):
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index 3d6c6e880520..a9ac2d528a4d 100644
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
> > @@ -6269,6 +6267,13 @@ static int nand_scan_tail(struct nand_chip *chip)
> >         if (ret)
> >                 goto err_free_secure_regions;
> >  
> > +       /*
> > +        * Populate the suspend/resume hooks after the BBT has been scanned to
> > +        * avoid using the suspend lock and resume waitqueue which are only
> > +        * initialized when mtd_device_register() is called.
> > +        */
> > +       mtd->_suspend = nand_suspend;
> > +       mtd->_resume = nand_resume;
> >         return 0;
> 
> I'm fine with this as long as it is documented for now.
> 

Hi Boris and Miquel,

gpmi-nand.c sets NAND_SKIP_BBTSCAN so we won't get there and populate
suspend resume hooks :(
Guess there is other drivers that does the same thing...

I have looked in the history and tried to blame gpmi-nand.c, but I can't
see the reason to why NAND_SKIP_BBTSCAN is set.

I have tested Boris' hack with this diff (and it seems to work):

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4d08e4ab5c1b..ec7f44d630b6 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2073,8 +2073,6 @@ static int gpmi_nand_attach_chip(struct nand_chip *chip)
 	if (ret)
 		return ret;
 
-	chip->options |= NAND_SKIP_BBTSCAN;
-
 	return 0;
 }
 
@@ -2460,9 +2459,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 		goto err_out;
 
 	ret = nand_boot_init(this);
-	if (ret)
-		goto err_nand_cleanup;
-	ret = nand_create_bbt(chip);
 	if (ret)
 		goto err_nand_cleanup;
 

Do I miss something?

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
