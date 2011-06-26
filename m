Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QawUK-0007ay-41
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 21:03:30 +0000
Received: by bwf12 with SMTP id 12so1305881bwf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 14:03:10 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] finish modularization of ofpart parser
Date: Mon, 27 Jun 2011 01:02:58 +0400
Message-Id: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, dedekind1@gmail.com,
	linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>,
	linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To fix building of kernel if MTD is selected as a module and OF_PARTS
is selected, finish modularization of ofpart MTD partition parser.

The following changes since commit 81e49819e7d6c11c91702d6b4d9fc71255614488:

  mtd: spelling, capitalization, uniformity (2011-06-24 22:58:01 +0300)

are available in the git repository at:
  git://git.infradead.org/users/dbaryshkov/mtd-cleanup.git mtd-big-cleanup

Dmitry Eremin-Solenikov (2):
      mtd: make ofpart buildable as a separate module
      mtd/ofpart: add ofoldpart alias

 drivers/mtd/Kconfig  |    3 ++-
 drivers/mtd/Makefile |    2 +-
 drivers/mtd/ofpart.c |    3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)
