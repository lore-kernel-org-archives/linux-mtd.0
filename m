Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atZBd-0006zk-4O
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 11:23:49 +0000
Received: by mail-lb0-x22c.google.com with SMTP id ys16so42270282lbb.3
 for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2016 04:23:28 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 Brian Norris <computersforpeace@gmail.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] Documentation: devicetree: deprecate "soft_bch"
 nand-ecc-mode value
Date: Fri, 22 Apr 2016 13:23:14 +0200
Message-Id: <1461324197-1333-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
References: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
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

Now that we support nand-ecc-algo property it should be used together
with "soft" to specify software BCH ECC.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 Documentation/devicetree/bindings/mtd/nand.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index 5ac4ab7..68342ea 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -20,8 +20,10 @@ Optional NAND controller properties
 Optional NAND chip properties:
 
 - nand-ecc-mode : String, operation mode of the NAND ecc mode.
-  Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
-  "soft_bch".
+		  Supported values are: "none", "soft", "hw", "hw_syndrome",
+		  "hw_oob_first".
+		  Deprecated values:
+		  "soft_bch": use "soft" and nand-ecc-algo instead
 - nand-ecc-algo: string, algorithm of NAND ECC.
 		 Supported values are: "hamming", "bch".
 - nand-bus-width : 8 or 16 bus width if not present 8
-- 
1.8.4.5
