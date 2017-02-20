From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 0/3] mtd: nand: atmel: Add ->setup_data_interface() +
 PM ops
Date: Mon, 20 Feb 2017 22:12:26 +0100
Message-Id: <1487625149-7234-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Hopefully the last resend. I double checked everything this time :-).

This patch series is adding to important features to the new Atmel NAND
controller driver:
1/ automatic SMC timings configuration based on information retrieved
   during NAND detection
2/ proper ->suspend()/->resume(). Timings are properly restored when
   resuming the system

This series depends on [1] and [2].

Regards,

Boris

[1]https://www.spinics.net/lists/arm-kernel/msg563780.html
[2]https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1337235.html

Boris Brezillon (3):
  mtd: nand: Pass the CS line to ->setup_data_interface()
  mtd: nand: atmel: Add ->setup_data_interface() hooks
  mtd: nand: atmel: Add PM ops

 drivers/mtd/nand/atmel/nand-controller.c | 351 ++++++++++++++++++++++++++++++-
 drivers/mtd/nand/mxc_nand.c              |  12 +-
 drivers/mtd/nand/nand_base.c             |  22 +-
 drivers/mtd/nand/s3c2410.c               |   5 +-
 drivers/mtd/nand/sunxi_nand.c            |   7 +-
 drivers/mtd/nand/tango_nand.c            |   7 +-
 include/linux/mtd/nand.h                 |  12 +-
 7 files changed, 380 insertions(+), 36 deletions(-)

-- 
2.7.4
