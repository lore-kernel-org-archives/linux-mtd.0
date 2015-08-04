Received: from michel.telenet-ops.be ([195.130.137.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMc0R-0002iA-1q
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 13:11:48 +0000
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>
Cc: Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] of: Add vendor prefix for JEDEC Solid State Technology
 Association
Date: Tue,  4 Aug 2015 15:11:21 +0200
Message-Id: <1438693881-10432-1-git-send-email-geert+renesas@glider.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the "jedec" vendor prefix for the "JEDEC Solid State Technology
Association" (formerly known as the "Joint Electron Device Engineering
Council"), which is already in use in several bindings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Brian Norris <computersforpeace@gmail.com>
---
v2:
  - Add Acked-by.
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index f727469b0893b2c3..1d88c84545b4dfd9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -113,6 +113,7 @@ intel	Intel Corporation
 intercontrol	Inter Control Group
 isee	ISEE 2007 S.L.
 isil	Intersil
+jedec	JEDEC Solid State Technology Association
 karo	Ka-Ro electronics GmbH
 keymile	Keymile GmbH
 kinetic Kinetic Technologies
-- 
1.9.1
