Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF3AC04FE0
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 10:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AC8MHiIajCo+/MYIxQAxOH/7L4J8BVSkUlSVRaX7NLs=; b=RJYIKaX12eWRvl
	6w6CesdlNZxL8W9DXR0HJT/TC2ZcxpC9zSWZvkctkDehs5TOdooILIWZcJ+EupTRnqvkQ/gXx00Td
	eTZfJgfGZ8Ww3ncv9T4v+uFVr+zlcIwsfw82W/2rp3PuQOtVlNVEmu5FitjQRVuOKljDJ+uuzZ1po
	G4ZP1ooejceYXQPKVHc9j95rT4hSTl6TScuKs+KV3cINBJk15wFtMBfGEvGuTDXxFGMSfaXKEpJUQ
	4KjEZl5H7rhgyt0xsRPHfLJLpTUMo8zoZsYb2JtJx4BBiOBbC5SiqSbk8s9MtVSjCSP61NogNa107
	52eBlAG8JRp+au5nps4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOc5P-009xjC-2C;
	Wed, 26 Jul 2023 10:49:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOc5N-009xgS-18;
	Wed, 26 Jul 2023 10:49:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B8E6561A6A;
	Wed, 26 Jul 2023 10:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C146FC433C7;
	Wed, 26 Jul 2023 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690368579;
	bh=2dfZYSb7SXGkMObcrfK4A6YGYYkg6dqmecGQRsejOiM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nlKvlRJi9pgRH+6o2ty2NFubBfldMbVG92auYpu5rLnD7BHetmDU9VKYf6sT5m1Lw
	 9z8nCOyKDUhe+AxVNHBpmS6G2dD8dJzX+rJji+yaVhGIr54DxEXSQ8Naflc5EqkZXm
	 oMx3oc62nv59pQtbN4bwMHejWgL7/m3Ho4bpcELYand2g/GOfOpkZzzw8UfdxYWu0D
	 cRTsM9p1Zy07AvT/CyljCNa9RVmM27z0pUsiEqV9U73RULJVyyi4xsIH17O7pCeT7K
	 2vuopndVreRhDXzjIQrwQNhfO8nP7E7b/KPlwkbJ15nkxHodGzG9a+hw+kyXBC4p1M
	 3/8b9w+0ZBn0Q==
Message-ID: <4d4a9a3c59ed2efe5132c01f08a7719c2ea60f04.camel@kernel.org>
Subject: Re: [PATCH v6 1/7] fs: pass the request_mask to generic_fillattr
From: Jeff Layton <jlayton@kernel.org>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Dave Chinner <david@fromorbit.com>, Anthony Iliopoulos
 <ailiop@suse.com>,  v9fs@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org,  linux-erofs@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org,  linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,  cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, linux-xfs@vger.kernel.org
Date: Wed, 26 Jul 2023 06:49:36 -0400
In-Reply-To: <1da81657-2ee1-0ef3-c222-66e00d021c24@linux.alibaba.com>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
	 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
	 <1da81657-2ee1-0ef3-c222-66e00d021c24@linux.alibaba.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_034941_502874_19C5DB66 
X-CRM114-Status: GOOD (  28.23  )
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

On Wed, 2023-07-26 at 17:40 +0800, Joseph Qi wrote:
> 
> On 7/25/23 10:58 PM, Jeff Layton wrote:
> > generic_fillattr just fills in the entire stat struct indiscriminately
> > today, copying data from the inode. There is at least one attribute
> > (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> > and we're looking at adding more with the addition of multigrain
> > timestamps.
> > 
> > Add a request_mask argument to generic_fillattr and have most callers
> > just pass in the value that is passed to getattr. Have other callers
> > (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> > STATX_CHANGE_COOKIE into generic_fillattr.
> > 
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/9p/vfs_inode.c       |  4 ++--
> >  fs/9p/vfs_inode_dotl.c  |  4 ++--
> >  fs/afs/inode.c          |  2 +-
> >  fs/btrfs/inode.c        |  2 +-
> >  fs/ceph/inode.c         |  2 +-
> >  fs/coda/inode.c         |  3 ++-
> >  fs/ecryptfs/inode.c     |  5 +++--
> >  fs/erofs/inode.c        |  2 +-
> >  fs/exfat/file.c         |  2 +-
> >  fs/ext2/inode.c         |  2 +-
> >  fs/ext4/inode.c         |  2 +-
> >  fs/f2fs/file.c          |  2 +-
> >  fs/fat/file.c           |  2 +-
> >  fs/fuse/dir.c           |  2 +-
> >  fs/gfs2/inode.c         |  2 +-
> >  fs/hfsplus/inode.c      |  2 +-
> >  fs/kernfs/inode.c       |  2 +-
> >  fs/libfs.c              |  4 ++--
> >  fs/minix/inode.c        |  2 +-
> >  fs/nfs/inode.c          |  2 +-
> >  fs/nfs/namespace.c      |  3 ++-
> >  fs/ntfs3/file.c         |  2 +-
> >  fs/ocfs2/file.c         |  2 +-
> >  fs/orangefs/inode.c     |  2 +-
> >  fs/proc/base.c          |  4 ++--
> >  fs/proc/fd.c            |  2 +-
> >  fs/proc/generic.c       |  2 +-
> >  fs/proc/proc_net.c      |  2 +-
> >  fs/proc/proc_sysctl.c   |  2 +-
> >  fs/proc/root.c          |  3 ++-
> >  fs/smb/client/inode.c   |  2 +-
> >  fs/smb/server/smb2pdu.c | 22 +++++++++++-----------
> >  fs/smb/server/vfs.c     |  3 ++-
> >  fs/stat.c               | 18 ++++++++++--------
> >  fs/sysv/itree.c         |  3 ++-
> >  fs/ubifs/dir.c          |  2 +-
> >  fs/udf/symlink.c        |  2 +-
> >  fs/vboxsf/utils.c       |  2 +-
> >  include/linux/fs.h      |  2 +-
> >  mm/shmem.c              |  2 +-
> >  40 files changed, 70 insertions(+), 62 deletions(-)
> > 
> 
> ...
> 
> > diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
> > index 1b337ebce4df..8184499ae7a5 100644
> > --- a/fs/ocfs2/file.c
> > +++ b/fs/ocfs2/file.c
> > @@ -1319,7 +1319,7 @@ int ocfs2_getattr(struct mnt_idmap *idmap, const struct path *path,
> >  		goto bail;
> >  	}
> >  
> > -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> > +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
> 
> For ocfs2 part, looks fine to me.
> 
> Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> 
> >  	/*
> >  	 * If there is inline data in the inode, the inode will normally not
> >  	 * have data blocks allocated (it may have an external xattr block).
> 
> ...
> 
> > diff --git a/fs/stat.c b/fs/stat.c
> > index 8c2b30af19f5..062f311b5386 100644
> > --- a/fs/stat.c
> > +++ b/fs/stat.c
> > @@ -29,6 +29,7 @@
> >  /**
> >   * generic_fillattr - Fill in the basic attributes from the inode struct
> >   * @idmap:	idmap of the mount the inode was found from
> > + * @req_mask	statx request_mask
> 
> s/req_mask/request_mask
> 

Thanks. Fixed in my tree.

> >   * @inode:	Inode to use as the source
> >   * @stat:	Where to fill in the attributes
> >   *
> > @@ -42,8 +43,8 @@
> >   * uid and gid filds. On non-idmapped mounts or if permission checking is to be
> >   * performed on the raw inode simply passs @nop_mnt_idmap.
> >   */
> > -void generic_fillattr(struct mnt_idmap *idmap, struct inode *inode,
> > -		      struct kstat *stat)
> > +void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
> > +		      struct inode *inode, struct kstat *stat)
> >  {
> >  	vfsuid_t vfsuid = i_uid_into_vfsuid(idmap, inode);
> >  	vfsgid_t vfsgid = i_gid_into_vfsgid(idmap, inode);
> > @@ -61,6 +62,12 @@ void generic_fillattr(struct mnt_idmap *idmap, struct inode *inode,
> >  	stat->ctime = inode_get_ctime(inode);
> >  	stat->blksize = i_blocksize(inode);
> >  	stat->blocks = inode->i_blocks;
> > +
> > +	if ((request_mask & STATX_CHANGE_COOKIE) && IS_I_VERSION(inode)) {
> > +		stat->result_mask |= STATX_CHANGE_COOKIE;
> > +		stat->change_cookie = inode_query_iversion(inode);
> > +	}
> > +
> >  }
> >  EXPORT_SYMBOL(generic_fillattr);
> >  
> > @@ -123,17 +130,12 @@ int vfs_getattr_nosec(const struct path *path, struct kstat *stat,
> >  	stat->attributes_mask |= (STATX_ATTR_AUTOMOUNT |
> >  				  STATX_ATTR_DAX);
> >  
> > -	if ((request_mask & STATX_CHANGE_COOKIE) && IS_I_VERSION(inode)) {
> > -		stat->result_mask |= STATX_CHANGE_COOKIE;
> > -		stat->change_cookie = inode_query_iversion(inode);
> > -	}
> > -
> >  	idmap = mnt_idmap(path->mnt);
> >  	if (inode->i_op->getattr)
> >  		return inode->i_op->getattr(idmap, path, stat,
> >  					    request_mask, query_flags);
> >  
> > -	generic_fillattr(idmap, inode, stat);
> > +	generic_fillattr(idmap, request_mask, inode, stat);
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(vfs_getattr_nosec);
> 
> ...
> 

-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
