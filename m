Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEdQU-0002Sg-6V
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 15:47:04 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH 0/3] Convert fsmc_nand driver to ->exec_op() to retrieve a
 unique ID
Date: Tue, 14 Nov 2017 16:46:19 +0100
Message-Id: <20171114154622.5493-1-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

A previous work is migrating the NAND framework from ->cmdfunc() and
->cmd_ctrl() to ->exec_op(), a different way to interract between NAND
core and NAND controller drivers.

Retrieving a unique ID from some ONFI NAND chips needs to send a
particular command to the chip. As there is no feedback from
->cmdfunc(), it may or it may not work depending on the controller
driver in use, but the core will not be notified. Using ->exec_op(),
instead, allows the core to know if the command can be handled by the
controller driver. For this reason, only drivers converted to
->exec_op() will benefit from the nand_read_unique_id() function
introduced in this series, as the first patch does it with the
fsmc_nand driver.

About exposing the unique ID in the mtd_info structure, the commit
message will give more details but long story short: it was hard to do
better without doing a deep, time-consuming rework. So I am really open
to suggestions.

Thank you,
Miquèl


Miquel Raynal (3):
  mtd: nand: fsmc: use ->exec_op()
  mtd: nand: add the infrastructure to retrieve the ONFI unique ID
  mtd: nand: add sysfs entry for NAND chip unique ID

 drivers/mtd/mtdcore.c        |  33 +++++-
 drivers/mtd/nand/fsmc_nand.c | 234 ++++++++++++++++++++++++-------------------
 drivers/mtd/nand/nand_base.c | 103 ++++++++++++++++++-
 include/linux/mtd/mtd.h      |   1 +
 include/linux/mtd/rawnand.h  |  19 +++-
 5 files changed, 283 insertions(+), 107 deletions(-)

-- 
2.11.0
