Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPuzv-0003Ws-HA
 for linux-mtd@lists.infradead.org; Sat, 28 Sep 2013 13:55:53 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: UBI fastmap updates
Date: Sat, 28 Sep 2013 15:55:09 +0200
Message-Id: <1380376516-30144-1-git-send-email-richard@nod.at>
Cc: richard.genoud@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

this series is a collection of all pending UBI fastmap updates.

Richard Genoud found issues in combination with U-Boot.
These issues also uncovered other minor issues in some error paths.
Only one fix is not really fastmap specific and touches generic 
UBI code, "UBI: simplify image sequence test".

Thanks,
//richard

Richard Genoud (2):
      UBI: fastmap: fix backward compatibility with image_seq
      UBI: simplify image sequence test

Richard Weinberger (5):
      UBI: fix refill_wl_user_pool()
      UBI: Fix error path in scan_pool()
      UBI: Call scan_all() with correct offset in error case
      UBI: Fix memory leak in ubi_attach_fastmap() error path
      UBI: Add some asserts to ubi_attach_fastmap()

 drivers/mtd/ubi/attach.c  | 11 ++++++-----
 drivers/mtd/ubi/fastmap.c | 41 +++++++++++++++++++++++++++++++++++++----
 drivers/mtd/ubi/wl.c      |  4 ----
 3 files changed, 43 insertions(+), 13 deletions(-)
