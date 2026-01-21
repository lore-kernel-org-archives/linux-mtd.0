Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8582EC44502
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 09:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZfcUz6dAW+oN8ViUmNvwMx2Krs9noJ5h7AidPumcyM=; b=wU+MKtFml73TEl
	ky2U3FxYlaClUQrUPPvDRRE+1BXvPG4YrF4u8VxKp2QUZLKFNcgg06diHBIdZYx450EcKsGbwugsz
	sylwxO8CNFTqE1nGbULBfQPOPxiA3pZaKXjAH6QY77BP4/HOuLCCE1i6EsYApE8tn2iu+GDBl9OjU
	QH6JT/IXDplNbnM0KFqxEHjGK5mUr9/874OqVKELL0r8KGduy8js5ZJ4ywBzlwYp5HHzQQ7kk9/Gq
	Nit0z0cv7obVZFV/Dt205Elgod54egOPlHUOHf7SamiJ91kAWsLgnUUvd6mAavS2ncj8BbIYQHPCJ
	u12U4l/qhQrs17l4+9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUL3-00000005Ak2-0rCs;
	Wed, 21 Jan 2026 09:17:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUKw-00000005AiH-18Yv;
	Wed, 21 Jan 2026 09:17:14 +0000
Date: Wed, 21 Jan 2026 01:17:14 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@infradead.org>, Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Chunhai Guo <guochunhai@vivo.com>, Carlos Maiolino <cem@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	David Laight <david.laight.linux@gmail.com>,
	Dave Chinner <david@fromorbit.com>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-unionfs@vger.kernel.org, devel@lists.orangefs.org,
	ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev,
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
	steve@digidescorp.com
Subject: Re: [PATCH v2 02/31] exportfs: add new EXPORT_OP_STABLE_HANDLES flag
Message-ID: <aXCZmmBRSJR3ftHn@infradead.org>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
 <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
 <aW8ztQ-RbhxwzMk7@infradead.org>
 <56fr33ju43h6zzp6jrzrkyfag6r3jz6wpnk45oe5byy6fqyvti@d43hgikfuk7t>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56fr33ju43h6zzp6jrzrkyfag6r3jz6wpnk45oe5byy6fqyvti@d43hgikfuk7t>
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

On Tue, Jan 20, 2026 at 09:40:07AM +0100, Jan Kara wrote:
> (with explanations before I couldn't quite see the difference between shmem
> and kernfs). I'd note that fat or shmem (which are both exportable)
> satisfy this only with reasonably high probability as they use
> get_random_u32() for initializing their i_generation but I guess it's as
> good as it gets for them.

For tmpfs random generations are as good as it gets, in fact that's what
XFS starts with when allocating new inode clusters (which could have
previous been used for for inodes as well).

fat on the other hand looks broken, as it also set a new generation when
reading inodes from disk.  So I don't think fat should be nfs exportable,
even if the export ops predate other uses.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
