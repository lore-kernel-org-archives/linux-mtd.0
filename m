Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRedl-0007oj-K7
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:28:58 +0000
Received: by pdjy10 with SMTP id y10so27090381pdj.6
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:28:36 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/5] UBI: Coverity-inspired fixes
Date: Sat, 28 Feb 2015 02:23:24 -0800
Message-Id: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Except for the last one, these were inspired by Coverity Scan results.

These fixes have barely been tested, but they are pretty straightforward
logically. As they've been sitting in my dust pile too long, I thought I'd at
least get them out there.

Brian Norris (5):
  UBI: account for bitflips in both the VID header and data
  UBI: fix out of bounds write
  UBI: initialize LEB number variable
  UBI: fix check for "too many bytes"
  UBI: align comment for readability

 drivers/mtd/ubi/attach.c | 2 +-
 drivers/mtd/ubi/cdev.c   | 2 +-
 drivers/mtd/ubi/eba.c    | 3 ++-
 drivers/mtd/ubi/ubi.h    | 2 +-
 drivers/mtd/ubi/wl.c     | 2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.1.0
