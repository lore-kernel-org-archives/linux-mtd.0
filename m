Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XkHIE-0008EP-RY
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 18:51:27 +0000
From: Ben Shelton <ben.shelton@ni.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] UBIFS: add xattr support for security / SELinux
Date: Fri, 31 Oct 2014 13:50:27 -0500
Message-Id: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
Cc: Ben Shelton <ben.shelton@ni.com>, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm reposting the patch series for security xattr / SELinux support on UBIFS
from Subodh Nijsure and Marc Kleine-Budde [1] in order to restart the process
of getting this support upstream.

Notes:

 - I removed 'UBIFS: xattr: protect ui_size and data_len by ui_mutex' because
   after looking through the comments before the definition of struct
   ubifs_inode, I'm not sure what this was intended to fix.  It looks like
   i_size and data_len are not intended to be protected by ui_mutex, and I'm
   unclear on why ui->ui_size needs to be protected here by host_ui's ui_mutex.
   CCing Marc -- could you comment on how this is supposed to work?

 - I made the suggested locking fixes in [2], with the exception of removing the
   i_mutex lock/unlock around the call to security_inode_init_security(), which 
   caused an assert.  With these fixes, I turned on lockdep and ran with SELinux
   enabled on an ARM-based embedded target using UBIFS, and I saw no lockdep
   warnings during filesystem labeling and normal operation.

[1] http://lists.infradead.org/pipermail/linux-mtd/2013-February/045794.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2013-February/045871.html

Subodh Nijsure (4):
  UBIFS: fix a couple bugs in UBIFS xattr length calculation
  UBIFS: Add xattr support for symlinks
  UBIFS: Add security.* XATTR support for the UBIFS
  UBIFS: add ubifs_err() to print error reason

 fs/ubifs/dir.c     |  20 +++++++++
 fs/ubifs/file.c    |   4 ++
 fs/ubifs/journal.c |  11 ++++-
 fs/ubifs/super.c   |   1 +
 fs/ubifs/ubifs.h   |   4 ++
 fs/ubifs/xattr.c   | 116 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 6 files changed, 145 insertions(+), 11 deletions(-)

-- 
2.1.1
