From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org,
 mark.rutland@arm.com, shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, boris.brezillon@free-electrons.com,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, oss@buserror.net,
 leoyang.li@nxp.com, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [PATCH 1/4][v4] dt-bindings: mtd-physmap: Add endianness supports
Date: Thu, 15 Feb 2018 17:19:04 +0530
Message-Id: <20180215114904.23627-1-prabhakar.kushwaha@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Connection between flash and controller is not necessary to be always
of same type. It may varies from platform to platform.

Adding endianness (optional) property to provide connection type
information.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
Changes for v2: updated subject
Changes for v3: fixed typo for "big-endian"
Changes for v4: Moved binding definition in mtd-physmap.txt
as discussed at https://patchwork.ozlabs.org/patch/842543/

 Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
index 4a0a48bf4ecb..961a8eed9d0d 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
@@ -41,6 +41,11 @@ additional (optional) property is defined:
 
  - erase-size : The chip's physical erase block size in bytes.
 
+ The device tree may optionally contain endianness property.
+ little-endian or big-endian : It represents connection between controller and
+			flash. If this property is absent, flash is considered
+			to be host-endian.
+
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
 
-- 
2.14.1
