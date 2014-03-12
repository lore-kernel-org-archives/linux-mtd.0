From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Mike Turquette <mturquette@linaro.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 6/6] clk: mvebu: Update binding documentation for the core
 divider clock
Date: Wed, 12 Mar 2014 12:16:44 -0300
Message-Id: <1394637404-7651-7-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1394637404-7651-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1394637404-7651-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Andrew Lunn <andrew@lunn.ch>, Seif Mazareeb <seif@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Core Divider clock support two new compatible strings for Armada
375 and Armada 380 SoCs. Add the compatible strings to the documentation.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt b/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt
index c62391f..520562a 100644
--- a/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt
+++ b/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt
@@ -4,7 +4,10 @@ The following is a list of provided IDs and clock names on Armada 370/XP:
  0 = nand (NAND clock)
 
 Required properties:
-- compatible : must be "marvell,armada-370-corediv-clock"
+- compatible : must be "marvell,armada-370-corediv-clock",
+		       "marvell,armada-375-corediv-clock",
+		       "marvell,armada-380-corediv-clock",
+
 - reg : must be the register address of Core Divider control register
 - #clock-cells : from common clock binding; shall be set to 1
 - clocks : must be set to the parent's phandle
-- 
1.9.0
