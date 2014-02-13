Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WE2Ph-000359-TG
 for linux-mtd@lists.infradead.org; Thu, 13 Feb 2014 19:57:39 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v5 0/1] ubi: Introduce block devices for UBI volumes
Date: Thu, 13 Feb 2014 16:57:05 -0300
Message-Id: <1392321426-18256-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds block device access on top of UBI volumes, which allows
for a ligthweigth solution to mount block-oriented filesystems on top of
flash devices.

The main target of this patch is supporting lighter, read-only filesystem,
by putting a squashfs on top of ubiblock. And since squashfs already provides
a file cache (which is even configurable), a first uncached implementation
it's good enough for now.

You can read this discussion if you are want more historical details:

  http://lkml.indiana.edu/hypermail/linux/kernel/1211.2/02556.html

In particular, it's important to note this already has users:

  1. http://permalink.gmane.org/gmane.linux.drivers.mtd/46221

  2. http://permalink.gmane.org/gmane.linux.drivers.mtd/49385

  3. Myself (Yes, I am now taking my own medicine).

As noted below, and despite being integrated into the UBI module,
the block layer is very losely coupled to the rest of the UBI code.
This is important as it should mean it has a low impact on UBI's stability.

As soon as this gets merged into UBI kernel core, I'll submit the mtd-utils
userspace tools, as well as start preparing some documentation for the mtd
website, and the docbook.

I'd be willing to drop read-support is that makes this feature acceptable;
but I guess that would make it pretty useless :-)

* Changes from v4

  * Dropped write-support

  * Dropped cached access

* Changes from v3

  * Replaced the 2-LEB (read and write) for a 1-LEB cache. This was done
    to prevent any cache-coherency issues and to avoid over-design.
    It's not clear having a separate read and write cache has a dramatical
    impact on wear leveling or performance.

  * Made the 1-LEB cache optional. Based on a suggestion by Piergiorgio
    Beruto, caching at the block level would be redundant and ineffective.
    The filesystem has a better chance of caching.

    Some very simple tests on squashfs (ubiblock's primary target) showed
    that squashfs does a great job on caching its file accesses.

    Given a LEB can be quite big on some devices O(~100KiB), it can be
    interesting to remove the cache altogether on memory-constrained platforms.

  * Make UBI_IOCVOLDETBLK return an error if the detaching wasn't successful,
    as suggested by Mike Frysinger.

  * Fixed a bunch of typos and suggestions made by Mike Frysinger.

* Changes from v2

  * On this 3rd version of the patch I've re-worked the patch considerably,
    mostly integrating it with UBI, instead of making it a separate module.

    Despite this integration, the ubiblock code is still completely independent
    of the UBI core and it can be completely compiled-out through configuration.

  * Making ubiblock part of UBI allows to add ioctl access to attach/detach
    block devices to/from UBI volumes in a very simple way.

  * A new tool 'ubiblkvol' is added to ubi-utils to access these two new ioctls.

  * To address the 'write or not to write' discussion, the write support is
    enabled with a kernel option and there's a big fat 'DANGEROUS' label on it
    to prevent misusage.

Ezequiel Garcia (1):
  ubi: Introduce block devices for UBI volumes

 drivers/mtd/ubi/Kconfig     |  19 ++
 drivers/mtd/ubi/Makefile    |   1 +
 drivers/mtd/ubi/block.c     | 656 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/build.c     |   5 +
 drivers/mtd/ubi/cdev.c      |  20 ++
 drivers/mtd/ubi/ubi.h       |  14 +
 include/uapi/mtd/ubi-user.h |  11 +
 7 files changed, 726 insertions(+)
 create mode 100644 drivers/mtd/ubi/block.c

-- 
1.8.1.5
