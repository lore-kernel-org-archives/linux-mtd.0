Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C766AC001E0
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 07:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fwS1QmR0D88BpZXeR0Hkzyo+U77ucpjNepscQbyLRE=; b=vHNdNMRD77+4rS
	6AbAR0HOf3QmBIu39SP137CxbchR0Ly25MUmcHie/94xP/2Nvfk/CcU8WZwR1giRy/6yzGHxa1A6w
	ij64w/54WLpC1JOBh7Xl4qTSWpWlXYyHURXZI64cPzOJcCYbgCscFyASL8B0w9e5lhFP9hBxysY6J
	cVXCt1p3yQR+YLFivqTK7qQI4nEnELCeGonhCb23evfE6C5dRPYnfbIzwP62VecYXl/Azzv9o2/L+
	BbMPZJ9ftXsdGBU6GV1Lhww/sCQIMiQiOokuT19tWf8r41fA/8/bNdojGXEF4b+DviyGk8cZiZl3F
	dWgem2x0RACJejM+tuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTdHU-004DHJ-1M;
	Wed, 09 Aug 2023 07:06:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTdHR-004DGF-12;
	Wed, 09 Aug 2023 07:06:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B61A62FBF;
	Wed,  9 Aug 2023 07:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BD8C433C7;
	Wed,  9 Aug 2023 07:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691564812;
	bh=LyptcIlHZJMPRLgCQdT8M5vqzNKCvVA2tglx+SSzKhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bD7f0dTITrbaEv4ks9HGhx0VVGQl2go0/eu1op4nP82j4N7TgX5btWqWiaSGoe8jp
	 i6+z7Q/Jk2DuDRVzKbPo4bN2rJnb7ZSAdXE4Z0xYd+h6nr/dULJQsuanMXc8U/mPWC
	 durewToMDZYiugVbqFDpM/vlNxIknI7IjiKj4iWyBj6wWmzWhg0/t+ygbJ1TK6LZ+2
	 DAg/4gaYUGbCnyrWc2K3wnSswvzR8b++oY6In8hF21Owe2spxR27o2A1Ew8ijOuuN3
	 Wo+4rLZHSLxhk9EzIXmcSquBg+Bnp2nKOE70h2bjG7fT6iPfQRAHqxOjlzas9G4WAl
	 a1bfUfvPCKxNg==
Date: Wed, 9 Aug 2023 09:06:34 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Jeff Layton <jlayton@kernel.org>,
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
	Bob Peterson <rpeterso@redhat.com>,
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
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
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
Subject: Re: [PATCH v7 06/13] ubifs: have ubifs_update_time use
 inode_update_timestamps
Message-ID: <20230809-handreichung-umgearbeitet-951eebed4d61@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-6-d1dec143a704@kernel.org>
 <20230808093701.ggyj7tyqonivl7tb@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808093701.ggyj7tyqonivl7tb@quack3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_000653_444443_84E853C4 
X-CRM114-Status: GOOD (  17.11  )
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

On Tue, Aug 08, 2023 at 11:37:01AM +0200, Jan Kara wrote:
> On Mon 07-08-23 15:38:37, Jeff Layton wrote:
> > In later patches, we're going to drop the "now" parameter from the
> > update_time operation. Prepare ubifs for this, by having it use the new
> > inode_update_timestamps helper.
> > 
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> 
> One comment below:
> 
> > diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> > index df9086b19cd0..2d0178922e19 100644
> > --- a/fs/ubifs/file.c
> > +++ b/fs/ubifs/file.c
> > @@ -1397,15 +1397,9 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
> >  		return err;
> >  
> >  	mutex_lock(&ui->ui_mutex);
> > -	if (flags & S_ATIME)
> > -		inode->i_atime = *time;
> > -	if (flags & S_CTIME)
> > -		inode_set_ctime_to_ts(inode, *time);
> > -	if (flags & S_MTIME)
> > -		inode->i_mtime = *time;
> > -
> > -	release = ui->dirty;
> > +	inode_update_timestamps(inode, flags);
> >  	__mark_inode_dirty(inode, I_DIRTY_SYNC);
> > +	release = ui->dirty;
> >  	mutex_unlock(&ui->ui_mutex);
> 
> I think this is wrong. You need to keep sampling ui->dirty before calling
> __mark_inode_dirty(). Otherwise you could release budget for inode update
> you really need...

Fixed in-tree.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
