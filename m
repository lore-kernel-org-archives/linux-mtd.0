Received: from perches-mx.perches.com ([206.117.179.246] helo=labridge.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rxoin-0007vQ-Ou
 for linux-mtd@lists.infradead.org; Wed, 15 Feb 2012 23:57:14 +0000
From: Joe Perches <joe@perches.com>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] jffs2: logging message neatening
Date: Wed, 15 Feb 2012 15:56:42 -0800
Message-Id: <cover.1329349881.git.joe@perches.com>
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joe Perches (4):
  jffs2: Convert most D1/D2 macros to jffs2_dbg
  jffs2: Convert printks to pr_<level>
  jffs2: Use pr_fmt and remove jffs: from formats
  jffs2: Standardize JFFS_<LEVEL> uses

 fs/jffs2/acl.c         |    2 +
 fs/jffs2/background.c  |   29 +++--
 fs/jffs2/build.c       |    6 +-
 fs/jffs2/compr.c       |   32 +++--
 fs/jffs2/compr_rubin.c |    2 +
 fs/jffs2/compr_zlib.c  |   39 ++++---
 fs/jffs2/debug.c       |   22 ++--
 fs/jffs2/debug.h       |   51 +++------
 fs/jffs2/dir.c         |   41 ++++---
 fs/jffs2/erase.c       |   71 +++++++----
 fs/jffs2/file.c        |   33 +++--
 fs/jffs2/fs.c          |   67 ++++++----
 fs/jffs2/gc.c          |  322 ++++++++++++++++++++++++++++--------------------
 fs/jffs2/malloc.c      |    2 +
 fs/jffs2/nodelist.c    |   30 +++--
 fs/jffs2/nodemgmt.c    |  214 +++++++++++++++++++-------------
 fs/jffs2/read.c        |   70 ++++++-----
 fs/jffs2/readinode.c   |    2 +
 fs/jffs2/scan.c        |  211 ++++++++++++++++++--------------
 fs/jffs2/summary.c     |   16 ++-
 fs/jffs2/super.c       |   30 +++--
 fs/jffs2/symlink.c     |    7 +-
 fs/jffs2/wbuf.c        |  148 ++++++++++++----------
 fs/jffs2/write.c       |  113 ++++++++++--------
 fs/jffs2/xattr.c       |    2 +
 25 files changed, 900 insertions(+), 662 deletions(-)

-- 
1.7.8.111.gad25c.dirty
