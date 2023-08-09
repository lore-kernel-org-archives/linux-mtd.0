Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F720EB64DD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 07:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=colKzG0mS2D4kU0bx+n7nO/1toQ0+Q7HrredXTbVqBk=; b=rYB/pNS1kW+5RD
	Xbxi6RDWVETYjvxafRkJcE2FoUvWwyYOHVFxC/uTguPjrSn5lp3jncS8x8GAq1b1ndDtz3Wn+Gxmk
	6VXRRBIFPfn3AbiY8mponDOaB+jjesIBO9LeUcol2vyoU7YLIhFwoBQ4buZnXki+kky1VqheJ3YI0
	vD9ZPR9jPG9YkgrOhiXfmEl2XAR3AxRW29DOHNZw06zq/pzS773eBRIrFOoqfmHwZk88h48Y1Uwih
	3+3DN4jOarhTWnH+/5GdwY6X6p4mgUBQOQuc/gaN0tEwKT12nLBkvdIeYp7F9xAIFmiJkXBu8vLwI
	8knlp+4evvj+KLjX/aWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTdFC-004CfT-2u;
	Wed, 09 Aug 2023 07:04:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTdF9-004CeO-2N;
	Wed, 09 Aug 2023 07:04:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 012D462FB3;
	Wed,  9 Aug 2023 07:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF415C433C8;
	Wed,  9 Aug 2023 07:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691564670;
	bh=mNaI4yIhrZSJhUwcMni6JCN62HgxRgb2ToogP2H4jFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dm1BfYtz2dqQMxa4y4K1DetMu3X3Ln+bwz+2jEemWCBc68DqnWDXfI9TyuC86JRyc
	 OV6+7i/vF54n6ROMNvy+VNt+3Tcbr5mPPxWG7+kZZzvdk1l5Y2fXqdyi4kiTIEHp6R
	 c+NokRM5ch22ngFHcUfi3IxiA2Hed3py0L00cGbjgid38+MsphBbYkHDRv8n5kfv6l
	 165HU85tqTN8dPjx7l1xQ1d3Tv6OZoFdRY/kHWh7X900UpXqc/s3kp4a/FPaL7/Rze
	 xRv3G8HkDEWg3uieFtEQ8pvVu174WnaDQBFW7zKSqu+mNZR7+LKPBNsWLcV/CsHS/4
	 sOc78sTonZdgw==
Date: Wed, 9 Aug 2023 09:04:12 +0200
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
Subject: Re: [PATCH v7 07/13] xfs: have xfs_vn_update_time gets its own
 timestamp
Message-ID: <20230809-abartig-lachen-df1965c6b37a@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-7-d1dec143a704@kernel.org>
 <20230808093903.2cg5wwbwbvflkeph@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808093903.2cg5wwbwbvflkeph@quack3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_000431_849625_75289E51 
X-CRM114-Status: GOOD (  20.23  )
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

On Tue, Aug 08, 2023 at 11:39:03AM +0200, Jan Kara wrote:
> On Mon 07-08-23 15:38:38, Jeff Layton wrote:
> > In later patches we're going to drop the "now" parameter from the
> > update_time operation. Prepare XFS for this by reworking how it fetches
> > timestamps and sets them in the inode. Ensure that we update the ctime
> > even if only S_MTIME is set.
> > 
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/xfs/xfs_iops.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> > index 731f45391baa..72d18e7840f5 100644
> > --- a/fs/xfs/xfs_iops.c
> > +++ b/fs/xfs/xfs_iops.c
> > @@ -1037,6 +1037,7 @@ xfs_vn_update_time(
> >  	int			log_flags = XFS_ILOG_TIMESTAMP;
> >  	struct xfs_trans	*tp;
> >  	int			error;
> > +	struct timespec64	now = current_time(inode);
> 
> No need to fetch current_time() here where you overwrite it just a bit
> later...

It also shadows the @now parameter of that function. Since that function
parameter is dropped in follow-up patches I simply s/now/time/g it here.
In any case, fixed in-tree.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
