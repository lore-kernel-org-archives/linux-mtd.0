Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJ3Qs-0000iq-6d
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2012 14:26:46 +0000
Received: by pbcxa7 with SMTP id xa7so8174720pbc.36
 for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2012 07:26:43 -0700 (PDT)
Message-ID: <506AF985.30104@gmail.com>
Date: Tue, 02 Oct 2012 19:56:13 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 0/8] mtd_tests: Remove duplicate code and cleanups
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>,
 Brian Norris <computersforpeace@gmail.com>,
 Adrian Hunter <ext-adrian.hunter@nokia.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Adrian Hunter <ext-adrian.hunter@nokia.com>
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>

This RFC patchset moves some common code in all the tests to a common header
file. Also, all the printk,PRINT_PREF are replaced with pr_info style prints.
This way duplicates are eliminated and the code looks clean.

I deliberately missed out the mtd_oobtest as Brian Norris has already sent a
patch for that.

All the patches are compile tested and checkpatch clean(No checkpatch warnings
are introduced by the code that is added in this patch).

Vikram Narayanan(8):
  mtd_tests: Refactor duplicate code
  mtd_pagetest: Replace printk with pr_{info,crit}
  mtd_torturetest: Replace printk with pr_{info,crit}
  mtd_subpagetest: Replace printk with pr_info
  mtd_stresstest: Replace printk with pr_{info,crit}
  mtd_speedtest: Replace printk with pr_{info,crit}
  mtd_readtest: Replace printk with pr_info
  mtd_nandbiterrs: Replace msg macro with pr_info

 drivers/mtd/tests/mtd_nandbiterrs.c |   97 +++++++-----------
 drivers/mtd/tests/mtd_oobtest.c     |   31 +-----
 drivers/mtd/tests/mtd_pagetest.c    |  191 +++++++++++++++--------------------
 drivers/mtd/tests/mtd_readtest.c    |   42 ++++----
 drivers/mtd/tests/mtd_speedtest.c   |  140 ++++++++------------------
 drivers/mtd/tests/mtd_stresstest.c  |   71 ++++---------
 drivers/mtd/tests/mtd_subpagetest.c |  147 +++++++++++----------------
 drivers/mtd/tests/mtd_tests.h       |   60 +++++++++++
 drivers/mtd/tests/mtd_torturetest.c |  104 +++++++------------
 9 files changed, 370 insertions(+), 513 deletions(-)
