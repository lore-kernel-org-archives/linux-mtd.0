Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2dJV-0006Hm-8G
 for linux-mtd@lists.infradead.org; Mon, 24 Apr 2017 12:41:58 +0000
Received: by mail-lf0-x243.google.com with SMTP id i3so16367872lfh.2
 for <linux-mtd@lists.infradead.org>; Mon, 24 Apr 2017 05:41:36 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 0/4] mtd: extend support for "fixed-partitions"
Date: Mon, 24 Apr 2017 14:41:16 +0200
Message-Id: <20170424124120.31613-1-zajec5@gmail.com>
In-Reply-To: <20170420135731.13272-2-zajec5@gmail.com>
References: <20170420135731.13272-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

My recent work on adding wide support for linux,part-probe was reviewed and
kind of Nack-ed, but fortunately I was pointed to the old (!) patchset from
Brian doing similar thing in a cleaner way.

This patchset picks the important changes from Brian, cleans them and rebases.

Original patches:
(not picked) [RFC PATCH 1/7] mtd: move partition parsers to drivers/mtd/partitions/
(not picked) [RFC PATCH 2/7] mtd: move partition parsers' Kconfig under a sub-menu
(partially)  [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
(picked)     [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parser() helpers
(partially)  [RFC PATCH 5/7] mtd: partitions: factor out "match by name" handling
(picked)     [RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching
(not picked) [RFC PATCH 7/7] mtd: partitions: add Google's FMAP partition parser

At this point this simply adds a full support for "fixed-partitions" binding.
It should also make adding new bindings (like Google's FMAP) easier in the
future.

I've successfully tested this with bcm47xxsflash driver on Tenda AC9 device. I
used following DT node to get "ofpart" driver parse & register my partitions.

&bcma-sflash {
	partitions {
		compatible = "fixed-partitions";
		#address-cells = <1>;
		#size-cells = <1>;

		partition@0 {
			label = "cfe";
			reg = <0x0000000 0x40000>;
			read-only;
		};

		firmware@40000 {
			label = "firmware";
			reg = <0x40000 0x7f0000>;
		};
	};
};

V2: Modify patch 1/4
    Include list of original patches in 0/4
    Include changelog in every patch
    Add Brian's tags (Acked/Reviewed/Tested)

Brian Norris (3):
  dt-bindings: mtd: make partitions doc a bit more generic
  mtd: partitions: factor out code calling parser
  mtd: partitions: add of_match_table parser matching

Rafał Miłecki (1):
  mtd: ofpart: add of_match_table with "fixed-partitions"

 .../devicetree/bindings/mtd/partition.txt          | 30 ++++++--
 drivers/mtd/mtdpart.c                              | 80 +++++++++++++++++++---
 drivers/mtd/ofpart.c                               |  7 ++
 include/linux/mtd/partitions.h                     |  1 +
 4 files changed, 103 insertions(+), 15 deletions(-)

-- 
2.11.0
