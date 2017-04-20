Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1CYE-00054H-Kl
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 13:55:16 +0000
Received: by mail-lf0-x242.google.com with SMTP id 88so5900832lfr.0
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 06:54:53 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 0/4] mtd: extend support for "fixed-partitions"
Date: Thu, 20 Apr 2017 15:54:27 +0200
Message-Id: <20170420135431.12585-1-zajec5@gmail.com>
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

At this point this simply adds a full support for "fixed-partitions" binding.
It should also make adding new bindings easier in the future.

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

Brian: I took your patches so I preserved your Signed-off-by, but please review
these changes to make sure I didn't do anything nasty there.

Brian Norris (3):
  dt-bindings: mtd: make partitions doc a bit more generic
  mtd: partitions: factor out code calling parser
  mtd: partitions: add of_match_table parser matching

Rafał Miłecki (1):
  mtd: ofpart: add of_match_table with "fixed-partitions"

 .../devicetree/bindings/mtd/partition.txt          | 28 ++++++--
 drivers/mtd/mtdpart.c                              | 80 +++++++++++++++++++---
 drivers/mtd/ofpart.c                               |  7 ++
 include/linux/mtd/partitions.h                     |  1 +
 4 files changed, 101 insertions(+), 15 deletions(-)

-- 
2.11.0
