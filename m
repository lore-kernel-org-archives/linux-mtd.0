Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7EEC001E0
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Aug 2023 18:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=euMZgmG1Xyfesuigojc1dXpRDJGJETMkP4a34SjSX18=; b=PWH8ASuKgwPq/hizc5YFdnAXLw
	ijR3sQ/eVq94isU3hSmvDnHzamh3PjvlGDMUgvDPdSdSlE0spXZjKv4sPL/1OOo2xUkWzIhuzr3bi
	+tDWhJwQjs/IRgd//qkVKbPzKZq1Bf6aDfeGXhrzDA0lV6h0vWqutcOw5mqWI3rA07+vD7+YCVzUd
	qBFq90W4Bpqshcg17Hcc1/+4VY3yQDFZXVC7qPkIIaZ6BWYSUPXprpKNsqIBBcLPfYpw1uxP6uRFS
	j4vsblaSWIF9JUxL13HecJFCS6HyBQGITfY7FCIHvQSKMRL0gZihhZO2mU/TBJPZFf0fRFwC9zWhE
	Ox2C17mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRGtK-005fhW-1R;
	Wed, 02 Aug 2023 18:48:14 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRGtG-005ffm-0u;
	Wed, 02 Aug 2023 18:48:11 +0000
Message-ID: <471c346601a7daace902428e56b8579b.pc@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1691002083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LM5dlnWT81GTwNGuf8M3+0tmWSk26IjSyG3XZJNlGxg=;
	b=q+WFWoVwU8f/i7FIz0XAfDaWphvSKk6j9cTrweJn7z9x5iBr7hiB35FGPAUBDF4ISjvz5h
	zznWulE1I6cYjxCc8w+oI7LqEsabOb90uMokjyBo26cUl9nOO1TEwZN8Rko1gnGWvU899Z
	+EBpH1/sTAIcDBro/WhZd/24PR+naT0wlQBLDVmBmCkMhE+2F6usEQx/ESFOSTzKfD3foi
	57LqLxR9Es5qHclOHN7ZNd3Wf1NFp5sNHd92kPnDoE27zzkvm/xF1Zegdhw2DWwM4cUSYl
	FcRs0tYEjK3/9OByMH8nBUpqgGgWvImVoeFcmbN4cGs0tbYOYiDHxrQ3J3/9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1691002083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LM5dlnWT81GTwNGuf8M3+0tmWSk26IjSyG3XZJNlGxg=;
	b=AoW9sil2tg15RxkemetVcD0MQH7aqHOPx9s45t6q2mXk4iNoevRltavPuQhHJickRN06JC
	9twitSFZovdSmN54RsIMwcP9LbHZ1K86aCiRYdAMGoHCsXm0u0QTFFXXd8+eXqppmU9Kp1
	Q9pg/HXE5fSlbCGR+84Z036/rAjhvge6A7ij00bIpSGub9bNIOdCFcEgHSqmL5WMnIl1Uf
	VF0itzVid71/SBJv2BhC3GrS7WwIz1UW8ofISSDCmwhyuSGM2Z2MEfKyccU/HDsRsX7g/2
	qop6kKp78QWclngeoV7X+/F2IIcl/qVTZIg1Eck9BzyGSdE1iSwHxnOAmhWl8g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1691002083; a=rsa-sha256;
	cv=none;
	b=cp3+mC0OMj7F40WMT7qUHuJDwt5m+4Y0ISygYXiZ4GOzzVuy+cXksXQTjexnbnoHqJnkLv
	A/Xh4iI5m54yLclEpvkUfV+Z5z+yl3bkiSW7DPqp7d3qf2mgApmdG2r6OnrC3HAVdpFkRR
	FGIzkra0rLP1oeUH2LzXYwCEn0h5f1JOcg5inVxvd5FI0X3iaV9zS9fxN8/uoNWsRSS8bg
	YveFBiSbZ9Cz5RuNQ9Dpsxd6wNh4r8y+aIu582+NYrL0UgzojRiCHbVTSN7csXMG8yKhXg
	YDPPznVWXhPSF0A8cu9cmJOJmS32KIv4mwdX1lo6pb8zpon7EJ1dEyaA13ArHw==
From: Paulo Alcantara <pc@manguebit.com>
To: Jeff Layton <jlayton@kernel.org>, Eric Van Hensbergen
 <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique
 Martinet <asmadeus@codewreck.org>, Christian Schoenebeck
 <linux_oss@crudebyte.com>, David Howells <dhowells@redhat.com>, Marc
 Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu
 <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara
 <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger
 <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA
 Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos Szeredi
 <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, Andreas
 Gruenbacher <agruenba@redhat.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Trond
 Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker
 <anna@kernel.org>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook
 <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>, Steve French
 <sfrench@samba.org>, Ronnie Sahlberg <lsahlber@redhat.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, Hans de
 Goede <hdegoede@redhat.com>, Hugh Dickins <hughd@google.com>, Andrew
 Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@kernel.org>
Cc: Dave Chinner <david@fromorbit.com>, Anthony Iliopoulos
 <ailiop@suse.com>, v9fs@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-xfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v6 1/7] fs: pass the request_mask to generic_fillattr
In-Reply-To: <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
Date: Wed, 02 Aug 2023 15:47:56 -0300
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_114810_498440_1041F193 
X-CRM114-Status: GOOD (  15.22  )
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

Jeff Layton <jlayton@kernel.org> writes:

> generic_fillattr just fills in the entire stat struct indiscriminately
> today, copying data from the inode. There is at least one attribute
> (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> and we're looking at adding more with the addition of multigrain
> timestamps.
>
> Add a request_mask argument to generic_fillattr and have most callers
> just pass in the value that is passed to getattr. Have other callers
> (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> STATX_CHANGE_COOKIE into generic_fillattr.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/9p/vfs_inode.c       |  4 ++--
>  fs/9p/vfs_inode_dotl.c  |  4 ++--
>  fs/afs/inode.c          |  2 +-
>  fs/btrfs/inode.c        |  2 +-
>  fs/ceph/inode.c         |  2 +-
>  fs/coda/inode.c         |  3 ++-
>  fs/ecryptfs/inode.c     |  5 +++--
>  fs/erofs/inode.c        |  2 +-
>  fs/exfat/file.c         |  2 +-
>  fs/ext2/inode.c         |  2 +-
>  fs/ext4/inode.c         |  2 +-
>  fs/f2fs/file.c          |  2 +-
>  fs/fat/file.c           |  2 +-
>  fs/fuse/dir.c           |  2 +-
>  fs/gfs2/inode.c         |  2 +-
>  fs/hfsplus/inode.c      |  2 +-
>  fs/kernfs/inode.c       |  2 +-
>  fs/libfs.c              |  4 ++--
>  fs/minix/inode.c        |  2 +-
>  fs/nfs/inode.c          |  2 +-
>  fs/nfs/namespace.c      |  3 ++-
>  fs/ntfs3/file.c         |  2 +-
>  fs/ocfs2/file.c         |  2 +-
>  fs/orangefs/inode.c     |  2 +-
>  fs/proc/base.c          |  4 ++--
>  fs/proc/fd.c            |  2 +-
>  fs/proc/generic.c       |  2 +-
>  fs/proc/proc_net.c      |  2 +-
>  fs/proc/proc_sysctl.c   |  2 +-
>  fs/proc/root.c          |  3 ++-
>  fs/smb/client/inode.c   |  2 +-
>  fs/smb/server/smb2pdu.c | 22 +++++++++++-----------
>  fs/smb/server/vfs.c     |  3 ++-
>  fs/stat.c               | 18 ++++++++++--------
>  fs/sysv/itree.c         |  3 ++-
>  fs/ubifs/dir.c          |  2 +-
>  fs/udf/symlink.c        |  2 +-
>  fs/vboxsf/utils.c       |  2 +-
>  include/linux/fs.h      |  2 +-
>  mm/shmem.c              |  2 +-
>  40 files changed, 70 insertions(+), 62 deletions(-)
>
> [...]
>
> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> index 218f03dd3f52..93fe43789d7a 100644
> --- a/fs/smb/client/inode.c
> +++ b/fs/smb/client/inode.c
> @@ -2540,7 +2540,7 @@ int cifs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  			return rc;
>  	}
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	stat->blksize = cifs_sb->ctx->bsize;
>  	stat->ino = CIFS_I(inode)->uniqueid;

Reviewed-by: Paulo Alcantara (SUSE) <pc@manguebit.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
