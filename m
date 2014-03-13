Received: from mail-yh0-f44.google.com ([209.85.213.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOBU3-0004o0-Mc
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 19:40:09 +0000
Received: by mail-yh0-f44.google.com with SMTP id f10so1565350yha.17
 for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2014 12:39:42 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Mike Turquette <mturquette@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 6/6] clk: mvebu: Update binding documentation for the core
 divider clock
Date: Thu, 13 Mar 2014 16:39:02 -0300
Message-Id: <1394739542-30017-7-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 sergei.shtylyov@cogentembedded.com, Tawfik Bayouk <tawfik@marvell.com>,
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

From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

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
