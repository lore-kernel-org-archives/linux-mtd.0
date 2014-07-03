Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2awI-0008K1-Dn
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 06:56:14 +0000
Received: by mail-pa0-f41.google.com with SMTP id fb1so13865722pad.14
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2014 23:55:51 -0700 (PDT)
From: Terry Chia <terrycwk1994@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] Add MODULE_DESCRIPTION to various modules in drivers/mtd
Date: Thu,  3 Jul 2014 14:55:41 +0800
Message-Id: <1404370542-14357-1-git-send-email-terrycwk1994@gmail.com>
Cc: linux-mtd@lists.infradead.org, Terry Chia <terrycwk1994@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds missing MODULE_DESCRIPTION to several files in drivers/mtd.
This addresses https://bugzilla.kernel.org/show_bug.cgi?id=10770 for the
drivers/mtd subsystem.

Terry Chia (1):
  Add MODULE_DESCRIPTION to various modules in drivers/mtd

 drivers/mtd/chips/cfi_cmdset_0020.c | 1 +
 drivers/mtd/chips/cfi_util.c        | 1 +
 drivers/mtd/maps/map_funcs.c        | 1 +
 drivers/mtd/nand/denali.c           | 1 +
 4 files changed, 4 insertions(+)

-- 
1.9.3
