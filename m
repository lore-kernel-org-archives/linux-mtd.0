Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDOrp-0003do-Jd
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 07:06:43 +0000
Received: by mail-lj1-x241.google.com with SMTP id j4-v6so29912126ljc.12
 for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2018 00:06:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] mtd: partitions: Add RedBoot FIS DT bindings
Date: Fri, 19 Oct 2018 09:06:21 +0200
Message-Id: <20181019070622.26661-2-linus.walleij@linaro.org>
In-Reply-To: <20181019070622.26661-1-linus.walleij@linaro.org>
References: <20181019070622.26661-1-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds device tree bindings for the RedBoot FIS partition
format.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/mtd/partitions/redboot-fis.txt   | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/redboot-fis.txt

diff --git a/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.txt b/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.txt
new file mode 100644
index 000000000000..fd0ebe4e3415
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.txt
@@ -0,0 +1,27 @@
+RedBoot FLASH Image System (FIS) Partitions
+===========================================
+
+The FLASH Image System (FIS) directory is a flash description
+format closely associated with the RedBoot boot loader.
+
+It uses one single flash eraseblock in the flash to store an index of
+all images in the flash.
+
+This block size will vary depending on flash but is typically
+32 KB in size.
+
+Required properties:
+- compatible : (required) must be "redboot-fis"
+- fis-index-block : (required) a index to the eraseblock containing
+  the FIS directory on this device. On a flash memory with 32KB
+  eraseblocks, 0 means the first eraseblock at 0x00000000, 1 means the
+  second eraseblock at 0x00008000 and so on.
+
+Example:
+
+flash@0 {
+	partitions {
+		compatible = "redboot-fis";
+		fis-index-block = <0>;
+	};
+};
-- 
2.17.2
