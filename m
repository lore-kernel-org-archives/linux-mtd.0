Received: from mail-ig0-f181.google.com ([209.85.213.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm3wt-0002ox-Re
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 17:00:48 +0000
Received: by mail-ig0-f181.google.com with SMTP id l13so1886120iga.8
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 09:00:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/11] mtd: nand: Add new generic NAND Device Tree property
 'nand-chip-select'
Date: Wed,  5 Nov 2014 16:59:47 +0000
Message-Id: <1415206793-25670-6-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1415206793-25670-1-git-send-email-lee.jones@linaro.org>
References: <1415206793-25670-1-git-send-email-lee.jones@linaro.org>
Cc: pekon@pek-sem.com, computersforpeace@gmail.com, lee.jones@linaro.org,
 kernel@stlinux.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mtd/nand.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index b53f92e..1d542c51 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -12,6 +12,9 @@
 - nand-ecc-step-size: integer representing the number of data bytes
 		      that are covered by a single ECC step.
 
+- nand-chip-select: integer representing chip number associated with the
+		    described Flash chip.
+
 The ECC strength and ECC step size properties define the correction capability
 of a controller. Together, they say a controller can correct "{strength} bit
 errors per {size} bytes".
-- 
1.9.1
