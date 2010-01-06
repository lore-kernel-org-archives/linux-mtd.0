Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSWPe-0004ti-IA
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 13:59:07 +0000
Received: by bwz4 with SMTP id 4so10827589bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jan 2010 05:58:58 -0800 (PST)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 6 Jan 2010 19:28:38 +0530
Message-ID: <ce9ab5791001060558u362f17baj5ee90e9b4adb72a7@mail.gmail.com>
Subject: [PATCH 0/3][NAND][OMAP]: fixing omap nand driver issues
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 3700088e8da8c890d9e4c6eb626e18287d149b97 Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Tue, 5 Jan 2010 16:43:08 +0530
Subject: [PATCH] fixing omap nand driver issues

fixing omap nand driver issues.

Vimal Singh (3):
  Fixing compilation warning for 'nand/omap2.c'
  NAND: OMAP: correct 'info' pointer in 'omap_nand_remove'
  NAND: OMAP: Fixing issue in oamp nand driver in prefetch mode read

 drivers/mtd/nand/omap2.c |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)
