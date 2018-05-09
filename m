Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGKJr-0006kA-MN
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 08:19:33 +0000
Received: by mail-lf0-x244.google.com with SMTP id z142-v6so6421699lff.5
 for <linux-mtd@lists.infradead.org>; Wed, 09 May 2018 01:19:17 -0700 (PDT)
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
Subject: [PATCH V2 1/2] dt-bindings: mtd: document Broadcom's BCM47xx
 partitions
Date: Wed,  9 May 2018 10:17:28 +0200
Message-Id: <20180509081729.28347-1-zajec5@gmail.com>
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

Broadcom based home router devices use partitions which have to be
discovered in a specific way. They are not fixed and there is not any
standard partition table. This commit adds and describes a new custom
binding for such devices.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
This commit documents a new binding for describing partitions. Just as a
reminder: we agreed to use "compatible" for that purpose to avoid
/guessing/. There are too many cases, devices and /formats/ to just
blindly try every possible parser.

This was e.g. described by Boris in his patchset 2+ years ago:
[RFC PATCH 0/7] mtd: partitions: add of_match_table support
http://lists.infradead.org/pipermail/linux-mtd/2015-December/064076.html

Quote:
>  (2) we can't just scan for all supported parsers (like the block system does), since
>      there is a wide diversity of "formats" (no standardization), and it is not
>      always safe or efficient to attempt to do so, particularly since many of
>      them allow their data structures to be placed anywhere on the flash, and
>      so require scanning the entire flash device to find them.

I believe this solution was also acked back then by Rob:
[RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
http://lists.infradead.org/pipermail/linux-mtd/2015-December/064100.html

V2: Move documentation to the new brcm,bcm947xx-cfe-partitions.txt file
    as suggested by Rob (we don't want to bloat partition.txt).
    Slightly update commit message.
---
 .../devicetree/bindings/mtd/partition.txt          |  2 +-
 .../partitions/brcm,bcm947xx-cfe-partitions.txt    | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm947xx-cfe-partitions.txt

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index 36f3b769a626..a8f382642ba9 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -14,7 +14,7 @@ method is used for a given flash device. To describe the method there should be
 a subnode of the flash device that is named 'partitions'. It must have a
 'compatible' property, which is used to identify the method to use.
 
-We currently only document a binding for fixed layouts.
+Available bindings are listed in the "partitions" subdirectory.
 
 
 Fixed Partitions
diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm947xx-cfe-partitions.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm947xx-cfe-partitions.txt
new file mode 100644
index 000000000000..1d61a029395e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm947xx-cfe-partitions.txt
@@ -0,0 +1,42 @@
+Broadcom BCM47xx Partitions
+===========================
+
+Broadcom is one of hardware manufacturers providing SoCs (BCM47xx) used in
+home routers. Their BCM947xx boards using CFE bootloader have several partitions
+without any on-flash partition table. On some devices their sizes and/or
+meanings can also vary so fixed partitioning can't be used.
+
+Discovering partitions on these devices is possible thanks to having a special
+header and/or magic signature at the beginning of each of them. They are also
+block aligned which is important for determinig a size.
+
+Most of partitions use ASCII text based magic for determining a type. More
+complex partitions (like TRX with its HDR0 magic) may include extra header
+containing some details, including a length.
+
+A list of supported partitions includes:
+1) Bootloader with Broadcom's CFE (Common Firmware Environment)
+2) NVRAM with configuration/calibration data
+3) Device manufacturer's data with some default values (e.g. SSIDs)
+4) TRX firmware container which can hold up to 4 subpartitions
+5) Backup TRX firmware used after failed upgrade
+
+As mentioned earlier, role of some partitions may depend on extra configuration.
+For example both: main firmware and backup firmware use the same TRX format with
+the same header. To distinguish currently used firmware a CFE's environment
+variable "bootpartition" is used.
+
+
+Devices using Broadcom partitions described above should should have flash node
+with a subnode named "partitions" using following properties:
+
+Required properties:
+- compatible : (required) must be "brcm,bcm947xx-cfe-partitions"
+
+Example:
+
+flash@0 {
+	partitions {
+		compatible = "brcm,bcm947xx-cfe-partitions";
+	};
+};
-- 
2.13.6
