Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319B2C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 15:28:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B645D206C2
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 15:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B645D206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fy0CwgU54aGIgZMTIhaVQAbFtP8ISN0z/yHc3zytYno=; b=y+XESUyWDtz3/FFBn60qH7Etv
	Uqfoaxzh/ZO8iIHpvgdXWmiId2VCce5ZjxcgelCdfrFv9QnrEAW0WdENXjj2NOyodVZWi4qVvzO3V
	AGTZBhTjSa9DgWzJuKCo0TFDr2zwenLC0PM2hOCSr6tniq4E56quCO1+/nRm7mFg0AKD7+vwVY+rG
	pWCY0RIUJY8d2Qg8MJFbVNXeX/XCcJy0UfbU0DosArpLmpZui9lHsmZUasqY6jX6gw9sN0x8emPYm
	u141qbsHnoso29koux+lYd0+CAaAKGkKcj1p1PWXZIW3+wjcFdjwoebiCiUrpKF0GBOpdVODpY8GT
	lM9x9oc6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4mjg-0001Er-3x; Wed, 27 Jan 2021 15:28:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4mje-0003be-Eg
 for linux-mtd@merlin.infradead.org; Wed, 27 Jan 2021 15:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=q/dlDrqDMEF8JRov+4PybYwqVGj+TuA1JosIhK2UY/s=; b=Vk8ZOVBaPaDVt5kEvvVv5zKjUO
 /Yx7G+WZEXDVhy0MTpYkoI6a7LjWQwtfYSkoLTur+s6ObI+07Ex9bwIh8E0o6LMC3JYTcQ3gZEUUo
 Fy26uj66fNQ7qJhWQo4CCQ7JVhG3FVktWJkGwLefDGgEKH0AaD3fBHiqJq07Ea/Nzh/VI7lWX9VE8
 IerM6YPojcoO3uQVCyrRQt87Ru1XFjEwzyQ79yDLyW47GVu8HhWt1FZuFrxY2t5UEvv3Ob8D6CDRH
 rUVDZY9zbZItt4nsO6rBsYyfkgDsHDClA/DyN3Hbl6GsOswJJNjYi3/oXTSsTOEzDBLNbhgRvu6f6
 zSTzbXPw==;
Received: from mx2.suse.de ([195.135.220.15])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1l4lg3-00770R-5I
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 14:20:22 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC0E7B980;
 Wed, 27 Jan 2021 14:19:52 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 753D71E14D0; Wed, 27 Jan 2021 15:19:52 +0100 (CET)
Date: Wed, 27 Jan 2021 15:19:52 +0100
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210127141952.GA13717@quack2.suse.cz>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
 <20210122171658.GA237653@infradead.org>
 <20210125083854.GB31738@pengutronix.de>
 <20210125154507.GH1175@quack2.suse.cz>
 <20210125204249.GA1103662@infradead.org>
 <20210126131752.GB10966@quack2.suse.cz>
 <20210126133406.GA1346375@infradead.org>
 <20210126161829.GG10966@quack2.suse.cz>
 <20210127140510.GI28722@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127140510.GI28722@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_142022_208385_F256435E 
X-CRM114-Status: GOOD (  22.92  )
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
Cc: Jan Kara <jack@suse.cz>, Richard Weinberger <richard@nod.at>,
 Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed 27-01-21 15:05:10, Sascha Hauer wrote:
> On Tue, Jan 26, 2021 at 05:18:29PM +0100, Jan Kara wrote:
> > On Tue 26-01-21 13:34:06, Christoph Hellwig wrote:
> > > On Tue, Jan 26, 2021 at 02:17:52PM +0100, Jan Kara wrote:
> > > > Well, I don't think that "wait until unfrozen" is that strange e.g. for
> > > > Q_SETQUOTA - it behaves like setxattr() or any other filesystem
> > > > modification operation. And IMO it is desirable that filesystem freezing is
> > > > transparent for operations like these. For stuff like Q_QUOTAON, I agree
> > > > that returning EBUSY makes sense but then I'm not convinced it's really
> > > > simpler or more useful behavior...
> > > 
> > > If we want it to behave like other syscalls we'll just need to throw in
> > > a mnt_want_write/mnt_drop_write pair.  Than it behaves exactly like other
> > > syscalls.
> > 
> > Right, we could do that. I'd just note that the "wait until unfrozen" and
> > holding of sb->s_umount semaphore is equivalent to
> > mnt_want_write/mnt_drop_write pair. But I agree
> > mnt_want_write/mnt_drop_write is easier to understand and there's no reason
> > not to use it. So I'm for that simplification in the new syscall.
> 
> Due to the user_path_at() to the mountpoint the fs won't go away, so I
> guess for non-exclusive, non-write quota command I don't need any
> additional locking.

They still need s_umount in read mode - to serialize against quotaon /
quotaoff (happening either through quotactl or filesystem remount).

> For non-exclusive, write commands I'll need a
> mnt_want_write/mnt_drop_write pair. What about the exclusive, write
> commands (Q_QUOTAON/Q_QUOTAOFF)?

And these still need s_umount in write mode for similar reasons. So the
only thing you really save is the "wait-for-unfreeze" code.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
