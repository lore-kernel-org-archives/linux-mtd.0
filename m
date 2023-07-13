Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EFCC001E0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 23:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qx3CvcqvVINVuXbCS4b1xpOai45FnuePX1ee47pKTUc=; b=KNsnK1Di9VsMGr
	BxA+i0CXHRjZt4noBp4NKoqQABVd+PFVax7POvqutCpOzQ06KOnUdGUx3cqOtR6jxWXSnQ/iwZspZ
	UvzOOa6CpmkntTGOleIotP/dBS2xaUCEaCPV/9BoeBrk2TOFOxJBn5AU+mKiI5oP3fg/9s60sj1rc
	vfn/LO/Tra1AbGGH4gKTJsdM7T1sKJP+SlqzEQZV1fKrdNU/KWPAeSoqtit/Orm+/U2D8/Ij9Bwhf
	jEhEW9silurBk6qa7C5kpqsy4CtLgzCqbwTyou9UhRh2JZ7VuveqAB2urx0c+OisTbarUkkBl6HLm
	WWCvgSd5b3vZdErSOvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK5Jm-004VX5-1V;
	Thu, 13 Jul 2023 23:01:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK5Jj-004VVd-2X;
	Thu, 13 Jul 2023 23:01:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 519AA61BB0;
	Thu, 13 Jul 2023 23:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC92CC433C7;
	Thu, 13 Jul 2023 23:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689289306;
	bh=o469Gn6TRoUgWK1yzrc9Tq+Zw/B6gpe2ALD+iBBNLtc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dmuulj7MQ5xrcZlRvkmqqt0cLhw9gHOygWjyV1GMrQh2qQIas328YpVrvgYa/9YlE
	 jdjzasvIwgr2pzbKhJ6bkYvRUPUJ7Cf222d3QWzBNDDOHRreW6B5jNpd7hZSqUP0DG
	 1om1BOfqMHiJVAzIrAkBkZ7yM8hkiudMOoj8eyWVmH/DEftijdI9AG0uCRfjjSpArl
	 vRWtCQtjZeUK6XAELF1K+qzyF9p42KVVOnsGhDho4Iisz00CdwAYHBxCcwNy70X3P4
	 ejK2Xi/B3UJqCd5vzE2APsFaUo7z38B+tdOnS4hwn6rB/d8Dd39Uv5VG/MGE7hJNYJ
	 1OevplbSpgwNg==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 13 Jul 2023 19:00:55 -0400
Subject: [PATCH v5 6/8] xfs: switch to multigrain timestamps
MIME-Version: 1.0
Message-Id: <20230713-mgctime-v5-6-9eb795d2ae37@kernel.org>
References: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
In-Reply-To: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
To: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@kernel.org>
Cc: Dave Chinner <david@fromorbit.com>, v9fs@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org, 
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, 
 linux-xfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=o469Gn6TRoUgWK1yzrc9Tq+Zw/B6gpe2ALD+iBBNLtc=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBksIIusPIfg6vbYZi6rm+r8gNys41rCFzK3/3ia
 PhemQOJxaiJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZLCCLgAKCRAADmhBGVaC
 FThOEACcN1l8TjhunRlKxfjl4GEZ1QeEwjtNX4gydoy2OgNjHxlnhXUZMCY77aPaf+2xc/lyobv
 SSRfjCTqzzl07bwmqkVIo3y7Dxq50Z45QXZK6iuErpWLxQrjjTiVuEtnmMRRLuu+5ZC8MNq74xP
 cQDdCkZZMe73bLkpfyCPFksXYk2bv+JK0B+CzboQyXxWRMjctEtcDAPG4JYms7znxF1dSXoVylL
 /J0KhIQ/r2ezXNSqhAMPT2r6o68iDUtaiUytMhVuc0W6TjfSeBLNDmKDnkzC3PKN996ImbU3ZIf
 b9SMQeCUPEp075x9xcKTdGaEUG1n5P9oJfoFKiV24GIHsQGpFrwdSqL0TygTRvcayvSudZTAzW4
 p72Ki0HJ0dZv94qlRvtNf2K69SVBBzryWi3A60MH2db12+d0IpOYFAd8U2R+0L4Oq+yUbcbSfmz
 W2m+cpeKx0IHdjswC4j0Z6FLkR10k+EDV8ekrW4hkiCtShHlCKR7NqQOevac0gCVYlpGY1SzZlz
 n2AzdLF7/bZeZMuQyjmso7Fa44qUoVkL89Xa9HEUbpMj8IYhxNGK7hy2jUfl2k45+Xtew7aOMFn
 jJQ+eCf7d2aslrHcY+jo6SqVZa88+8H4i8F5gVH9xF5kxLuy0AfSoJZuN7Q63Rb0/Rmi66tBkCi
 H+1guzkn1J2LjCw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_160147_910854_531A1687 
X-CRM114-Status: GOOD (  16.29  )
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

Enable multigrain timestamps, which should ensure that there is an
apparent change to the timestamp whenever it has been written after
being actively observed via getattr.

Also, anytime the mtime changes, the ctime must also change, and those
are now the only two options for xfs_trans_ichgtime. Have that function
unconditionally bump the ctime, and warn if XFS_ICHGTIME_CHG is ever not
set.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/xfs/libxfs/xfs_trans_inode.c | 6 +++---
 fs/xfs/xfs_iops.c               | 4 ++--
 fs/xfs/xfs_super.c              | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
index 0c9df8df6d4a..86f5ffce2d89 100644
--- a/fs/xfs/libxfs/xfs_trans_inode.c
+++ b/fs/xfs/libxfs/xfs_trans_inode.c
@@ -62,12 +62,12 @@ xfs_trans_ichgtime(
 	ASSERT(tp);
 	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
 
-	tv = current_time(inode);
+	/* If the mtime changes, then ctime must also change */
+	WARN_ON_ONCE(!(flags & XFS_ICHGTIME_CHG));
 
+	tv = inode_set_ctime_current(inode);
 	if (flags & XFS_ICHGTIME_MOD)
 		inode->i_mtime = tv;
-	if (flags & XFS_ICHGTIME_CHG)
-		inode_set_ctime_to_ts(inode, tv);
 }
 
 /*
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 3a9363953ef2..3f89ef5a2820 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -573,10 +573,10 @@ xfs_vn_getattr(
 	stat->gid = vfsgid_into_kgid(vfsgid);
 	stat->ino = ip->i_ino;
 	stat->atime = inode->i_atime;
-	stat->mtime = inode->i_mtime;
-	stat->ctime = inode_get_ctime(inode);
 	stat->blocks = XFS_FSB_TO_BB(mp, ip->i_nblocks + ip->i_delayed_blks);
 
+	fill_mg_cmtime(request_mask, inode, stat);
+
 	if (xfs_has_v3inodes(mp)) {
 		if (request_mask & STATX_BTIME) {
 			stat->result_mask |= STATX_BTIME;
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 818510243130..4b10edb2c972 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -2009,7 +2009,7 @@ static struct file_system_type xfs_fs_type = {
 	.init_fs_context	= xfs_init_fs_context,
 	.parameters		= xfs_fs_parameters,
 	.kill_sb		= kill_block_super,
-	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
+	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_MGTIME,
 };
 MODULE_ALIAS_FS("xfs");
 

-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
