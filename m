Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK62F-0005R5-0K
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 14:39:17 +0000
Message-Id: <cover.1438093758.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Tue, 28 Jul 2015 16:29:18 +0200
Subject: [PATCH 0/2] New NAND chip IDs
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Petros Angelatos <petrosagg@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

the NAND chips on Cubietech boards are not known to Linux.

I used Petros Angelatos' patch from sunxi experimental tree for one chip and
added another chip.

I hope it's ok to send both patches to avoid merge conflict.

Thanks

Michal

Michal Suchanek (1):
  mtd: nand: add Samsung K9GBG08U0A chip id

Petros Angelatos (1):
  mtd: nand: add Samsung's K9GBG08U0B to nand_ids table

 drivers/mtd/nand/nand_ids.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.1.4
