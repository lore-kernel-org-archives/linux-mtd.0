Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4CAC001E0
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Aug 2023 17:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ozCryjIPNF8NJYT5MpoJoQo/xsP9LNBtNCQ4+mMToQ=; b=I7mL+JwHPs9dcL
	lKh5beFje0384HOu2Q9TpBDWBDljMpXJ9ZZL1qnvSI/p52Ii7JrugGaOvVr7U2IuEQ/dt2NW+AgPc
	fdzj/+9wIbXPIa+fVX00ZvSkM+s7W73eclWlDj9gMjC7EjhlJ6RDc/QGa0gr1Cs+6vNJ4Nx4cKP9u
	lOC0h5RfxyeSaIWt4Lutn1ZRqNyIGUvD5epSzgq0Ztf4N9P2JHb9QaGxhG9DagY12vMf47kXP9YXQ
	WSY3vgPgL9lX89JX9Sxkm+/ZMpflxyfTrCm1kLVDfsMjug00tihfWsv6I3vKrWypxpwg6Axqo7LWs
	Tovur3H5PgL24M99hj1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFxy-005Zj3-2G;
	Wed, 02 Aug 2023 17:48:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFxw-005ZhX-0T;
	Wed, 02 Aug 2023 17:48:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2B11615A2;
	Wed,  2 Aug 2023 17:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB32C433C7;
	Wed,  2 Aug 2023 17:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690998534;
	bh=llcebvZe/hkTeRKgHM9EKZHOV4OnEZQnmHgz/2BQCWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvxuU6kSe40eik5JXODSzEUcQCom178bEIK/ueyoWRpPBYA045brCsn1TKHc//Xbp
	 0ObmccZq1JK/3BS0VYByWWa5KMlUgDASDUx+Tg3MIvNOAUYxUN5IA3Q6lhJnKpS+Kr
	 sJpmoKfyS9TkkEjB5QiyyKjYqppx1pnxNqB5iMeyjJu+17+GIbmic7cVmXJSuLaPLd
	 3IndlMaTUYFSp0rFtJkAhEAA+wijtIBWkzROVqk80WuAfa/+5o+BWPM09WvvAR3rkz
	 JrCY5Grb5YAFwp2aCPycS4pLSm1cHlwT5kTUQjtvoINT5B7AR/RvqxCMtj/D0aZcEn
	 M8gGWOmNe33KQ==
Date: Wed, 2 Aug 2023 10:48:53 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
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
	Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
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
	Ronnie Sahlberg <lsahlber@redhat.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>,
	Anthony Iliopoulos <ailiop@suse.com>, v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
	codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
	ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	linux-mm@kvack.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v6 5/7] xfs: switch to multigrain timestamps
Message-ID: <20230802174853.GC11352@frogsfrogsfrogs>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-5-a794c2b7abca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725-mgctime-v6-5-a794c2b7abca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_104856_309993_F760AA5E 
X-CRM114-Status: GOOD (  24.04  )
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

On Tue, Jul 25, 2023 at 10:58:18AM -0400, Jeff Layton wrote:
> Enable multigrain timestamps, which should ensure that there is an
> apparent change to the timestamp whenever it has been written after
> being actively observed via getattr.
> 
> Also, anytime the mtime changes, the ctime must also change, and those
> are now the only two options for xfs_trans_ichgtime. Have that function
> unconditionally bump the ctime, and ASSERT that XFS_ICHGTIME_CHG is
> always set.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/xfs/libxfs/xfs_trans_inode.c | 6 +++---
>  fs/xfs/xfs_iops.c               | 4 ++--
>  fs/xfs/xfs_super.c              | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
> index 6b2296ff248a..ad22656376d3 100644
> --- a/fs/xfs/libxfs/xfs_trans_inode.c
> +++ b/fs/xfs/libxfs/xfs_trans_inode.c
> @@ -62,12 +62,12 @@ xfs_trans_ichgtime(
>  	ASSERT(tp);
>  	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
>  
> -	tv = current_time(inode);
> +	/* If the mtime changes, then ctime must also change */
> +	ASSERT(flags & XFS_ICHGTIME_CHG);
>  
> +	tv = inode_set_ctime_current(inode);
>  	if (flags & XFS_ICHGTIME_MOD)
>  		inode->i_mtime = tv;
> -	if (flags & XFS_ICHGTIME_CHG)
> -		inode_set_ctime_to_ts(inode, tv);
>  	if (flags & XFS_ICHGTIME_CREATE)
>  		ip->i_crtime = tv;
>  }
> diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> index 3a9363953ef2..3f89ef5a2820 100644
> --- a/fs/xfs/xfs_iops.c
> +++ b/fs/xfs/xfs_iops.c
> @@ -573,10 +573,10 @@ xfs_vn_getattr(
>  	stat->gid = vfsgid_into_kgid(vfsgid);
>  	stat->ino = ip->i_ino;
>  	stat->atime = inode->i_atime;
> -	stat->mtime = inode->i_mtime;
> -	stat->ctime = inode_get_ctime(inode);
>  	stat->blocks = XFS_FSB_TO_BB(mp, ip->i_nblocks + ip->i_delayed_blks);
>  
> +	fill_mg_cmtime(request_mask, inode, stat);

Huh.  I would've thought @stat would come first since that's what we're
acting upon, but ... eh. :)

If everyone else is ok with the fill_mg_cmtime signature,
Acked-by: Darrick J. Wong <djwong@kernel.org>

--D

> +
>  	if (xfs_has_v3inodes(mp)) {
>  		if (request_mask & STATX_BTIME) {
>  			stat->result_mask |= STATX_BTIME;
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 818510243130..4b10edb2c972 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -2009,7 +2009,7 @@ static struct file_system_type xfs_fs_type = {
>  	.init_fs_context	= xfs_init_fs_context,
>  	.parameters		= xfs_fs_parameters,
>  	.kill_sb		= kill_block_super,
> -	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
> +	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_MGTIME,
>  };
>  MODULE_ALIAS_FS("xfs");
>  
> 
> -- 
> 2.41.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
