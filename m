Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgIhY-0004Yh-Jd
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 23:51:18 +0000
From: Theuns Verwoerd <theuns.verwoerd@alliedtelesis.co.nz>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Theuns Verwoerd <theuns.verwoerd@alliedtelesis.co.nz>
Subject: [PATCH 0/2] Secure deletion under JFFS2
Date: Fri, 20 Jul 2018 11:50:10 +1200
Message-Id: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Security certifications such as FIPS require the capability to securely 
delete files, which is problematic under JFFS2's log-based model.  We can
ensure that all dirty or obsolete data has been cleared at the conclusion 
of secure deletion by forcibly driving the existing garbage collection 
system however.

To that end, these patches provide two pieces of functionality:
1. -POLL signal handling in jffs2_gc to force complete collection of 
   dirty blocks up to the time it was started.
2. Synchronisation with userspace (via debugfs files) to allow 
   secure deletion to wait until that process has completed.

Theuns Verwoerd (2):
  jffs2: Provide forced dirty node cleanup via POLL signal
  jffs2: Provide jffs2_sync files to track gc POLL progress

 fs/jffs2/Kconfig       |  8 ++++++++
 fs/jffs2/background.c  | 31 ++++++++++++++++++++++++++++++-
 fs/jffs2/build.c       |  1 +
 fs/jffs2/jffs2_fs_sb.h |  2 ++
 fs/jffs2/nodelist.h    |  1 +
 fs/jffs2/nodemgmt.c    |  6 +++++-
 fs/jffs2/super.c       | 40 ++++++++++++++++++++++++++++++++++++++++
 7 files changed, 87 insertions(+), 2 deletions(-)

-- 
2.18.0
