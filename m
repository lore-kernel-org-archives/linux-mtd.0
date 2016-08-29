Message-ID: <1472470803.11041.4.camel@mtkswgap22>
Subject: [PATCH v2 0/2] mtd: nand: fix writing incorrect ECC parity data in
 OOB region.
From: RogerCC.Lin <rogercc.lin@mediatek.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <xiaolei.li@mediatek.com>, <steven.liu@mediatek.com>, <robh@kernel.org>,
 <computersforpeace@gmail.com>, <daniel.thompson@linaro.org>,
 <linux-mtd@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <dwmw2@infradead.org>,
 <blogic@openwrt.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Date: Mon, 29 Aug 2016 19:40:03 +0800
In-Reply-To: <20160829101006.2b200e0a@bbrezillon>
References: <1472443093.27061.4.camel@mtkswgap22>
 <20160829101006.2b200e0a@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series fix chances to write incorrect ECC data which may cause
uncorrectable ECC error when reading.

changes since v1:
- separate patches into 2.
- use shift operator with byte access to avoid endianness conversion
problems.
- follow linux coding style.

The patch passed the test of UBIFS file-system read/write on Mediatek's
RFB. The tested driver is checked-out from LEDE OpenWRT project's
upstream driver, which is pretty much same as nand/next branch upstream
driver(git clone https://git.lede-project.org/source.git).

RogerCC Lin (2):
  mtd: nand: fix generating over-boundary ECC data when writing.
  mtd: nand: fix chances to create incomplete ECC data when writing.

 drivers/mtd/nand/mtk_ecc.c  |   12 ++++++++----
 drivers/mtd/nand/mtk_nand.c |    8 ++++----
 2 files changed, 12 insertions(+), 8 deletions(-)
