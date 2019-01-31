Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178FAC169C4
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 07:37:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E745220881
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 07:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GIR1OcbG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E745220881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRM49h6LTcphjwVcF4JNMrvMfv4DY4JLcwk+Db3fPm4=; b=GIR1OcbGhseTcI
	XFOVAaAVDn4EQm+X5j17SFEu7qSSQpCjyMwq5FN+xrGIfIAgreXXIHae4HPTGAcsBYOWQeAswra8N
	rGpaxmDbwQzkbREBgU3qZXvovM45jyTQS4CEdyR8AAHmU5RjjNNyQ4O6kd9bLl+tmSYoaAM3b0F4X
	SJTNkd7BLeJCpcTbYKwrSEcHjiPPgIaZBzF4AQdXtA+YEmp7qd1nvwdH8p0C/ZG9i1x9Aknq8ineg
	kqGrIprxrw3Fvt2S/n6uEO2O8Nn4XwMBbZRZwghqbhqmaVNCRfGupizp8deaHvmW2p8Xd6qBTgLr+
	I5PVdO7+JY8PImeLMicA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gp6ua-0002Nn-UB; Thu, 31 Jan 2019 07:37:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gp6uX-0002N7-6v
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2019 07:37:23 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gp6uO-0005T6-84; Thu, 31 Jan 2019 08:37:12 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gp6uM-00058d-8A; Thu, 31 Jan 2019 08:37:10 +0100
Date: Thu, 31 Jan 2019 08:37:10 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: UBIFS quota support
Message-ID: <20190131073710.2tpg5vx6fhfumou7@pengutronix.de>
References: <20190110114448.vcx6w76ibmxwvlh3@pengutronix.de>
 <CAFLxGvyrNaq6ya9TNr-tdEEbV=qsi8qEko6R7oJ-DtkxPJMk0g@mail.gmail.com>
 <20190123154743.GL13149@quack2.suse.cz>
 <20190125092156.ck77sdqainmmewuz@pengutronix.de>
 <20190130124535.GE30203@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190130124535.GE30203@quack2.suse.cz>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 20:14:39 up 9 days, 6:27, 45 users, load average: 0.01, 0.12, 0.15
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_233721_406321_E93CF9A7 
X-CRM114-Status: GOOD (  28.25  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 30, 2019 at 01:45:35PM +0100, Jan Kara wrote:
> Hello,
> 
> > UBIFS has no idea of transactions and works a little different from
> > ext4. In UBIFS all filesystem data and metadata are stored in the leaf
> > nodes of a b+tree. These leaf nodes are constantly written to flash and
> > would be enough to reconstruct the FS. From time to time UBIFS does a
> > commit and writes the index nodes to flash. During recovery the tree can
> > be read from the index nodes from the last commit. The remaining leaf
> > nodes that were written after the last commit are then scanned and added
> > to the tree during replay.
> > 
> > Quota seems to work in the way that it has callbacks into the FS to read
> > and update dqblks. This is not very suitable for UBIFS. Instead it would
> 
> Yes, generally it works by requesting loading / storing of quota
> information for a particular user from the filesystem.
> 
> > be nicer to read the full quota data from flash and hand it over to
> > quota. When UBIFS does a commit it would then request a consistent view
> > of the quota data and write it back to flash. During replay of an
> > uncleanly mounted FS UBIFS could read the quota data from the last
> > commit and update it with the remaining leaf nodes that need to be
> > replayed anyway.
> 
> Well, I don't think writing all quota data for each commit is a good
> design. That will write out lot of unnecessary stuff that didn't change
> since last time. It is like if you rewrite the whole file to update
> one block in it... Similarly loading all quota data doesn't look great for
> performance. There can be thousands or tens of thousands different users of
> the filesystem (yes, I've seen such deployments) and you don't want to read
> and keep in memory information you don't currently need. But I guess UBIFS
> is targetted at smaller deployments?

It seems our perspective to quota is quite different ;)
UBIFS targets embedded systems, in a typical usecase I wouldn't expect
more than a handful of users and certainly not more users than we fit
dqblks in a single page. From my perspective it adds overhead that we
have a tree at all and that the current quota formats constantly changes
the single page that we have all our quota data in, instead of writing
the whole data at once every once in a while.

> 
> Anyway, what is easily doable is that you would just ignore requests for
> update from quota subsystem (just let quota subsystem mark dquot as dirty)
> and then on commit call dquot_writeback_dquots() that will call
> ->write_dquot callback for each dquot that is dirty. That way you'd get
> full dump of dquots that changed since last commit. You'd need to somehow
> make sure this gets merged with information from previous commit. Then on
> crash recovery you'd load quota information from commit and update it with
> the changes that happened since that last commit.

Yes, something like that should work.

> 
> Honestly loading quota limits by init scripts looks like a hack to me. Note
> that quota limits rarely change so you can easily store them separately
> from usage information and load them on mount. Since setting of limits does
> not have to be crash-safe (well, it needs to keep the quota information in
> a state that is recoverable by mount but it doesn't need to coordinate with
> any other filesystem operations), I don't think implementing that would be
> hard...

It's not my goal to put quota limits into init scripts, still I think it
could be a nice stopover to divide the whole thing into more managable
parts. I think I'll just implement it up to that point and post the
result. Then we can still see if it's enough to merge or if I have to
implement the rest before merging.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
