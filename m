Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdfJV-0006vE-2M
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 12:00:53 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/1] Bad block markers here, there and everywhere
Date: Tue,  5 Nov 2013 09:00:20 -0300
Message-Id: <1383652821-3557-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Huang Shijie <b32955@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everyone,

This commit adds a new option called NAND_BBT_DATA_BBM. The change itself
is pretty small and simple to understand: when the badblock_pattern sets the
NAND_BBT_DATA_BBM option, scan_block_fast() reads the data region instead
of the OOB region.

So, let me explain why we need this new feature.

Some NAND controllers provide its own unique view of a device page, where the
page is partitioned into several DATA,OOB regions. In other words, a flash that's
specified by the manufacturer:

|-------------------------|
|         DATA      | OOB |
|-------------------------|

is actually handled by the driver/controller as:

|-------------------------|
| DATA | OOB | DATA | OOB |
|-------------------------|

Now, this has a peculiar side-effect: the bad block marker is located at
position that is regarded as the data region in the controller's view.

Therefore, when the device is scanned for bad blocks (for the first
time) and the bad block table is built using the factory-marked blocks,
these markers are never found.

To address this case, we introduce a new option NAND_BBT_DATA_BBM.
Such option is used to read the data region of a a given page, instead
of the oob region, in the scan_block_fast() function. The page is read
as usual, using the length and offset parameters set in the bad block pattern.

Given drivers can customize the bad block pattern to match its specific
requirements, the new option allows to search for a bad block marker at
*any* position within a page.

This feature would be important and helpful to deal with the Armada 370/XP
(pxa3xx-nand driver) bad block markers factory (initial) detection.
Details about the NAND controller can be found in the last patchset:

  https://lwn.net/Articles/571062/

Also, it seems gpmi-nand would also benefit from this feature. The gpmi-nand
driver seem to go through great pains to deal with this case. So, instead of
doing weird things at a driver level we can just handle this in the core code.

So, how does it look?

Ezequiel Garcia (1):
  mtd: nand: Allow bad block markers to be found in the data region

 drivers/mtd/nand/nand_bbt.c | 11 +++++++++--
 include/linux/mtd/bbm.h     |  4 ++++
 2 files changed, 13 insertions(+), 2 deletions(-)

-- 
1.8.1.5
