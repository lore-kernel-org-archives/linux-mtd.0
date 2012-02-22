Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S0EH6-0001x1-Py
 for linux-mtd@lists.infradead.org; Wed, 22 Feb 2012 15:38:41 +0000
Received: by wgbdt13 with SMTP id dt13so97254wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 22 Feb 2012 07:38:35 -0800 (PST)
MIME-Version: 1.0
From: josselin.costanzi@mobile-devices.fr
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH] UBI: allocate verification buffer on demand
Date: Wed, 22 Feb 2012 16:37:04 +0100
Message-Id: <4f450bb8.334cb40a.7321.64a3@mx.google.com>
Cc: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>

With recent Nand (2MiB erase block), UBI/UBIFS is allocating a lot of RAM each
time a mtd device is attached and each time a ubifs volume is mounted.
The following patch makes UBI allocate peb_buf2 on demand.

Note: I'm not sure using vmalloc while holding buf_mutex is okay or not.
I'm waiting for you comments.

Josselin Costanzi (1):
  UBI: allocate verification buffer on demand

 drivers/mtd/ubi/build.c |    6 ------
 drivers/mtd/ubi/eba.c   |   31 +++++++++++++++++++++++++++----
 drivers/mtd/ubi/ubi.h   |    4 +---
 3 files changed, 28 insertions(+), 13 deletions(-)

-- 
1.7.5.4
