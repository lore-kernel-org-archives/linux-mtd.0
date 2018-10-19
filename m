Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDPXV-0003Sy-Fa
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 07:49:54 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 13/15] dt-binding: mtd: physmap: Document the addr-gpios
 property
Date: Fri, 19 Oct 2018 09:49:06 +0200
Message-Id: <20181019074908.13226-14-boris.brezillon@bootlin.com>
In-Reply-To: <20181019074908.13226-1-boris.brezillon@bootlin.com>
References: <20181019074908.13226-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Add documentation for the addr-gpios. This extension to the physmap
binding allow creating flash devices that are paged using GPIOs.

Cc: devicetree@vger.kernel.org
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- Drop Rob's R-b (waiting for a second review)
---
 Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
index 232fa12e90ef..7df0dcaccb7d 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
@@ -29,6 +29,8 @@ file systems on embedded devices.
  - use-advanced-sector-protection: boolean to enable support for the
    advanced sector protection (Spansion: PPB - Persistent Protection
    Bits) locking.
+ - addr-gpios : (optional) List of GPIO descriptors that will be used to
+   address the MSBs address lines. The order goes from LSB to MSB.
 
 For JEDEC compatible devices, the following additional properties
 are defined:
-- 
2.14.1
