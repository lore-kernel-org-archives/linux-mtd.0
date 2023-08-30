Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222C9C83F12
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 01:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+WKikguZyeaE2W0wz4Pw/8W8SiOkV5/RyvVGErbAIo=; b=XKIrnKFeVHYFen
	eEA7tLWBkuHjfmsCvcyZjjeHUMkyFP0cnK3uI0dA4u/EUHLVxbccv1LJJoBg25n9Pac0Am+9mOSmJ
	gpaIoUdZRw8OjYeLZZtiKIOuU4Q2wgVAx/44+tg8Kwf+S0TVjvpVO4nuQrKCxSufJqsOizVT0Bi0D
	g56envkABcadTzUtiNZwUuiymdoivZ4byhWZt7+eAJAquGQ9RYjaTAjhMLg65nOMcRakS/ipKE/z0
	0OLqNWj/4N2qwcvHCc070BAjnY3Lx3NPnduYHnStmNfyqqX1jfJjf/eT9MIiP0IL/S7A6umvim5oG
	/hKUoXAyYwr1d59VrUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb9wk-00CZKX-2e;
	Wed, 30 Aug 2023 01:24:38 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb9wh-00CZJk-0E;
	Wed, 30 Aug 2023 01:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UGL8Hs7wie/83TbDi9sHxBsPaDb/+1IP8lK74uZbCKw=; b=VMCLMK1iXxNHLo2tyoSLb1HI/I
	ygrNcHqe5LWzcSOicXKiXv7+aZW1BJ7dB0vjqMCV0MnziRQDnoZOz3XgmiNQiiDnA13PUlmOVrxc4
	WpSk9x7uA8R3KciGWN7qJ88utnJ3QSHSvYKWfoJJvhO0U1H1/cqwYZYmtvld8BDA8iqcXv8CBaGId
	erqQdPcYkjIFz/hBJqwMuB/rDK2BOMTdgnlCwnIMFpdDxv6wkG8Wn7rLsnAYsC5D7sc1BRtVulXjw
	RcKjf3m9ODmy0yW/y+LgeKEyGIU6PCqX4XrC83Co4MtcnJcvY9SuxDXgB2k0Ps8NGdX3ExJB41/fI
	ibsynONQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qb9v5-001yGw-2Z;
	Wed, 30 Aug 2023 01:22:55 +0000
Date: Wed, 30 Aug 2023 02:22:55 +0100
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
Message-ID: <20230830012255.GC3390869@ZenIV>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
 <20230829224454.GA461907@ZenIV>
 <e1c4a6d5001d029548542a1f10425c5639ce28e4.camel@kernel.org>
 <20230830000221.GB3390869@ZenIV>
 <1005e30582138e203a99f49564e2ef244b8d56aa.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1005e30582138e203a99f49564e2ef244b8d56aa.camel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_182435_111013_200B8251 
X-CRM114-Status: GOOD (  35.92  )
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

On Tue, Aug 29, 2023 at 08:43:31PM -0400, Jeff Layton wrote:
> On Wed, 2023-08-30 at 01:02 +0100, Al Viro wrote:
> > On Tue, Aug 29, 2023 at 06:58:47PM -0400, Jeff Layton wrote:
> > > On Tue, 2023-08-29 at 23:44 +0100, Al Viro wrote:
> > > > On Tue, Jul 25, 2023 at 10:58:14AM -0400, Jeff Layton wrote:
> > > > > generic_fillattr just fills in the entire stat struct indiscriminately
> > > > > today, copying data from the inode. There is at least one attribute
> > > > > (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> > > > > and we're looking at adding more with the addition of multigrain
> > > > > timestamps.
> > > > > 
> > > > > Add a request_mask argument to generic_fillattr and have most callers
> > > > > just pass in the value that is passed to getattr. Have other callers
> > > > > (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> > > > > STATX_CHANGE_COOKIE into generic_fillattr.
> > > > 
> > > > Out of curiosity - how much PITA would it be to put request_mask into
> > > > kstat?  Set it in vfs_getattr_nosec() (and those get_file_..._info()
> > > > on smbd side) and don't bother with that kind of propagation boilerplate
> > > > - just have generic_fillattr() pick it there...
> > > > 
> > > > Reduces the patchset size quite a bit...
> > > 
> > > It could be done. To do that right, I think we'd want to drop
> > > request_mask from the ->getattr prototype as well and just have
> > > everything use the mask in the kstat.
> > > 
> > > I don't think it'd reduce the size of the patchset in any meaningful
> > > way, but it might make for a more sensible API over the long haul.
> > 
> > ->getattr() prototype change would be decoupled from that - for your
> > patchset you'd only need the field addition + setting in vfs_getattr_nosec()
> > (and possibly in ksmbd), with the remainders of both series being
> > independent from each other.
> > 
> > What I suggest is
> > 
> > branchpoint -> field addition (trivial commit) -> argument removal
> > 		|
> > 		V
> > your series, starting with "use stat->request_mask in generic_fillattr()"
> > 
> > Total size would be about the same, but it would be easier to follow
> > the less trivial part of that.  Nothing in your branch downstream of
> > that touches any ->getattr() instances, so it should have no
> > conflicts with the argument removal side of things.
> 
> The only problem with this plan is that Linus has already merged this.
> I've no issue with adding the request_mask to the kstat and removing it
> as a separate parameter elsewhere, but I think we'll need to do it on
> top of what's already been merged.

D'oh...  My apologies; I'll do a branch on top of that (and rebase on
top of -rc1 once the window closes).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
