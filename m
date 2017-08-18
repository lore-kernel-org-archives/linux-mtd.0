Received: from mout.web.de ([212.227.15.4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dimao-0003uO-Hg
 for linux-mtd@lists.infradead.org; Fri, 18 Aug 2017 19:06:04 +0000
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/3] JFFS2: Adjustments for seven function implementations
Message-ID: <ec91fdb9-9107-f1a3-3530-b3272ca51da7@users.sourceforge.net>
Date: Fri, 18 Aug 2017 21:05:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 20:50:05 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in four functions
  Improve a size determination in jffs2_scan_medium()
  Adjust a null pointer check in two functions

 fs/jffs2/compr.c    | 5 ++---
 fs/jffs2/dir.c      | 1 -
 fs/jffs2/erase.c    | 5 +----
 fs/jffs2/gc.c       | 5 ++---
 fs/jffs2/nodemgmt.c | 3 +--
 fs/jffs2/scan.c     | 2 +-
 fs/jffs2/security.c | 2 +-
 7 files changed, 8 insertions(+), 15 deletions(-)

-- 
2.14.0
