Received: from mx1.mailbox.org ([2001:67c:2050:104:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gW2V1-0007yv-5B
 for linux-mtd@lists.infradead.org; Sun, 09 Dec 2018 17:04:13 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 0/2] mtd: spi-nor: Add two spi nor flash chips
Date: Sun,  9 Dec 2018 18:03:40 +0100
Message-Id: <20181209170342.9554-1-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patches were applied in OpenWrt since some time and I would like
to integrate them into the mainline Linux kernel, I do not have the
devices, I only compared the settings with the datasheets I found.

André Valentin (1):
  mtd: spi-nor: Add support for mx25u3235f

Piotr Dymacz (1):
  mtd: spi-nor: Add support for EON EN25Q128

 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.11.0
