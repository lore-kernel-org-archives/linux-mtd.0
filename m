Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XiOCN-00050o-Px
 for linux-mtd@lists.infradead.org; Sun, 26 Oct 2014 13:49:36 +0000
From: Tanya Brokhman <tlinder@codeaurora.org>
To: dedekind1@gmail.com,
	richard@nod.at
Subject: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention handling
Date: Sun, 26 Oct 2014 15:49:02 +0200
Message-Id: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
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

Changes from V1:
- Documentation file was added in the first patch that describes the
  design in general.
  All other patches were unchanged and resent just for reference. Still
  working on comments from Richard on fastmap layout.
  All comments that were made for V1 will be addressed in the next patch
  set. This version is just for the addition of the documentation file.

Tanya Brokhman (5):
  mtd: ubi: Read disturb infrastructure
  mtd: ubi: Fill read disturb statistics
  mtd: ubi: Make in_wl_tree function public
  mtd: ubi: Read threshold verification
  mtd: ubi: Add sysfs entry to force all pebs' scan

 Documentation/mtd/ubi/ubi-read-disturb.txt | 145 ++++++++++++++++
 drivers/mtd/ubi/attach.c                   | 137 +++++++++++----
 drivers/mtd/ubi/build.c                    |  81 +++++++++
 drivers/mtd/ubi/debug.c                    |  11 ++
 drivers/mtd/ubi/eba.c                      |   7 +-
 drivers/mtd/ubi/fastmap.c                  | 132 +++++++++++---
 drivers/mtd/ubi/io.c                       |  28 +++
 drivers/mtd/ubi/ubi-media.h                |  32 +++-
 drivers/mtd/ubi/ubi.h                      |  62 ++++++-
 drivers/mtd/ubi/vtbl.c                     |   6 +-
 drivers/mtd/ubi/wl.c                       | 270 +++++++++++++++++++++++++++--
 11 files changed, 835 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/mtd/ubi/ubi-read-disturb.txt

-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, 
a Linux Foundation Collaborative Project
