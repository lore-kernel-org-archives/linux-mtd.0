Received: from mail-ia0-f174.google.com ([209.85.210.174])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tl4Ub-0005cK-VD
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2012 21:14:27 +0000
Received: by mail-ia0-f174.google.com with SMTP id y25so1029462iay.19
 for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2012 13:14:25 -0800 (PST)
From: Christopher Cordahi <christophercordahi@nanometrics.ca>
To: David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 1/2] mtd: cmdlinepart: describe mtd ordering
Date: Tue, 18 Dec 2012 16:11:51 -0500
Message-Id: <653ac5f88c42f6d24be04c354ddbadd8db20b8ba.1355863937.git.christophercordahi@nanometrics.ca>
In-Reply-To: <cover.1355863937.git.christophercordahi@nanometrics.ca>
References: <cover.1355863937.git.christophercordahi@nanometrics.ca>
In-Reply-To: <cover.1355863937.git.christophercordahi@nanometrics.ca>
References: <cover.1355863937.git.christophercordahi@nanometrics.ca>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Huang Shijie <b32955@freescale.com>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd documentation makes no mention of the useful feature whereby
partitions' logical ordering need not match their physical ordering.
Truncation of parts, skipping of zero sized parts, and handling of
overlapping parts are similarly not mentioned.

This updates the comments at the top of file describing the command
line parsing as currently implemented.   I proposed this in
http://lists.infradead.org/pipermail/linux-mtd/2012-December/045314.html

Signed-off-by: Christopher Cordahi <christophercordahi@nanometrics.ca>
---
 drivers/mtd/cmdlinepart.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 525c579..8d4a166 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -23,11 +23,22 @@
  * mtdparts=<mtddef>[;<mtddef]
  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
  *              where <mtd-id> is the name from the "cat /proc/mtd" command
- * <partdef> := <size>[@offset][<name>][ro][lk]
+ * <partdef> := <size>[@<offset>][<name>][ro][lk]
  * <mtd-id>  := unique name used in mapping driver/device (mtd->name)
  * <size>    := standard linux memsize OR "-" to denote all remaining space
+ *              size is automatically truncated at end of device
+ *              if specified or trucated size is 0 the part is skipped
+ * <offset>  := standard linux memsize
+ *              if omitted the part will immediately follow the previous part
+ *              or 0 if the first part
  * <name>    := '(' NAME ')'
  *
+ * <size> and <offset> can be specified such that the parts are out of order
+ * in physical memory and may even overlap.
+ *
+ * The parts are assigned MTD numbers in the order they are specified in the
+ * command line regardless of their order in physical memory.
+ *
  * Examples:
  *
  * 1 NOR Flash, with 1 single writable partition:
-- 
1.7.1
