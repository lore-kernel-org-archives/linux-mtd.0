Received: from mail-yk0-f176.google.com ([209.85.160.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOBTq-0004nM-Od
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 19:39:59 +0000
Received: by mail-yk0-f176.google.com with SMTP id 19so3958823ykq.7
 for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2014 12:39:21 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Mike Turquette <mturquette@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/6] Armada 380 NAND support
Date: Thu, 13 Mar 2014 16:38:56 -0300
Message-Id: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
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

This patchset adds support for the NAND on Armada 380/385 SoCs.

The first patch adds a new "armada-380-corediv-clock" compatible
string, with its proper SoC-specific structure, adding the register
layout for this SoC family.

The second and third patches add the devicetree changes to support
the Core Divider clock.

After adding its clock source, the fourth and fifth patches add
the NAND devicetree changes. The NAND controller is compatible with
the Armada 370 controller, so we are currently support it using the
same compatible string.

The last patch updates the binding documentation for the Core Divider
clock, which is missing the information about the already supported
Armada 375 compatible string.

This series is based on linux-next 20140307. I expect it will apply
cleanly on v3.15-rc1; if that's not the case, I'll send a rebased patchset.

The clock and devicetree changes are mostly independent so they
can be merged through the clock and mvebu tree respectively.

Changes from v1:

  * Changed nand@d0000 with flash@d0000 in the devicetree. The
    latter is compliant with ePAPR recomendation (see ePAPR v1.1,
    section 2.2.2, Generic Names Recommendation).

Ezequiel Garcia (6):
  clk: mvebu: Support Armada 380 SoC on the core divider clock
  ARM: mvebu: Add a 2 GHz fixed-clock on Armada 38x SoCs
  ARM: mvebu: Add the Core Divider clock to Armada 38x SoCs
  ARM: mvebu: Add support for NAND controller in Armada 38x SoC
  ARM: mvebu: Enable NAND controller in Armada 385-DB
  clk: mvebu: Update binding documentation for the core divider clock

 .../bindings/clock/mvebu-corediv-clock.txt         |  5 ++++-
 arch/arm/boot/dts/armada-385-db.dts                | 21 ++++++++++++++++++
 arch/arm/boot/dts/armada-38x.dtsi                  | 25 ++++++++++++++++++++++
 drivers/clk/mvebu/clk-corediv.c                    | 23 ++++++++++++++++++++
 4 files changed, 73 insertions(+), 1 deletion(-)

-- 
1.9.0
