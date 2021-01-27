Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2A5C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 16:41:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3B9B64D9D
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 16:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3B9B64D9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yGaYn6/sBujLIvY2eF3sGa7E8AXhGxdKB/viP8gME2s=; b=xVvI0m9iwOMOTVorOW+NCzRti
	2Y4fU57LsXmnYFNRb1B75l50BtRawewUJNFYrXQ0m5lzS1mQHimsXiOujA/xppdF+ocgH+vDbo0k5
	+Br4kM2O4v/Fosnc5Rxb2oVTgUMIjYPevDKTFLaOaUDNkKQDJRd/Wa07WWbDP6pv89IWVsxndPMp4
	oXxSk4fyDOf1t/CwUpeLFmsFfcEW9JEDezJ6+6F/hfxfFx0SvAX2yx4WBX8tAjnDAdU/lRLRKJ3Gl
	TVW47oAAGJmaYzhihBj7piHH6pAYL5Os3Xvx6uRQdvDuoacie/wwoDhviLa579+fu/W67btcsFMxl
	hlvxka9MA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4mmR-0002HF-Qe; Wed, 27 Jan 2021 15:30:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4mlc-0007Ur-Bu
 for linux-mtd@merlin.infradead.org; Wed, 27 Jan 2021 15:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YjLsXoNwEy5MmfiBZgq0vqOXWFIRRASpyR9GfRIgDLI=; b=t6y14Awvkihft59c9uLJd3GQSU
 HBtHp0X/PpBABsqtjpeLPq9PXfYY4lbjun5SPk1O4pVMDNLYWo9JHBqRQhMyVfeQ7UbV6/gfq1Q05
 r+AhZwEpcT8x9FVzjDPYwMrQbX/fqXMh9TM5nsW82E6a4WwLiToSgzF9cIu3ljpe0UCQZf3bNY7HL
 mnBKtR+f0VvprHrllvJzYnh6/RJk0FkvTkz07IAszx1imsnwq1RHuz+Peg70haE/4/sXzzqBf8mYk
 gHWcpIMfSGkKPNGqaUb35ZF9rtoIZV4yyc1Nd3/mCBgSeWiV6lWf3HjemlZHxt6jbjWSnljllEauS
 TRvhK0Tg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1l4lUJ-0076Lf-Uw
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 14:08:10 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l4lRj-0008SV-2i; Wed, 27 Jan 2021 15:05:23 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l4lRW-00024o-JR; Wed, 27 Jan 2021 15:05:10 +0100
Date: Wed, 27 Jan 2021 15:05:10 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210127140510.GI28722@pengutronix.de>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
 <20210122171658.GA237653@infradead.org>
 <20210125083854.GB31738@pengutronix.de>
 <20210125154507.GH1175@quack2.suse.cz>
 <20210125204249.GA1103662@infradead.org>
 <20210126131752.GB10966@quack2.suse.cz>
 <20210126133406.GA1346375@infradead.org>
 <20210126161829.GG10966@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126161829.GG10966@quack2.suse.cz>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:59:08 up 56 days,  2:26, 96 users,  load average: 0.05, 0.07, 0.08
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_140810_626096_5BB5C03E 
X-CRM114-Status: GOOD (  18.76  )
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

On Tue, Jan 26, 2021 at 05:18:29PM +0100, Jan Kara wrote:
> On Tue 26-01-21 13:34:06, Christoph Hellwig wrote:
> > On Tue, Jan 26, 2021 at 02:17:52PM +0100, Jan Kara wrote:
> > > Well, I don't think that "wait until unfrozen" is that strange e.g. for
> > > Q_SETQUOTA - it behaves like setxattr() or any other filesystem
> > > modification operation. And IMO it is desirable that filesystem freezing is
> > > transparent for operations like these. For stuff like Q_QUOTAON, I agree
> > > that returning EBUSY makes sense but then I'm not convinced it's really
> > > simpler or more useful behavior...
> > 
> > If we want it to behave like other syscalls we'll just need to throw in
> > a mnt_want_write/mnt_drop_write pair.  Than it behaves exactly like other
> > syscalls.
> 
> Right, we could do that. I'd just note that the "wait until unfrozen" and
> holding of sb->s_umount semaphore is equivalent to
> mnt_want_write/mnt_drop_write pair. But I agree
> mnt_want_write/mnt_drop_write is easier to understand and there's no reason
> not to use it. So I'm for that simplification in the new syscall.

Due to the user_path_at() to the mountpoint the fs won't go away, so I
guess for non-exclusive, non-write quota command I don't need any
additional locking. For non-exclusive, write commands I'll need a
mnt_want_write/mnt_drop_write pair. What about the exclusive, write
commands (Q_QUOTAON/Q_QUOTAOFF)?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
