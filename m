Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fn7rQ-0008Hl-KE
 for linux-mtd@lists.infradead.org; Tue, 07 Aug 2018 19:41:41 +0000
Received: by mail-pf1-x436.google.com with SMTP id j8-v6so9078773pff.6
 for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2018 12:41:30 -0700 (PDT)
Subject: [PATCH v2 0/2] spi-nor: add support for is25wp256
Date: Tue,  7 Aug 2018 12:40:57 -0700
Message-Id: <20180807194059.26348-1-palmer@sifive.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com,
 richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: marek.vasut@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds support for the is25wp256 flash chip, which is on our HiFive
Unleashed board.  Additionally it adds support for ISSI's special
unlocking scheme, which we need to unlock block protection on the whole
chip.

Changes since v1 [<20180804014947.24601-1-palmer@sifive.com>]:
* There are now two patches, as it's logically two separate changes.
* The chip is called is25wp256 instead of is25wp256d, with the
  corresponding commit text also renamed.
* The block size has been changed to match the other similar chips that
  are already supported.
* SPI_NOR_4B_OPCODES is no longer set, to match the other similar chips
  that are are already supported.

[PATCH v2 1/2] spi-nor: add support for ISSI's block unlocking scheme
[PATCH v2 2/2] spi-nor: add support for is25wp256
