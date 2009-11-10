Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N7m20-0004Ji-Ol
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 08:24:56 +0000
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/1] MTD OneNAND OMAP2/3: allow giving partition layout as
	module parameter
Date: Tue, 10 Nov 2009 10:22:34 +0200
Message-Id: <1257841355-5773-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Cc: Mika Korhonen <ext-mika.2.korhonen@nokia.com>, adrian.hunter@nokia.com,
	vimal.newwork@gmail.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

v2: Fix checkpatch issues, improvements suggested by Artem Bityutskiy and Vimal Singh
    
    - OneNAND OMAP driver always selects partitioning and commandline parsing
    - => module parameter always present
    - remove unnecessary #define
    - reformat Kconfig entry for cmdlineparts


v1: Original patch, see
    http://lists.infradead.org/pipermail/linux-mtd/2009-September/027141.html
    http://lists.infradead.org/pipermail/linux-mtd/2009-October/027859.html


Mika Korhonen (1):
  MTD OneNAND OMAP2/3: allow giving partition layout as module
    parameter

 drivers/mtd/Kconfig            |   15 ++++++---------
 drivers/mtd/cmdlinepart.c      |   34 ++++++++++++++++++++++++++++------
 drivers/mtd/onenand/Kconfig    |    2 ++
 drivers/mtd/onenand/omap2.c    |   32 +++++++++++++++++++++++++-------
 include/linux/mtd/partitions.h |    1 +
 5 files changed, 62 insertions(+), 22 deletions(-)
