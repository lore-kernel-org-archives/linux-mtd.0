Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45BFC6FA8F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 00:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61CdK657o/S7+Vm6EwiDpdaY+4jGOuiDOjMO6nPtiV0=; b=CWUP02X8ZG7Gl4
	7yhH5+zJQOWv3oxwiieRQ0j1NwXumdNPPt28M/1+flWk0X8yJZSMFQ1jtITwRtZpI+8ZFsC3HgcxF
	oC+njKzItUnmyxQerlGL9HIzvlaLbsITEfGRny/BnC+SJIzQqDpWpK/BWQc5Jzl8wM1yKhUqIMz+l
	Vu3xN+4Vydf1S/rzg0pCQBFKBw/7iuQqWSKCAtWPkHPTZ8MzjbBcgq4emjkSKvB3PahmjkDTfVSho
	mVGRYwOBfh/hFu33ILQB7pfLJRFVCWL2zqBik4pl1FyvQtI0XLSkxXuEGwMyTI0c/qCXNlbfdwIR2
	mDlAFwQL+6BvDAxfkyPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb9JC-00CWed-03;
	Wed, 30 Aug 2023 00:43:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb9J8-00CWdZ-0U;
	Wed, 30 Aug 2023 00:43:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2110C61BB9;
	Wed, 30 Aug 2023 00:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A58C433CC;
	Wed, 30 Aug 2023 00:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693356218;
	bh=LyIf2T4m7Z+aGoOTC20QhjEHya5KDco7uKHcToK2QN0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IsIDlNRfFegBQz5apXf9Q9gjAuC8RqtGng+nYfYjX0S5SJxWLKbkP/MogQRo+SLWh
	 08nrxChiobBJGOdvi1cvZ9Cxb2Pii/+6mcjLXiRCfGelk5Fzb7nFOM5cN1DYFxC+lb
	 K0+wyy4lvPV7hwkO6kEPEPBXJN5ToQ7LqZEmRRmYaASuIjGr2KolOsqcxXfv9z9AFT
	 U+YvwKGFpKZQuYKrSPBrKqS32L3Y2d5AV2LqhVdm8HiFMosr5io8ASM2xgBUjx2M+9
	 p73bg3Y2GD+ffVCVZHTAzgHK5yijHsVB4GOG1GW7sSKXaED0tZT4jOsD9cxCZCytpG
	 axe3lD1uk8SPA==
Message-ID: <1005e30582138e203a99f49564e2ef244b8d56aa.camel@kernel.org>
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
Date: Tue, 29 Aug 2023 20:43:31 -0400
In-Reply-To: <20230830000221.GB3390869@ZenIV>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
	 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
	 <20230829224454.GA461907@ZenIV>
	 <e1c4a6d5001d029548542a1f10425c5639ce28e4.camel@kernel.org>
	 <20230830000221.GB3390869@ZenIV>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_174342_275601_A484C1D1 
X-CRM114-Status: GOOD (  31.45  )
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

On Wed, 2023-08-30 at 01:02 +0100, Al Viro wrote:
> On Tue, Aug 29, 2023 at 06:58:47PM -0400, Jeff Layton wrote:
> > On Tue, 2023-08-29 at 23:44 +0100, Al Viro wrote:
> > > On Tue, Jul 25, 2023 at 10:58:14AM -0400, Jeff Layton wrote:
> > > > generic_fillattr just fills in the entire stat struct indiscriminately
> > > > today, copying data from the inode. There is at least one attribute
> > > > (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> > > > and we're looking at adding more with the addition of multigrain
> > > > timestamps.
> > > > 
> > > > Add a request_mask argument to generic_fillattr and have most callers
> > > > just pass in the value that is passed to getattr. Have other callers
> > > > (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> > > > STATX_CHANGE_COOKIE into generic_fillattr.
> > > 
> > > Out of curiosity - how much PITA would it be to put request_mask into
> > > kstat?  Set it in vfs_getattr_nosec() (and those get_file_..._info()
> > > on smbd side) and don't bother with that kind of propagation boilerplate
> > > - just have generic_fillattr() pick it there...
> > > 
> > > Reduces the patchset size quite a bit...
> > 
> > It could be done. To do that right, I think we'd want to drop
> > request_mask from the ->getattr prototype as well and just have
> > everything use the mask in the kstat.
> > 
> > I don't think it'd reduce the size of the patchset in any meaningful
> > way, but it might make for a more sensible API over the long haul.
> 
> ->getattr() prototype change would be decoupled from that - for your
> patchset you'd only need the field addition + setting in vfs_getattr_nosec()
> (and possibly in ksmbd), with the remainders of both series being
> independent from each other.
> 
> What I suggest is
> 
> branchpoint -> field addition (trivial commit) -> argument removal
> 		|
> 		V
> your series, starting with "use stat->request_mask in generic_fillattr()"
> 
> Total size would be about the same, but it would be easier to follow
> the less trivial part of that.  Nothing in your branch downstream of
> that touches any ->getattr() instances, so it should have no
> conflicts with the argument removal side of things.

The only problem with this plan is that Linus has already merged this.
I've no issue with adding the request_mask to the kstat and removing it
as a separate parameter elsewhere, but I think we'll need to do it on
top of what's already been merged.
-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
