Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5414AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 08:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00D24613A1
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 08:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00D24613A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikWDIjcG9TR8JnnvuFbMi6i4aA0lx0UtK2YhUYT87K4=; b=0UZxo+CGq3c/Do
	s9Bjp8jJTpe4rx7EgJgfnJzt4miM861WX3z1+pGjhDMgXMdUf8wyhzd+ayEbDrmiwTLoqkmHglLRN
	J3xI92jJpcMXyNPPSSA3WZc0GW97Z9/GVKfgFOE2Mf8rBE+Q0XerdwkU/xXfzs6DTScCYpVsGjJdX
	ZfqJzpWC29axbOQGMYwugVpAiaFzEmII3fET6A1BDGQDhllFrJ6Q8vbbG2q3GDHygnFq8mL8lnmDt
	snEEoaIAKxaiIGrm6vKtC3S4kiS6rZ+UXCCnjWp6CxCWPU80k+uBe1T7NJ8Y/FGpC4PAEF06qSAXK
	zACldYN4gWmejOiN8R7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXJkj-005gy4-VC; Mon, 04 Oct 2021 08:55:18 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXJkg-005gxa-IB
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 08:55:16 +0000
Received: from skn-laptop (_gateway [172.25.0.1])
 by first.geanix.com (Postfix) with ESMTPSA id 4AFDAB42F1;
 Mon,  4 Oct 2021 08:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1633337711; bh=sOyzdYHDj4ghiyZr/0ilGGXA7moAY6qAFtH09e2W4oc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=VGgEnq+fZA7uK9AK/O+vMbIK4PG4hi/vzPzwqkFIVaj+18/gOk199Fsrjc2WLB1Z5
 ibP061jSX8xezrFXuUVPIq9y/TFwCrp4ge21V8kyk/E16EfrilJKbC91hQ3fgfki0M
 UPX32uW/caehIgMlU5rHJR6LIYq2fGWuqylygm+qpHptALF/bXRfGYCoU0UlELr8Ol
 Q6lKHuCKBw7m5FQR9GjZp0fFTk5+jYQZel930Icl+xMh887UhZeUQlPi2B38OFT4/S
 N5FXJtwTZwxgMJJpKXigl9u7h/srTC8ORN7Ig2TEQoYslseJAy95ddIAen3ZnhLkLl
 Oix9Iyw5gzxqQ==
Date: Mon, 4 Oct 2021 10:55:09 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: use mutex to protect access while in
 suspend
Message-ID: <20211004085509.iikxtdvxpt6bri5c@skn-laptop>
References: <20211004065608.3190348-1-sean@geanix.com>
 <20211004104147.579f3b01@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211004104147.579f3b01@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_015514_784746_0CFAE1B6 
X-CRM114-Status: GOOD (  35.26  )
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

On Mon, Oct 04, 2021 at 10:41:47AM +0200, Boris Brezillon wrote:
> On Mon,  4 Oct 2021 08:56:09 +0200
> Sean Nyekjaer <sean@geanix.com> wrote:
> 
> > This will prevent nand_get_device() from returning -EBUSY.
> > It will force mtd_write()/mtd_read() to wait for the nand_resume() to unlock
> > access to the mtd device.
> > 
> > Then we avoid -EBUSY is returned to ubifsi via mtd_write()/mtd_read(),
> > that will in turn hard error on every error returened.
> > We have seen during ubifs tries to call mtd_write before the mtd device
> > is resumed.
> 
> I think the problem is here. Why would UBIFS/UBI try to write something
> to a device that's not resumed yet (or has been suspended already, if
> you hit this in the suspend path).
> 
> > 
> > Exec_op[0] speed things up, so we see this race when the device is
> > resuming. But it's actually "mtd: rawnand: Simplify the locking" that
> > allows it to return -EBUSY, before that commit it would have waited for
> > the mtd device to resume.
> 
> Uh, wait. If nand_resume() was called before any writes/reads this
> wouldn't happen. IMHO, the problem is not that we return -EBUSY without
> blocking, the problem is that someone issues a write/read before calling
> mtd_resume().
> 

The commit msg from "mtd: rawnand: Simplify the locking" states this clearly.

"""
Last important change to mention: we now return -EBUSY when someone
tries to access a device that as been suspended, and propagate this
error to the upper layer.
"""

IMHO "mtd: rawnand: Simplify the locking" should never had been merged
before the upper layers was fixed to handle -EBUSY. ;)
Which they still not are...

Yes, guess there is data in the ubifs queue when going into suspend,
then the ubifs kthread is starting writing when the cpu resumes.
Before mtd_resume() and other pm_resume() handles are called.

How would you have ubifs to wait for mtd_resume()? If you don't like
this mutex solution?

> > 
> > Tested on a iMX6ULL.
> > 
> > [0]:
> > ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
> > 
> > Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > ---
> > 
> > I did this a RFC as we probably will need to remove the suspended
> > variable as it's kinda made obsolute by this change.
> > Should we introduce a new mutex? Or maybe a spin_lock?
> > 
> >  drivers/mtd/nand/raw/nand_base.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index 3d6c6e880520..0ea343404cac 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -4567,7 +4567,6 @@ static int nand_suspend(struct mtd_info *mtd)
> >  		ret = chip->ops.suspend(chip);
> >  	if (!ret)
> >  		chip->suspended = 1;
> > -	mutex_unlock(&chip->lock);
> 
> Hm, I'm not sure keeping the lock when you're in a suspended state
> is a good idea. It just papers over another bug IMO (see above).
> 
> >  
> >  	return ret;
> >  }
> > @@ -4580,7 +4579,6 @@ static void nand_resume(struct mtd_info *mtd)
> >  {
> >  	struct nand_chip *chip = mtd_to_nand(mtd);
> >  
> > -	mutex_lock(&chip->lock);
> >  	if (chip->suspended) {
> >  		if (chip->ops.resume)
> >  			chip->ops.resume(chip);
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
