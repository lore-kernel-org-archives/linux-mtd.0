Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1corGB-0003pC-1d
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 12:45:37 +0000
From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rahul Bedarkar <rahul.bedarkar@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [RFC 0/6] Add user OTP support in SPI-NOR
Date: Fri, 17 Mar 2017 18:13:50 +0530
Message-ID: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Many NOR flash chips comes with One-Time-Programmable area a.k.a
security registers. This RFC patchset aims at adding generic OTP
support in SPI-NOR to read/write user OTP area.

In SPI-NOR framework, OTP specific read/write methods will use
read_xfer/write_xfer hooks. So PATCH 1, reverts "unused read_xfer/
write_xfer hooks."

PATCH 2 changes return value of read_xfer/write_xfer to allow
returning amount of data transferred and errors as read(2)/write(2).
This makes them inline with current read/write hooks.

PATCH 3 modified helpers in m25p80.c so that those can be used
from read_xfer/write_xfer methods.

PATCH 4 implements read_xfer/write_xfer in m25p80.c

PATCH 5 implements generic support to read/write user OTP.

And finally in PATCH 6 user OTP support for s25fl016k is enabled.

Overall changes are as follows:

New flag SPI_NOR_HAS_OTP is added to specify chip has OTP area. Using
OTP_INFO macro, details of OTP area can be specified. It includes size
of area, number of OTP areas/banks, starting address and difference
between consecutive OTP banks. OTP framework will give user linear
address view from 0 to size of OTP area. User don't need to specify
actual physical address of OTP area for reading/writing.

Details which could be specific to manufacturer like opcodes for
read/write/erase can be specified based on manufacturer.

Generic OTP read/write methods are added so as it can be used for OTP
support from other manufacturer.

This complete patchset is tested with Winbond NOR flash W25Q16DV which
is detected as "s25fl016k" by SPI-NOR.

I've plans to add support for locking these OTP areas and reading
factory OTP area as well. But before that I would to get comments
on this initial part to understand if I'm going in right direction.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Rahul Bedarkar (6):
  Revert "mtd: spi-nor: remove unused read_xfer/write_xfer hooks"
  mtd: spi-nor: change return value of read_xfer and write_xfer
  mtd: m25p80: don't pass spi_nor to helper methods
  mtd: m25p80: implement read_xfer and write_xfer
  mtd: spi-nor: add support to read/write user OTP
  mtd: spi-nor: enable OTP support for s25fl016k

 drivers/mtd/devices/m25p80.c  | 111 ++++++++++++---
 drivers/mtd/spi-nor/spi-nor.c | 314 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spi-nor.h   |  52 +++++++
 3 files changed, 460 insertions(+), 17 deletions(-)

-- 
2.6.2
