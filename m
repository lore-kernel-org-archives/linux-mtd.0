Received: from [206.117.179.246] (helo=labridge.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsMPB-0002qL-Nh
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 22:42:26 +0000
From: Joe Perches <joe@perches.com>
To: codalist@coda.cs.cmu.edu, linux-mtd@lists.infradead.org,
 reiserfs-devel@vger.kernel.org
Subject: [PATCH 0/4] fs: Remove unnecessary OOM messages
Date: Tue, 31 Jan 2012 14:42:06 -0800
Message-Id: <cover.1328049542.git.joe@perches.com>
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
  coda: Remove unnecessary OOM messages
  jffs2: Remove unnecessary OOM messages
  reiserfs: Remove unnecessary OOM messages
  udf: Remove unnecessary OOM messages

 fs/coda/coda_linux.h  |   13 ++++++-------
 fs/jffs2/compr_lzo.c  |    1 -
 fs/jffs2/compr_zlib.c |    6 ++----
 fs/reiserfs/journal.c |    8 ++------
 fs/reiserfs/resize.c  |    1 -
 fs/udf/super.c        |    5 +----
 6 files changed, 11 insertions(+), 23 deletions(-)

-- 
1.7.8.111.gad25c.dirty
