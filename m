Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VibsU-0005KZ-Ik
 for linux-mtd@lists.infradead.org; Tue, 19 Nov 2013 03:21:27 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 0/3] the clean-up for gpmi
Date: Tue, 19 Nov 2013 10:57:49 +0800
Message-ID: <1384829872-8714-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


v1 --> v2:
	Based on the l2-mtd/next.
	This patch set only contains the patches for the error messages.

Huang Shijie (3):
  mtd: gpmi: remove the unnecessary pr_err()
  mtd: gpmi: change pr_err to dev_err
  mtd: gpmi: change pr_debug to dev_dbg

 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  110 +++++++++++++++-----------------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   56 ++++++++--------
 2 files changed, 78 insertions(+), 88 deletions(-)

-- 
1.7.2.rc3
