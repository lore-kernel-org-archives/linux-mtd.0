Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UdiBd-0000MP-7u
 for linux-mtd@lists.infradead.org; Sat, 18 May 2013 14:32:41 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 0/1] ubi: Introduce block devices for UBI volumes
Date: Sat, 18 May 2013 11:31:53 -0300
Message-Id: <1368887515-10536-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Tim Bird <tim.bird@am.sony.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
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

If you are wondering why we want this, you can read this discussion:

  http://lkml.indiana.edu/hypermail/linux/kernel/1211.2/02556.html

In particular, it's important to note this already has users:

  http://permalink.gmane.org/gmane.linux.drivers.mtd/46221

* Changes from v2 *

On this 3rd version of the patch I've re-worked the patch considerably,
mostly integrating it with UBI, instead of making it a separate module.

Despite this integration, the ubiblock code is still completely independent
of the UBI core and it can be completely compiled-out through configuration.
In turn, making ubiblock part of UBI allows to add ioctl access to attach/detach
block devices to/from UBI volumes in a very simple way.

A new tool 'ubiblkvol' is added to ubi-utils to access these two new ioctls.

To address the 'write or not to write' discussion, the write support is enabled
with a kernel option and there's a big fat 'DANGEROUS' label on it to prevent
misusage.

I'm eager to hear some comments, and perhaps some flames: it's getting very cold
this autumn south of south-america :)

Ezequiel Garcia (1):
  ubi: Introduce block devices for UBI volumes

 drivers/mtd/ubi/Kconfig     |  24 ++
 drivers/mtd/ubi/Makefile    |   1 +
 drivers/mtd/ubi/block.c     | 894 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/build.c     |   5 +
 drivers/mtd/ubi/cdev.c      |  20 +
 drivers/mtd/ubi/ubi.h       |  14 +
 include/uapi/mtd/ubi-user.h |  11 +
 7 files changed, 969 insertions(+)
 create mode 100644 drivers/mtd/ubi/block.c

-- 
1.8.1.5
