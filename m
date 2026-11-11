Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE4C606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P6ut1Aki;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnAJOnka
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oKcYyDYh1jL6VcidcL3A620TuyUqdTHGty3StUg7nXU=; b=P6ut1AkiC532Ap3N3ed4k+Cnhx
	d7It3yFNA0xWdIad0GfkQZ5xjeAshdHIdRf1HU0u+FlQXzDqVwRSJRUFN6oJn21Ci7u5IQ5ihGAe8
	aXhoO2+fnQF18k/ulBr+nCOI7BczGw+57/HQD80joCgf2aF0Bx0okgHJdmDjDY6zUNj8/WjCTrzn9
	A6ES14QbBqJPVh00GFZPKpX1a2dlC3xsTruvqmF7SM6yr7I/h0vCeGxbsseUg4qXn+VhBDR59TzOs
	NVsz4E3grrg4+ulRKIdeP8Y3fr2cDRafVt5eMaU8aeP3y/ID+sl6cyfGc4MF5ULEdqmvpFygC+l3p
	7mDQRqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4kt-00000006CwO-1eEc;
	Wed, 11 Nov 2026 09:36:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4ks-00000006CwH-0Ezj
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 09:36:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EB19608FB;
	Wed, 11 Nov 2026 09:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851D61F00A05;
	Wed, 11 Nov 2026 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389793;
	bh=LJNb3lZ6t5sFOGVn3CCAi04LzEeZdHbIsSE+XUn+En8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hnAJOnkaTiUIgD29xN8uy/N56NBdY8A0ox3+/FrL5khLxHOW6B2l8W6nLGQl0PrYn
	 YRIvPTe6YF/F3tDZ1iLBZGjGcQRZYlJw5bXJPcMcr4qQhGB4HxcWH9xifBMAN/DXpi
	 QWygDMgiN3z6tAu8U0RscVHXhqpoNah8jj1ZzNOEaeU23RuYUbjC936+XyAQaUulCP
	 ZSxB3xwlGnJ8DdjO6p2DUu/+Hkvccj4/VCaDe1sJf8V2z8QoHYGPeGCbdY4UVTKsk7
	 roysdqQ5a7H/LXUQtnyn7UPieCP10CHPFcxaoYQl/wQsVAGM/0iByy97QqdujK4SQx
	 NdUm0GDBliRRg==
Date: Wed, 11 Nov 2026 10:36:26 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2 26/34] gfs2: don't set SB_RDONLY on withdraw
Message-ID: <20261111-sangen-klagen-klonen-331f995b9cdc@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-26-2f44f64f0b66@kernel.org>
 <sashiko-outbox-191245@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-191245@kernel.org>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 04:10:10PM +0000, sashiko-bot@kernel.org wrote:
> which submits writes for those dirty resource group buffers to the block
> device without reaching gfs2_write_inode(). Should gfs2_aspace_writepages()
> also check gfs2_withdrawn(sdp)?

No. sd_inode comes from new_inode() and is never hashed so
__mark_inode_dirty() never puts it on a writeback list.
sync_filesystem() doesn't write it back.

> If a freeze is triggered via freeze_store() in fs/gfs2/sys.c or
> gfs2_freeze_func() in fs/gfs2/super.c (which call VFS freeze_super()
> directly rather than gfs2_freeze_super()), or if a withdraw completes during
> the msleep(1000) retry loop in gfs2_freeze_super() after the initial
> gfs2_withdrawn(sdp) check above, won't freeze_super() succeed on the
> withdrawn filesystem and leave s_writers locked? Should gfs2_freeze_fs()
> check gfs2_withdrawn(sdp) outside the SDF_JOURNAL_LIVE check?

freeze_super() succeeded on a withdrawn filesystem before as well via
the read-only shortcut. Now it takes s_writers and thaw_super()
releases them again because SB_RDONLY doesn't change in between. That's
the point of the patch. A withdraw during the retry loop makes
gfs2_lock_fs_check_clean() fail and the freeze is undone.

> When gfs2_lock_fs_check_clean(sdp) fails in gfs2_freeze_super(), doesn't
> calling gfs2_do_thaw() below re-initialize sdp->sd_freeze_gh while it is
> already queued and holding sdp->sd_freeze_gl in LM_ST_SHARED mode?

Pre-existing.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
