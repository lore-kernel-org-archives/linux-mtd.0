Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905ECC282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 15:47:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 613D421855
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 15:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HDHZQTcq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 613D421855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAsrVgMiRTf0qIpDJMlQvYgQMLIUnWbypv53W6Ij6qs=; b=HDHZQTcqediskr
	Mkw7t1ccjxfnKA9asBhoEJndnDwMB7igYIqFDDZ1PJbABPZhcXiuVOFJZPd/un1OjK4s+oTpCKgkl
	eNy2vHTyb81/yjvzt4Fy4pq3vljIltOm8eUvEFbJen5cHL9KW1I/LbO8bG0Iedk6VgplGtHpBlgDE
	Es20w+zVZD33IuOMIPEL4ZTrL69wi2AZURNqkXYNzRkSPLj7EPrcdqzsrGXZfwuWTS4Le5/od4Ahv
	wHb/qWLuwMfajcwAoGlPc62CvSnPq0wClbHMogF+VwexVIH3wVHG8tPE8t465Oq7RSGWA0BmM7im9
	092QwdM/BS72S9xLsrdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmKkp-0003Gz-Jy; Wed, 23 Jan 2019 15:47:51 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmKkk-0003Fz-Nn
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 15:47:49 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B6902B083;
 Wed, 23 Jan 2019 15:47:43 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 3593A1E3FF5; Wed, 23 Jan 2019 16:47:43 +0100 (CET)
Date: Wed, 23 Jan 2019 16:47:43 +0100
From: Jan Kara <jack@suse.cz>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: UBIFS quota support
Message-ID: <20190123154743.GL13149@quack2.suse.cz>
References: <20190110114448.vcx6w76ibmxwvlh3@pengutronix.de>
 <CAFLxGvyrNaq6ya9TNr-tdEEbV=qsi8qEko6R7oJ-DtkxPJMk0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvyrNaq6ya9TNr-tdEEbV=qsi8qEko6R7oJ-DtkxPJMk0g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_074747_068350_89BE4F4C 
X-CRM114-Status: GOOD (  26.58  )
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
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Jan Kara <jack@suse.cz>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

sorry for not getting to you earlier, this email got burried in my inbox...

On Wed 23-01-19 00:07:12, Richard Weinberger wrote:
> On Thu, Jan 10, 2019 at 12:45 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > I'm currently working on resurrecting the UBIFS quota patches posted back in
> > 2015 by Dongsheng Yang, last posted here:
> >
> > http://lists.infradead.org/pipermail/linux-mtd/2015-September/061812.html
> >
> > First of all I think work stopped there, there is no newer UBIFS quota
> > support I am missing, right?
> >
> > One problem with this series was that the quotactl systemcall expects a
> > path to a block device. UBIFS doesn't work on a block device but on a
> > character device instead.
> > The solution in this series was to pass the path to the cdev in
> > quotactl.  A struct cdev * member was added to struct super_block which
> > was used to identify the superblock for a given cdev. This approach was
> > rejected by Christoph ("I don't think the cdev has any business in core
> > VFS code.").  Apart from that UBIFS can not only be mounted with a path
> > to the character device (mount -t ubifs /dev/ubix_y /mnt) but also in
> > the form ubix:volname (mount -t ubifs ubix:volname /mnt) in which case
> > userspace doesn't have any valid path it could pass in quotactl.
> >
> > An idea out of this would be to allow to pass the mountpoint instead of
> > the path to the block device in quotactl which would work with nfs or
> > even tmpfs aswell. Would that be acceptable? Any other ideas?

So after some thought, yes, I think that passing mount point as a specifier
identifying a block device will be OK.

> *kind ping*
> 
> Jan, another thing Sascha and I are not sure about, what are the
> consistency constraints of the quota file?
> If I read the code correctly, quota just writes to the quota file and
> assumes that the file system makes sure about consistency. Either by fsck
> fixing the quota file or having a data journal for the quota file.

Essentially yes but it depends on how exactly you decide to implement quota
files. First let me explain to you some details about how quota subsystem
works.

When quota structure (struct dquot) for some user gets
first attached to some inode we call ->acquire_dquot callback from
dquot_operations. This is responsible for allocating necessary disk space
for the structure (if not already allocated) and otherwise making sure that
the quota information can be easily stored later. Also it should fill in
current quota information if the structure for given ID already exists.

Similarly when the last reference to dquot is dropped ->release_dquot
callback is called.

When update to quota information happens, the core will call ->mark_dirty
callback. Then there are other callbacks but those are not that important
and we can figure them out later.

Essentially you have two sensible options:

1) Follow the path of ext4, ocfs2, and similar and use the format of quota
files handled by the generic code.

2) Define your own quota file format.

In the first case, we use ->mark_dirty callback to trigger update of the
quota file. This happens by ext4_mark_dquot_dirty() calling
ext4_write_dquot() calling dquot_commit() which updates corresponding block
in quota file by calling ->quota_write() callback - ext4_quota_write() then
takes care of attaching this update to the running transaction. As Sasha
has noted, we use the fact that we have a transaction running stored in
current->journal_info so this update to quota file just gets added to the
running transaction. So you will have to somehow replicate this
functionality in ubifs so that this update of quota file happens atomically
(wrt power failure) together with the block allocation.

In the second case you are somewhat more free in your options (but also
have to implement more code). E.g. OCFS2 uses this option. In this case you
get ->mark_dirty callback (essentially happening as a result of
dquot_alloc_space() or similar calls) and it is up to you associate new
quota information with appropriate metadata change.

> In case of UBIFS where we have a data journal this should be doable.
> Is it okay when the quota file has S_SYNC set?

Well, quota code does not care about S_SYNC flag. So yes, you can set it
but the behavior of core quota code will not change in any way.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
