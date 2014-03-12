Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNgjo-0005yY-Vd
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 10:50:17 +0000
From: Pekon Gupta <pekon@ti.com>
To: Tony Lindgren <tony@atomide.com>, <bcousson@baylibre.com>
Subject: [PATCH v1 0/3] add parallel NAND support for TI's new OMAPx and AMxx
 platforms (Part-2)
Date: Wed, 12 Mar 2014 16:19:17 +0530
Message-ID: <1394621360-2457-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-omap <linux-omap@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch-set adds parallel NAND support on following TI platforms
 - AM335x (am335x-bone LT, am335x-boneblack): <disabled by default>
 - AM43xx (am437x-gp-evm)


Pekon Gupta (3):
  ARM: dts: am335x-bone: add support for beaglebone NAND cape
  ARM: dts: am335x-boneblack: add support for beaglebone NAND cape
  ARM: dts: am437x-gp-evm: add support for parallel NAND flash

 arch/arm/boot/dts/am335x-bone.dts      | 123 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-boneblack.dts | 120 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/am437x-gp-evm.dts    | 107 ++++++++++++++++++++++++++++
 3 files changed, 350 insertions(+)

-- 
1.8.5.1.163.gd7aced9
