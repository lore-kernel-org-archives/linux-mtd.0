From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 0/3] Reuse davinci-nand driver for Keystone arch
Date: Wed, 20 Nov 2013 18:24:56 +0200
Message-ID: <1384964699-15134-1-git-send-email-ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 grygorii.strashko@ti.com, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series contains updates of Davinci nand driver, in order to be
reused for Keystone platform.

Depends on:
- Davinci nand driver fixes and updates:
  https://lkml.org/lkml/2013/11/20/271

- Introduce AEMIF driver for Davinci/Keystone archs:
  http://lkml.org/lkml/2013/11/11/352

V1:
https://lkml.org/lkml/2013/11/11/352

Ivan Khoronzhuk (3):
  mtd: nand: davinci: reuse driver for Keystone arch
  mtd: nand: davinci: don't set timings if AEMIF is used
  mtd: nand: davinci: don't request AEMIF address range

 .../devicetree/bindings/mtd/davinci-nand.txt       |    8 +--
 drivers/mtd/nand/Kconfig                           |    6 +--
 drivers/mtd/nand/davinci_nand.c                    |   57 +++++++++++++-------
 3 files changed, 45 insertions(+), 26 deletions(-)

-- 
1.7.9.5
