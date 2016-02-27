Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZnhI-0004H1-UV
 for linux-mtd@lists.infradead.org; Sat, 27 Feb 2016 22:50:50 +0000
Received: by mail-wm0-x243.google.com with SMTP id p65so4104629wmp.1
 for <linux-mtd@lists.infradead.org>; Sat, 27 Feb 2016 14:50:24 -0800 (PST)
To: Brian Norris <computersforpeace@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] mtd: m25p80: make use of recently introduced
 max_transfer_size in SPI core
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Message-ID: <56D2279D.9070400@gmail.com>
Date: Sat, 27 Feb 2016 23:47:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some time ago there was a discussion about enabling m25p80_read to read
in chunks due to controller transfer size limits. Related patches have
been proposed but it seems like they got lost on the way.

This is a new attempt to add reading in chunks if the transfer size
exceeds the controller limit exposed via spi_max_transfer_size().

Heiner Kallweit (2):
  mtd: m25p80: fix retlen usage in m25p80_read and propagate errors
  mtd: m25p80: consider max_transfer_size when reading

 drivers/mtd/devices/m25p80.c | 43 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

-- 
2.7.1
