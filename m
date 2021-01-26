Return-Path: <SRS0=ENrU=G5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A07C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 13:18:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33CDC23109
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 13:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33CDC23109
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hXiwGvjjZU4pNnD0wp//lznBtGVdN3TI36VEzflQzmI=; b=UkOBpURt1s/GDITtAen8tOvLf
	o91d+dzMXab1s3y/0MlYTSRA/JX2z/S0BnYXVfrM+uniq9+Ma6bRw2sWlnd3KavZCt3H51437JZbN
	MWk3kOUl6dJmP/ZifNo6adUQJzdlEIJrrSgMk/XSEJFKlQ9Bjr3AXt9v1Y3RxvRwn8+8F7aFDiBFW
	9PWl2R1OVjVyp+DVoBM9dKBszc0V4+Jn5J2IfUC2+Ja7xwnxkbnDC9dM3/Ris8ef30tEdTt7y5cIN
	DpghiwoJUn44vBXf2WpLHcTIFNMY4McaPVTqGQkCPligLCe9EItjC6S3j0ueSqqkHN0zzNAmO6ozF
	Q4N1Dhekg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4OEK-00076f-2f; Tue, 26 Jan 2021 13:18:00 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4OEE-00075V-Kp
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2021 13:17:58 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD38CAD19;
 Tue, 26 Jan 2021 13:17:52 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 880E81E151D; Tue, 26 Jan 2021 14:17:52 +0100 (CET)
Date: Tue, 26 Jan 2021 14:17:52 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210126131752.GB10966@quack2.suse.cz>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
 <20210122171658.GA237653@infradead.org>
 <20210125083854.GB31738@pengutronix.de>
 <20210125154507.GH1175@quack2.suse.cz>
 <20210125204249.GA1103662@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125204249.GA1103662@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_081754_812651_77D6652F 
X-CRM114-Status: GOOD (  25.17  )
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
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon 25-01-21 20:42:49, Christoph Hellwig wrote:
> On Mon, Jan 25, 2021 at 04:45:07PM +0100, Jan Kara wrote:
> > > What do you mean by "take"? Take the superblock as an argument to
> > > quotactl_sb() or take a reference to the superblock?
> > > Sorry, I don't really get where you aiming at.
> > 
> > I think Christoph was pointing at the fact it is suboptimal to search for
> > superblock by device number when you already have a pointer to it.  And I
> > guess he was suggesting we could pass 'sb' pointer to quotactl_sb() when we
> > already have it. Although to be honest, I'm not sure how Christoph imagines
> > the refactoring of user_get_super() he mentions - when we have a path
> > looked up through user_path(), that pins the superblock the path is on so
> > it cannot be unmounted. So perhaps quotactl_sb() can done like:
> 
> I don't think we need a quotactl_sb at all, do_quotactl is in fact a
> pretty good abstraction as-is.
> 
> For the path based one we just need to factor out a little helper
> to set excl and thaw and then call it like:
> 
> 	sb = path.dentry->d_inode->i_sb;
> 
> 	if (excl)
> 		down_write(&sb->s_umount);
> 	else
> 		down_read(&sb->s_umount);
> 	if (thawed && sb->s_writers.frozen != SB_UNFROZEN)
> 		ret = -EBUSY;
> 	else
> 		ret = do_quotactl(sb, type, cmds, id, addr, &path);
> 	if (excl)
> 		up_write(&sb->s_umount);
> 	else
> 		up_read(&sb->s_umount);
> 
> as there is no good reason to bring over the somewhat strange wait until
> unfrozen semantics to a new syscall.

Well, I don't think that "wait until unfrozen" is that strange e.g. for
Q_SETQUOTA - it behaves like setxattr() or any other filesystem
modification operation. And IMO it is desirable that filesystem freezing is
transparent for operations like these. For stuff like Q_QUOTAON, I agree
that returning EBUSY makes sense but then I'm not convinced it's really
simpler or more useful behavior...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
