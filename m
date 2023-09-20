Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1007CE79B3
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kY4tFDKErrsvHMeow0wsjtvF1DGpQ7oX+vl33A2qOPE=; b=S6AUkO2U3Vamcz
	47prikJwdwl6cO2BoSMoUXQE2rYmTN0BoLa7hbAhbBONL0N9kDoJb78eX6qCaLwhQUMUB5WXADK8e
	meTYnsfp3qLEqNPF2jrtwA/ma2kNpFcJk7BsqY4rR0MbCllRF8PAKNRl8s8CzDuT435JYd2HGF/vf
	S4+mRWyLHXCRq8wUyuVukKNgMAnCJn2DmwXxb5980tYl8NbYGiw7P1AgqSU3CT3MZC67oi4xjr+n0
	iu5v1B3fW6ySxUAI1Gs0Hye/DaRvUbyLAE3X0y43+xlHgUBGP7z+fwXOSdJKfHc+WUNUja9B9EJiG
	YSHsYUo2XCp/aBcWEnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qityJ-002Woo-29;
	Wed, 20 Sep 2023 09:58:15 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qityH-002WmK-0l;
	Wed, 20 Sep 2023 09:58:14 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3BDE31FEB5;
	Wed, 20 Sep 2023 09:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1695203889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5cx/4/QTnSQH/xoBZtq0Dbb3QvNNJW5HvvEMLfrjPF8=;
	b=BYHC4/FQp0jOPuSZahj4EmBcrB6WqWWyb6bVG4tzLJvtQOD6FLAr0dDhpQkR6V1shi0Mhn
	Wnl16oS1oija7d9fXqGCmLn/ra7ZBIyWecE/f8BKE4QEvWRM8DTlr0qUeJQBIy74OP3jId
	Xr35EzHqpCVb2+JvJzh1fo4PASSm4UY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1695203889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5cx/4/QTnSQH/xoBZtq0Dbb3QvNNJW5HvvEMLfrjPF8=;
	b=Inurd+QUrEWmA0gt+rtqxZtUQzsEAGSeU+EJGHN4fUZvLVNJlZX/VLCNUyqlPc1A4HF+Lq
	dsq7y3KAnJwsQfCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2502313A64;
	Wed, 20 Sep 2023 09:58:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RdgECTHCCmUJCAAAMHmgww
	(envelope-from <jack@suse.cz>); Wed, 20 Sep 2023 09:58:09 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id B20DAA077D; Wed, 20 Sep 2023 11:58:08 +0200 (CEST)
Date: Wed, 20 Sep 2023 11:58:08 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Cc: Bruno Haible <bruno@clisp.org>, Jan Kara <jack@suse.cz>,
	Xi Ruoyao <xry111@linuxfromscratch.org>, bug-gnulib@gnu.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
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
Message-ID: <20230920095808.x2gurkdgbrqoumir@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_025813_416323_B14539B2 
X-CRM114-Status: GOOD (  42.53  )
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

On Tue 19-09-23 12:31:08, Jeff Layton wrote:
> On Tue, 2023-09-19 at 16:52 +0200, Bruno Haible wrote:
> > Jeff Layton wrote:
> > > I'm not sure what we can do for this test. The nap() function is making
> > > an assumption that the timestamp granularity will be constant, and that
> > > isn't necessarily the case now.
> > 
> > This is only of secondary importance, because the scenario by Jan Kara
> > shows a much more fundamental breakage:
> > 
> > > > The ultimate problem is that a sequence like:
> > > > 
> > > > write(f1)
> > > > stat(f2)
> > > > write(f2)
> > > > stat(f2)
> > > > write(f1)
> > > > stat(f1)
> > > > 
> > > > can result in f1 timestamp to be (slightly) lower than the final f2
> > > > timestamp because the second write to f1 didn't bother updating the
> > > > timestamp. That can indeed be a bit confusing to programs if they compare
> > > > timestamps between two files. Jeff?
> > > > 
> > > 
> > > Basically yes.
> > 
> > f1 was last written to *after* f2 was last written to. If the timestamp of f1
> > is then lower than the timestamp of f2, timestamps are fundamentally broken.
> > 
> > Many things in user-space depend on timestamps, such as build system
> > centered around 'make', but also 'find ... -newer ...'.
> > 
> 
> 
> What does breakage with make look like in this situation? The "fuzz"
> here is going to be on the order of a jiffy. The typical case for make
> timestamp comparisons is comparing source files vs. a build target. If
> those are being written nearly simultaneously, then that could be an
> issue, but is that a typical behavior? It seems like it would be hard to
> rely on that anyway, esp. given filesystems like NFS that can do lazy
> writeback.

TL;DR I don't think we can just wave away the change as "the problem has
always been there".

Firstly, the fact that something is not quite reliable on NFS doesn't mean
people don't rely on the behavior on local filesystems. NFS has a
historical reputation of being a bit weird ;). Secondly, I agree that the
same problems can manifest currently for files on two filesystems with
different timestamp granularity. But again that is something that is rare -
widely used filesystems have a granularity of a jiffy and in most cases
build and source files are on the same filesystem anyway. So yes, in
principle the problems could happen even before multigrain timestamps but
having different granularity per inode just made them manifest in much much
more setups and that matters because setups that were perfectly fine before
are not anymore.

> One of the operating principles with this series is that timestamps can
> be of varying granularity between different files. Note that Linux
> already violates this assumption when you're working across filesystems
> of different types.
> 
> As to potential fixes if this is a real problem:

Regarding whether the problem is real: I wouldn't worry too much about the
particular test that started this thread. That seems like something very
special. But the build system issues could be real - as you wrote in your
motivation for the series - a lot can happen in a jiffy on contemporary
computers. I can imagine build product having newer timestamp than build
source because the modification of source managed to squeeze into the same
jiffy and still use a coarse-grained timestamp. Or some other
producer-consumer type of setup... Sure usually there would be enough
stat(2) calls on both sides to force finegrained timestamps on both files
but if there are not in some corner case, debugging the problem is really
tough.

> I don't really want to put this behind a mount or mkfs option (a'la
> relatime, etc.), but that is one possibility.
> 
> I wonder if it would be feasible to just advance the coarse-grained
> current_time whenever we end up updating a ctime with a fine-grained
> timestamp? It might produce some inode write amplification. Files that
> were written within the same jiffy could see more inode transactions
> logged, but that still might not be _too_ awful.

From a first glance I'd guess the performance overhead will be too big for
a busy filesystem to enable this unconditionally. But I could be wrong...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
