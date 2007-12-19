Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4zKk-0001s8-HL
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 13:51:44 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Wed, 19 Dec 2007 17:41:37 +0200
Message-Id: <20071219154137.23264.28116.sendpatchset@golum>
Subject: [PATCH 0/5] UBI: make UBI devices dynamic
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

here is a patchset which makes UBI devices dynamic. This means,
that you may attach/detach MTD devices runtime, not just when
UBI module is loaded/unloaded. This is very convinient - you do
may compile UBI into the kernel and attach/detach needed MTD
devices later, when your init scripts (loaded from initrd) decide
which exactly MTD device(s) to attach. This also makes testing
a lot easier.

The idea is similar to what the device mapper has: UBI creates
an UBI control device, which registers itself in UBI sysfs
hierarchy (/sys/class/ubi/ubi_ctrl) with dynamically allocated
major and minor numbers. The control device has 2 ioctls -
attach MTD device and detach MTD device.

This patchset applies on top of my other UBI changes and fixes,
which you may find in the UBI git.

I CC Frank and Andreas, as one of the main UBI users. I CC
Arnd as an ioctl expert.

--
Best regards,
Artem Bityutskiy (Битюцкий Артём)
