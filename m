Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275FEC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 13:27:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5D3260E8B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 13:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5D3260E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqycXndb4WXGqhVBBv4kOngjjTgllNiKiplph2ROtFU=; b=iNOs1Z3Pkh48w7
	U/pWPK+G0+xkaEdIYLwQ65fN08ASP8V6lL6RnAN+xXWqksqZgG7stlne3zUlHVoeIF+5yN2WJsYxU
	00x6tjb61qiDxPVl87lNuIUHstXwAFhiv6y7DHiUSIHEHHOp/HLNGdxzkJ+kB8P9PFXx2LvxopocK
	B+hAKz6cusOroYhyZokAqHVn4ftMAOFo6+wTBrtL4X22PZFQ2/5vU0sNyb2cIbUXkUf2H7dpc2TPJ
	kq++AQj4hyVFUJpJeLnnlK9eD+ve/zvY0KzpVJNSgx66AFORHRwUPRhyGnFA2GXYijZ9nl7tD5dMW
	STxyLbBNTPq9+EJLJVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZvKi-009WOQ-9x; Mon, 11 Oct 2021 13:27:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZvKf-009WNc-AV
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 13:27:10 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1803D1F42741;
 Mon, 11 Oct 2021 14:27:07 +0100 (BST)
Date: Mon, 11 Oct 2021 15:27:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mtd: mtdconcat: add suspend lock handling
Message-ID: <20211011152703.0086d990@collabora.com>
In-Reply-To: <20211011151501.48cc9289@collabora.com>
References: <20211011115253.38497-1-sean@geanix.com>
 <20211011115253.38497-4-sean@geanix.com>
 <20211011151501.48cc9289@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_062709_527063_D29ED25B 
X-CRM114-Status: GOOD (  28.29  )
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

On Mon, 11 Oct 2021 15:15:01 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Mon, 11 Oct 2021 13:52:53 +0200
> Sean Nyekjaer <sean@geanix.com> wrote:
> 
> > Use new suspend lock handling for this special case for concatenated
> > MTD devices.
> > 
> > Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > ---
> >  drivers/mtd/mtdconcat.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
> > index f685a581df48..c497c851481f 100644
> > --- a/drivers/mtd/mtdconcat.c
> > +++ b/drivers/mtd/mtdconcat.c
> > @@ -561,25 +561,32 @@ static void concat_sync(struct mtd_info *mtd)
> >  
> >  static int concat_suspend(struct mtd_info *mtd)
> >  {
> > +	struct mtd_info *master = mtd_get_master(mtd);
> >  	struct mtd_concat *concat = CONCAT(mtd);
> >  	int i, rc = 0;
> >  
> >  	for (i = 0; i < concat->num_subdev; i++) {
> >  		struct mtd_info *subdev = concat->subdev[i];
> > -		if ((rc = mtd_suspend(subdev)) < 0)
> > +
> > +		down_write(&master->master.suspend_lock);
> > +		if ((rc = __mtd_suspend(subdev)) < 0)
> >  			return rc;
> > +		up_write(&master->master.suspend_lock);
> >  	}
> >  	return rc;
> >  }
> >  
> >  static void concat_resume(struct mtd_info *mtd)
> >  {
> > +	struct mtd_info *master = mtd_get_master(mtd);
> >  	struct mtd_concat *concat = CONCAT(mtd);
> >  	int i;
> >  
> >  	for (i = 0; i < concat->num_subdev; i++) {
> >  		struct mtd_info *subdev = concat->subdev[i];
> > -		mtd_resume(subdev);
> > +		down_write(&master->master.suspend_lock);
> > +		__mtd_resume(subdev);
> > +		up_write(&master->master.suspend_lock);
> >  	}
> >  }
> >    
> 
> Why do we need to implement the _suspend/_resume() hooks here? The
> underlying MTD devices should be suspended at some point (when the
> class ->suspend() method is called on those device), and there's
> nothing mtdconcat-specific to do here. Looks like implementing this
> suspend-all-subdevs loop results in calling mtd->_suspend()/_resume()
> twice, which is useless. The only issue I see is if the subdevices
> haven't been registered to the device model, but that happens, I
> believe we have bigger issues (those devices won't be suspended when
> mtdconcat is not used).


Uh, just had a look at mtd_concat_create() callers, and they indeed
don't register the subdevices, so I guess the suspend-all-subdevs loop
is needed. I really thought mtdconcat was something more generic
aggregating already registered devices...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
