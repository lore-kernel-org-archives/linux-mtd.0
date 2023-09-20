Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26D3CE79CF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2/5z/msEZZaw6QfgKiVn8pZzOla98uDrlcA4EaKqXA=; b=uEBA5dMgSZ2PeU
	fPnjGFAT63YlKoNtHlh9DRwP6OZkzOQa/QV3+ID7+BkngY/tYbUXUThJbWvOT6cN32jZ6Y7Zycio0
	d5SBvvqokuQYFHqHiXYyong/8OWVbcPhFyXpztHdbboA00Tl1f8Zr5AjNYTOUEOuKQZupvjMbeE7o
	fmQ7xopVSX6d5aSgtbfE9xnN1yOlxVhNCyxwbrW2/brIB6M1kiLM2AdrsfhFShNo9qB1xynmczJq7
	ampuFqZE20AUTV5Dom8udRX5YBz5AtgAWNKUHQW245pUFixIw1XEZaPCtnkvNJoKQZpe+CPODNmy+
	rDPVanGuMjhWzEpAFMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qivhw-002v48-09;
	Wed, 20 Sep 2023 11:49:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qivhs-002v17-1n;
	Wed, 20 Sep 2023 11:49:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 96616B81CD5;
	Wed, 20 Sep 2023 11:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6370EC433C9;
	Wed, 20 Sep 2023 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695210559;
	bh=TqtjWOcEef/+khFbYtdnIshKRIs8+bywMfiG/cwmuh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cFYKmaGXziAaFdOhpy49kuzCT+oXmuuyMlKdt5avbqCKSL/Zu7OVEs3mlm7M/sHyA
	 0HvJ8d7afp2KnwqnvPT80LQhjFnRks3F/YsDrfT7vnnepp6+WGA4Zh/TgQaMx3vzG/
	 FSdjSYHz15F17uBZuvgclX0e0Uzn2y3zr2N4KuAbC7L4TSP8nzppTP6PGz7ksuIBn6
	 D7F8fYpVmjnW0KAu5zZZbDeVJBeiDbOkUDLtjQKowBnwbvuuMN7P3da3QHW8y+AF7o
	 0GQW+1Wqk+Kq+clrWKVSkVIemiMGsEV0NqdTi+gPzRLCsKCVTIw/LoOQ2OmEp/Yh2H
	 Okefwq3+K1QiA==
Date: Wed, 20 Sep 2023 13:48:59 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Bruno Haible <bruno@clisp.org>,
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
Message-ID: <20230920-raser-teehaus-029cafd5a6e4@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
 <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_044924_865264_E35C6D13 
X-CRM114-Status: GOOD (  29.01  )
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

> > > While we initially thought we can do this unconditionally it turns out
> > > that this might break existing workloads that rely on timestamps in very
> > > specific ways and we always knew this was a possibility. Move
> > > multi-grain timestamps behind a vfs mount option.
> > 
> > Surely this is a safe choice as it moves the responsibility to the sysadmin
> > and the cases where finegrained timestamps are required. But I kind of
> > wonder how is the sysadmin going to decide whether mgtime is safe for his
> > system or not? Because the possible breakage needn't be obvious at the
> > first sight...
> > 
> 
> That's the main reason I really didn't want to go with a mount option.
> Documenting that may be difficult. While there is some pessimism around
> it, I may still take a stab at just advancing the coarse clock whenever
> we fetch a fine-grained timestamp. It'd be nice to remove this option in
> the future if that turns out to be feasible.
> 
> > If I were a sysadmin, I'd rather opt for something like
> > finegrained timestamps + lazytime (if I needed the finegrained timestamps
> > functionality). That should avoid the IO overhead of finegrained timestamps
> > as well and I'd know I can have problems with timestamps only after a
> > system crash.
> 
> > I've just got another idea how we could solve the problem: Couldn't we
> > always just report coarsegrained timestamp to userspace and provide access
> > to finegrained value only to NFS which should know what it's doing?
> > 
> 
> I think that'd be hard. First of all, where would we store the second
> timestamp? We can't just truncate the fine-grained ones to come up with
> a coarse-grained one. It might also be confusing having nfsd and local
> filesystems present different attributes.

As far as I can tell we have two options. The first one is to make this
into a mount option which I really think isn't a big deal and lets us
avoid this whole problem while allowing filesytems exposed via NFS to
make use of this feature for change tracking.

The second option is that we turn off fine-grained finestamps for v6.6
and you get to explore other options.

It isn't a big deal regressions like this were always to be expected but
v6.6 needs to stabilize so anything that requires more significant work
is not an option.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
