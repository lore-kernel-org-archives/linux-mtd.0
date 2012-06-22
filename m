Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiDNz-0004ge-Qg
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 23:35:32 +0000
Received: by pbbrq13 with SMTP id rq13so4463121pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2012 16:35:30 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/8] NAND and NAND-BBT improvements
Date: Fri, 22 Jun 2012 16:35:37 -0700
Message-Id: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This series includes several assorted changes to MTD, NAND, and NAND-BBT code.
I wanted to get these out there now, as I will be off the radar for the next
week. These aren't too thoroughly tested, but for those that are somewhat
obvious, feel free to merge them. Others are meant for some discussion; feel
free to improve them and resubmit yourself.

Of note: the first two patches address a problem with mtd_read_oob() and the
recent max_bitflips changes by Mike Dunn. If they are satisfactory, it may be
worth merging them in the 3.5-rc cycle, as they help avoid an API inconsistency
that recently emerged.

"mtd: nand: use ECC, if present, when scanning OOB"
This patch may not be needed/wanted, as it affects the NAND_BBT_ABSPAGE
codepath. Refer to previous discussions with Mike Dunn regarding diskonchip.c.

Regards,
Brian

Brian Norris (8):
  mtd: move mtd_read_oob() definition out of mtd.h
  mtd: check for max_bitflips in mtd_read_oob()
  mtd: nand: rename "no_bbt" descriptors to "no_oob"
  mtd: nand: remove unused 'int' return codes
  mtd: nand: rename '_raw' BBT scan functions
  mtd: nand_bbt: refactor check_pattern_no_oob()
  mtd: nand_bbt: use string library
  mtd: nand: use ECC, if present, when scanning OOB

 drivers/mtd/mtdcore.c       |   21 +++++++++
 drivers/mtd/nand/nand_bbt.c |  108 +++++++++++++++++++++----------------------
 include/linux/mtd/mtd.h     |    9 +---
 3 files changed, 75 insertions(+), 63 deletions(-)

-- 
1.7.10
