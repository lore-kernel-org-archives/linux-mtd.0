Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J5KYw-0003Tc-Tr
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2007 12:31:49 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 20 Dec 2007 16:22:51 +0200
Message-Id: <20071220142251.30834.86791.sendpatchset@golum>
Subject: [PATCH v2 0/6] UBI: make UBI devices dynamic
Cc: Frank Haverkamp <haver@vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

here is the second iteration of the patch-set. Changes (were
requested by Arnd):

* data_offset is removed as it makes no sens to set it to anything
  but the default value
* UBI control device is now registered as "misc" device, so we
  do not waste Linux major/minor numbers
* More commentaries in the ubi-user.h file

The ltree slab cache is not removed, it will be done separately.

The original message
~~~~~~~~~~~~~~~~~~~~

here is a patch-set which makes UBI devices dynamic. This means,
that you may attach/detach MTD devices run-time, not just when
UBI module is loaded/unloaded. This is very convenient - you do
may compile UBI into the kernel and attach/detach needed MTD
devices later, when your init scripts (loaded from initrd) decide
which exactly MTD device(s) to attach. This also makes testing
a lot easier.

The idea is similar to what the device mapper has: UBI creates
an UBI control device, which registers itself in UBI sysfs
hierarchy (/sys/class/ubi/ubi_ctrl) with dynamically allocated
major and minor numbers. The control device has 2 ioctls -
attach MTD device and detach MTD device.

This patch-set applies on top of my other UBI changes and fixes,
which you may find in the UBI git.

I CC Frank and Andreas, as one of the main UBI users. I CC
Arnd as an ioctl expert.

--
Best regards,
Artem Bityutskiy (Битюцкий Артём)
