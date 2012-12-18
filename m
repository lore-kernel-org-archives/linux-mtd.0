Received: from mail-ie0-f181.google.com ([209.85.223.181])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tl4Up-0005dW-Vr
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2012 21:14:40 +0000
Received: by mail-ie0-f181.google.com with SMTP id 16so1600839iea.26
 for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2012 13:14:38 -0800 (PST)
From: Christopher Cordahi <christophercordahi@nanometrics.ca>
To: David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 2/2] mtd: cmdlinepart: update /proc/mtd comment
Date: Tue, 18 Dec 2012 16:11:52 -0500
Message-Id: <e30dac743f4ffb1c63ee9b5d6d55185813606a71.1355863937.git.christophercordahi@nanometrics.ca>
In-Reply-To: <cover.1355863937.git.christophercordahi@nanometrics.ca>
References: <cover.1355863937.git.christophercordahi@nanometrics.ca>
In-Reply-To: <cover.1355863937.git.christophercordahi@nanometrics.ca>
References: <cover.1355863937.git.christophercordahi@nanometrics.ca>
Cc: Philip Rakity <prakity@yahoo.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
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

/proc/mtd doesn't contain the mtd-id of the device, but the part name from the
command line.  This corrects what I believe is an obsolete comment from commit
a0ee24a03b1c06813c814b9f70946c8984752f01.

Signed-off-by: Christopher Cordahi <christophercordahi@nanometrics.ca>
Cc: Philip Rakity <prakity@yahoo.com>
---
 drivers/mtd/cmdlinepart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 8d4a166..721d05c 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -22,7 +22,6 @@
  *
  * mtdparts=<mtddef>[;<mtddef]
  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
- *              where <mtd-id> is the name from the "cat /proc/mtd" command
  * <partdef> := <size>[@<offset>][<name>][ro][lk]
  * <mtd-id>  := unique name used in mapping driver/device (mtd->name)
  * <size>    := standard linux memsize OR "-" to denote all remaining space
@@ -32,6 +31,7 @@
  *              if omitted the part will immediately follow the previous part
  *              or 0 if the first part
  * <name>    := '(' NAME ')'
+ *              NAME will appear in /proc/mtd
  *
  * <size> and <offset> can be specified such that the parts are out of order
  * in physical memory and may even overlap.
-- 
1.7.1
