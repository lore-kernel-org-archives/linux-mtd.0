Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew5FL-0001Ha-6n
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2018 12:11:14 +0000
Received: by mail-lf0-x243.google.com with SMTP id f75-v6so4426309lfg.6
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2018 05:10:56 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Peter Rosin <peda@axentia.se>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V10 0/3] mtd: read partitions compatible prop for "ofpart" type
Date: Wed, 14 Mar 2018 13:10:41 +0100
Message-Id: <20180314121044.12033-1-zajec5@gmail.com>
In-Reply-To: <20180130201059.4424-1-zajec5@gmail.com>
References: <20180130201059.4424-1-zajec5@gmail.com>
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

This patchset provides a proper support for flash device DT node with
"partitions" subnode using "compatible" property. It's already
documented in the: Documentation/devicetree/bindings/mtd/partition.txt

We believed that version 7 was ready to go, but soon after landing in
the linux-next we got a regression report from Peter. Later versions
takes a safe path by:
1) Respecting parsers order as specified in the default/driver-provided
   list.
2) Looking at "compatible" property only when "ofpart" type gets
   speciied.

Version 9 was successfully tested by Peter and version 10 just squashes
two commits into a one.

I double-checked the code and cannot think of any regression this could
cause. I also hope this design (roughly discussed with Boris) can be
acceptable for the mtd subsystem.

The most important patch from this patchset (1/3) was reviewed by Rob in
the
[PATCH V6 1/2] mtd: partitions: add of_match_table parser matching
https://patchwork.ozlabs.org/comment/1831551/

If possible this is a 4.17 material.

Rafał Miłecki (3):
  mtd: partitions: add of_match_table parser matching for the "ofpart"
    type
  mtd: rename "ofpart" parser to "fixed-partitions" as it fits it better
  mtd: ofpart: add of_match_table with "fixed-partitions"

 drivers/mtd/mtdpart.c          | 116 +++++++++++++++++++++++++++++++++++++----
 drivers/mtd/ofpart.c           |  18 +++++--
 include/linux/mtd/partitions.h |   1 +
 3 files changed, 121 insertions(+), 14 deletions(-)

-- 
2.11.0
