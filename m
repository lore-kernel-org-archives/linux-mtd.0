Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sr1Oc-0007Fl-J6
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2012 06:36:35 +0000
Received: by pbbrq13 with SMTP id rq13so320330pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 23:36:27 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2 0/2] NAND and NAND-BBT improvements
Date: Mon, 16 Jul 2012 23:38:13 -0700
Message-Id: <1342507095-18574-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is a v2 resubmit of part of a previous series. Some of the previous
patches have already been accepted (and so are omitted here, of course) and
others are still under discussion. I only include the reviewed,
ready-for-submission ones here.

Only v2 changes: comment wording + "Reviewed-by" tags

Of note: the first patch addresses a problem with mtd_read_oob() and the recent
max_bitflips changes by Mike Dunn. If it is satisfactory, it may be worth
merging it in the 3.5-rc cycle (along with its previously-accepted dependent
patch), as it would help avoid an API inconsistency that recently emerged.

Thanks,
Brian

Brian Norris (2):
  mtd: check for max_bitflips in mtd_read_oob()
  mtd: nand: remove unused 'int' return codes

 drivers/mtd/mtdcore.c       | 15 ++++++++++++++-
 drivers/mtd/nand/nand_bbt.c | 19 ++++++++-----------
 2 files changed, 22 insertions(+), 12 deletions(-)

-- 
1.7.11.1
