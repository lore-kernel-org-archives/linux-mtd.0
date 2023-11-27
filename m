Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935D3C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 22:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qo96a0t2I6erC3IQJNPCEgBnWgVFsjS10hVIsM32Eo=; b=aoKhsmP5oC1SKN
	rr736hY3/fcgE/gLRU1mB2rt6d41Wbr5/KekXAYZwSx6iEDxWGskrneB5ukUu9GyNk9UFB9va0G8T
	iJqof0Mz3Q5k7QVXmvpY1S1vSX83QKljOs9YusTT1AJx2vz7EmTIz4lDxBmHlWBw5byjbzDk0IDVH
	X+Wbfu6kOT4D935beJeGucamLZPhehE+6QTP2/lVDEytCTOqw/I7LdQb+MNEs5vZrr6aiKJZInMN7
	SCWMjP5fDy+sZDXprYUXaBZ5VTpd75llZCGm9vqTW8VXMA6Smm2nd0bKusNDyIIrnJ55iKpo/qhjw
	+9oF3ifEd8M/kV6l9saA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jks-003YnC-1k;
	Mon, 27 Nov 2023 22:07:02 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jko-003YmA-33
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 22:07:00 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r7jkh-0001Ad-1s;
	Mon, 27 Nov 2023 22:06:52 +0000
Date: Mon, 27 Nov 2023 22:06:50 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH] ubi: don't decrease ubi->ref_count on detach error
Message-ID: <ZWUS-mjWIcIFXvY5@makrotopia.org>
References: <9857609999c5b7196417474938a7a09892cd1612.1701104870.git.daniel@makrotopia.org>
 <771902199.32600.1701116758852.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <771902199.32600.1701116758852.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_140658_984793_A09B3C67 
X-CRM114-Status: GOOD (  29.05  )
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

Hi Richard,

On Mon, Nov 27, 2023 at 09:25:58PM +0100, Richard Weinberger wrote:
> > If attempting to detach a UBI device while it is still busy, detaching
> > is refused. However, the reference counter is still being decreased
> > despite the error. Rework detach function to only decrease the refcnt
> > once all conditions for detachment are met.
> > 
> > Fixes: cdfa788acd13 ("UBI: prepare attach and detach functions")
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> Good catch! Did you find this by review or while testing?

I was working on simplifying the NVMEM-on-UBI code which includes
attaching UBI via MTD notifiers. You and others had rightously
criticized the sketchy situation of the 'remove' handler which has now
lead me to rework that part of my patches, which made me end up looking
at the ref_count logic and error path at some point it popped into my
eyes that this can't be right.

> 
> > ---
> > drivers/mtd/ubi/build.c | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> > index 7d4ff1193db6f..f47987ee9a31b 100644
> > --- a/drivers/mtd/ubi/build.c
> > +++ b/drivers/mtd/ubi/build.c
> > @@ -1099,16 +1099,16 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
> > 
> > 	spin_lock(&ubi_devices_lock);
> > 	put_device(&ubi->dev);
> > -	ubi->ref_count -= 1;
> > -	if (ubi->ref_count) {
> > +	if (ubi->ref_count > 1) {
> 
> Is there a specific reason why you have modified the check to test only
> for ref_count being positive?

My idea was to really change only what I meant to change and make
that change the least intrusive possible.

> If rec_counts turns negative, due to a bug, we could still stop it here.

... here and in every other pleace where we touch it?
Adding new sanity checks to the code probably doesn't hurt but goes
beyond the scope of fixing this very bug, so I'll only do it there for
now.

> 
> > 		if (!anyway) {
> > 			spin_unlock(&ubi_devices_lock);
> > 			return -EBUSY;
> > 		}
> > 		/* This may only happen if there is a bug */
> > 		ubi_err(ubi, "%s reference count %d, destroy anyway",
> > -			ubi->ubi_name, ubi->ref_count);
> > +			ubi->ubi_name, ubi->ref_count - 1);
> > 	}
> > +	ubi->ref_count -= 1;
> 
> Please add there an ubi_asert() which tests whether ref_count is really zero.
> ...just to be more bullet proof.

That makes sense, now that it became clear that ref_count wasn't
trustable for more than a decade, let's better make sure it is now.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
