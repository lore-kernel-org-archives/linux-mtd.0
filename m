Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXZe7-0005MP-LZ
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2018 22:07:41 +0000
Received: by mail-lf0-x241.google.com with SMTP id i15-v6so15696661lfc.2
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2018 15:07:28 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] dt-bindings: mtd: document Broadcom's TRX firmware
 format binding
Date: Tue, 26 Jun 2018 00:05:07 +0200
Message-Id: <20180625220508.21242-1-zajec5@gmail.com>
In-Reply-To: <20180612104434.15232-1-zajec5@gmail.com>
References: <20180612104434.15232-1-zajec5@gmail.com>
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

Broadcom based home router devices use TRX firmware format. It's a
container that can hold few partitions. If operating system is expected
to access them it has to understand that format and parse flash data
accordingly.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Drop unneeded "brcm,trx-v1" and "brcm,trx-v2" bindings.
---
 .../bindings/mtd/partitions/brcm,trx.txt           | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt

diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
new file mode 100644
index 000000000000..b677147ca4e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
@@ -0,0 +1,37 @@
+Broadcom TRX Container Partition
+================================
+
+TRX is Broadcom's official firmware format for the BCM947xx boards. It's used by
+most of the vendors building devices based on Broadcom's BCM47xx SoCs and is
+supported by the CFE bootloader.
+
+Design of the TRX format is very minimalistic. Its header contains
+identification fields, CRC32 checksum and the locations of embedded partitions.
+Its purpose is to store a few partitions in a format that can be distributed as
+a standalone file and written in a flash memory.
+
+Container can hold up to 4 partitions. The first partition has to contain a
+device executable binary (e.g. a kernel) as it's what the CFE bootloader starts
+executing. Other partitions can be used for operating system purposes. This is
+useful for systems that keep kernel and rootfs separated.
+
+TRX doesn't enforce any strict partition boundaries or size limits. All
+partitions have to be less than the 4GiB max size limit.
+
+There are two existing/known TRX variants:
+1) v1 which contains 3 partitions
+2) v2 which contains 4 partitions
+
+There aren't separated compatible bindings for them as version can be trivialy
+detected by a software parsing TRX header.
+
+Required properties:
+- compatible : (required) must be "brcm,trx"
+
+Example:
+
+flash@0 {
+	partitions {
+		compatible = "brcm,trx";
+	};
+};
-- 
2.13.7
