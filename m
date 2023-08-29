Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D81C83F12
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 22:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwGS793ZwDwaOy7eVTGj3pkuJa+vYTSoxMURgJjGxX0=; b=zJUzk95GzMjrOR
	zSdLGjoRkf+rTIRLVE821h3KUejixj4bIt4ucRAl5BrJThnJl9BcXcg/QDEOPJm8Y9uPMjIOgPh/S
	p5edfsdayVZr9HVl9u9R3BGgsNj6qUIWy1RKyE3SK+00F8w82M61iw+xTX57OgTN1rl9NpsfE+n+n
	FmQcwA7YpYk5QuzbNoRI6+m34548QTzWBRCsxO13Ed93tLnRY3rwWVBYDwn9tpjzFf1i0WbFIi8cH
	aTuhju44w2a1aonvtPqP60dxhyMvAH6fipvCbKmeDA1NbWAl9WripOVodGXSRBdv3sGG0oKYZpsEE
	00wFiJK15eQwdy62y+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb7fm-00CQ1y-31;
	Tue, 29 Aug 2023 22:58:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb7fk-00CQ1H-1C;
	Tue, 29 Aug 2023 22:58:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C592563D06;
	Tue, 29 Aug 2023 22:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FABC433C7;
	Tue, 29 Aug 2023 22:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693349935;
	bh=rn2r8LG5beXDEpNUXXmAsWk7K7Z6B0SkbbGrSUfCikA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UJJSRKRH7LTjcnDdUPp7RtBE/dB7QJhjeEB1YQbMKrKaYzMACob4EBI4SsR0sy5Ye
	 mt7wmIqsOOWPvL2AjZ5YQtEhH9AU5fAVtL4UeL7OEXz9q6ZHDNk6+YIdzODX8+wqil
	 jlsqG5Nirzs8oHVVRgwIrBWk+tU4uj4vEMyBjQFrJmh/cCsnnPwHApt0qQlEh4VPoV
	 fx7tHB0NGyHo231wK83vtI9suH/0L3cn9cyGLY9db8p4Yc0AKTTsIBFPHCXTIrOvy6
	 YzP3/2IXTyd/Lvsgr1kAOQEzWJjTRoatnNjA657yXZ2FiJLFoy7sfB1K1HWwMGB4Ek
	 xBWdtuLvgMoog==
Message-ID: <e1c4a6d5001d029548542a1f10425c5639ce28e4.camel@kernel.org>
Subject: Re: [PATCH v6 1/7] fs: pass the request_mask to generic_fillattr
From: Jeff Layton <jlayton@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov
 <lucho@ionkov.net>,  Dominique Martinet <asmadeus@codewreck.org>, Christian
 Schoenebeck <linux_oss@crudebyte.com>, David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef
 Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,  Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>,  coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>,
 Gao Xiang <xiang@kernel.org>,  Chao Yu <chao@kernel.org>, Yue Hu
 <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,  Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara
 <jack@suse.com>,  Theodore Ts'o <tytso@mit.edu>, Andreas Dilger
 <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA
 Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos Szeredi <miklos@szeredi.hu>,
 Bob Peterson <rpeterso@redhat.com>, Andreas Gruenbacher
 <agruenba@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tejun Heo <tj@kernel.org>, Christian Brauner <brauner@kernel.org>, Trond
 Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker
 <anna@kernel.org>,  Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook
 <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>,  Steve French
 <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg
 <lsahlber@redhat.com>,  Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey
 <tom@talpey.com>, Sergey Senozhatsky <senozhatsky@chromium.org>,  Richard
 Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, Hugh
 Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 Anthony Iliopoulos <ailiop@suse.com>, v9fs@lists.linux.dev,
 linux-kernel@vger.kernel.org,  linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org,  ceph-devel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
  ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, linux-xfs@vger.kernel.org
Date: Tue, 29 Aug 2023 18:58:47 -0400
In-Reply-To: <20230829224454.GA461907@ZenIV>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
	 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
	 <20230829224454.GA461907@ZenIV>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_155856_496986_6B77CB03 
X-CRM114-Status: GOOD (  20.43  )
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

On Tue, 2023-08-29 at 23:44 +0100, Al Viro wrote:
> On Tue, Jul 25, 2023 at 10:58:14AM -0400, Jeff Layton wrote:
> > generic_fillattr just fills in the entire stat struct indiscriminately
> > today, copying data from the inode. There is at least one attribute
> > (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> > and we're looking at adding more with the addition of multigrain
> > timestamps.
> > 
> > Add a request_mask argument to generic_fillattr and have most callers
> > just pass in the value that is passed to getattr. Have other callers
> > (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> > STATX_CHANGE_COOKIE into generic_fillattr.
> 
> Out of curiosity - how much PITA would it be to put request_mask into
> kstat?  Set it in vfs_getattr_nosec() (and those get_file_..._info()
> on smbd side) and don't bother with that kind of propagation boilerplate
> - just have generic_fillattr() pick it there...
> 
> Reduces the patchset size quite a bit...

It could be done. To do that right, I think we'd want to drop
request_mask from the ->getattr prototype as well and just have
everything use the mask in the kstat.

I don't think it'd reduce the size of the patchset in any meaningful
way, but it might make for a more sensible API over the long haul.
-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
