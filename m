Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UfSIM-00075j-1H
 for linux-mtd@lists.infradead.org; Thu, 23 May 2013 09:58:50 +0000
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/4 RESEND] mtd: cfi_cmdset_0002: Add OTP support for
 Micron M29EW NOR flashes
Date: Thu, 23 May 2013 11:58:12 +0200
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <8d75956b-b710-47fe-b5d1-61266fb3aac4@mary.at.omicron.at>
Cc: Christian Riesch <christian.riesch@omicron.at>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
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
(512 Mbit, 16 bit, only one chip) on a custom board with a
Texas Instruments AM1808 system on chip.

Changes since v1:
- dropped one patch that changes the detection of M29EW devices,
  this patch is currently not required
- added support for locking
- fixed a few bugs in the loop that walks through the OTP memory

Best regards,
Christian

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
