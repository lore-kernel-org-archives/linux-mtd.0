Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BB2606A883
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 09:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PbX/1Nt2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G0aoPaWB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+BKvipCa6k+Df08hLXL5qZEV6DmT5mKFdUgg4lMWSjQ=; b=PbX/1Nt2KML+TU8QlCewZPEWkp
	z+KXcff6W0ivbEJUu3JRDSmNTbbxuodgNgCtMIHh11v8UXRgclBIgQpti1nR+GXmc8ji1Q/MEFOpm
	+Y03cbVqsK9n/4wlRjvUokKxEcWe/XBJh50DNcJOgOnomfPMCDMutaLQUCFHGGzhFw8VFSG0A/pNN
	t+oBVPtievEU40Iijp2FS24KCDe+1oqswGdIN8CU1PB+702JhiPx2iOSgulrO0ixfjbyiIggs1wRG
	fX9cvBJF4FVVmRgioconrUkaQlPguN+h6BbHtPCXg90eqLaTQJEH0p7CD5QEeECELpv7DHBrn99Uo
	lXkXw37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnjy-0000000CEoE-3OMz;
	Fri, 13 Nov 2026 09:38:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnjw-0000000CEnl-0gaX
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 09:38:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DFA4463C8;
	Fri, 13 Nov 2026 09:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F321F000C4;
	Fri, 13 Nov 2026 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794562715;
	bh=cyYiEXj4r2TdfxUYkpb5oOHA+dMqnC/KnZCWbHMkenQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G0aoPaWBd72jNdaUejL1FLrAnRK3dBg7nKImNWeUFNW4z4PCgCfYTdQz1fkRwVHmb
	 KMUT4o1pv98YTq4+sOb0DRnY5NA9AhSY9muPozYtlPKP7GITGIWVyqxlT2Lbe4gDgh
	 DUKeiVG6uBVTl5/xgukvDHNaOL5j36fa2FQ4TKuu/sqZvneH+k7Y9Kkvsr58uzYShF
	 m6liZNx7Yn9oUKVS6OG22zQht8IfiDOTOY2ocG2nLZ33OCWigHMStPuFGS8jRrcEDg
	 HPmsR3svBeIaC1O1WZTEBFOuB731AaPpyqUmnt9jeKGaFcyRTBKxm1yOv1bk0r5wv1
	 n093Q7JztiiYw==
Date: Fri, 13 Nov 2026 10:38:28 +0100
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-mm@kvack.org, ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	Karl Mehltretter <kmehltretter@gmail.com>, Dave Kleikamp <shaggy@kernel.org>
Subject: Re: [PATCH v2 04/34] ext2: don't set SB_RDONLY after filesystem
 errors
Message-ID: <20261113-hermachen-qualvoll-porzellan-adc585bf14d1@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-4-2f44f64f0b66@kernel.org>
 <5qefa4mracb3x2z4vsdejmkyyfrhdcrixmmnooz4rzwcdfoejm@mqkvixj6afwp>
 <20261110-kargheit-impfen-pausieren-881763d28b19@brauner>
 <za33axmgzmuzsj3zmfeh43fkphtcsqtkhhrauwuvs7aiftelgp@dzl6z322st5f>
 <20261112-wohncontainer-saurier-wonnen-91f30c3b3ae2@brauner>
 <20261112-besorgen-nobel-handschuhe-fb3373259b5f@brauner>
 <20261112-aktivieren-datteln-assimilieren-062b8257ed49@brauner>
 <7rm43pfkasky5th4fs65qdt4l2d6j3togha56idrqhs4524qca@u7socb57rg3v>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7rm43pfkasky5th4fs65qdt4l2d6j3togha56idrqhs4524qca@u7socb57rg3v>
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

On Thu, Nov 12, 2026 at 07:27:45PM +0100, Jan Kara wrote:
> On Thu 12-11-26 18:03:55, Christian Brauner wrote:
> > Ok, so if I understood you correctly the changes below should be
> > implementing what you ask, @Jan.
> > 
> > It's a diff against v2:
> > 
> > - jfs: free the anonymous tlocks when evicting an inode the way
> >   txUnlock() does. That's also a mainline fix.
> > 
> > - fs: sync_filesystem() and sync(2) skip a superblock in the emergency
> >   state. syncfs(2) and Q_SYNC return EROFS.
> > 
> > - fs: refuse to freeze a superblock in the emergency state. Otherwise
> >   freeze doesn't sync anything anymore and the flusher keeps writing to
> >   the frozen filesystem.
> > 
> >   That means, FIFREEZE and dm suspend with lockfs now fail with EROFS on
> >   an errored ext2, fat etc. I think you said that you expect freeze to
> >   fail anyway. I think that's right.
> > 
> >   The exfat, ntfs, btrfs and ext4 shutdown ioctls then have to skip the
> >   freeze after an error.
> > 
> > - ext2, fat, affs, ufs and hfs: drop the ->write_inode() refusals.
> >   Otherwise the flusher writes data and bitmaps but never the inodes.
> > 
> > - ext2, jfs, nilfs2, ocfs2 and ubifs: their ->sync_fs() checks are dead
> >   now and go.
> > 
> > - ubifs: drop dirty folios and inodes after an error. Without the sync
> >   at remount the flusher otherwise hits ubifs' asserts after a remount
> >   to read-only.
> > 
> > With that nothing is synced on request after an error anymore.
> > 
> > syncfs, fsync and Q_SYNC return EROFS without writing anything and
> > sync(2) and umount skip the filesystem's own sync.
> > 
> > The flusher and the block device flushes in sync(2) and
> > kill_block_super() still write. So what ends up on disk is the same as
> > on mainline today:
> > 
> > Is that what you had in mind?
> 
> Wow, that was quick! Indeed this looks like what I had in mind and I like
> the result. Thanks for implementing it so quickly.

No problem. We're paying off technical debt, big time... So I my motto
is "let's go", so we can focus on the fun things again.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
