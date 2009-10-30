Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N3krP-000763-ER
	for linux-mtd@lists.infradead.org; Fri, 30 Oct 2009 06:21:24 +0000
Received: by bwz4 with SMTP id 4so3543519bwz.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Oct 2009 23:21:17 -0700 (PDT)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 30 Oct 2009 11:50:57 +0530
Message-ID: <ce9ab5790910292320x2eef0550pdc3fde5d616ea361@mail.gmail.com>
Subject: [PATCH 0/3] NAND: OMAP: Fix and clean NAND driver
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Vimal Singh <vimalsingh@ti.com>
Date: Fri, 30 Oct 2009 11:34:14 +0530
Subject: [PATCH 0/3] NAND: OMAP: Fix and clean NAND driver

This patch series addresses some of the issues in omap nand driver.

Vimal Singh (3):
  Fixing compilation warning for 'nand/omap2.c'
  NAND: OMAP: Fixing omap nand driver, compiled as module
  NAND: OMAP: Simplifying HWECC and removing unnecessary macros

 drivers/mtd/nand/omap2.c |  315 ++++++++++++++++------------------------------
 1 files changed, 108 insertions(+), 207 deletions(-)

-- 
Regards,
Vimal Singh
