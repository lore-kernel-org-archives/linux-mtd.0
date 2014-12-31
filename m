Received: from mail-qc0-x229.google.com ([2607:f8b0:400d:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6Kjs-0004MS-Vj
 for linux-mtd@lists.infradead.org; Wed, 31 Dec 2014 14:59:09 +0000
Received: by mail-qc0-f169.google.com with SMTP id w7so11693995qcr.28
 for <linux-mtd@lists.infradead.org>; Wed, 31 Dec 2014 06:58:47 -0800 (PST)
From: Joe Balough <jbb5044@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: ubiformat: Add support for image confirmation
Date: Wed, 31 Dec 2014 09:58:43 -0500
Message-Id: <1420037925-31156-1-git-send-email-jbb5044@gmail.com>
Cc: Joe Balough <jbb5044@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Working with ubi images being flashed to NAND using ubiformat, I
found it desirable to ensure that the data that has been flashed is 
properly written to the device using a readback mechanism.

These patches add a -c, --confirm argument to ubiformat that will
cause the program to read back the eraseblock written in the
flash_image function, then use a memcmp to verify it was written
correctly. 

This is my first patch and I am happy to make any requested changes.

Joe Balough (2):
  mtd: ubiformat: Add --confirm argument
  mtd: ubiformat: Add confirmation fail exit

 ubi-utils/ubiformat.c | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

-- 
2.1.3
