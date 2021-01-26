Return-Path: <SRS0=ENrU=G5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211B6C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 10:52:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0FD7230FD
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 10:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0FD7230FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VfwzAumCVI28AJzT5jE6vvkfKGc5LZxP1FAEiFbo7xs=; b=ma7iuzGnxXkMQxyCzxSqnaE/x
	q2i2XsBN2jiXXsOwdHWpsLujAcnXgsj8YHfuHQS03ktuFbfKk8/ebQYeByJxl8kA0hEYymQMMqJAs
	CiZ0Or5dQyisTK6kfG1vVgo7xbYov+Mhuns2NI5LV+qoBW3ZkvWpaB5wZUJKjFEQtcbhFzF9hvjug
	0s+w/oetpzEbuY3a8MCbMh3tG6tugtOMqHRCYpnSUBRs7Wi2N6QTn9sZr8T5ts8/Dr3LVuasSgaKV
	F4yAADoGtTfJGnGlVYGqmgrSVlmp1fb/Ao88THQ7mloiGzlViT5vXNs1IkrLLhP8egKDucxFTcyPg
	mxWUBuF+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Lvj-00019z-1F; Tue, 26 Jan 2021 10:50:39 +0000
Received: from metis.ext.pengutronix.de ([85.220.165.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Lvg-00019D-Pz
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2021 10:50:37 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l4LrF-00008s-P7; Tue, 26 Jan 2021 11:46:01 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l4LrB-00054N-OP; Tue, 26 Jan 2021 11:45:57 +0100
Date: Tue, 26 Jan 2021 11:45:57 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210126104557.GB28722@pengutronix.de>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
 <20210122171658.GA237653@infradead.org>
 <20210125083854.GB31738@pengutronix.de>
 <20210125154507.GH1175@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125154507.GH1175@quack2.suse.cz>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:20:06 up 54 days, 22:47, 98 users,  load average: 0.16, 0.17, 0.21
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_055036_907328_06135E24 
X-CRM114-Status: GOOD (  25.20  )
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
Cc: Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 04:45:07PM +0100, Jan Kara wrote:
> On Mon 25-01-21 09:38:54, Sascha Hauer wrote:
> > On Fri, Jan 22, 2021 at 05:16:58PM +0000, Christoph Hellwig wrote:
> > > On Fri, Jan 22, 2021 at 04:15:29PM +0100, Sascha Hauer wrote:
> > > > This patch introduces the Q_PATH flag to the quotactl cmd argument.
> > > > When given, the path given in the special argument to quotactl will
> > > > be the mount path where the filesystem is mounted, instead of a path
> > > > to the block device.
> > > > This is necessary for filesystems which do not have a block device as
> > > > backing store. Particularly this is done for upcoming UBIFS support.
> > > > 
> > > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > 
> > > I hate overloading quotactl even more.  Why not add a new quotactl_path
> > > syscall instead?
> > 
> > We can probably do that. Honza, what do you think?
> 
> Hum, yes, probably it would be cleaner to add a new syscall for this so
> that we don't overload quotactl(2). I just didn't think of this.

How should the semantics of that new syscall look like?

The easiest and most obvious way would be to do it like the quotactl(2)
and just replace the special argument with a path:

int quotactl_path(int cmd, const char *path, int id, caddr_t addr);

If we try adding a new syscall then we could completely redefine the API
and avoid the shortcomings of the original quotactl(2) if there are any.
Can you foresee the discussions we end up in? I am afraid I am opening a
can of worms here.
OTOH there might be value in keeping the new syscall compatible to the
existing one, but I don't know how much this argument counts.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
