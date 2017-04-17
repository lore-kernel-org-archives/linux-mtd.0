Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0CdI-0007wY-9d
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 19:48:21 +0000
Received: by mail-lf0-x242.google.com with SMTP id 75so17255033lfs.3
 for <linux-mtd@lists.infradead.org>; Mon, 17 Apr 2017 12:47:59 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V5 1/3] dt-bindings: mtd: document linux,part-probe property
Date: Mon, 17 Apr 2017 21:47:44 +0200
Message-Id: <20170417194746.10697-1-zajec5@gmail.com>
In-Reply-To: <20170417182853.24281-1-zajec5@gmail.com>
References: <20170417182853.24281-1-zajec5@gmail.com>
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

Support for this property has been introduced in 2010 with commit
9d5da3a9b849 ("mtd: extend physmap_of to let the device tree specify the
parition probe") but it was never documented. Fix this by adding a
proper description and example.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 Documentation/devicetree/bindings/mtd/common.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
index fc068b923d7a..1ada70e718b2 100644
--- a/Documentation/devicetree/bindings/mtd/common.txt
+++ b/Documentation/devicetree/bindings/mtd/common.txt
@@ -6,10 +6,17 @@ Optional properties:
   controller based name) in order to ease flash device identification
   and/or describe what they are used for.
 
+- linux,part-probe: if present, this property should contain a list of strings
+  with partition probes to be used for the flash device. A role of partition
+  probe (parser) is to read/construct partition table and register found
+  partitions. Getting partition table may be platform or device specific so
+  various devices may use various Linux drivers for this purpose.
+
 Example:
 
 	flash@0 {
 		label = "System-firmware";
+		linux,part-probe = "cmdlinepart", "ofpart";
 
 		/* flash type specific properties */
 	};
-- 
2.11.0
