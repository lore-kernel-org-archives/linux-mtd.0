Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PozEm-00020y-8U
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 14:17:13 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p1EEFb3W006655
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2011 16:17:09 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: 
Date: Mon, 14 Feb 2011 16:16:08 +0200
Message-Id: <1297692971-7399-1-git-send-email-jarkko.lavinen@nokia.com>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Happy Valentine's day

Mtdswap is a volatile block driver on top flash partition meant to be
used as a swap.  Its like FTL but without stored mapping.

Use example. The header option will use builtin swap header, avoids mkswap and
saves 4KiB.
  modprobe onenand_sim
  modprobe mtdswap partitions=0 header=1
  swapon /dev/mtdswap0

Erase blocks have clean and dirty markers stored in the OOB.  Clean
markers contain an erase counter for wear leveling. The current
implementation assumes OOB can be written once before writing to main
area.

A new background method is added into struct mtd_blktrans_ops and
background support to mtd_blkdevs thread.  The idea is to allow
garbage collection to run as a background job when the request queue
is empty. This allows the mtdswap to be single threaded and avoids
messy locking. It also increases GC performance.

MTdswap tries to recover from read and write errors and erase
failures. Soft read error, write error and erase failures are normally
not returned to user. Only hard read errors cause data loss and an error
to be returned to the user.

Bitflips are considered normal behavior.  Erase blocks with read or
write errors schedule the erase block to be garbage collected. With
hard read error the GC may fail and data is lost. Hard read errors
cause the erase block to be pattern tested before taken back into use.

Write errors cause the erase block to marked bad immediately. Erase
failure tolerance is a compile time option. With strict handling the
erase block is marked bad immediately, otherwise after several
retries.

Potential improvements could be:
- Buffering for faster IO and and pages larger than 4KiB.
- Using device names rather than number as a module parameter.
- Erasing more than one erase block at a time.
- Scan the erase blocks after startup to make faster startup.
- Storing the mapping information to make it yet another FTL and allow
  hibernation into swap partition.

Jarkko Lavinen

 drivers/mtd/Kconfig          |   18 
 drivers/mtd/Makefile         |    1 
 drivers/mtd/mtd_blkdevs.c    |   33 
 drivers/mtd/mtdswap.c        | 1593 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/blktrans.h |    2 
 5 files changed, 1644 insertions(+), 3 deletions(-)
