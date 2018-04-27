Received: from mail.intenta.de ([178.249.25.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fC0eM-0006WS-NI
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2018 10:31:07 +0000
Date: Fri, 27 Apr 2018 12:30:26 +0200
From: Helmut Grohne <h.grohne@intenta.de>
To: David Woodhouse <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>
CC: Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 0/3] jffs2: fix lockdep warning
Message-ID: <cover.1524823321.git.h.grohne@intenta.de>
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
first guess on what is going nailed it.

Helmut Grohne (3):
  jffs2: avoid unnecessarily taking f->sem
  jffs2: jffs2_iget defer f->sem acquisition
  jffs2: put directories f->sem on a separate lockdep class

 fs/jffs2/fs.c        | 16 +++++++++++++++-
 fs/jffs2/readinode.c |  4 +---
 fs/jffs2/super.c     |  3 +++
 3 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.11.0
