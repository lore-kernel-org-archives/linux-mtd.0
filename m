Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLXGf-0005YP-FA
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 12:19:18 +0000
Received: from counter.omicron.at ([212.183.10.29])
 by ns.omicron.at (8.13.1/8.13.1) with ESMTP id s26CIlvl002167
 for <linux-mtd@lists.infradead.org>; Thu, 6 Mar 2014 13:18:53 +0100
Received: from mary.at.omicron.at (mary.at.omicron.at [172.22.100.48])
 by counter.omicron.at (8.14.4/8.14.4) with ESMTP id s26CIlu2031175
 for <linux-mtd@lists.infradead.org>; Thu, 6 Mar 2014 13:18:47 +0100
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 0/4] mtd: cfi_cmdset_0002: Add OTP support for Micron M29EW
 NOR flashes
Date: Thu, 6 Mar 2014 13:18:26 +0100
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <b3773cf0-45be-4b83-afcc-c1d1c64065b6@mary.at.omicron.at>
Cc: Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
This patchset adds support for the reading, writing, and locking of the
one time programmable (OTP) memory of Micron M29EW NOR flashes.

These flashes have a 256 byte OTP memory, which is called extended
memory region in its datasheet. The flash is compatible to Spansion S29GL
and Macronix MX29GL devices, so support for the OTP memory of these
flashes should also be possible.

Tests with this patchset were done with a single Micron M29EW device
(512 Mbit, 16 bit) on a custom board with a Texas Instruments AM1808
system on chip.

Prerequisites:
- Patch mtd: Add a retlen parameter to _get_{fact,user}_prot_info,
  commit 102f842b7aafee364659a0a45663d53085638312 in l2-mtd.git

Changes since v1:
- dropped one patch that changes the detection of M29EW devices,
  this patch is currently not required
- added support for locking
- fixed a few bugs in the loop that walks through the OTP memory

Changes since v2:
- Added retlet parameter to cfi_amdstd_get_{fact,user}_prot_info
- Fixed partial write of words

Christian Riesch (4):
  mtd: cfi_cmdset_0002: Add support for reading OTP
  mtd: cfi_cmdset_0002: Invalidate cache after entering/exiting OTP
    memory
  mtd: cfi_cmdset_0002: Add support for writing OTP memory
  mtd: cfi_cmdset_0002: Add support for locking OTP memory

 drivers/mtd/chips/cfi_cmdset_0002.c |  350 +++++++++++++++++++++++++++++++++--
 1 file changed, 331 insertions(+), 19 deletions(-)

-- 
1.7.9.5
