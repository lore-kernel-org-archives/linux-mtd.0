Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C53C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 09:59:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1578D61373
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 09:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1578D61373
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9ADcqF7lBd1vKg/ojVqUFtbRktzZp+8FhQVssj/b+8=; b=YQqlDvYTOvlZnu
	UFJgTyLm8m2FsHxM9CDj+v3AJVAZ6T2cTGHrc+G0+htHB95Z8l9kHBQ/oaALmyikg5XtPaY/DewGk
	ZJqxVXryGPClmoZImF4VwP3PLx2RlNOXuYKtMMKkxlUbagK3gq28mA4beZUE+1ZCdkddSJ3CUbWwo
	coyIFemd64vGbH2bTNEGlyTT8eKA9VaOQVpnTeAehHeKVLAXPU9wRLNNqd8jOLUwBAK6es4gPHqwG
	izWf6BaIgXiEv/zuAO+UflTJIDTPCTjTPKzrfQKKTYPQpRcenTA0sPi8BkniYoKNY23i4CZWT3hio
	a73VhFtU4xArQPNV3gbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXKjp-005sDG-VY; Mon, 04 Oct 2021 09:58:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXKjm-005sAk-Q6
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 09:58:24 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D5C2E1F42EC7;
 Mon,  4 Oct 2021 10:58:20 +0100 (BST)
Date: Mon, 4 Oct 2021 11:58:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: use mutex to protect access while in
 suspend
Message-ID: <20211004115817.18739936@collabora.com>
In-Reply-To: <20211004085509.iikxtdvxpt6bri5c@skn-laptop>
References: <20211004065608.3190348-1-sean@geanix.com>
 <20211004104147.579f3b01@collabora.com>
 <20211004085509.iikxtdvxpt6bri5c@skn-laptop>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_025823_039025_44A54BB5 
X-CRM114-Status: GOOD (  29.65  )
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

On Mon, 4 Oct 2021 10:55:09 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> On Mon, Oct 04, 2021 at 10:41:47AM +0200, Boris Brezillon wrote:
> > On Mon,  4 Oct 2021 08:56:09 +0200
> > Sean Nyekjaer <sean@geanix.com> wrote:
> >   
> > > This will prevent nand_get_device() from returning -EBUSY.
> > > It will force mtd_write()/mtd_read() to wait for the nand_resume() to unlock
> > > access to the mtd device.
> > > 
> > > Then we avoid -EBUSY is returned to ubifsi via mtd_write()/mtd_read(),
> > > that will in turn hard error on every error returened.
> > > We have seen during ubifs tries to call mtd_write before the mtd device
> > > is resumed.  
> > 
> > I think the problem is here. Why would UBIFS/UBI try to write something
> > to a device that's not resumed yet (or has been suspended already, if
> > you hit this in the suspend path).
> >   
> > > 
> > > Exec_op[0] speed things up, so we see this race when the device is
> > > resuming. But it's actually "mtd: rawnand: Simplify the locking" that
> > > allows it to return -EBUSY, before that commit it would have waited for
> > > the mtd device to resume.  
> > 
> > Uh, wait. If nand_resume() was called before any writes/reads this
> > wouldn't happen. IMHO, the problem is not that we return -EBUSY without
> > blocking, the problem is that someone issues a write/read before calling
> > mtd_resume().
> >   
> 
> The commit msg from "mtd: rawnand: Simplify the locking" states this clearly.
> 
> """
> Last important change to mention: we now return -EBUSY when someone
> tries to access a device that as been suspended, and propagate this
> error to the upper layer.
> """
> 
> IMHO "mtd: rawnand: Simplify the locking" should never had been merged
> before the upper layers was fixed to handle -EBUSY. ;)
> Which they still not are...

That's not really the problem here. Upper layers should never get
-EBUSY in the first place if the MTD device was resumed before the UBI
device. Looks like we have a missing UBI -> MTD parenting link, which
would explain why things don't get resumed in the right order. Can you
try with the following diff applied?

---
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index f399edc82191..1981ce8f3a26 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -905,6 +905,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int
ubi_num, ubi->dev.release = dev_release;
        ubi->dev.class = &ubi_class;
        ubi->dev.groups = ubi_dev_groups;
+       ubi->dev.parent = &mtd->dev;
 
        ubi->mtd = mtd;
        ubi->ubi_num = ubi_num;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
