Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2769AC001B0
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 22:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6cHSbpEA5MveQDmUL4Wtcc3JSCXKu9JA968kQ487YU=; b=w+RwcB3YyEiQQ3
	xO9RsKsdOkaxmNqIGYa6VGrWzWntjpWjJHsz9kPbusSWplMxwPKiqylHzJ6R6GWRZYZtU5+MKrNbL
	0NelhqMKlpflzi+0nDHpYjZp0t1aJKW1aqI+81L3SSYIVlUAF5KuDeFa+BQOvs0zstrx80Iu4qLLp
	vj4Pj7gso0Tp2yi0nUyx5ObcnCfyZFvXGSjc9FBNfEddVOBTyPRmu3L3NJVDGQouHs1ikRLVp6WX1
	QB+o7JU55Duft7Ap0Olza2Hd5zB++TXhPByg2dBC4d/tk2vWxTNP/+MMW7S8kyHeYz8+kfe5DECnA
	dGaLY7Pf9L+320TCeCBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrLC-005yBA-1s;
	Wed, 09 Aug 2023 22:07:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrL8-005y8D-1A;
	Wed, 09 Aug 2023 22:07:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C164F6142A;
	Wed,  9 Aug 2023 22:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A1FC433C8;
	Wed,  9 Aug 2023 22:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691618857;
	bh=Sbngo3UIZo2TJfFo7ktsW7U9FXdWGIk5Lt7H9K5XFM8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jLUEcluJ8QWu44nwg8FvEto5mxdSD6jhT4hkYGZFSvOuTab/uQF0xUgz8zLDtJscq
	 f+HBUBgdFJj3+Y2ejcBWfM2DahqOuHFBxu+LY+Hv0Ofoq0ohoPPQ6mfudIqZwl+oWN
	 pLNza58hUz5pcfryyZpEKO+0VcHneBut5CYMVVo+IlIVXRYDByI99w4/3LNaQTR8ZH
	 5Tcm+fOwhAMw+LBYRd9XcCm1AD2BTsoO11JuCHNeGAZ3X/S7nnQe6dSMtz75w2+y5t
	 1AyLcsRC7pto0A+XhqMGGaQoyj7sZyZ0q03rK2TphlgLtVEfD926pjyggGNcgTjePk
	 OQw0IGY/USDEA==
Message-ID: <e4cee2590f5cb9a13a8d4445e550e155d551670d.camel@kernel.org>
Subject: Re: [PATCH v7 05/13] fat: make fat_update_time get its own timestamp
From: Jeff Layton <jlayton@kernel.org>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Frank Sorenson
	 <sorenson@redhat.com>
Cc: Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Eric Van Hensbergen
 <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique
 Martinet <asmadeus@codewreck.org>, Christian Schoenebeck
 <linux_oss@crudebyte.com>, David Howells <dhowells@redhat.com>, Marc Dionne
 <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, Gao
 Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu
 <huyue2@gl0jj8bn.sched.sma.tdnsstic1.cn>, Jeffle Xu
 <jefflexu@linux.alibaba.com>,  Namjae Jeon <linkinjeon@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>,  Theodore
 Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk
 Kim <jaegeuk@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson
 <rpeterso@redhat.com>, Andreas Gruenbacher <agruenba@redhat.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker
 <anna@kernel.org>,  Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook
 <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>,  Steve French
 <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg
 <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Tom
 Talpey <tom@talpey.com>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>,
 Hugh Dickins <hughd@google.com>,  Andrew Morton
 <akpm@linux-foundation.org>, Amir Goldstein <amir73il@gmail.com>, "Darrick
 J. Wong" <djwong@kernel.org>, Benjamin Coddington <bcodding@redhat.com>, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 v9fs@lists.linux.dev, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org,  ceph-devel@vger.kernel.org,
 codalist@telemann.coda.cs.cmu.edu,  ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org,  linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,  cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-unionfs@vger.kernel.org,  linux-xfs@vger.kernel.org
Date: Wed, 09 Aug 2023 18:07:29 -0400
In-Reply-To: <87a5v06kij.fsf@mail.parknet.co.jp>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
	 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
	 <87msz08vc7.fsf@mail.parknet.co.jp>
	 <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
	 <878rak8hia.fsf@mail.parknet.co.jp>
	 <20230809150041.452w7gucjmvjnvbg@quack3>
	 <87v8do6y8q.fsf@mail.parknet.co.jp>
	 <2cb998ff14ace352a9dd553e82cfa0aa92ec09ce.camel@kernel.org>
	 <87leek6rh1.fsf@mail.parknet.co.jp>
	 <ccffe6ca3397c8374352b002fe01d55b09d84ef4.camel@kernel.org>
	 <87h6p86p9z.fsf@mail.parknet.co.jp>
	 <edf8e8ca3b38e56f30e0d24ac7293f848ffee371.camel@kernel.org>
	 <87a5v06kij.fsf@mail.parknet.co.jp>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_150738_505069_2CCC12A5 
X-CRM114-Status: GOOD (  20.08  )
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

On Thu, 2023-08-10 at 05:14 +0900, OGAWA Hirofumi wrote:
> Jeff Layton <jlayton@kernel.org> writes:
> 
> > When you say it "doesn't work the same", what do you mean, specifically?
> > I had to make some allowances for the fact that FAT is substantially
> > different in its timestamp handling, and I tried to preserve existing
> > behavior as best I could.
> 
> Ah, ok. I was misreading some.
> 
> inode_update_timestamps() checks IS_I_VERSION() now, not S_VERSION.  So,
> if adding the check of IS_I_VERSION() and (S_MTIME|S_CTIME|S_VERSION) to
> FAT?
> 
> With it, IS_I_VERSION() would be false on FAT, and I'm fine.
> 
> I.e. something like
> 
> 	if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && IS_I_VERSION(inode)
> 	    && inode_maybe_inc_iversion(inode, false))
>   		dirty_flags |= I_DIRTY_SYNC;
> 
> Thanks.

If you do that then the i_version counter would never be incremented.
But...I think I see what you're getting at.

Most filesystems that support the i_version counter have an on-disk
field for it. FAT obviously has no such thing. I suspect the i_version
bits in fat_update_time were added by mistake. FAT doesn't set
SB_I_VERSION so there's no need to do anything to the i_version field at
all.

Also, given that the mtime and ctime are always kept in sync on FAT,
we're probably fine to have it look something like this:

--------------------8<------------------
int fat_update_time(struct inode *inode, int flags) 
{ 
        int dirty_flags = 0;

        if (inode->i_ino == MSDOS_ROOT_INO) 
                return 0;

        fat_truncate_time(inode, NULL, flags);
        if (inode->i_sb->s_flags & SB_LAZYTIME)
                dirty_flags |= I_DIRTY_TIME;
        else
                dirty_flags |= I_DIRTY_SYNC;

        __mark_inode_dirty(inode, dirty_flags);
        return 0;
} 
--------------------8<------------------

...and we should probably do that in a separate patch in advance of the
update_time rework, since it's really a different change.

If you're in agreement, then I'll plan to respin the series with this
fixed and resend.

Thanks for being patient!
-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
