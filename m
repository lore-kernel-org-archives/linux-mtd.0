From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] MTD: OneNAND: multiblock erase support
Date: Thu,  3 Sep 2009 13:54:31 +0300
Message-Id: <1251975273-12432-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Cc: amul.saha@samsung.com, dedekind@infradead.org, kyungmin.park@samsung.com,
	Mika Korhonen <ext-mika.2.korhonen@nokia.com>, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Sorry about CCing this twice - I made a typo in the mailing list address.
 Please reply to this.)

This patch series is an updated version of
http://lists.infradead.org/pipermail/linux-mtd/2009-June/026130.html

I split the previous patch in two for readability: the first part extracts
the execution of erase command to a separate function for easier integration
of different erase method. The second part implements the multiblock erase
function in case multiple blocks are requested to be erased and the chip is
not Flex.

This is useful for flashing applications that need to do their work as
fast as possible. For full 64 eraseblock case the erase speed is up to 30x
faster. (Samsung: 64 MB/s vs 2.1 GB/s, I got 1.4 GB/s on Linux kernel)


Mika Korhonen (2):
  MTD: OneNAND: move erase method to a separate function
  MTD: OneNAND: multiblock erase support

 drivers/mtd/onenand/omap2.c        |   22 +++-
 drivers/mtd/onenand/onenand_base.c |  274 +++++++++++++++++++++++++++++-------
 include/linux/mtd/onenand.h        |    2 +
 include/linux/mtd/onenand_regs.h   |    2 +
 4 files changed, 246 insertions(+), 54 deletions(-)
