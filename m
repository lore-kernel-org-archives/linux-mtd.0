Received: from mailout06.t-online.de ([194.25.134.19])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccamS-0003bi-4E
 for linux-mtd@lists.infradead.org; Sat, 11 Feb 2017 16:44:16 +0000
Received: from fwd26.aul.t-online.de (fwd26.aul.t-online.de [172.20.26.131])
 by mailout06.t-online.de (Postfix) with SMTP id DA67141D02C7
 for <linux-mtd@lists.infradead.org>; Sat, 11 Feb 2017 17:43:44 +0100 (CET)
From: torfl@t-online.de
To: linux-mtd@lists.infradead.org
Cc: Torsten Fleischer <torfl@t-online.de>
Subject: [PATCH 0/2] mtd-utils: Fix printf format specifier for off_t and
 loff_t
Date: Sat, 11 Feb 2017 17:43:30 +0100
Message-Id: <1486831412-30409-1-git-send-email-torfl@t-online.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Torsten Fleischer <torfl@t-online.de>

On different systems the size of off_t and loff_t can differ from each
other and they can have a size of either 4 or 8 byte.

The first patch creates the definitions for the printf format specifier
for both data types according to the size of them.
This fixes several compiler warnings on 32bit systems.

The second patch replaces the format specifier that is wrong for 32bit
systems by the appropriate definition for off_t.

Torsten Fleischer (2):
  mtd-utils: Fix format specifier definitions for off_t and loff_t.
  mtd-utils: serve_image: Use PRIdoff_t as format specifier.

 configure.ac                   |  2 +-
 include/common.h               | 14 +++++++++-----
 misc-utils/serve_image.c       |  4 +++-
 tests/mtd-tests/nandpagetest.c |  2 +-
 4 files changed, 14 insertions(+), 8 deletions(-)

-- 
2.1.4
