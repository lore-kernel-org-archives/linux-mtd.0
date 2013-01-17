From: Josh Wu <josh.wu@atmel.com>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
Subject: [PATCH v2 0/3] at91: PMECC: enable PMECC in dt for at91sam9x5ek,
 at91sam9n12ek
Date: Thu, 17 Jan 2013 11:24:29 +0800
Message-Id: <1358393072-14794-1-git-send-email-josh.wu@atmel.com>
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com, Josh Wu <josh.wu@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Those patches will enable PMECC in dt parameters for at91sam9x5ek, at91sam9n12ek.
The driver will check minimum required ecc on ONFI parameter from NAND flash. 
If pmecc-cap in dts doesn't meet the requirement then driver reports a error.

v2: rebase to v3.8-rc3. And wrapped the commit message.

Josh Wu (3):
  MTD: at91: atmel_nand: for PMECC, add code to choose the ecc bits and
    sector size according to the ONFI parameter ECC requirement.
  at91: 9x5: add DT parameters to enable PMECC
  at91: at91sam9n12: add DT parameters to enable PMECC

 arch/arm/boot/dts/at91sam9n12.dtsi  |    1 +
 arch/arm/boot/dts/at91sam9n12ek.dts |    5 +-
 arch/arm/boot/dts/at91sam9x5.dtsi   |    4 ++
 arch/arm/boot/dts/at91sam9x5cm.dtsi |    5 +-
 drivers/mtd/nand/atmel_nand.c       |   89 +++++++++++++++++++++++++++++++++++
 5 files changed, 102 insertions(+), 2 deletions(-)

-- 
1.7.9.5
