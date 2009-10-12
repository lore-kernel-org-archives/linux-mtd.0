Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxHaO-0001Tw-7h
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 09:53:04 +0000
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v5 0/3] MTD: OneNAND: multiblock erase support
Date: Mon, 12 Oct 2009 12:52:42 +0300
Message-Id: <1255341165-1972-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Cc: amul.saha@samsung.com, artem.bityutskiy@nokia.com,
	kyungmin.park@samsung.com, Mika Korhonen <ext-mika.2.korhonen@nokia.com>,
	adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(v5) Adjust patches to apply on current tree. Use __func__ in printk's.
     Fix mistakes found by K. Park.

(v4) This patch series is a reworked version of

http://lists.infradead.org/pipermail/linux-mtd/2009-September/027138.html
http://lists.infradead.org/pipermail/linux-mtd/2009-September/027139.html
http://lists.infradead.org/pipermail/linux-mtd/2009-September/027140.html

based on comments by Adrian Hunter and Kyungmin Park. This version should
address the issues pointed out by them.

The original patch is:
http://lists.infradead.org/pipermail/linux-mtd/2009-June/026130.html

I split the original patch in two for readability: the first part extracts
the execution of erase command to a separate function for easier integration
of different erase method. The second part implements the multiblock erase
function in case multiple blocks are requested to be erased and the chip is
not Flex.

This is useful for flashing applications that need to do their work as
fast as possible. For full 64 eraseblock case the erase speed is up to 30x
faster. (Samsung: 64 MB/s vs 2.1 GB/s, I got 1.4 GB/s on Linux kernel)


Mika Korhonen (3):
  MTD: OneNAND: move erase method to a separate function
  MTD: OneNAND: multiblock erase support
  MTD: OneNAND: fix double printing of function name

 drivers/mtd/onenand/omap2.c        |   22 +++-
 drivers/mtd/onenand/onenand_base.c |  289 +++++++++++++++++++++++++++++------
 include/linux/mtd/flashchip.h      |    4 +-
 include/linux/mtd/onenand_regs.h   |    2 +
 4 files changed, 262 insertions(+), 55 deletions(-)
