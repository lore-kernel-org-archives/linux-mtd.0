Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2C2C27C76
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8+Bv9BfaTu+pkfDWel8wgBDWDizSVDibmYL8wXJls5o=; b=nHWd5UYA0e9ODP
	un5w+GXmi8NMmzDh5kRyjNUkdYaVHWRkh1BBBBabUDoCTZronyhtT+tjhM4gFBZ1DWmzXW1d/mvj6
	UFhZTh8t79+KMvns9/V1ETWB2HmxOileb/yj/5v4YtZDhnbSzLAgX6UUzGT4bl4rTEqTkDh5otS+t
	bqYT6coLPvIGcMY8ANocuY4CzFc42X91TxyoJjXTTyQbCE+/nC4MY/GfR7zpDIfEK9ekn+z45UzM8
	5TWbJy1O9u+D8WXM5CfxKxm+G0M+1XN38MyAbEcgrA8na/nCPh0qrjMlhCOpZs72h3r55QlNewCFb
	vNxUOCJ88zGZSImpMdkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKdy6-007AR6-Vd; Wed, 25 Jan 2023 11:29:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKdy3-007AQX-CS
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2023 11:29:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0714B61356;
	Wed, 25 Jan 2023 11:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AAC2C433EF;
	Wed, 25 Jan 2023 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674646165;
	bh=iVepgeT7psmWqr/2L8LpCH4RngFmQJ2i/zddXU3Ybms=;
	h=From:Subject:Date:To:Cc:From;
	b=aa0adWk8JIHYbDKjUCphZ1mzhrcTx2e5m+zTBZn9obQWuMBhYiKhvxE/PfkC0DrMo
	 n+Ti2ja6VfjxgUnPOpsi1+/EmtHqmyra/AonZ5w9wjQlfzKpsP+4TOI050CJaL0N1y
	 bKz7YhLgOmOvqok9PjXvsoVl3tKqVYUbksPXEapn+w0KefS9YB16xUcTypEO9pAwIN
	 evQ3wG1KZlyA608u+IFmR08EX1UGoUJze8vveYRXvWqAxEv1eQ5rc5zD6Fc879yXFq
	 13JMMXTEhD0lFVC6szsgPPomAG4klotXLnPAg8gEVmP0MH1tcrAZMyEp+bDrceHz66
	 q2f2/uwZQY7jw==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH 00/12] acl: remove remaining posix acl handlers
Date: Wed, 25 Jan 2023 12:28:45 +0100
Message-Id: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG4S0WMC/x2O0QqDMBAEf0XuuSeaVgj9ldKHmGw0YGO5UxHEf
 2/s47DMsAcpJEHpWR0k2JKmORdobxX50eUBnEJhMo25N63pOCo7P7HgM2/gAbn4nne3LMJFCBN
 E+eEjgu06G6ylkuqdgntx2Y9XLGodV0VdQtf6FcS0/0+83uf5A07KJIqUAAAA
To: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Seth Forshee <sforshee@kernel.org>, 
 "Christian Brauner (Microsoft)" <brauner@kernel.org>, 
 linux-erofs@lists.ozlabs.org, Jan Kara <jack@suse.com>, 
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com, 
 reiserfs-devel@vger.kernel.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3964; i=brauner@kernel.org;
 h=from:subject:message-id; bh=iVepgeT7psmWqr/2L8LpCH4RngFmQJ2i/zddXU3Ybms=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMSRfFJq42SCo7mej0syzO7/VS69Ps21sFO48f9znuHr/fZEX
 p52lO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYSeIbhn+X/3zmPrKtsko21fh3Smv
 5k/WvP2Uo6Sw92TuXesanV+BYjw7wCO68bLxsFprMsyP59RaXIcbL7hMBFnntnmxRL2pSJsAIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_032927_551394_F0287836 
X-CRM114-Status: GOOD (  14.49  )
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

Hey everyone,

after we finished the introduction of the new posix acl api last cycle
we still left the generic POSIX ACL xattr handler around for two
reasons. First, because a few filesystems relied on the ->list() method
of the generic POSIX ACL xattr handlers in their ->listxattr() inode
operation. Second, during inode initalization in inode_init_always() the
registered xattr handlers in sb->s_xattr are used to raise IOP_XATTR in
inode->i_opflags.

With the removal of the legacy POSIX ACL handlers it is at least
possible for a filesystem to only implement POSIX ACLs but no other
xattrs. If that were to happen we would miss to raise IOP_XATTR because
sb->s_xattr would be NULL.

Fix these things and then get rid of the misleading and effectively
already unused generic POSIX ACL handlers.

For most filesystems it is a trivial removal of the generic POSIX ACL
handlers. Only for erofs, ext2, ext4, f2fs, jffs2, reiserfs, oc2fs the
handler is used but rather easy to fix.

All filesystems with reasonable integration into xfstests have been
tested with:

        ./check -g acl,attr,cap,idmapped,io_uring,perms,unlink

All tests pass without regression on xfstests for-next branch.

Since erofs doesn't have integration into xfstests yet afaict I have
tested it with the testuite available in erofs-utils. They also all pass
without any regressions.

This branch depends on [1] which hopefully should be merged soon and can
be pulled from [2] which already includes [1] so it's easy to test and
compile.

With this all remnants of the old POSIX ACL xattr handling will be gone.

Thanks!
Christian

[1]: https://lore.kernel.org/lkml/20230125100040.374709-1-brauner@kernel.org
[2]: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git tags/fs.acl.remove.generic.xattr.handlers.v1

Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
---
Christian Brauner (12):
      xattr: simplify listxattr helpers
      xattr, posix acl: add listxattr helpers
      xattr: remove unused argument
      fs: drop unused posix acl handlers
      erofs: drop posix acl handlers
      ext2: drop posix acl handlers
      ext4: drop posix acl handlers
      f2fs: drop posix acl handlers
      jffs2: drop posix acl handlers
      ocfs2: drop posix acl handlers
      reiserfs: drop posix acl handlers
      acl: remove posix acl handlers

 fs/9p/xattr.c                   |   4 --
 fs/btrfs/xattr.c                |   4 --
 fs/ceph/xattr.c                 |   4 --
 fs/cifs/xattr.c                 |   4 --
 fs/ecryptfs/inode.c             |   4 --
 fs/erofs/xattr.c                |  49 ++++++++++++----
 fs/erofs/xattr.h                |  21 -------
 fs/ext2/xattr.c                 |  60 +++++++++++--------
 fs/ext4/xattr.c                 |  71 +++++++++++++----------
 fs/f2fs/xattr.c                 |  63 ++++++++++++--------
 fs/gfs2/xattr.c                 |   2 -
 fs/jffs2/xattr.c                |  42 +++++++-------
 fs/jfs/xattr.c                  |   4 --
 fs/nfs/nfs3_fs.h                |   1 -
 fs/nfs/nfs3acl.c                |   6 --
 fs/nfs/nfs3super.c              |   3 -
 fs/nfsd/nfs4xdr.c               |   3 +-
 fs/ntfs3/xattr.c                |   4 --
 fs/ocfs2/xattr.c                |  41 +++++++------
 fs/orangefs/xattr.c             |   2 -
 fs/overlayfs/super.c            |   8 ---
 fs/posix_acl.c                  |  20 -------
 fs/reiserfs/xattr.c             |  38 ++++++------
 fs/xattr.c                      | 124 ++++++++++++++++++++--------------------
 fs/xfs/xfs_xattr.c              |   4 --
 include/linux/posix_acl_xattr.h |   6 +-
 include/linux/xattr.h           |   8 ++-
 mm/shmem.c                      |   4 --
 28 files changed, 290 insertions(+), 314 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230125-fs-acl-remove-generic-xattr-handlers-4cfed8558d88


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
