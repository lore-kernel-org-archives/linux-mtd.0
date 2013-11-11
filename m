From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 00/12] Introduce davinci AEMIF driver
Date: Mon, 11 Nov 2013 16:47:37 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8CD5@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patches introduce AEMIF driver for davinci/keystone archs=0A=
and defines AEMIF and NAND devices in keystone DT.=0A=
Also some changes added to davinci NAND driver in order to reuse it=0A=
for Keystone arch.=0A=
=0A=
The patches can be spitted to several series if needed, like=0A=
=0A=
12      - add AEMIF/NAND device entry in DT=0A=
arm: dts: keystone: add AEMIF/NAND device entry=0A=
=0A=
9-11    - reuse davinci-nand driver for keystone arch=0A=
mtd: nand: davinci: don't request AEMIF address range=0A=
mtd: nand: davinci: don't set timings if AEMIF is used=0A=
mtd: nand: davinci: reuse driver for Keystone arch=0A=
=0A=
7-8     - introduce AEMIF driver=0A=
memory: davinci-aemif: add bindings for AEMIF driver=0A=
memory: davinci-aemif: introduce AEMIF driver=0A=
=0A=
4-6     - move davinci-nand bindings under mtd=0A=
mtd: nand: davinci: adjust DT properties to MTD generic=0A=
mtd: nand: davinci: extend description of bindings=0A=
mtd: nand: davinci: move bindings under mtd=0A=
=0A=
1-3     - separate nand fixes=0A=
mtd: nand: davinci: simplify error handling=0A=
mtd: nand: davinci: check required ti,davinci-chipselect property=0A=
mtd: nand: davinci: fix driver registration=0A=
=0A=
See Documentation:=0A=
Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf=0A=
OMAP-L138 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf=0A=
Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf=0A=
=0A=
Test:=0A=
# flash_erase /dev/mtd2 0 0=0A=
=0A=
Erasing 128 Kibyte @ 7de0000 -- 99 % complete flash_erase: Skipping bad blo=
ck at=0A=
07e00000=0A=
flash_erase: Skipping bad block at 07e20000=0A=
flash_erase: Skipping bad block at 07e40000=0A=
flash_erase: Skipping bad block at 07e60000=0A=
Erasing 128 Kibyte @ 7e60000 -- 100 % complete=0A=
=0A=
# nandtest -k -p 3 /dev/mtd2=0A=
ECC corrections: 0=0A=
ECC failures   : 0=0A=
Bad blocks     : 4=0A=
BBT blocks     : 0=0A=
Bad block at 0x07e00000=0A=
Bad block at 0x07e20000=0A=
Bad block at 0x07e40000=0A=
Bad block at 0x07e60000=0A=
=0A=
Finished pass 1 successfully=0A=
Bad block at 0x07e00000F44864=0A=
Bad block at 0x07e20000=0A=
Bad block at 0x07e40000=0A=
Bad block at 0x07e60000=0A=
=0A=
Finished pass 2 successfully=0A=
Bad block at 0x07e00000=0A=
Bad block at 0x07e20000=0A=
Bad block at 0x07e40000=0A=
Bad block at 0x07e60000=0A=
=0A=
Finished pass 3 successfully=0A=
=0A=
Based on=0A=
git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git=
=0A=
keystone/master=0A=
=0A=
Ivan Khoronzhuk (12):=0A=
  mtd: nand: davinci: fix driver registration=0A=
  mtd: nand: davinci: check required ti,davinci-chipselect property=0A=
  mtd: nand: davinci: simplify error handling=0A=
  mtd: nand: davinci: move bindings under mtd=0A=
  mtd: nand: davinci: extend description of bindings=0A=
  mtd: nand: davinci: adjust DT properties to MTD generic=0A=
  memory: davinci-aemif: introduce AEMIF driver=0A=
  memory: davinci-aemif: add bindings for AEMIF driver=0A=
  mtd: nand: davinci: reuse driver for Keystone arch=0A=
  mtd: nand: davinci: don't set timings if AEMIF is used=0A=
  mtd: nand: davinci: don't request AEMIF address range=0A=
  arm: dts: keystone: add AEMIF/NAND device entry=0A=
=0A=
 .../devicetree/bindings/arm/davinci/nand.txt       |   46 ---=0A=
 .../bindings/memory-controllers/davinci-aemif.txt  |  198 ++++++++++=0A=
 .../devicetree/bindings/mtd/davinci-nand.txt       |   94 +++++=0A=
 arch/arm/boot/dts/keystone.dts                     |   63 +++=0A=
 drivers/memory/Kconfig                             |   11 +=0A=
 drivers/memory/Makefile                            |    1 +=0A=
 drivers/memory/davinci-aemif.c                     |  415 ++++++++++++++++=
++++=0A=
 drivers/mtd/nand/Kconfig                           |    6 +-=0A=
 drivers/mtd/nand/davinci_nand.c                    |   95 +++--=0A=
 9 files changed, 839 insertions(+), 90 deletions(-)=0A=
 delete mode 100644 Documentation/devicetree/bindings/arm/davinci/nand.txt=
=0A=
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/da=
vinci-aemif.txt=0A=
 create mode 100644 Documentation/devicetree/bindings/mtd/davinci-nand.txt=
=0A=
 create mode 100644 drivers/memory/davinci-aemif.c=0A=
=0A=
--=0A=
1.7.9.5=0A=
=0A=
