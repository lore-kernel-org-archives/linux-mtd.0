Received: from mail.intenta.de ([178.249.25.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZC34-0001wu-E5
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2018 09:52:24 +0000
Date: Tue, 18 Dec 2018 10:51:59 +0100
From: Helmut Grohne <helmut.grohne@intenta.de>
To: David Woodhouse <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard.weinberger@gmail.com>
CC: Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v3 0/3] jffs2: fix lockdep warning
Message-ID: <cover.1545126261.git.helmut.grohne@intenta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series essentially fixes a false positive lockdep warning. The issue
is known since 2012, referenced and fixed in the third patch. The other two
patches subtly change the locking semantics on order to make the third patch
feasible.

I would like thank Peter Zijlstra for his precise guiding on where to look. His
first guess on what is going nailed it. I would also like to thank David
Woodhouse and Richard Weinberger for their reviews.

Changes in v3:
 - Avoid ?: operator (requested by Richard Weinberger).
 - Add Reviewed-by tags from Richard Weinberger.
 - Rebase patch series on v4.20-rc7.
 - Update my email address.

Changes in v2:
 - Initialize the lock class on every inode initialization rather than just the
   initial one in jffs2_i_init_once. (Thanks to David Woodhouse for pointing at
   this issue.)
 - Properly wrap the commit message to make checkpatch.pl fully happy.

Helmut Grohne (3):
  jffs2: avoid unnecessarily taking f->sem
  jffs2: jffs2_iget defer f->sem acquisition
  jffs2: put directories f->sem on a separate lockdep class

 fs/jffs2/fs.c        | 21 ++++++++++++++++++++-
 fs/jffs2/readinode.c |  4 +---
 2 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.11.0
