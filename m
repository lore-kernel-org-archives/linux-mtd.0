Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SglQ8-00083J-MX
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 23:31:45 +0000
Received: by pbbrq13 with SMTP id rq13so9410663pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2012 16:31:41 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/2] UBI(FS): fixing IS_ENABLED() usage + backport trees
Date: Mon, 18 Jun 2012 16:31:21 -0700
Message-Id: <1340062283-11421-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

It looks like your ubifs-v3.3.git tree does not compile successfully. I
think there are two issues:

 1) IS_ENABLED() should be used with the CONFIG_ prefix. i.e.,
 IS_ENABLED(CONFIG_DEBUG_FS) instead of IS_ENABLED(DEBUG_FS)

 2) IS_ENABLED() has changed some between v3.3 and when this commit was
 originally integrated in mainline, so it masks a compile error in the
 mainline version

This patch series addresses issue 1. I suggest that this be backported to
the appropriate UBIFS tree to solve some build failures. But I think issue
2 may still be a problem, so perhaps the mainline IS_ENABLED() fix should
be backported as well?

BTW, there may be more than one backport tree that fails; I just tested
v3.3.

UBIFS commit (mainline) that breaks when ported to v3.3:
5e0c43e74d16db5710caebe8169995c9a13807f9

Upstream commit that fixes IS_ENABLED:
69349c2dc01c489eccaa4c472542c08e370c6d7e

Build failure in ubifs-v3.3.git:

  CC      drivers/mtd/ubi/debug.o
drivers/mtd/ubi/debug.c: In function ‘ubi_debugfs_init’:
drivers/mtd/ubi/debug.c:267: error: ‘__enabled_DEBUG_FS’ undeclared (first use in this function)
drivers/mtd/ubi/debug.c:267: error: (Each undeclared identifier is reported only once
drivers/mtd/ubi/debug.c:267: error: for each function it appears in.)
drivers/mtd/ubi/debug.c:267: error: ‘__enabled_DEBUG_FS_MODULE’ undeclared (first use in this function)
drivers/mtd/ubi/debug.c: In function ‘ubi_debugfs_exit’:
drivers/mtd/ubi/debug.c:287: error: ‘__enabled_DEBUG_FS’ undeclared (first use in this function)
drivers/mtd/ubi/debug.c:287: error: ‘__enabled_DEBUG_FS_MODULE’ undeclared (first use in this function)
drivers/mtd/ubi/debug.c: In function ‘ubi_debugfs_init_dev’:
drivers/mtd/ubi/debug.c:418: error: ‘__enabled_DEBUG_FS’ undeclared (first use in this function)
drivers/mtd/ubi/debug.c:418: error: ‘__enabled_DEBUG_FS_MODULE’ undeclared (first use in this function)
drivers/mtd/ubi/debug.c: In function ‘ubi_debugfs_exit_dev’:
drivers/mtd/ubi/debug.c:488: error: ‘__enabled_DEBUG_FS’ undeclared (first use in this function)
drivers/mtd/ubi/debug.c:488: error: ‘__enabled_DEBUG_FS_MODULE’ undeclared (first use in this function)
make[3]: *** [drivers/mtd/ubi/debug.o] Error 1
make[2]: *** [drivers/mtd/ubi] Error 2
make[1]: *** [drivers/mtd] Error 2
make[1]: *** Waiting for unfinished jobs....

Regards,
Brian

Brian Norris (2):
  UBIFS: correct usage of IS_ENABLED()
  UBI: correct usage of IS_ENABLED()

 drivers/mtd/ubi/debug.c |    8 ++++----
 fs/ubifs/debug.c        |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)
