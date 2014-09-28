Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XY86Y-0000FT-IQ
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 06:37:10 +0000
From: Tanya Brokhman <tlinder@codeaurora.org>
To: dedeking1@gmail.com
Subject: [RFC/PATCH 0/5] mtd:ubi: Read disturb and Data retention handling
Date: Sun, 28 Sep 2014 09:36:47 +0300
Message-Id: <1411886207-8028-1-git-send-email-tlinder@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tanya Brokhman <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

One of the limitations of the NAND devices is the method used to read
NAND flash memory may cause bit-flips on the surrounding cells and result
in uncorrectable ECC errors. This is known as the read disturb or data
retention.

Today’s Linux NAND drivers implementation doesn’t address the read disturb
and the data retention limitations of the NAND devices. To date these
issues could be overlooked since the possibility of their occurrence in
today’s NAND devices is very low. 

With the evolution of NAND devices and the requirement for a “long life”
NAND flash, read disturb and data retention can no longer be ignored
otherwise there will be data loss over time.

The following patch set implements handling of Read-disturb and Data
retention by the UBI layer.


Tanya Brokhman (2):
  mtd: ubi: Read disturb infrastructure
  mtd: ubi: Add sysfs entry to force all pebs' scan

Tatyana Brokhman (3):
  mtd: ubi: Fill read disturb statistics
  mtd: ubi: Make in_wl_tree function public
  mtd: ubi: Read threshold verification

 drivers/mtd/ubi/attach.c    | 137 ++++++++++++++++------
 drivers/mtd/ubi/build.c     |  81 +++++++++++++
 drivers/mtd/ubi/debug.c     |  11 ++
 drivers/mtd/ubi/eba.c       |   7 +-
 drivers/mtd/ubi/fastmap.c   | 132 ++++++++++++++++++----
 drivers/mtd/ubi/io.c        |  28 +++++
 drivers/mtd/ubi/ubi-media.h |  32 +++++-
 drivers/mtd/ubi/ubi.h       |  62 +++++++++-
 drivers/mtd/ubi/vtbl.c      |   6 +-
 drivers/mtd/ubi/wl.c        | 270 +++++++++++++++++++++++++++++++++++++++++---
 10 files changed, 690 insertions(+), 76 deletions(-)

-- 
1.8.5.2
--
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
