Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53050C44536
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 22:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-id:Date:References:
	In-reply-to:Subject:Cc:To:From:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6G57f5tGC0X/d7P2UMV+QD7nYZFjoMmMWvjCsc95gM=; b=i7NO/0U09nY3QD
	on6SGJxro8mDIpGD3T1EtWYOUjGBGGGOD1qOJAduFFDeWG0IAVe2Y5l2T707EZbF4fDUPhcc0k24t
	PsylUiWIGEXCXywteloMCDCDJNnKVm0TVoUQ/Fzugn5x111/zAcb4PhPsI8TvHKTRxfRz5g98YEbO
	7shPKYlEhOEeQ1t2nPV1sRLlAfG4mr7byTuOJU2ZFWfVwow0HUcOEXs+j0+9SdngAApAoBdtRXxBB
	VCyPFNkG2DKWVtiWSPza7iyk7eUrRkxXBSsUR9esidd2d8gqUcid9dVYX7korBLtxXb3aWPw96WLd
	WzSUSclrvJ/O5JrP0IaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigzn-0000000683n-0kRt;
	Wed, 21 Jan 2026 22:48:15 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigzk-0000000683I-1tk2
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jan 2026 22:48:13 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 8D6A31300F24;
	Wed, 21 Jan 2026 17:48:08 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 21 Jan 2026 17:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1769035688; x=1769042888; bh=5coOyJl4iosEMxvKLf9pz/D+NbUu48dkiDD
	9Y2kxJME=; b=GuovOWXRBLUE5OJcSyLnE/2eveX/36uTx36j9P93zjQcQRBZQL2
	hrnzBjQOgzs/f0q+zVSV1tWHCGJeldpGO5tNxzbNYGAmGERTI/74rC4AhDEcwnbN
	3EK+IxK9Da7qBxTZ0cL7/5RdElCmK5xx1WEmeVCQTAdbEDCJzhvLIyYH/VUBXRn2
	h49SQEqoXX9n4peKNOiWNTGeGPiK9qsGhIMzVRsfQ8nV0r0CSHnLs3nYhgIfpNL3
	aRQdXpKb6VS0ww0j3QddijYoBo1Kwrkcj+Ox1b+DG22Mrte7SY069e+GdbfIhnlj
	3VqqpOkLrd4aGQop2LrD926E4486pl+anPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769035688; x=
	1769042888; bh=5coOyJl4iosEMxvKLf9pz/D+NbUu48dkiDD9Y2kxJME=; b=G
	Qln8ftBpavKFAA+sJNEPaaNr8oKurXmo3q4BaVp9GwaWB1fm8C563yxGcgYW93DS
	2xtNzCjbtolaXD67qz6Qutqe5geB5bsD8Ugeg6j/LWjxuo9XwZj1mmfo4drLgUP2
	yKqhpGLcalZ4u5NUgfoc97greSYLp54DwzSB4S6wHw4u2msQsbGk5ZA8IJMGNIbQ
	ngZ+8m6ZYaIowc/dHLMNgP5a1uqvjsJX/qkbUxNoCKOD6a2oW1oaQNc62xAi1nw9
	1ilzAzJcDO41rfb5T7w8GgYR5Vyc6IoiPl6WjnE4pmvyLFxhbYKi59Pm07XkqffD
	MH3MYMODbYPIXIIlLoSWg==
X-ME-Sender: <xms:o1dxaZ-cMFc_o0d43ug7z0kzLEBmcLr7-qnETyPvdBZuqqtXE2bH3w>
    <xme:o1dxaWu_cgJpAPDvXRifHWGeBvpSKMc12f7rFBgOoG_tMemlpn3xQTXYgCwgfa7tz
    OXDCzuK93xla979oqbjqOFhStCl3Vabm505SJATmkmL4XzdyA>
X-ME-Received: <xmr:o1dxaTxZPCOrm1mlblqPiWzOX285XPSCGpXm-fKvOvS9y7eJCkfR7O9aWP_lCWxHfYgXgfjqf3Vws4y9gRuwORW00qGz0381O1TtjVlRJXe1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
    rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
    epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
    esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepjeejpdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
    hrtghpthhtohepghhuohgthhhunhhhrghisehvihhvohdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidquhhnihhonhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhnihhlfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqvgigthegsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:o1dxabxtlAdkhpwCkINTEBpxmOYNyzwJPUiM41SluU32_hzzNA9XZQ>
    <xmx:o1dxafCKgd9STI3lGSZvVjQToHTy1h7liCKSrmU9waffzwMuC1NFUA>
    <xmx:o1dxaY793FR_a6LdPfr_ZHshxnAh_1jwBDA6jddarcyZMxIXycacjw>
    <xmx:o1dxaRMf9cXehnUejISjAclfFWLd7Zsy6-U0xLPbufXx8cPynQ1yZw>
    <xmx:qFdxaSd_vulaCSCn1gwPqzAJtzBUIYK-Pjhk-xVuA_6gzPYpL8lA2saQ>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 17:47:43 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
Cc: "Christoph Hellwig" <hch@infradead.org>,
 "Christian Brauner" <brauner@kernel.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Chuck Lever" <chuck.lever@oracle.com>,
 "Olga Kornievskaia" <okorniev@redhat.com>,
 "Dai Ngo" <Dai.Ngo@oracle.com>, "Tom Talpey" <tom@talpey.com>,
 "Amir Goldstein" <amir73il@gmail.com>, "Hugh Dickins" <hughd@google.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Theodore Ts'o" <tytso@mit.edu>,
 "Andreas Dilger" <adilger.kernel@dilger.ca>, "Jan Kara" <jack@suse.com>,
 "Gao Xiang" <xiang@kernel.org>, "Chao Yu" <chao@kernel.org>,
 "Yue Hu" <zbestahu@gmail.com>, "Jeffle Xu" <jefflexu@linux.alibaba.com>,
 "Sandeep Dhavale" <dhavale@google.com>,
 "Hongbo Li" <lihongbo22@huawei.com>, "Chunhai Guo" <guochunhai@vivo.com>,
 "Carlos Maiolino" <cem@kernel.org>, "Ilya Dryomov" <idryomov@gmail.com>,
 "Alex Markuze" <amarkuze@redhat.com>,
 "Viacheslav Dubeyko" <slava@dubeyko.com>, "Chris Mason" <clm@fb.com>,
 "David Sterba" <dsterba@suse.com>,
 "Luis de Bethencourt" <luisbg@kernel.org>,
 "Salah Triki" <salah.triki@gmail.com>,
 "Phillip Lougher" <phillip@squashfs.org.uk>,
 "Steve French" <sfrench@samba.org>, "Paulo Alcantara" <pc@manguebit.org>,
 "Ronnie Sahlberg" <ronniesahlberg@gmail.com>,
 "Shyam Prasad N" <sprasad@microsoft.com>,
 "Bharath SM" <bharathsm@microsoft.com>,
 "Miklos Szeredi" <miklos@szeredi.hu>,
 "Mike Marshall" <hubcap@omnibond.com>,
 "Martin Brandenburg" <martin@omnibond.com>,
 "Mark Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>,
 "Joseph Qi" <joseph.qi@linux.alibaba.com>,
 "Konstantin Komarov" <almaz.alexandrovich@paragon-software.com>,
 "Ryusuke Konishi" <konishi.ryusuke@gmail.com>,
 "Trond Myklebust" <trondmy@kernel.org>,
 "Anna Schumaker" <anna@kernel.org>, "Dave Kleikamp" <shaggy@kernel.org>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Richard Weinberger" <richard@nod.at>, "Jan Kara" <jack@suse.cz>,
 "Andreas Gruenbacher" <agruenba@redhat.com>,
 "OGAWA Hirofumi" <hirofumi@mail.parknet.co.jp>,
 "Jaegeuk Kim" <jaegeuk@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "David Laight" <david.laight.linux@gmail.com>,
 "Dave Chinner" <david@fromorbit.com>, linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, devel@lists.orangefs.org,
 ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev,
 linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, gfs2@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 01/31] Documentation: document EXPORT_OP_NOLOCKS
In-reply-to: <d8d68d1df6838c382799ce58345cfb5366585a8f.camel@kernel.org>
References: <>, <d8d68d1df6838c382799ce58345cfb5366585a8f.camel@kernel.org>
Date: Thu, 22 Jan 2026 09:47:41 +1100
Message-id: <176903566115.16766.12892778448343562390@noble.neil.brown.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_144812_579575_12E845EF 
X-CRM114-Status: GOOD (  30.76  )
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
Reply-To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 21 Jan 2026, Jeff Layton wrote:
> On Wed, 2026-01-21 at 20:58 +1100, NeilBrown wrote:
> > On Wed, 21 Jan 2026, Jeff Layton wrote:
> > > On Tue, 2026-01-20 at 09:12 -0500, Jeff Layton wrote:
> > > > On Tue, 2026-01-20 at 08:20 -0500, Jeff Layton wrote:
> > > > > On Mon, 2026-01-19 at 23:44 -0800, Christoph Hellwig wrote:
> > > > > > On Mon, Jan 19, 2026 at 11:26:18AM -0500, Jeff Layton wrote:
> > > > > > > +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Some
> > > > > > > +    filesystems cannot properly support file locking as implemented by
> > > > > > > +    nfsd. A case in point is reexport of NFS itself, which can't be done
> > > > > > > +    safely without coordinating the grace period handling. Other clustered
> > > > > > > +    and networked filesystems can be problematic here as well.
> > > > > > 
> > > > > > I'm not sure this is very useful.  It really needs to document what
> > > > > > locking semantics nfs expects, because otherwise no reader will know
> > > > > > if they set this or not.
> > > > > 
> > > > > Fair point. I'll see if I can draft something better. Suggestions
> > > > > welcome.
> > > > 
> > > > How about this?
> > > > 
> > > > +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Filesystems
> > > > +    that want to support locking over NFS must support POSIX file locking
> > > > +    semantics and must handle lock recovery requests from clients after a
> > > > +    reboot. Most local disk, RAM, or pseudo-filesystems use the generic POSIX
> > > > +    locking support in the kernel and naturally provide this capability. Network
> > > > +    or clustered filesystems usually need special handling to do this properly.
> > > 
> > > Even better, I think?
> > > 
> > > +
> > > +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Filesystems
> > > +    that want to support locking over NFS must support POSIX file locking
> > > +    semantics. When the server reboots, the clients will issue requests to
> > > +    recover their locks, which nfsd will issue to the filesystem as new lock
> > > +    requests. Those must succeed in order for lock recovery to work. Most
> > > +    local disk, RAM, or pseudo-filesystems use the generic POSIX locking
> > > +    support in the kernel and naturally provide this capability. Network or
> > > +    clustered filesystems usually need special handling to do this properly.
> > > +    Set this flag on filesystems that can't guarantee the proper semantics
> > > +    (e.g. reexported NFS).
> > 
> > I think this is quite thorough, which it good ...  maybe too good :-) It
> > reminds me that for true NFS compatibility the fs shouldn't allow local
> > locks (or file opens!) until the grace period has passed.  I don't think
> > any local filesystems enforce that - it would have to be locks.c that
> > does I expect.  I doubt there would be much appetite for doing that
> > though.
> > 
> 
> Yeah, I don't see us ever doing that. It'd be a tricky chicken-and-egg
> problem, given the demand-driven way that the mountd upcalls work
> today. We don't even know that anything is exported until something
> asks for it.

statd keeps state in /var/lib/nfs/sm, and nfsd keeps v4 state elsewhere
in /var/lib/nfs.  This state effectively records if any NFS client might
try to recover a lock.
I think the v4 state is granular enough to identify the filesystem.
lockd could be enhanced to use the same state I suspect.

We would need to generalise that state and load it at mount time and
block new state creation accordingly.

i.e. this would have to be a vfs-level thing which nfsd makes use of.

Possibly, but there are other things better worth our time.

NeilBrown


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
