Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66165FD8FD3
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 16:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZmjRXPHfTpo0X2z+zTZD+QL2LiZq8xQaIRKg/97QSw=; b=2mSl+B5FbhcWA0
	Cs3sTuWgoUUjOeWaXFUZAj/5N1YchjRA1aHVhrrM3bAZXJmI8+FdKSEkbAA9aim6xz7P/54z95fPI
	ET1JDa3l5Vc1jBIvdZ6P2ulmsdPNH62tVqUZhIofXOJbb1vCfBHKhYYC2sfWlqdrscC3e/U4MFT/5
	T6nFFx6D31rAUKxvJ58YRZEmWUxrmAzMn1d3qVka+pkRYOJYXDmBGQ/fJNORoRhFE9FV+uw2lO5CX
	wUf3zksP58hF2ldT1xfIYrJRVkwhBi6sNgebq3YkWfKlNGfwc0croxl7BzKMCBi96lYOkLeIkCIbE
	B+jVSR8ddTXNjN2VoPbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vve88-00000006ix7-3p6t;
	Thu, 26 Feb 2026 16:22:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vve88-00000006iwy-1euc;
	Thu, 26 Feb 2026 16:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6E5A6013A;
	Thu, 26 Feb 2026 16:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBF5C116C6;
	Thu, 26 Feb 2026 16:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772122943;
	bh=zBSOHROIWzwnJvs9/9cwNsUSUVDRgXIG4XZCDyNzlZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JssZjrPw1BO0Mw8Q9yfwnQsgaD6FpgkNgIWpbVUWXLyeJnokKKg4hk1SAaRN/4Pl2
	 p5YBVNEqJjiqtkjLnya4b8Ga67KiibEKKFpBd87HHM6a9Nr/QZeAv6psBrGRdFMMiz
	 A9DSSr/iUARrTgSnBid48sZtR6nbfqnBEMtEEnmZIzWpuH9bLY6kY9ErKk7lBImyBm
	 /Lk4+mloyiRijQ2SiVpy8mPc9oycbHcUIEINyu+Tm3ChF79dz7yAux92+Q0KlVrv/G
	 LUTkHVEDI976MFOVD4JvxorvgEXP2iFNe7YZQj9uo/QF6AdIL6XZAAV6xKOXhQSqTF
	 qLmaMxW89/z7g==
Date: Thu, 26 Feb 2026 08:22:22 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, Martin Schiller <ms@dev.tdt.de>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org
Subject: Re: [PATCH 61/61] vfs: update core format strings for u64 i_ino
Message-ID: <20260226162222.GH13829@frogsfrogsfrogs>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-61-ccceff366db9@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226-iino-u64-v1-61-ccceff366db9@kernel.org>
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

On Thu, Feb 26, 2026 at 10:56:03AM -0500, Jeff Layton wrote:
> Update format strings from %lu/%lx to %llu/%llx and 0UL literal to
> 0ULL in pipe, dcache, fserror, and eventpoll, now that i_ino is u64
> instead of unsigned long.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Acked-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/dcache.c    | 4 ++--
>  fs/eventpoll.c | 2 +-
>  fs/fserror.c   | 2 +-
>  fs/pipe.c      | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/dcache.c b/fs/dcache.c
> index 24f4f3acaa8cffd6f98124eec38c1a92d6c9fd8e..9e8425ecd88955c72027d21591b1d12c87e7e8aa 100644
> --- a/fs/dcache.c
> +++ b/fs/dcache.c
> @@ -1637,11 +1637,11 @@ static enum d_walk_ret umount_check(void *_data, struct dentry *dentry)
>  	if (dentry == _data && dentry->d_lockref.count == 1)
>  		return D_WALK_CONTINUE;
>  
> -	WARN(1, "BUG: Dentry %p{i=%lx,n=%pd} "
> +	WARN(1, "BUG: Dentry %p{i=%llx,n=%pd} "
>  			" still in use (%d) [unmount of %s %s]\n",
>  		       dentry,
>  		       dentry->d_inode ?
> -		       dentry->d_inode->i_ino : 0UL,
> +		       dentry->d_inode->i_ino : 0ULL,
>  		       dentry,
>  		       dentry->d_lockref.count,
>  		       dentry->d_sb->s_type->name,
> diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> index 5714e900567c499739bb205f43bb6bf73f7ebe54..4ccd4d2e31adf571f939d2e777123e40302e565f 100644
> --- a/fs/eventpoll.c
> +++ b/fs/eventpoll.c
> @@ -1080,7 +1080,7 @@ static void ep_show_fdinfo(struct seq_file *m, struct file *f)
>  		struct inode *inode = file_inode(epi->ffd.file);
>  
>  		seq_printf(m, "tfd: %8d events: %8x data: %16llx "
> -			   " pos:%lli ino:%lx sdev:%x\n",
> +			   " pos:%lli ino:%llx sdev:%x\n",
>  			   epi->ffd.fd, epi->event.events,
>  			   (long long)epi->event.data,
>  			   (long long)epi->ffd.file->f_pos,
> diff --git a/fs/fserror.c b/fs/fserror.c
> index 06ca86adab9b769dfb72ec58b9e51627abee5152..1e4d11fd9562fd158a23b64ca60e9b7e01719cb8 100644
> --- a/fs/fserror.c
> +++ b/fs/fserror.c
> @@ -176,7 +176,7 @@ void fserror_report(struct super_block *sb, struct inode *inode,
>  lost:
>  	if (inode)
>  		pr_err_ratelimited(
> - "%s: lost file I/O error report for ino %lu type %u pos 0x%llx len 0x%llx error %d",
> + "%s: lost file I/O error report for ino %llu type %u pos 0x%llx len 0x%llx error %d",
>  		       sb->s_id, inode->i_ino, type, pos, len, error);
>  	else
>  		pr_err_ratelimited(
> diff --git a/fs/pipe.c b/fs/pipe.c
> index b44a756c0b4165edc2801b2290bf35480245d7a6..9841648c9cf3e8e569cf6ba5c792624fe92396f5 100644
> --- a/fs/pipe.c
> +++ b/fs/pipe.c
> @@ -873,7 +873,7 @@ static struct vfsmount *pipe_mnt __ro_after_init;
>   */
>  static char *pipefs_dname(struct dentry *dentry, char *buffer, int buflen)
>  {
> -	return dynamic_dname(buffer, buflen, "pipe:[%lu]",
> +	return dynamic_dname(buffer, buflen, "pipe:[%llu]",
>  				d_inode(dentry)->i_ino);
>  }
>  
> 
> -- 
> 2.53.0
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
