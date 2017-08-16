Received: from mout.web.de ([212.227.17.11])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhyLa-0003HO-59
 for linux-mtd@lists.infradead.org; Wed, 16 Aug 2017 13:27:00 +0000
To: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/2] UBIFS: Adjustments for some function implementations
Message-ID: <bd8107ce-fc62-db39-8134-59dca314da7c@users.sourceforge.net>
Date: Wed, 16 Aug 2017 15:26:17 +0200
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
Date: Wed, 16 Aug 2017 15:21:23 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in dbg_check_orphans()
  Improve 19 size determinations

 fs/ubifs/log.c      |  2 +-
 fs/ubifs/lpt.c      | 12 ++++++------
 fs/ubifs/orphan.c   | 10 ++++------
 fs/ubifs/recovery.c |  2 +-
 fs/ubifs/replay.c   |  8 ++++----
 fs/ubifs/scan.c     |  4 ++--
 fs/ubifs/super.c    |  2 +-
 fs/ubifs/tnc.c      |  2 +-
 8 files changed, 20 insertions(+), 22 deletions(-)

-- 
2.14.0
