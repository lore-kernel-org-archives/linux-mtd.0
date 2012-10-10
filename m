Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TM08o-0002aO-NN
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 17:32:19 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so988127pbc.36
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 10:32:15 -0700 (PDT)
Message-ID: <5075B105.4080701@gmail.com>
Date: Wed, 10 Oct 2012 23:01:49 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [RESEND PATCH 0/9] mtd_tests cleanup
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series removes the usage of PRINT_PREF and printk's and
replaces it with pr_{info,err,crit} whichever is applicable.

Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>

Brian Norris (1):
  mtd: mtd_oobtest: printk -> pr_{info,err,crit}

Vikram Narayanan (8):
  mtd_tests/mtd_nandbiterrs: Replace msg macro with pr_{info,err}
  mtd_tests/mtd_nandecctest: Use pr_fmt macro
  mtd_tests/mtd_pagetest: Replace printk with pr_{info,crit,err}
  mtd_tests/mtd_readtest: Replace printk with pr_{info,err}
  mtd_tests/mtd_speedtest: Replace printk with pr_{info,crit,err}
  mtd_tests/mtd_stresstest: Replace printk with pr_{info,crit,err}
  mtd_tests/mtd_subpagetest: Replace printk with pr_{info,crit,err}
  mtd_tests/mtd_torturetest: Replace printk with pr_{info,crit}

 drivers/mtd/tests/mtd_nandbiterrs.c |   73 ++++++++--------
 drivers/mtd/tests/mtd_nandecctest.c |    6 +-
 drivers/mtd/tests/mtd_oobtest.c     |  171 +++++++++++++++++------------------
 drivers/mtd/tests/mtd_pagetest.c    |  152 ++++++++++++++++----------------
 drivers/mtd/tests/mtd_readtest.c    |   42 +++++-----
 drivers/mtd/tests/mtd_speedtest.c   |   88 +++++++++---------
 drivers/mtd/tests/mtd_stresstest.c  |   44 +++++-----
 drivers/mtd/tests/mtd_subpagetest.c |  124 +++++++++++++-------------
 drivers/mtd/tests/mtd_torturetest.c |   73 ++++++++--------
 9 files changed, 387 insertions(+), 386 deletions(-)

-- 
1.7.4.1
