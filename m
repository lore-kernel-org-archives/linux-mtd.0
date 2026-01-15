Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F63D33A0B
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVeSKXEWMb9eySGaZB9PZjCUQ81Y2nwxHCzbNIDF5xY=; b=1y8ogs7PDHgryE
	KY3PndH0oZx/qi1H2xUvntW8wb9zGm+5hHgwAUqgWGpdc8J6HESiwuax/bkEWNepD93PTCkGwOe3R
	ygSh965FjGWDcqFf1F6K84CaRiL7yVG81R7SIfUMu5aa7TPVD1LfDR5C4wtcWXo4/FjLTD4yvzjzP
	yEGx6chkmBILkFLfbcu8XSKttqRfIaxABhU1abmzNLNDzVce7qVPCbbh3xyiLPXxQSeqfggQeOGgu
	HrqA2LZ/f8z2l9FUtLmVm3NaPy5F1v0w4urLmOHIKU7CvYC/Cx38XpubcexIQwe/ZQeOsIrTE+x7O
	zKBmC+1Bsg90Bo8zJDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIn0-0000000C09p-21NW;
	Thu, 15 Jan 2026 08:33:10 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgImu-0000000C08y-0V2p;
	Thu, 15 Jan 2026 08:33:04 +0000
Date: Thu, 15 Jan 2026 00:33:04 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>,
	Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>,
	Nicolas Pitre <nico@fluxnic.net>, Anders Larsen <al@alarsen.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Dave Kleikamp <shaggy@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Carlos Maiolino <cem@kernel.org>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Alexander Aring <alex.aring@gmail.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>, Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, gfs2@lists.linux.dev, linux-doc@vger.kernel.org,
	v9fs@lists.linux.dev, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
Message-ID: <aWimQEokuib7fXjY@infradead.org>
References: <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
 <aWeUv2UUJ_NdgozS@infradead.org>
 <20260114-klarstellen-blamieren-0b7d40182800@brauner>
 <aWiMaMwI6nYGX9Bq@infradead.org>
 <20260115-inspektion-kochbuch-505d8f94829e@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-inspektion-kochbuch-505d8f94829e@brauner>
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

On Thu, Jan 15, 2026 at 09:14:06AM +0100, Christian Brauner wrote:
> On Wed, Jan 14, 2026 at 10:42:48PM -0800, Christoph Hellwig wrote:
> > On Wed, Jan 14, 2026 at 04:20:13PM +0100, Christian Brauner wrote:
> > > > You're still think of it the wrong way.  If we do have file systems
> > > > that break the original exportfs semantics we need to fix that, and
> > > > something like a "stable handles" flag will work well for that.  But
> > > > a totally arbitrary "is exportable" flag is total nonsense.
> > > 
> > > File handles can legitimately be conceptualized independently of
> > > exporting a filesystem. If we wanted to tear those concepts apart
> > > implementation wise we could.
> > > 
> > > It is complete nonsense to expect the kernel to support exporting any
> > > arbitrary internal filesystem or to not support file handles at all.
> > 
> > You are going even further down the path of entirely missing the point
> > (or the two points by now).
> 
> You're arguing for the sake of arguing imho. You're getting exactly what
> we're all saying as evidenced by the last paragraph in your mail: it is
> entirely what this whole thing is about.

I can't even parse what you mean.  And no, I hate these stupid
arguments, and I have much better things to do than dragging this on.

> > If a file systems meets all technical requirements of being nfsd
> > exportable and the users asks for it, it is not our job to make an
> > arbitrary policy decision to say no.
> 
> This is an entirely irrelevant point because we're talking about
> cgroupfs, nsfs, and pidfs. And they don't meet this criteria. cgroupfs
> is a _local resource management filesystem_ why would we ever want to
> support exporting it over the network. It allows to break the local
> delegation model as I've explained. cgroupfs shows _local processes_. So
> a server will see completely nonsensical PID identifiers listed in
> cgroup files and it can fsck around with processes in a remote system.

None of that is a technical argument.  The lack of stable file handles
would be one, and I think we came to the conclusion yesterday that
this is the case.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
