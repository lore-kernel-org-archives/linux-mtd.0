Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWOCV-0004jN-Vr
 for linux-mtd@lists.infradead.org; Mon, 21 May 2012 08:42:48 +0000
Received: from localhost (localhost [127.0.0.1])
 by anubis.se.axis.com (Postfix) with ESMTP id 0BED119DE0
 for <linux-mtd@lists.infradead.org>; Mon, 21 May 2012 10:42:41 +0200 (CEST)
Received: from anubis.se.axis.com ([127.0.0.1])
 by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id buhE9TWS2iXP for <linux-mtd@lists.infradead.org>;
 Mon, 21 May 2012 10:42:40 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
 by anubis.se.axis.com (Postfix) with ESMTP id 2EB1219D82
 for <linux-mtd@lists.infradead.org>; Mon, 21 May 2012 10:42:39 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
 by thoth.se.axis.com (Postfix) with ESMTP id 2CD0B34E5D
 for <linux-mtd@lists.infradead.org>; Mon, 21 May 2012 10:42:39 +0200 (CEST)
From: Johan Gunnarsson <johan.gunnarsson@axis.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] use hrtimer in nand_wait
Date: Mon, 21 May 2012 10:42:36 +0200
Message-ID: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: jespern@axis.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I've been researching a bug where blocks have gone bad when combining NAND writes with long periods of disabled interrupts. Such as lots of serial port writes (think printk) in interrupt context.

I've narrowed it down to the nand_wait routine and its dependency on a reliable jiffies counter. Sadly, jiffies is not reliable when handling of timer interrupts are delayed or even completely discarded. If interrupts are disabled for, say, 3 timer periods, jiffies will stop counting during this time and have a very fast increment by 3 when interrupts are later enabled. This combined with unfortunate timing can cause the timeout loop think a 20ms timeout is happening when just <0.1ms has passed in wall clock time.

To illustrate the jiffies/interrupt-relationship:

Interrupts: |      |      |                    |      |      |      |
Jiffies:    |      |      |                    |||    |      |      |

This obviously only happen on multi-core CPUs, where the write and interrupts are executed by different cores simultaneously. Switching to hrtimer-based timeout solves this problem for me. I found a second (less serious) issue which included in the first patch.

Johan


Johan Gunnarsson (2):
  mtd: nand: panic_nand_wait expects timeout in ms.
  mtd: nand: use hrtimer to measure timeout in nand_wait{_ready,}

 drivers/mtd/nand/nand_base.c |   42 ++++++++++++++++++++++++++++++++++--------
 1 files changed, 34 insertions(+), 8 deletions(-)

-- 
1.7.2.5
