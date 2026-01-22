Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4520D3EE84
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 17:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+//ncta6j0hyF/o0NOdjUY0kMigUUXatsJCQx1pwdc=; b=Rtste9JWIEf5X0
	3JwCoax90ACmo0fPUffNMl5isrFwghYWzl+KfKdHbBg8ERqUYMuXc1/G4RQkjr0KotOX73++6kpZd
	e7faYscvfDPpljKhb5UVXDftbsu4JUlHgYQTuIjpburNlLeFALQ898xTuvfJIHawrHpgm0/yaSrFY
	ru7pPsydKqACELtp32FH+/emzjLKN9OvALatuEI/J5o0xhfzxL2qerI0K0l7lyT3CkciXoMm6lfFM
	H7y9zgHJcrxhSvvlXqysqfttaqgsnJSvxpOY0a26vfQ54qW6NV2uaCdAxCLhDo4fWxYgGpYPB9htx
	GHOCJLr/yRjQj5sGX4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy6e-00000007X6K-41jw;
	Thu, 22 Jan 2026 17:04:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy6b-00000007X5o-2EC6
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 17:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 528AE4099B;
	Thu, 22 Jan 2026 17:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156DAC116C6;
	Thu, 22 Jan 2026 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101464;
	bh=xwFz5Oidq8APQpCp7THEtDpXn9O+NGssd7GC7NPkIXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ueyMX6ohlT+V7E4FTnwyr+bckr2XgM0otlsgh+U8+RB7dufNou2jXtRF8/4HiLX1h
	 aiyHG+xAbRXlOpSKYNl+YW1B6es8lJGWyDpCT3G89X8Bn++QSMPHsovt5BRyWj7Z84
	 MiFPflUjkr2UeHtVIt004pQ2LHYESJ6jR9ib6bF3tKB5BvchCfBJcHtl2H7eGV6Hj+
	 XeQh59i2mPbJ0Z07CURTocG8MzgcrhLB0YpqMQ2BX+Q2rUwcSwiRIRCTHIiyBghAen
	 fRki137MnL3p5j+2P7Cc4giyKdLsB0k8xoBASjwbPFk1rE23p0Kg5qRxi8CJQxSLFn
	 VC/vMBqCcUNNQ==
Date: Thu, 22 Jan 2026 09:04:23 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, NeilBrown <neil@brown.name>,
	Christian Brauner <brauner@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Chuck Lever <chuck.lever@oracle.com>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Chunhai Guo <guochunhai@vivo.com>, Carlos Maiolino <cem@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-unionfs@vger.kernel.org,
	devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev,
	ntfs3@lists.linux.dev, linux-nilfs@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net, linux-mtd@lists.infradead.org,
	gfs2@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
Message-ID: <20260122170423.GU5945@frogsfrogsfrogs>
References: <176885553525.16766.291581709413217562@noble.neil.brown.name>
 <aW8w2SRyFnmA2uqk@infradead.org>
 <176890126683.16766.5241619788613840985@noble.neil.brown.name>
 <aXCg-MqXH0E6IuwS@infradead.org>
 <176899164457.16766.16099772451425825775@noble.neil.brown.name>
 <364d2fd98af52a2e2c32ca286decbdc1fe1c80d3.camel@kernel.org>
 <aXDm8FPPOHs04w9m@infradead.org>
 <3210d04fa2c0b1f4312d10506cac30586cb49a3c.camel@kernel.org>
 <aXHFlF1tef68i2HU@infradead.org>
 <b491335d12e976e1ea1c07b9c14164ac69d22aea.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b491335d12e976e1ea1c07b9c14164ac69d22aea.camel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_090425_607013_FB6B3FD7 
X-CRM114-Status: GOOD (  37.18  )
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

On Thu, Jan 22, 2026 at 07:12:36AM -0500, Jeff Layton wrote:
> On Wed, 2026-01-21 at 22:37 -0800, Christoph Hellwig wrote:
> > On Wed, Jan 21, 2026 at 10:18:00AM -0500, Jeff Layton wrote:
> > > > fat seems to be an exception as far as the 'real' file systems go.
> > > > And it did sound to me like some of the synthetic ones had similar
> > > > issues.
> > > > 
> > > 
> > > Not sure what we can do about FAT without changing the filehandle
> > > format in some fashion. The export ops just use
> > > generic_encode_ino32_fh, and FAT doesn't have stable inode numbers.
> > > The "nostale" ops seem sane enough but it looks like they only work
> > > with the fs in r/o mode.
> > 
> > Yeah.  I guess we need to ignore this because of <history>
> > 
> 
> Yep. This is a case where the handles are not PERSISTENT but I don't
> think we can get away with making FAT unexportable. We're probably
> stuck with it.
> 
> > > > I think Amirs patch would take care of that.  Although userland nfs
> > > > servers or other storage applications using the handle syscalls would
> > > > still see them.  Then again fixing the problem that some handles
> > > > did not fulfill the long standing (but not documented well enough)
> > > > semantics probably is a good fix on it's own.
> > > 
> > > Agreed. We should try to ensure uniqueness and persistence in all
> > > filehandles both for nfsd and userland applications.
> > 
> > Sounds good to me.
> 
> 
> Unfortunately, there are already exceptions. Apparently pidfs and
> cgroupfs handles (at least) can't be extended because of userspace
> expectations:
> 
> https://lore.kernel.org/linux-nfs/20260120-irrelevant-zeilen-b3c40a8e6c30@brauner/

systemd cracking file handles??  Yeesh, I thought userspace was supposed
to treat a file handle as an opaque N-byte blob and nothing more, and
only certain "special" tools (e.g. xfsprogs on XFS) could do more than
that.

--D

> My personal take is that we should try to make handle uniqueness a goal
> for most existing filesystems, but we're going to have some that can't
> achieve that. For them we probably want to be able to flag them so they
> can be id'ed by userland.
> 
> So, we will need an export_operations flag of some sort
> (EXPORT_OP_UNIQUE_HANDLES?). At that point, we'll have to decide
> whether to deny nfsd export based on that flag:
> 
> We could deny export of any fs that doesn't set the flag, but NFSv4
> actually allows the server to advertise that it can't guarantee handle
> uniqueness. There isn't much guidance for the client on how to handle
> that though and the attribute seems to have the scope of the entire NFS
> server.
> 
> -- 
> Jeff Layton <jlayton@kernel.org>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
