Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB7CC41513
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 17:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LjKLj4VLQ35M6qQlCsuXGsiz5XqGjnObFgn4vWNoyg=; b=kuGkyawSVqFt+U
	BqZJlDGdHDN2NWkoThPpT9YRY9O77We7FEWrP6eB/Asf4UuRCdCBrThg4m9cgvNcAZXYkFcqhX9ky
	kkKKevs59agdZlW371U33gKLTFPB1m6uqYHKL4Yb6s+L8EJ6d1S2sEHvYNS+FZJzK6HX8B9jeLXnt
	olpRlEvzYaMR/vG+jtr6ausJHX1zGx9OfNxwWePOEQhKRGrcVm2s3cx7oSXpsljGQEPW+RllqEFGC
	/e7LaMkd1TlTeY/p/r1Ii7SgE7ixfXNJdVzP7lDX9/a9Ji53dEzM5Siqq2PGj/oYHYuuRMxJgpSgc
	vYzP8bQMDGCgWom25NJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTnT7-005Z3t-37;
	Wed, 09 Aug 2023 17:59:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTnT5-005Z2y-1A;
	Wed, 09 Aug 2023 17:59:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A7C864360;
	Wed,  9 Aug 2023 17:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5192AC433C8;
	Wed,  9 Aug 2023 17:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691603973;
	bh=xOe+Vz95v0qUUg0QOdDgphymvgENzflkYZLnMMULJfc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=meGLBjWxluzaOBNuo8p0RmOQwgxUuFNZjvOIrqHLsT0YVm/rgDHwnHDJAx99/2L/o
	 bhtobjoD8C6zGB5rdBPrQ785IrHaS3N4jJtTCfHc34NT0geG1/U9IaQFq3S4WuZ+t8
	 gzoPyUaQOM1ROi1uUYhm2o1c3laLFRiCZK/Lx2Wm4O80TbvA4CQm+kAJim7vyqiQ1H
	 44XIoEDh201mHVX5XJvZmC/E4Ogx1IKt/t/nyvPCcopm66rc52em9DBbgLmnfaxUsA
	 shBRwdOI1wQgTtwpw38zZcoHm5c5hE7yNnsry2zyL7HvpHmwfSKALId/x1hyiXL2cb
	 CwGZoXi1fmKhQ==
Message-ID: <ccffe6ca3397c8374352b002fe01d55b09d84ef4.camel@kernel.org>
Subject: Re: [PATCH v7 05/13] fat: make fat_update_time get its own timestamp
From: Jeff Layton <jlayton@kernel.org>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Eric Van Hensbergen
 <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique
 Martinet <asmadeus@codewreck.org>, Christian Schoenebeck
 <linux_oss@crudebyte.com>, David Howells <dhowells@redhat.com>, Marc Dionne
 <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, Gao
 Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu
 <huyue2@gl0jj8bn.sched.sma.tdnsstic1.cn>, Jeffle Xu
 <jefflexu@linux.alibaba.com>,  Namjae Jeon <linkinjeon@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>,  Theodore
 Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk
 Kim <jaegeuk@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson
 <rpeterso@redhat.com>, Andreas Gruenbacher <agruenba@redhat.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker
 <anna@kernel.org>,  Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook
 <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>,  Steve French
 <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg
 <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Tom
 Talpey <tom@talpey.com>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>,
 Hugh Dickins <hughd@google.com>,  Andrew Morton
 <akpm@linux-foundation.org>, Amir Goldstein <amir73il@gmail.com>, "Darrick
 J. Wong" <djwong@kernel.org>, Benjamin Coddington <bcodding@redhat.com>, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 v9fs@lists.linux.dev, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org,  ceph-devel@vger.kernel.org,
 codalist@telemann.coda.cs.cmu.edu,  ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org,  linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,  cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-unionfs@vger.kernel.org,  linux-xfs@vger.kernel.org
Date: Wed, 09 Aug 2023 13:59:26 -0400
In-Reply-To: <87leek6rh1.fsf@mail.parknet.co.jp>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
	 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
	 <87msz08vc7.fsf@mail.parknet.co.jp>
	 <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
	 <878rak8hia.fsf@mail.parknet.co.jp>
	 <20230809150041.452w7gucjmvjnvbg@quack3>
	 <87v8do6y8q.fsf@mail.parknet.co.jp>
	 <2cb998ff14ace352a9dd553e82cfa0aa92ec09ce.camel@kernel.org>
	 <87leek6rh1.fsf@mail.parknet.co.jp>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_105935_488374_A7CC1FBA 
X-CRM114-Status: GOOD (  31.62  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2023-08-10 at 02:44 +0900, OGAWA Hirofumi wrote:
> Jeff Layton <jlayton@kernel.org> writes:
> 
> > On Thu, 2023-08-10 at 00:17 +0900, OGAWA Hirofumi wrote:
> > > Jan Kara <jack@suse.cz> writes:
> 
> [...]
> 
> > My mistake re: lazytime vs. relatime, but Jan is correct that this
> > shouldn't break anything there.
> 
> Actually breaks ("break" means not corrupt fs, means it breaks lazytime
> optimization). It is just not always, but it should be always for some
> userspaces.
> 
> > The logic in the revised generic_update_time is different because FAT is
> > is a bit strange. fat_update_time does extra truncation on the timestamp
> > that it is handed beyond what timestamp_truncate() does.
> > fat_truncate_time is called in many different places too, so I don't
> > feel comfortable making big changes to how that works.
> > 
> > In the case of generic_update_time, it calls inode_update_timestamps
> > which returns a mask that shows which timestamps got updated. It then
> > marks the dirty_flags appropriately for what was actually changed.
> > 
> > generic_update_time is used across many filesystems so we need to ensure
> > that it's OK to use even when multigrain timestamps are enabled. Those
> > haven't been enabled in FAT though, so I didn't bother, and left it to
> > dirtying the inode in the same way it was before, even though it now
> > fetches its own timestamps from the clock. Given the way that the mtime
> > and ctime are smooshed together in FAT, that seemed reasonable.
> > 
> > Is there a particular case or flag combination you're concerned about
> > here?
> 
> Yes. Because FAT has strange timestamps that different granularity on
> disk . This is why generic time truncation doesn't work for FAT.
> 
> Well anyway, my concern is the only following part. In
> generic_update_time(), S_[CM]TIME are not the cause of I_DIRTY_SYNC if
> lazytime mode.
> 
> -	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
> +	if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && inode_maybe_inc_iversion(inode, false))
> 		dirty_flags |= I_DIRTY_SYNC;
> 

That would be wrong. The problem is that we're changing how update_time
works:

Previously, update_time was given a timestamp and a set of S_* flags to
indicate which fields should be updated. Now, update_time is not given a
timestamp. It needs to fetch it itself, but that subtly changes the
meaning of the flags field.

It now means "these fields needed to be updated when I last checked".
The timestamp and i_version may now be different from when the flags
field was set. This means that if any of S_CTIME/S_MTIME/S_VERSION were
set that we need to attempt to update all 3 of them. They may now be
different from the timestamp or version that we ultimately end up with.

The above may look to you like it would always cause I_DIRTY_SYNC to be
set on any ctime or mtime update, but inode_maybe_inc_iversion only
returns true if it actually updated i_version, and it only does that if
someone issued a ->getattr against the file since the last time it was
updated.

So, this shouldn't generate any more DIRTY_SYNC updates than it did
before.
-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
