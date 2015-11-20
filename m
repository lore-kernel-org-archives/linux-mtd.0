Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzcLs-0000ZW-LG
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 03:27:09 +0000
Received: by pacdm15 with SMTP id dm15so101901261pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 19:26:47 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/3] mtd: support cleanup callback for partition parsers
Date: Thu, 19 Nov 2015 19:26:34 -0800
Message-Id: <1447989997-108476-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Currently, we assume that all of the resources used by partition parsers can be
cleaned up with a single kfree(), but that can be burdensome to work around.
This series (particularly, patch 3) supports a cleanup() callback for parsers.

Brian

Brian Norris (3):
  mtd: rename MTD parser get/put
  mtd: untangle error codes and number of partitions
  mtd: support a cleanup callback for partition parsers

 drivers/mtd/mtdcore.c          | 22 ++++++++++++++++------
 drivers/mtd/mtdcore.h          | 25 ++++++++++++++++++++++++-
 drivers/mtd/mtdpart.c          | 19 +++++++++++--------
 include/linux/mtd/partitions.h |  1 +
 4 files changed, 52 insertions(+), 15 deletions(-)

-- 
2.6.0.rc2.230.g3dd15c0
