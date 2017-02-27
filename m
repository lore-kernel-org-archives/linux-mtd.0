Received: from smtp5-g21.free.fr ([212.27.42.5])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciRun-0003vW-3c
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 20:29:05 +0000
From: Alban <albeu@free.fr>
To: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alban <albeu@free.fr>
Subject: [RFC 0/3] drivers: Add an API to read device specific config data
Date: Mon, 27 Feb 2017 21:28:09 +0100
Message-Id: <1488227292-18906-1-git-send-email-albeu@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

while looking at adding OF support for the ath9k driver I had the problem of
reading the EEPROM data. On the SoC platforms this data is stored in an SPI
flash along with a few other things. In OpenWRT/LEDE this data is read from
the board init code using the fact that the flash is (normaly) readable from
a memory map. A bit too hackish for my taste.

This is just one example, there is various other similar cases, mostly with
MAC addresses. I thought it would be nicer if we had a clean API for this,
similar to the firmware API but per device instance instead of beeing per
driver. The device driver wouldn't have to care where the data is stored,
they just request it and the backend take care of reading the EEPROM, MTD
or whatever is used on the board.

This series implement such an API along with an implementation for MTD
devices and a use in the ath9k driver. As this is an RFC I didn't yet
write the OF binding documentation, that will come later if the feedback
is positive.

Alban Bedel (3):
  drivers: Add an API to read device specific config data
  mtd: Add support for reading device data out of MTD devices
  ath9k: ahb: Add OF support

 drivers/base/Kconfig                   |   6 +
 drivers/base/Makefile                  |   1 +
 drivers/base/devdata.c                 | 204 +++++++++++++++++++++++++++++++++
 drivers/mtd/Kconfig                    |   9 ++
 drivers/mtd/Makefile                   |   1 +
 drivers/mtd/devdata.c                  |  70 +++++++++++
 drivers/net/wireless/ath/ath9k/Kconfig |   1 +
 drivers/net/wireless/ath/ath9k/ahb.c   |  55 +++++++--
 drivers/net/wireless/ath/ath9k/init.c  |  41 ++++++-
 include/linux/devdata.h                |  79 +++++++++++++
 10 files changed, 459 insertions(+), 8 deletions(-)
 create mode 100644 drivers/base/devdata.c
 create mode 100644 drivers/mtd/devdata.c
 create mode 100644 include/linux/devdata.h

-- 
2.7.4
