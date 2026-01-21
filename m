Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFFFC44501
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 09:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-id:Date:References:
	In-reply-to:Subject:Cc:To:From:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+QOQZGj6HdaULzF3nB+JfUOiLVED5X7312CNTb8N60=; b=yXHoSqSOTg4hRz
	5x83FDxt8GQQc1dQ4Ykv9IwaP0y4dw2tJp9alZb2VM2dPrSXy/GB76pw7h1ig+jOP6REh8XvLIqhM
	PA2T6Pl0Ucui9p9VU6zo8uZe/hvhFmYknWST6mjRvpyQaxI/9x31Ma4Y3f1CD2ZSlxcxyEexc1Y3m
	k0zbZ5atJD874Y269V+k9od6bhp1NazMVnjSV2I4SLrbtFKlG5e7EthNY68EAyhWCOWceeJnLqhWB
	MXWpwvay/1YlYkyNed2YYFUT43QOjGg4NDt3n419wwfAdbVmyEpmerGyzhXBVOvBNCc6MOEAAkRWl
	4LiUMDXHaDfrIHeYC2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUz0-00000005E9c-31W8;
	Wed, 21 Jan 2026 09:58:38 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUyy-00000005E97-0vgL
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jan 2026 09:58:37 +0000
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailflow.stl.internal (Postfix) with ESMTP id 451251300E5F;
	Wed, 21 Jan 2026 04:58:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Wed, 21 Jan 2026 04:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1768989512; x=1768996712; bh=SJFJMNOM7awUTkwMl4hIh6WDIUWbLKvHg9W
	hRsfaf2c=; b=u/+XlkNJ5V8C5rphAsXf4CRGr0/yY85HzlfIyvdWMIOWXjkQsZL
	hepFVBVO1TGy2MoYqvQ7u24GdOhaMOyN4g29b2duuwJtKYPuWULecyd+MTKRrnGd
	bn7kIcDBwiSCpdoLSUnyYvsgKKeCh1a1dboVMEHTkywI3/WnmYN3GCNjLf2VRDaS
	mz10UPqJbOR5v9xAcZGKcH9zcUO4BUeKjYMDUBeMoVj1ZC1ebbxPD9BY7qRT3PmC
	Gwn3pbkB6fVbCnilSsQt/utzs+2skAgouKRc4vJtaZN+evNBodtN4J3cJ2k+j3M7
	oBRpH6fOpkxc7s+UTVvfrzOozmRmPn80CPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768989512; x=
	1768996712; bh=SJFJMNOM7awUTkwMl4hIh6WDIUWbLKvHg9WhRsfaf2c=; b=K
	sgHoYFPnq/EWy/oXN2LK4RtBbAtHJ8+lCm2EZp7IwyvLgqOVBaJq5V/djUpulah9
	UZ0lnTRqDqpfgEWG2bwPTyIhf+OkxtllFSCCXe8SSJx40Mx4bOPORKRjQmxip1hr
	Hb36gWUn1deRpKO7vBAa/3uHu4mrPFLZ6AyHhEPvNlMxLsivck+jYIJfvJxUK3BQ
	GCt+NV5AdMTQ9cbmkjq9uYNtDwzHhARKjkpF8i9scEBGI7u7PYYWuik1qWV+s+zq
	gG23IiKM5UnKmkw6iHYCl3/e/WqQdwf43M3cAuoYqYAcuk/YbwF3Gb61tiHUVMiD
	2n2dL6Sl4cIXHxXek/iYQ==
X-ME-Sender: <xms:Q6NwadpokZr4zUG9s3yceH_yGV-75ZmEqaCw1iMpcdO-7P_bqHmGqA>
    <xme:Q6NwaYq2ihpc8yBbDG1PVuLPaKeWe_7VoQt8GacEUU17dyYTuVoNw4BKpnWFQRT-4
    Xg1led3wwge8NMYQ6_6srDDet02RciO8TD0ld2euMF5b0iDjA>
X-ME-Received: <xmr:Q6NwaW9rCqB8cw6Q2kJ-ijrsI9kO3BQ343rhJ_gbt5YTx-pU0BQLrEVYYLR7F-XOpzmXxNsMMi5DLL_oShZmUtCCtUc08foOiDNqnALDYUDz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedvleekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:Q6NwaXP_r1AtxnebpNkWh0ccYaXxkWUlkdex3I21_ko1xomksZ4zhQ>
    <xmx:Q6Nwadv_3MuYvlxZn64JB2BnqApISdsMFoP98SEqbGk-2TZ7AkLEZw>
    <xmx:Q6NwaZ3nfLV93Vtn6SIHnsAzPzQFUB9XxFmo0He_Kd-2FrGyOzYc5Q>
    <xmx:Q6NwaXZBKV6NDhrR9j2xzoxiBc-32Bgplw5GGYFI5LL9zipce5X4Yg>
    <xmx:SKNwaTXSyiSStct1wtcBjcLkfs8d66i92fMj1g3ySdmDH9qv7jDxxYWO>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 04:58:08 -0500 (EST)
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
In-reply-to: <2ed97731c54ef130ea58861a91c80dacd785de9a.camel@kernel.org>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>,
 <20260119-exportfs-nfsd-v2-1-d93368f903bd@kernel.org>,
 <aW8yV6v8ZDiynOUm@infradead.org>,
 <9b64bed72e43d0bf24e9b1e3bc770c4a87082762.camel@kernel.org>,
 <707f08e114bf603caf7de020bb630d5477e86bca.camel@kernel.org>,
 <2ed97731c54ef130ea58861a91c80dacd785de9a.camel@kernel.org>
Date: Wed, 21 Jan 2026 20:58:06 +1100
Message-id: <176898948697.16766.1729756714812778707@noble.neil.brown.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_015836_344556_582CE923 
X-CRM114-Status: GOOD (  22.61  )
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
> On Tue, 2026-01-20 at 09:12 -0500, Jeff Layton wrote:
> > On Tue, 2026-01-20 at 08:20 -0500, Jeff Layton wrote:
> > > On Mon, 2026-01-19 at 23:44 -0800, Christoph Hellwig wrote:
> > > > On Mon, Jan 19, 2026 at 11:26:18AM -0500, Jeff Layton wrote:
> > > > > +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Some
> > > > > +    filesystems cannot properly support file locking as implemented by
> > > > > +    nfsd. A case in point is reexport of NFS itself, which can't be done
> > > > > +    safely without coordinating the grace period handling. Other clustered
> > > > > +    and networked filesystems can be problematic here as well.
> > > > 
> > > > I'm not sure this is very useful.  It really needs to document what
> > > > locking semantics nfs expects, because otherwise no reader will know
> > > > if they set this or not.
> > > 
> > > Fair point. I'll see if I can draft something better. Suggestions
> > > welcome.
> > 
> > How about this?
> > 
> > +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Filesystems
> > +    that want to support locking over NFS must support POSIX file locking
> > +    semantics and must handle lock recovery requests from clients after a
> > +    reboot. Most local disk, RAM, or pseudo-filesystems use the generic POSIX
> > +    locking support in the kernel and naturally provide this capability. Network
> > +    or clustered filesystems usually need special handling to do this properly.
> 
> Even better, I think?
> 
> +
> +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Filesystems
> +    that want to support locking over NFS must support POSIX file locking
> +    semantics. When the server reboots, the clients will issue requests to
> +    recover their locks, which nfsd will issue to the filesystem as new lock
> +    requests. Those must succeed in order for lock recovery to work. Most
> +    local disk, RAM, or pseudo-filesystems use the generic POSIX locking
> +    support in the kernel and naturally provide this capability. Network or
> +    clustered filesystems usually need special handling to do this properly.
> +    Set this flag on filesystems that can't guarantee the proper semantics
> +    (e.g. reexported NFS).

I think this is quite thorough, which it good ...  maybe too good :-) It
reminds me that for true NFS compatibility the fs shouldn't allow local
locks (or file opens!) until the grace period has passed.  I don't think
any local filesystems enforce that - it would have to be locks.c that
does I expect.  I doubt there would be much appetite for doing that
though.

Reviewed-by: NeilBrown <neil@brown.name>

Thanks,
NeilBrown

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
