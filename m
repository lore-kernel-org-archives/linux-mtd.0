Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DA6CE79CE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6U6r4BrZVORfz4VV2eIZrL3JWITljBc4QD8POsWXnI=; b=gDXiupB93N55ky
	9V/+PYmb61x/LjsPRz75QcP2jpY1IBLTUAq/CNAVo6qK4vrcNj+QRz1i++XZ31pyYcXJm3UGCAoyP
	Qz+kbPSvOQmfcj6hc0Qr1HgYBrMUTGd06BHqi0uASCktLrYvE6JBEzMcefk3cL0H9dJpVxT7zo1QO
	6MWNAxcY0giBkdq6s+UNaF7HUuUp26//lR8rVvf1sbxAPkMMz8V+emS3saEu0Onk5Pr3qIqFqLh/1
	Dj0i2TiVPnZVknv0GCDpX0jbT8z5QMbct5bEW7RAXrOUyg2LGyqlS2qIfV5vt0qc15aFhQnSL7lCY
	LHWVRfsaIT6hCrwSfxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwrt-0037em-1Y;
	Wed, 20 Sep 2023 13:03:49 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwrq-0037e2-23;
	Wed, 20 Sep 2023 13:03:48 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C3BF21BE3;
	Wed, 20 Sep 2023 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1695215024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3YH4aY4cbPoScM3IUucMKFT40epHCwOjmoTvaSKlk4Y=;
	b=otKGaXz2/XrzfZupt6ktvrQuKInIDzegtQmfaPoLxY4VnNRmhq8GHrCWQI+1osXbmJXzc8
	hsqSIqgaDK56ti5FatEpfKHR+a56lMxOto1VcAq5D4tteZwrApJ+/tkTZloeNfEYZLFbM/
	mYxTcP/RIUrXsopZPm765X2swd+GJzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1695215024;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3YH4aY4cbPoScM3IUucMKFT40epHCwOjmoTvaSKlk4Y=;
	b=l1S9AoaClTRNwFpmRqvsn+Gd9YnYp+Fj4zpQGbOPeBxV22YGtYbvWxhVageo026HMgq9Vl
	V59SyZSRECSeZaCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64873132C7;
	Wed, 20 Sep 2023 13:03:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Sqx7GLDtCmX3bwAAMHmgww
	(envelope-from <jack@suse.cz>); Wed, 20 Sep 2023 13:03:44 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id F3DF5A077D; Wed, 20 Sep 2023 15:03:43 +0200 (CEST)
Date: Wed, 20 Sep 2023 15:03:43 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>,
	Bruno Haible <bruno@clisp.org>,
	Xi Ruoyao <xry111@linuxfromscratch.org>, bug-gnulib@gnu.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
	Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bo b Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amir Goldstein <l@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>,
	Benjamin Coddington <bcodding@redhat.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	v9fs@lists.linux.dev, linux-afs@lists.infradead.org,
	linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
	codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v7 12/13] ext4: switch to multigrain timestamps
Message-ID: <20230920130343.qs2kuzngoomy4s3r@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
 <20230920-kaulquappen-computer-0a4a0e4c3c71@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920-kaulquappen-computer-0a4a0e4c3c71@brauner>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_060346_827549_8717A149 
X-CRM114-Status: GOOD (  51.93  )
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

On Wed 20-09-23 12:30:52, Christian Brauner wrote:
> On Wed, Sep 20, 2023 at 12:17:31PM +0200, Jan Kara wrote:
> > On Wed 20-09-23 10:41:30, Christian Brauner wrote:
> > > > > f1 was last written to *after* f2 was last written to. If the timestamp of f1
> > > > > is then lower than the timestamp of f2, timestamps are fundamentally broken.
> > > > > 
> > > > > Many things in user-space depend on timestamps, such as build system
> > > > > centered around 'make', but also 'find ... -newer ...'.
> > > > > 
> > > > 
> > > > 
> > > > What does breakage with make look like in this situation? The "fuzz"
> > > > here is going to be on the order of a jiffy. The typical case for make
> > > > timestamp comparisons is comparing source files vs. a build target. If
> > > > those are being written nearly simultaneously, then that could be an
> > > > issue, but is that a typical behavior? It seems like it would be hard to
> > > > rely on that anyway, esp. given filesystems like NFS that can do lazy
> > > > writeback.
> > > > 
> > > > One of the operating principles with this series is that timestamps can
> > > > be of varying granularity between different files. Note that Linux
> > > > already violates this assumption when you're working across filesystems
> > > > of different types.
> > > > 
> > > > As to potential fixes if this is a real problem:
> > > > 
> > > > I don't really want to put this behind a mount or mkfs option (a'la
> > > > relatime, etc.), but that is one possibility.
> > > > 
> > > > I wonder if it would be feasible to just advance the coarse-grained
> > > > current_time whenever we end up updating a ctime with a fine-grained
> > > > timestamp? It might produce some inode write amplification. Files that
> > > 
> > > Less than ideal imho.
> > > 
> > > If this risks breaking existing workloads by enabling it unconditionally
> > > and there isn't a clear way to detect and handle these situations
> > > without risk of regression then we should move this behind a mount
> > > option.
> > > 
> > > So how about the following:
> > > 
> > > From cb14add421967f6e374eb77c36cc4a0526b10d17 Mon Sep 17 00:00:00 2001
> > > From: Christian Brauner <brauner@kernel.org>
> > > Date: Wed, 20 Sep 2023 10:00:08 +0200
> > > Subject: [PATCH] vfs: move multi-grain timestamps behind a mount option
> > > 
> > > While we initially thought we can do this unconditionally it turns out
> > > that this might break existing workloads that rely on timestamps in very
> > > specific ways and we always knew this was a possibility. Move
> > > multi-grain timestamps behind a vfs mount option.
> > > 
> > > Signed-off-by: Christian Brauner <brauner@kernel.org>
> > 
> > Surely this is a safe choice as it moves the responsibility to the sysadmin
> > and the cases where finegrained timestamps are required. But I kind of
> > wonder how is the sysadmin going to decide whether mgtime is safe for his
> > system or not? Because the possible breakage needn't be obvious at the
> > first sight... If I were a sysadmin, I'd rather opt for something like
> 
> I think you'll basically enable this because you want to export a
> filesystem via NFS.

OK, that's what I thought but then you have to make a tough choice between:

1) Possibly inconsistent NFS caches on frequent changes.
2) Possibly broken builds on NFS.

Pick your poison ;)

> > finegrained timestamps + lazytime (if I needed the finegrained timestamps
> > functionality). That should avoid the IO overhead of finegrained timestamps
> 
> That would work with this patch, no? Or are you saying it would need
> something else?

Sorry, I was not really precise here. What I meant was that instead of
having multigrain timestamps, I (as a sysadmin) would want the filesystem
to set sb->s_time_gran to 1 ns and use lazytime to remove the IO overhead
of the frequent timestamp updates. But that is just me brainstorming
possible solutions of the original NFS problem.

> > as well and I'd know I can have problems with timestamps only after a
> > system crash.
> > 
> > I've just got another idea how we could solve the problem: Couldn't we
> > always just report coarsegrained timestamp to userspace and provide access
> > to finegrained value only to NFS which should know what it's doing?
> 
> What would changes would be involved for that?

See my other email. It should be fairly small...

> If this is invasive work and we decide this is something that we want to
> do then we should remove FS_MGTIME from btrfs, xfs, ext4, and tmpfs for
> v6.6.

.. but let's see what Jeff thinks. I can miss some problem with the
solution.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
