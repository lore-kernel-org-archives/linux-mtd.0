From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-mtd@lists.infradead.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2 0/2] MTD: spi-nor: add support for sst26wf016, sst26wf032
Date: Mon, 10 Sep 2018 14:46:26 +0300
Message-Id: <20180910114628.19156-1-Eugeniy.Paltsev@synopsys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for the SST sst26wf016 and sst26wf032 flash IC:

sst26wf*** flash series block protection implementation differs from other
SST series, so we add implementation for sst26wf*** lock/unlock/is_locked
functions.

Add sst26wf016 and sst26wf032 flash IC info to spi_flash_ids list.

NOTE:
these patches is basically following mine u-boot commits port:
http://git.denx.de/?p=u-boot.git;a=commitdiff;h=3d4fed87a5fa3ffedf64ff2811cd95c5ac4503ac
http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a19e97157c3721ef9c4b15c68c1773467a3b4a98

Changes v1->v2:
 * Check return value of {read | write}_reg callbacks.

Eugeniy Paltsev (2):
  mtd: spi-nor: Add support of sst26wf* flash ICs protection ops
  mtd: spi-nor: add support for sst26wf016, sst26wf032

 drivers/mtd/spi-nor/spi-nor.c | 179 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |   4 +
 2 files changed, 183 insertions(+)

-- 
2.14.4
