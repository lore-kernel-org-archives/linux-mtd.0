Return-Path: <SRS0=q3Mz=WL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2205C32759
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 07:47:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C61712084D
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 07:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eBMdSfNq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C61712084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6orPVMP/2OOltteIOQy8MGwCZXGwPYhHojom0EcComs=; b=eBMdSfNqmkCLKu
	ednnCj/jy3GVwYKCoH5UgupJrBcn/wen+6W37wBNeuZoLshbe4EJViGrcidACcIMZM3HClEWFgxXQ
	bZ5itk+NlI5r0PJr4GlZ9+9cuo/mHGhwXZ5Ph0zTuEDH1EWBESkrHPGJVA85ZLXXxLJ7PIuBqJqrS
	8CcXEcZszXbLh13UvKbwFsvN7ioEZkTK6JghNaqBSCcnXcOu72ROKWRl9CTj/c0029P0sCtkYVzKI
	UXWi0C4KtbNydxs7Ce6u87RR+gmwArxW7R22HbNqFJN1WSC2+EQ/AWpFX4d+uN8IIQlMhVvxAhT/R
	w83M9Iexv1HEd5N+fotw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyATM-0007sY-OZ; Thu, 15 Aug 2019 07:47:00 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyATJ-0007qW-09
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2019 07:46:58 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hyATF-00014R-Ns; Thu, 15 Aug 2019 09:46:53 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hyATD-0000yH-QY; Thu, 15 Aug 2019 09:46:51 +0200
Date: Thu, 15 Aug 2019 09:46:51 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 05/11] quota: Allow to pass quotactl a mountpoint
Message-ID: <20190815074651.4wnzc2beh7tpcori@pengutronix.de>
References: <20190814121834.13983-1-s.hauer@pengutronix.de>
 <20190814121834.13983-6-s.hauer@pengutronix.de>
 <20190814233632.GW1131@ZenIV.linux.org.uk>
 <20190814233946.GX1131@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814233946.GX1131@ZenIV.linux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:34:43 up 38 days, 13:44, 50 users,  load average: 0.14, 0.13, 0.19
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_004657_039610_1A7E0742 
X-CRM114-Status: GOOD (  17.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Aug 15, 2019 at 12:39:46AM +0100, Al Viro wrote:
> On Thu, Aug 15, 2019 at 12:36:32AM +0100, Al Viro wrote:
> > On Wed, Aug 14, 2019 at 02:18:28PM +0200, Sascha Hauer wrote:
> > > +/**
> > > + * reference_super - get a reference to a given superblock
> > > + * @sb: superblock to get the reference from
> > > + *
> > > + * Takes a reference to a superblock. Can be used as when the superblock
> > > + * is known and leaves it in a state as if get_super had been called.
> > > + */
> > > +void reference_super(struct super_block *sb)
> > > +{
> > > +	spin_lock(&sb_lock);
> > > +	sb->s_count++;
> > > +	spin_unlock(&sb_lock);
> > > +
> > > +	down_read(&sb->s_umount);
> > > +}
> > > +EXPORT_SYMBOL_GPL(reference_super);
> > 
> > NAK, for a plenty of reasons
> > 
> > 1) introduction of EXPORT_SYMBOL_GPL garbage
> > 2) aforementioned garbage on something that doesn't need to be exported
> > 3) *way* too easily abused - get_super() is, at least, not tempting to
> > play with in random code.  This one is, and it's too low-level to
> > allow.
> 
> ... and this is a crap userland API.
> 
> *IF* you want mountpoint-based variants of quotactl() commands, by all means,
> add those.  Do not overload the old ones.  And for path-based you don't
> need to mess with superblock references - just keep the struct path until
> the end.  That will keep the superblock alive and active just fine.

I'll happily drop these changes. To clarify, quota currently does:

	if (quotactl_cmd_onoff(cmd))
		sb = get_super_exclusive_thawed(bdev);
	else if (quotactl_cmd_write(cmd))
		sb = get_super_thawed(bdev);
	else
		sb = get_super(bdev);

You are saying that the struct super_block I get from a struct path pointer is
in a suitable state for all the cases above, right?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
