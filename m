Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D54C001DE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 19:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOEe9s+uJgZJMKUjurh9Sj4ren4a2drEOxGH/Y+OYYo=; b=CnbjZvGxT4LuPa
	RlbsC1rvvxfdraB/BLnoByTiW37xMS8cT4a3/Ummg6wxW76LmKe7gsD1l3UWpCtiG63T75GSJx2l/
	O5ZVrJdlrOHdvAR3l3POWFqh5uBTnfGrJ/f/h2rVVZnN5hv2DlKYsy1xyAIbmKP6eBb6ce/p5EcQj
	eSj+vOU8y5fjxJQNX5hty4Xo0bhhBlUyUo4FwXG8nwQkODytzft7ded7kkfxgbBlq/TKfaTp9N+vP
	mk+ILBhmppfEGmDJ5TFIyvHVlJAjmfXJFuc+3aKogVac/u+X72Jc2iM29MS1lqauumdlocM8frV90
	udW6x7NUqvND8A2bIKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qToUI-005g1p-36;
	Wed, 09 Aug 2023 19:04:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qToUF-005g0G-1Z;
	Wed, 09 Aug 2023 19:04:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C947D644DE;
	Wed,  9 Aug 2023 19:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB107C433C7;
	Wed,  9 Aug 2023 19:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691607890;
	bh=alXrKPD5fHXeJn9UjHKim4LKQU7HoozYjQglaZ1xXaI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AneNvnqJ20CJmKiEgeASfLx4NSIFXV4j2vtzAKGnX32iLsSf9A43S7wAfHVHbYQQP
	 h3ON9dJJ2d4zasDcG0OHa5a1AfenYnO+uoesgXhOt+soOjJtmmxlhUNc5QuXKGuVOg
	 rulv+awus9qyVEIGRttUpq9Lcin2kAZfB093o2LczBjmWrzPbu4HcAMNS3Ib4zj45p
	 3u7x0mQLZuZR6+lN5gsi60S8IiOPzBT4vt1n3+KsBq67CA1z2KjKobM8vv+qdWmPsN
	 ddnXMIFOGmdQH1E3uRbvXBai78DI/EAYz+8n3M9qwxNTsQtwGjIcAPpzsM/ELjqang
	 5ERP9Tcme3DHA==
Message-ID: <edf8e8ca3b38e56f30e0d24ac7293f848ffee371.camel@kernel.org>
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
Date: Wed, 09 Aug 2023 15:04:42 -0400
In-Reply-To: <87h6p86p9z.fsf@mail.parknet.co.jp>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
	 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
	 <87msz08vc7.fsf@mail.parknet.co.jp>
	 <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
	 <878rak8hia.fsf@mail.parknet.co.jp>
	 <20230809150041.452w7gucjmvjnvbg@quack3>
	 <87v8do6y8q.fsf@mail.parknet.co.jp>
	 <2cb998ff14ace352a9dd553e82cfa0aa92ec09ce.camel@kernel.org>
	 <87leek6rh1.fsf@mail.parknet.co.jp>
	 <ccffe6ca3397c8374352b002fe01d55b09d84ef4.camel@kernel.org>
	 <87h6p86p9z.fsf@mail.parknet.co.jp>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_120451_629607_770294FC 
X-CRM114-Status: GOOD (  25.29  )
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

On Thu, 2023-08-10 at 03:31 +0900, OGAWA Hirofumi wrote:
> Jeff Layton <jlayton@kernel.org> writes:
> 
> > On Thu, 2023-08-10 at 02:44 +0900, OGAWA Hirofumi wrote:
> > > Jeff Layton <jlayton@kernel.org> writes:
> > > 
> > That would be wrong. The problem is that we're changing how update_time
> > works:
> > 
> > Previously, update_time was given a timestamp and a set of S_* flags to
> > indicate which fields should be updated. Now, update_time is not given a
> > timestamp. It needs to fetch it itself, but that subtly changes the
> > meaning of the flags field.
> > 
> > It now means "these fields needed to be updated when I last checked".
> > The timestamp and i_version may now be different from when the flags
> > field was set. This means that if any of S_CTIME/S_MTIME/S_VERSION were
> > set that we need to attempt to update all 3 of them. They may now be
> > different from the timestamp or version that we ultimately end up with.
> > 
> > The above may look to you like it would always cause I_DIRTY_SYNC to be
> > set on any ctime or mtime update, but inode_maybe_inc_iversion only
> > returns true if it actually updated i_version, and it only does that if
> > someone issued a ->getattr against the file since the last time it was
> > updated.
> > 
> > So, this shouldn't generate any more DIRTY_SYNC updates than it did
> > before.
> 
> Again, if you claim so, why generic_update_time() doesn't work same? Why
> only FAT does?
> 
> Or I'm misreading generic_update_time() patch?
> 

When you say it "doesn't work the same", what do you mean, specifically?
I had to make some allowances for the fact that FAT is substantially
different in its timestamp handling, and I tried to preserve existing
behavior as best I could.

-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
