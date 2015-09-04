Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXpcu-0000gH-12
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2015 11:57:53 +0000
Received: by wicfx3 with SMTP id fx3so15426807wic.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2015 04:57:29 -0700 (PDT)
From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>,
 Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Subject: [PATCH 0/5] Pass xattr handler to xattr handler operations
Date: Fri,  4 Sep 2015 13:57:17 +0200
Message-Id: <1441367842-25079-1-git-send-email-agruenba@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here are some xattr cleanups centered around passing struct xattr_handler down
to the xattr handler operations.  Please review.

Thanks,
Andreas

Andreas Gruenbacher (5):
  ubifs: Remove unused "security.*" xattr handler
  hfsplus: Remove unused xattr handler list operations
  9p: Simplify the xattr handlers
  xattr handlers: Pass handler to operations instead of flags
  xattr handlers: Some simplifications

 fs/9p/Makefile               |  5 +--
 fs/9p/acl.c                  | 59 ++++++--------------------------
 fs/9p/xattr.c                | 42 +++++++++++++++++++++++
 fs/9p/xattr.h                |  3 --
 fs/9p/xattr_security.c       | 80 -------------------------------------------
 fs/9p/xattr_trusted.c        | 80 -------------------------------------------
 fs/9p/xattr_user.c           | 80 -------------------------------------------
 fs/ext2/xattr.c              |  2 +-
 fs/ext2/xattr_security.c     |  9 +++--
 fs/ext2/xattr_trusted.c      |  9 +++--
 fs/ext2/xattr_user.c         |  9 +++--
 fs/ext4/xattr.c              |  2 +-
 fs/ext4/xattr_security.c     |  9 +++--
 fs/ext4/xattr_trusted.c      |  9 +++--
 fs/ext4/xattr_user.c         |  9 +++--
 fs/f2fs/xattr.c              | 46 ++++++++++++-------------
 fs/gfs2/xattr.c              |  9 +++--
 fs/hfsplus/xattr.c           | 17 +++-------
 fs/hfsplus/xattr_security.c  | 17 +++-------
 fs/hfsplus/xattr_trusted.c   | 17 +++-------
 fs/hfsplus/xattr_user.c      | 17 +++-------
 fs/jffs2/security.c          |  9 +++--
 fs/jffs2/xattr.c             |  4 +--
 fs/jffs2/xattr_trusted.c     |  8 +++--
 fs/jffs2/xattr_user.c        |  9 +++--
 fs/nfs/nfs4proc.c            | 18 ++++++----
 fs/ocfs2/xattr.c             | 27 ++++++++++-----
 fs/posix_acl.c               | 22 ++++++------
 fs/reiserfs/xattr.c          | 11 +++---
 fs/reiserfs/xattr_security.c |  8 +++--
 fs/reiserfs/xattr_trusted.c  |  8 +++--
 fs/reiserfs/xattr_user.c     |  8 +++--
 fs/squashfs/xattr.c          | 81 ++++++++++++++++----------------------------
 fs/ubifs/super.c             |  1 -
 fs/ubifs/ubifs.h             |  1 -
 fs/ubifs/xattr.c             | 40 ----------------------
 fs/xattr.c                   | 10 +++---
 fs/xfs/xfs_xattr.c           |  8 +++--
 include/linux/xattr.h        |  9 ++---
 39 files changed, 259 insertions(+), 553 deletions(-)
 delete mode 100644 fs/9p/xattr_security.c
 delete mode 100644 fs/9p/xattr_trusted.c
 delete mode 100644 fs/9p/xattr_user.c

-- 
2.4.3
