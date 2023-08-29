Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A97C83F18
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 22:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xw71UUJTz4mZISwmWSmEedIRahjecH8C6HObQvTsJW0=; b=Yaotttp3UlyBTJ
	FPrh4q9Hu3GWWPuwUBb/gH8jWadyQ8HkvZ0tQn3/qweMZcgPo645j4jw5e5d2B/Hbzr7W84wNlHR9
	f3asnSlMad8yp0Dv5JWmboHDB4r+l7h4FBpTpQGrOLypaxmk0zvHrYw8Lg3X9SC4N5GtTpBCBBAoQ
	z0NhMw/IOlb6SVt3wltkH2ztMdNCZGmEh2LQIN1bDEW9qhJv2R/clGqaeVTlI6EfEAH2uhQkP4anJ
	fJzcKe8Hgwkk8cWfv9vfkKv3LiDuFv1to4pxMdva6YNzVvqHbztuupsn/c4qNG297HsCb4pc6c3xh
	XZUUympQMgyeANkrdOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb7UP-00CPGq-0v;
	Tue, 29 Aug 2023 22:47:13 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb7UL-00CPEt-1c;
	Tue, 29 Aug 2023 22:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XGuBrJRA9Fd4AduQK/hSseIFrv8V5F+R7owbTsvIznw=; b=q1V5fHa/AXkRLdmnc9TtDTItxb
	sjv5FpbdJarUSWDm8h5uqmHXkHTGtBOUlKVK5U/4PExCLqpYcowYZaV/PvP/kk1bfsDWLvRZIDMi6
	J4YRKXkMJOy3sqhHWZHu4Fl1bfB/qtOHn3XYeh3dGmGOC0qbSQkD2Y+wYSoEusMnNBuy4+VyYQnkY
	Lc4KlaQORaxPNCRh9pBUGO98Ft5v23nvU0WQJiozkEiistd3znn+J2fx0QgNh+u6E23YopsyfOSpr
	Rmce2YRpGqgEixjkKJHtsYkWfKbeh3RTX6XJKjEhssGOmTvrkXGjl1f8Qxu8W6gub1Ziw1YBVxlnq
	0FDl8ZIQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qb7SA-001wYO-34;
	Tue, 29 Aug 2023 22:44:55 +0000
Date: Tue, 29 Aug 2023 23:44:54 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
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
	Tejun Heo <tj@kernel.org>, Christian Brauner <brauner@kernel.org>,
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
	"Darrick J. Wong" <djwong@kernel.org>,
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
Subject: Re: [PATCH v6 1/7] fs: pass the request_mask to generic_fillattr
Message-ID: <20230829224454.GA461907@ZenIV>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_154709_534976_9114C4D9 
X-CRM114-Status: GOOD (  14.60  )
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

On Tue, Jul 25, 2023 at 10:58:14AM -0400, Jeff Layton wrote:
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

Out of curiosity - how much PITA would it be to put request_mask into
kstat?  Set it in vfs_getattr_nosec() (and those get_file_..._info()
on smbd side) and don't bother with that kind of propagation boilerplate
- just have generic_fillattr() pick it there...

Reduces the patchset size quite a bit...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
