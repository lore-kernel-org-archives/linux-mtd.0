Received: from mail1.bemta8.messagelabs.com ([216.82.243.199])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bz1cm-00013B-Bv
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 13:18:44 +0000
To: linux-mtd <linux-mtd@lists.infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>
CC: DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Mason <slash.tmp@free.fr>, Sebastian Frias
 <sf84@laposte.net>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH v7 0/2] tango NFC support + bindings doc
Message-ID: <580F5AD2.9020909@sigmadesigns.com>
Date: Tue, 25 Oct 2016 15:14:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This patch series adds support for the NAND Flash controller
on recent Tango chips, along with the bindings documentation.

Marc Gonzalez (2):
  mtd: nand: add tango NFC dt bindings doc
  mtd: nand: add tango NAND flash controller support

 Documentation/devicetree/bindings/mtd/tango-nand.txt |  38 ++
 drivers/mtd/nand/Kconfig                             |   6 +
 drivers/mtd/nand/Makefile                            |   1 +
 drivers/mtd/nand/tango_nand.c                        | 654 +++++++++++++++++++++++++++++
 4 files changed, 699 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/tango-nand.txt
 create mode 100644 drivers/mtd/nand/tango_nand.c

Regards.
