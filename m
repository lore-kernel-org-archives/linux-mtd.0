Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbhic-0000d8-PP
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 23:29:24 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 0/3] fixups for OOB ECC problems
Date: Tue, 28 Jun 2011 16:28:57 -0700
Message-ID: <1309303740-9936-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Jim Quinlan <jim2101024@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Now that we have added the possibility that mtd->read_oob returns
-EUCLEAN or -EBADMSG for corrected bitflips and for uncorrectable errors,
respectively, there are more pieces of code that need to take this into
account. These patches should address some of these by ignoring bitflips
when bit accuracy is not needed or by ignoring corrected errors when
scrubbing would be unnecessary.

There are still other cases to address, for example, some flash-based BBT
code.

This applies on top of l2-mtd-2.6.git. Patch 3 is an amendment to commit
abf386c475beab813dc9b3366e592e00255e987a, ("mtd: nand: handle ECC errors
in OOB"), so it can be squashed in if you want. Let me know if you want
me to do this and do a resend.

Brian

Brian Norris (3):
  mtd: nand: ignore ECC errors for simple BBM scans
  mtd: tests: ignore corrected bitflips in OOB on mtd_readtest
  mtd: edit NAND-related comment

 drivers/mtd/mtdchar.c            |    5 +++--
 drivers/mtd/nand/nand_bbt.c      |   13 ++++++++++---
 drivers/mtd/tests/mtd_readtest.c |    3 ++-
 3 files changed, 15 insertions(+), 6 deletions(-)
