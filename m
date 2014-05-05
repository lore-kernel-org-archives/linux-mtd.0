Received: from ns.omicron.at ([212.183.10.25])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhCBk-00012n-9W
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 06:15:45 +0000
From: Christian Riesch <christian.riesch@omicron.at>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [RESEND PATCH v4 0/4] mtd: cfi_cmdset_0002: Add OTP support for
 Micron M29EW NOR flashes
Date: Mon, 5 May 2014 08:14:25 +0200
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <817d0c27-e4a8-45e2-b2c8-89fe64256268@mary.at.omicron.at>
Cc: Christian Riesch <christian.riesch@omicron.at>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

The first version of this patchset was posted to the list in February 2013.
There were a few comments to these patches (from Artem), which I have
addressed in separate patches (merged by you on March 9).

Since there are no further objections against these patches (after a review
time of more than a year), I would like to ask you to merge them as well.

Best regards,
Christian 


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
- Applies on linux-mtd.git

Changes for v2:
- dropped one patch that changes the detection of M29EW devices,
  this patch is currently not required
- added support for locking
- fixed a few bugs in the loop that walks through the OTP memory

Changes for v3:
- Added retlet parameter to cfi_amdstd_get_{fact,user}_prot_info
- Fixed partial write of words

Changes for v4:
- Updated prerequisites in cover letter

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
