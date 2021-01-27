Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D73C433E6
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 16:27:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D7920789
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 16:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1D7920789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lWK/yWP+45UzLHcxxcTZlode09aMoORVs8AL0qvZTtM=; b=cwvUxqnawERJwOCm0Kib+cNwn
	ge8P1DsNYC12ijGhHaQfqWrDqsr0hx5nbr7JcAEne+Jfe6vM9NNiZq3HtPGLwHhSVjd0KFJd0bDqL
	Jwrp4bfUGDR8hKgSALRM6CxehiKVwXMiotGZ5gUqxwiDDcTT1Q/Te36bnnJijgekWd2eqDIYmeNQc
	+ORQ9vj9EhWR6ra2JTJ7+BYvFabQesAusyN1Nh3WbuS/9VlbLyvsO3ZVc8370aDPZBgKqBLv5wzWW
	AwDUI/8yUUU1NprVJ/s2tghy7L7T5++KACX3YbiazobtYJHNEQiVuj6G6v6mQyzhyCqccex2v4K/x
	WxvQwbhwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4ndz-0003Tv-Ge; Wed, 27 Jan 2021 16:26:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4ndx-0003TL-Ea
 for linux-mtd@merlin.infradead.org; Wed, 27 Jan 2021 16:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XeayQu8Z7eVgXskFL8EGTZVPJCUNtquB2mc3XL06JbM=; b=Qw9sgKIECO6GIPDIPG6CIQTiA9
 4fIDaVX2zjwK56xMBXxpb0Zh+vV210bcNgERKA7qc5xiNec8aMhzm2BA922Mkrxh7BdPLHiUD05Vd
 PL0BUHM9SksSjCfj38UwYk5xcrxQOdwsGCaxivj8l0RpP1q3bphG0DeQWGGKCef9xrjDas8PQk1N5
 +XuDEbz5a7AjC2iNcjv4vlXoQL1QMpedmt0NJIyzXCusO/ziVTbWnrmMeOl9/Fhp4h7OntcP7dmNA
 8qnkj6DPLwcJzNjz8XKaYuKGPv73/fGA3ZR43greZSL0KUe+lUuLPxFXPhIzDAkOBNOlLhR/0faSq
 9JiAiw0Q==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l4ndk-007ES0-SR; Wed, 27 Jan 2021 16:25:58 +0000
Date: Wed, 27 Jan 2021 16:25:56 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210127162556.GA1721964@infradead.org>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
 <20210122171658.GA237653@infradead.org>
 <20210125083854.GB31738@pengutronix.de>
 <20210125154507.GH1175@quack2.suse.cz>
 <20210126104557.GB28722@pengutronix.de>
 <20210127144646.GB13717@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127144646.GB13717@quack2.suse.cz>
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
 kernel@pengutronix.de, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 27, 2021 at 03:46:46PM +0100, Jan Kara wrote:
> In a puristic world they'd be 9 different syscalls ... or somewhat less
> because Q_GETNEXTQUOTA is a superset of Q_GETQUOTA, we could drop Q_SYNC
> and Q_GETFMT because they have dubious value these days so we'd be left
> with 6. I don't have a strong opinion whether 6 syscalls are worth the
> cleanliness or whether we should go with just one new quotactl_path()
> syscall. I've CCed linux-api in case other people have opinion.
> 
> Anyway, even if we go with single quotactl_path() syscall we should remove
> the duplication between VFS and XFS quotactls when we are creating a new
> syscall. Thoughts?

I thunk the multiplexer is just fine.  We don't really need Q_SYNC
for a new syscall.  For XFS vs classic VFS quota we probably don't
need to duplicate the two data structure, but we need to make sure we
catch the superset of the information if we want to disable the old
ones.

So I suspect just supporting evrything excpt for the global Q_SYNC
and reusing do_quotactl as-is is the most maintainable and easiest
to understand way forward.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
