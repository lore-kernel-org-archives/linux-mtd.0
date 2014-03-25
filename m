Received: from mail-pa0-f73.google.com ([209.85.220.73])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSb67-0006i7-OR
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 23:49:36 +0000
Received: by mail-pa0-f73.google.com with SMTP id kq14so154465pab.2
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 16:49:05 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: axboe@kernel.dk,
	ulf.hansson@linaro.org
Subject: [PATCH 0/4] Set max_discard_sectors maximal value to UINT_MAX>>9
Date: Tue, 25 Mar 2014 16:48:22 -0700
Message-Id: <1395791307-23727-1-git-send-email-gwendal@chromium.org>
Cc: linux-mmc@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Without this change, 'blkdiscard /dev/mmcblk0' would panic:
Because max_discard_sectors was set to 4G sectors, discard request issued
on behalf of blkdiscard would be merged, leading to request larger than 4GB:
[  169.035929] __end_that: dev mmcblk0: type=1, flags=122c8081
[  169.041464]   sector 0, nr/cnr 0/4294966272
[  169.045689]   bio ebb7a380, biotail ebb7aa80, buffer   (null), len 0
[  169.052106] blk_update_request: bio idx 0 >= vcnt 0
[  169.057068] request botched: dev mmcblk0: type=1, flags=122c8081
[  169.063138]   sector 0, nr/cnr 0/4294966272
[  169.067436]   bio ebb7a380, biotail ebb7aa80, buffer   (null), len 0
The IOCTL would be stuck in the kernel, a watchdog would reboot the machine.

After this change, blkdiscard works fine. With blktrace/blkparse, I verified
the discard requests are sane: 8387584 is 4GB in sectors rounded down.
Example of a ~16GB device:
 9368  Q   D 0 + 8387584 [blkdiscard]
    0  m   N cfq9368 alloced
 9368  G   D 0 + 8387584 [blkdiscard]
 9368  P   N [blkdiscard]
 9368  Q   D 8387584 + 8387584 [blkdiscard]
 9368  G   D 8387584 + 8387584 [blkdiscard]
 9368  Q   D 16775168 + 8387584 [blkdiscard]
 9368  G   D 16775168 + 8387584 [blkdiscard]
 9368  Q   D 25162752 + 5372928 [blkdiscard]
 9368  G   D 25162752 + 5372928 [blkdiscard]
 9368  I   D 0 + 8387584 [blkdiscard]
    0  m   N cfq9368 insert_request
    0  m   N cfq9368 add_to_rr
 9368  I   D 8387584 + 8387584 [blkdiscard]
    0  m   N cfq9368 insert_request
 9368  I   D 16775168 + 8387584 [blkdiscard]
    0  m   N cfq9368 insert_request
 9368  I   D 25162752 + 5372928 [blkdiscard]
    0  m   N cfq9368 insert_request
 9368  U   N [blkdiscard] 4
 ...

I fixed the other locations where max_discard_sectors was set to
UINT_MAX and checked the other settings were in units of 512 bytes
sectors.

Gwendal Grignou (4):
  Limit max_discard_sectors to UINT_MAX>>9
  Limit max_discard_sectors to UINT_MAX>>9
  Limit max_discard_sectors to UINT_MAX>>9
  Limit max_discard_sectors to UINT_MAX>>9

 block/blk-lib.c           | 2 +-
 drivers/block/nbd.c       | 2 +-
 drivers/mmc/core/core.c   | 6 ++++--
 drivers/mtd/mtd_blkdevs.c | 2 +-
 4 files changed, 7 insertions(+), 5 deletions(-)

-- 
1.9.1.423.g4596e3a
