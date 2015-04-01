Received: from ozlabs.org ([2401:3900:2:1::2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdBmp-00038O-Ek
 for linux-mtd@lists.infradead.org; Wed, 01 Apr 2015 06:06:00 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
Subject: [PATCH 0/2] Add a MTD driver for OpenPower PNOR flash
Message-Id: <1427868330.741478.119647151764.0.gpush@pablo>
In-Reply-To: <1427868330.741478.119647151764.0.gpush@pablo>
To: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Date: Wed, 01 Apr 2015 14:05:30 +0800
Cc: Cyril Bur <cyrilbur@gmail.com>, Joel Stanley <joel@jms.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

This series implements a simple mtd device to allow access to the PNOR
flash on OpenPower machines. The flash is accessed through firmware
calls.

Patch 1/2 adds the Linux interface to these calls. Patch 2/2 adds a mtd
driver that uses these calls.

Because there's two subsystems involved here, there are a couple of
methods to merge this:

 1) The powerpc folks take 1/2, and the mtd folks take 2/2, to be
    applied once 1/2 is available (Michael has created a topic branch for
    this in the past, which can make things a little easier), or

 2) One of the maintainers takes both patches, once the other has acked
    their patch. I'd suggest that it goes through the powerpc tree in
    this case, as that will be less likely to conflict.

Either way, I'm happy.

Cheers,

	
Jeremy

---
Cyril Bur (2):
      powerpc/powernv: Add interfaces for flash device access
      drivers/mtd: add powernv flash MTD abstraction driver
