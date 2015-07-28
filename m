Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK0ry-0001yj-R5
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 09:08:20 +0000
Message-Id: <cover.1438073915.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Tue, 28 Jul 2015 10:58:35 +0200
Subject: [PATCH 0/2] New SPI NOR chip IDs
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Huang Shijie <shijie.huang@intel.com>,
  Marek Vasut <marex@denx.de>, Michal Suchanek <hramrach@gmail.com>,
  Ben Hutchings <ben@decadent.org.uk>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

these are flash chips I used when testing spi nor drivers.

GD25Q41B is thoroughly tested, Pm25LD020 is tested but the chip is probably bad
and GD25LQ32C is tested readonly.

Thanks

Michal

Michal Suchanek (2):
  mtd: spi-nor: Add GD25LQ32C 1.8V SPI NOR flash ID
  MTD: spi-nor: Add Pm25LD020 and GD25Q41B chip ID.

 drivers/mtd/spi-nor/spi-nor.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.1.4
