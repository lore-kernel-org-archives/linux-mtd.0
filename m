Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31339C001B0
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jF6AEX31hN3DfSZvbl/CPnNw2rXfWqErLPw9CANJsf8=; b=JK3e/usOmVjz7s
	ibqZALseQZj/M+gfmKo0aCi6gYkcxN2E2IHV9DxWTaxVbjWdr06y8a+7j11yJJJSvPV3TQ+0TuSGU
	W8gRiAgtwI2Tiwjdry0seFsd4eEhbnb2ySSAjQMnt0lcWQJQucQCtYOJiYXVTrTsD+fYQG3/uMlXh
	lG+Pv6eqYAn2llLpDFFfbd3wd9Ot70w7Do1bDTV5mY5JjB9vhBRRFsRo/0C1ORpRu6MB4uRpW75cE
	qdD9xkRTFO1xBj6ZrC+2GKbt8Ilz+PPRCGPoq7Dp8TGaEXOJgZj8OyrrjWFAg/+Zz9S0RHsUn41nM
	i2/nvsbzsW1hoGWQoRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTJBF-0029mz-11;
	Tue, 08 Aug 2023 09:39:09 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTJBB-0029m8-36;
	Tue, 08 Aug 2023 09:39:07 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 186E41F88D;
	Tue,  8 Aug 2023 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1691487544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PVeErVjOshT1HL9BKit56tV7zQvJsI4KiQWED3rMFuk=;
	b=Ih/dtuDlLjuehwLx/dl1alOHiAbINBHhQjqICxdO8QzvDNyayDD12QEIdQQqzzznj7Q14P
	c5hv8MUHhglxrWQtTaFcAIVopxDABjqy/dP+ec5Lv+rEt0nndTNahsaoLReC2CFkrCP+64
	W8/atfzAfsnelhickcggtSiPj4yTuJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1691487544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PVeErVjOshT1HL9BKit56tV7zQvJsI4KiQWED3rMFuk=;
	b=j1Qrid+U1SfmOjtDLooGt12t1hCG9o0NAGXfAvVFTMysCO70VmrTAY263EbPzLWm1azsyz
	yYZCAZd1ftjgXqAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01B42139E9;
	Tue,  8 Aug 2023 09:39:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id u1hdADgN0mRKHgAAMHmgww
	(envelope-from <jack@suse.cz>); Tue, 08 Aug 2023 09:39:04 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 732A5A0769; Tue,  8 Aug 2023 11:39:03 +0200 (CEST)
Date: Tue, 8 Aug 2023 11:39:03 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
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
Message-ID: <20230808093903.2cg5wwbwbvflkeph@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-7-d1dec143a704@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-mgctime-v7-7-d1dec143a704@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_023906_151508_3D620B10 
X-CRM114-Status: GOOD (  21.64  )
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

On Mon 07-08-23 15:38:38, Jeff Layton wrote:
> In later patches we're going to drop the "now" parameter from the
> update_time operation. Prepare XFS for this by reworking how it fetches
> timestamps and sets them in the inode. Ensure that we update the ctime
> even if only S_MTIME is set.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/xfs/xfs_iops.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> index 731f45391baa..72d18e7840f5 100644
> --- a/fs/xfs/xfs_iops.c
> +++ b/fs/xfs/xfs_iops.c
> @@ -1037,6 +1037,7 @@ xfs_vn_update_time(
>  	int			log_flags = XFS_ILOG_TIMESTAMP;
>  	struct xfs_trans	*tp;
>  	int			error;
> +	struct timespec64	now = current_time(inode);

No need to fetch current_time() here where you overwrite it just a bit
later...

> @@ -1056,12 +1057,15 @@ xfs_vn_update_time(
>  		return error;
>  
>  	xfs_ilock(ip, XFS_ILOCK_EXCL);
> -	if (flags & S_CTIME)
> -		inode_set_ctime_to_ts(inode, *now);
> +	if (flags & (S_CTIME|S_MTIME))
> +		now = inode_set_ctime_current(inode);
> +	else
> +		now = current_time(inode);
> +
>  	if (flags & S_MTIME)
> -		inode->i_mtime = *now;
> +		inode->i_mtime = now;
>  	if (flags & S_ATIME)
> -		inode->i_atime = *now;
> +		inode->i_atime = now;
>  
>  	xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
>  	xfs_trans_log_inode(tp, ip, log_flags);

Otherwise the patch looks good to me so feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
