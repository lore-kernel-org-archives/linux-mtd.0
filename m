Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A842EC001B0
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 17:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OZC0lCeJmBWEcFEe1tJkqBNpddMTDnGommzuRMT8eM=; b=rulwHIQzb9C3zk
	jr/Y/Fw7f5ABobeKRA6WAHU6n8Tg9IaQ2sUlXg8DcBY4UxJrb0ci2/1zx8a3SVzTlRMiqN9Kvdk7E
	nRCtDoY24WpdUXCypb1O8SvQJfWd4I1Il8HkBF2DGZDAoQ6Cv3hgCfq587afQ0VYMLHOHilzRR+4D
	ynEfikzooQjAJB5IDU75dfxXIQx5AIycD4fCRloFFKwKfE223MHCzR29WbFmicMe8tF8X+jqQUih9
	ybj9H192kmiWfK2I8XTD63f1wT8DQARIhrweHkK0VziC9uZuSHVAn0oOKbmBzVfIinsLEYCErdzoL
	/SO/79R0GOggcfhR3BPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTnEP-005YJk-1i;
	Wed, 09 Aug 2023 17:44:25 +0000
Received: from mail.parknet.co.jp ([210.171.160.6])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTnEM-005YHs-0n;
	Wed, 09 Aug 2023 17:44:24 +0000
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id B41832055FA5;
	Thu, 10 Aug 2023 02:44:18 +0900 (JST)
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id 379HiHKW223321
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 02:44:18 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
	by devron.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id 379HiHXo222009
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 02:44:17 +0900
Received: (from hirofumi@localhost)
	by devron.myhome.or.jp (8.17.2/8.17.2/Submit) id 379HiApg221995;
	Thu, 10 Aug 2023 02:44:10 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Jeff Layton <jlayton@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        Eric Van Hensbergen
 <ericvh@kernel.org>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique
 Martinet <asmadeus@codewreck.org>,
        Christian Schoenebeck
 <linux_oss@crudebyte.com>,
        David Howells <dhowells@redhat.com>,
        Marc
 Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>,
        Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
        Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
        Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
        Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>,
        Chao Yu <chao@kernel.org>,
        Yue Hu
 <huyue2@gl0jj8bn.sched.sma.tdnsstic1.cn>,
        Jeffle Xu
 <jefflexu@linux.alibaba.com>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Andreas Dilger
 <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>, Miklos
 Szeredi <miklos@szeredi.hu>,
        Bob Peterson <rpeterso@redhat.com>,
        Andreas
 Gruenbacher <agruenba@redhat.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Tejun Heo <tj@kernel.org>,
        Trond Myklebust
 <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Mark
 Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
        Joseph Qi
 <joseph.qi@linux.alibaba.com>,
        Mike Marshall <hubcap@omnibond.com>,
        Martin Brandenburg <martin@omnibond.com>,
        Luis Chamberlain
 <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>, Iurii Zaikin
 <yzaikin@google.com>,
        Steve French <sfrench@samba.org>, Paulo Alcantara
 <pc@manguebit.com>,
        Ronnie Sahlberg <ronniesahlberg@gmail.com>,
        Shyam
 Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
        Sergey
 Senozhatsky <senozhatsky@chromium.org>,
        Richard Weinberger
 <richard@nod.at>,
        Hans de Goede <hdegoede@redhat.com>, Hugh Dickins
 <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Amir
 Goldstein <amir73il@gmail.com>,
        "Darrick J. Wong" <djwong@kernel.org>,
        Benjamin Coddington <bcodding@redhat.com>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        v9fs@lists.linux.dev, linux-afs@lists.infradead.org,
        linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
        codalist@telemann.coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
        linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
        linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
        linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
        ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        linux-mtd@lists.infradead.org, linux-mm@kvack.org,
        linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v7 05/13] fat: make fat_update_time get its own timestamp
In-Reply-To: <2cb998ff14ace352a9dd553e82cfa0aa92ec09ce.camel@kernel.org> (Jeff
	Layton's message of "Wed, 09 Aug 2023 12:30:52 -0400")
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
	<20230807-mgctime-v7-5-d1dec143a704@kernel.org>
	<87msz08vc7.fsf@mail.parknet.co.jp>
	<52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
	<878rak8hia.fsf@mail.parknet.co.jp>
	<20230809150041.452w7gucjmvjnvbg@quack3>
	<87v8do6y8q.fsf@mail.parknet.co.jp>
	<2cb998ff14ace352a9dd553e82cfa0aa92ec09ce.camel@kernel.org>
Date: Thu, 10 Aug 2023 02:44:10 +0900
Message-ID: <87leek6rh1.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_104422_517045_178D6993 
X-CRM114-Status: GOOD (  19.96  )
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

Jeff Layton <jlayton@kernel.org> writes:

> On Thu, 2023-08-10 at 00:17 +0900, OGAWA Hirofumi wrote:
>> Jan Kara <jack@suse.cz> writes:

[...]

> My mistake re: lazytime vs. relatime, but Jan is correct that this
> shouldn't break anything there.

Actually breaks ("break" means not corrupt fs, means it breaks lazytime
optimization). It is just not always, but it should be always for some
userspaces.

> The logic in the revised generic_update_time is different because FAT is
> is a bit strange. fat_update_time does extra truncation on the timestamp
> that it is handed beyond what timestamp_truncate() does.
> fat_truncate_time is called in many different places too, so I don't
> feel comfortable making big changes to how that works.
>
> In the case of generic_update_time, it calls inode_update_timestamps
> which returns a mask that shows which timestamps got updated. It then
> marks the dirty_flags appropriately for what was actually changed.
>
> generic_update_time is used across many filesystems so we need to ensure
> that it's OK to use even when multigrain timestamps are enabled. Those
> haven't been enabled in FAT though, so I didn't bother, and left it to
> dirtying the inode in the same way it was before, even though it now
> fetches its own timestamps from the clock. Given the way that the mtime
> and ctime are smooshed together in FAT, that seemed reasonable.
>
> Is there a particular case or flag combination you're concerned about
> here?

Yes. Because FAT has strange timestamps that different granularity on
disk . This is why generic time truncation doesn't work for FAT.

Well anyway, my concern is the only following part. In
generic_update_time(), S_[CM]TIME are not the cause of I_DIRTY_SYNC if
lazytime mode.

-	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
+	if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && inode_maybe_inc_iversion(inode, false))
		dirty_flags |= I_DIRTY_SYNC;

If reverted this part to check only S_VERSION, I'm fine.

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
