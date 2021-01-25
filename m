Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70DAC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 20:45:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8663921D79
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 20:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8663921D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oj7mi9rizOghJ/pvoqHjQtr8bYNHJ5KKGFiNt6VYago=; b=pcrkB+zPq/YZXbD3tirJF8uGx
	tTVA1PieSyVAc1Ei2UUkD6DjhKmfObA4EfoLp/UL6B3NWQqTxHJi7PMO8XRjkgYLfKFLqkU3iv3V9
	Aq3Pzr31XhTkQFmc1luvYZsvkBv0MJsCDZ2D+t9L1uJ5+KKxf45p75FDyv2/l9ots12I1mZIzRWVP
	n+v7JZumKZ5Rv/4y+fiFEAroYDsY9n3V7EkgNBjenIqicL1fbyKaNE6ZZ827gDi9iLNmMnOMKG1qS
	Ke+KP6rEqEyz82TNjtk7F4fva/jh8hUQmU2rv0rc4MqHEvQTLbM5pV5jCJ4Gx7OddjT3eArj7RTG4
	zCdQKvSDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l48i9-0004lo-Bf; Mon, 25 Jan 2021 20:43:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l48i3-0004lc-8h
 for linux-mtd@merlin.infradead.org; Mon, 25 Jan 2021 20:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=50rdGGRcUaSkPpis7lUfu3LrVnBfoRkaHShYQAQljW4=; b=rNyfrzJJFlsslQGGX976kUrj14
 qY5AVfDFICTZjzTsCoZ+4TO735fTLbAkzmOdCHo/KD2vt65u/osgVXyZ0DOOGv4mkGv9xyHfQXx8j
 PTgGQ3jlJPKhk4cNtju5TmP4PVpeEKNjEJeyRH1WD9hQC/AKp8y9BgH1uUorzbFRGiMwGrWaycJI/
 q5Hr/5PcoHLYfc2na36Wo3deya2bFao1a3cOU+F3fvgzlu1fAddpTT+JYJjqXkzcnlcYpZ3UQL2vw
 CjbPG9gIMd9yhih2uo16nLMCI9lrX1hRDG+akVoxmLE5q9QUnYK9uABcW0QyurnmFX4n4poy6L//a
 W15JiESg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l48hF-004ddP-FH; Mon, 25 Jan 2021 20:42:54 +0000
Date: Mon, 25 Jan 2021 20:42:49 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210125204249.GA1103662@infradead.org>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
 <20210122171658.GA237653@infradead.org>
 <20210125083854.GB31738@pengutronix.de>
 <20210125154507.GH1175@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125154507.GH1175@quack2.suse.cz>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 04:45:07PM +0100, Jan Kara wrote:
> > What do you mean by "take"? Take the superblock as an argument to
> > quotactl_sb() or take a reference to the superblock?
> > Sorry, I don't really get where you aiming at.
> 
> I think Christoph was pointing at the fact it is suboptimal to search for
> superblock by device number when you already have a pointer to it.  And I
> guess he was suggesting we could pass 'sb' pointer to quotactl_sb() when we
> already have it. Although to be honest, I'm not sure how Christoph imagines
> the refactoring of user_get_super() he mentions - when we have a path
> looked up through user_path(), that pins the superblock the path is on so
> it cannot be unmounted. So perhaps quotactl_sb() can done like:

I don't think we need a quotactl_sb at all, do_quotactl is in fact a
pretty good abstraction as-is.

For the path based one we just need to factor out a little helper
to set excl and thaw and then call it like:

	sb = path.dentry->d_inode->i_sb;

	if (excl)
		down_write(&sb->s_umount);
	else
		down_read(&sb->s_umount);
	if (thawed && sb->s_writers.frozen != SB_UNFROZEN)
		ret = -EBUSY;
	else
		ret = do_quotactl(sb, type, cmds, id, addr, &path);
	if (excl)
		up_write(&sb->s_umount);
	else
		up_read(&sb->s_umount);

as there is no good reason to bring over the somewhat strange wait until
unfrozen semantics to a new syscall.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
