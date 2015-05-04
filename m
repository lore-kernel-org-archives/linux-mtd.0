Received: from e23smtp07.au.ibm.com ([202.81.31.140])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpA7M-0003g5-VT
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 06:44:41 +0000
Received: from /spool/local
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Mon, 4 May 2015 16:44:14 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 131972CE8040
 for <linux-mtd@lists.infradead.org>; Mon,  4 May 2015 16:44:11 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t446i2rI42860584
 for <linux-mtd@lists.infradead.org>; Mon, 4 May 2015 16:44:11 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t446hcSU016253
 for <linux-mtd@lists.infradead.org>; Mon, 4 May 2015 16:43:38 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Add a MTD driver for OpenPower PNOR flash
Date: Mon,  4 May 2015 16:42:18 +1000
Message-Id: <1430721739-17517-1-git-send-email-cyrilbur@gmail.com>
Cc: dwmw2@infradead.org, jk@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm resending the patch that Jeremy Kerr sent a while back.

This patch implements a simple mtd device to allow access to the PNOR
flash on OpenPower machines. The flash is accessed through firmware
calls.

The firmware calls are already merged in:
commit ed59190e41b725e1cfd79541f5fc66c20adb0671
Author: Cyril Bur <cyrilbur@gmail.com>
Date:   Wed Apr 1 14:05:30 2015 +0800

    powerpc/powernv: Add interfaces for flash device access

Cheers,

Cyril



Cyril Bur (1):
  drivers/mtd: add powernv flash MTD abstraction driver

 drivers/mtd/devices/Kconfig         |   6 +
 drivers/mtd/devices/Makefile        |   1 +
 drivers/mtd/devices/powernv_flash.c | 288 ++++++++++++++++++++++++++++++++++++
 3 files changed, 295 insertions(+)
 create mode 100644 drivers/mtd/devices/powernv_flash.c

-- 
1.9.1
