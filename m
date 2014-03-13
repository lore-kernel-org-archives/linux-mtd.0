Received: from mail-yk0-f172.google.com ([209.85.160.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOBTq-0004nS-O4
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 19:39:57 +0000
Received: by mail-yk0-f172.google.com with SMTP id 200so3956013ykr.3
 for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2014 12:39:25 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Mike Turquette <mturquette@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 1/6] clk: mvebu: Support Armada 380 SoC on the core divider
 clock
Date: Thu, 13 Mar 2014 16:38:57 -0300
Message-Id: <1394739542-30017-2-git-send-email-ezequiel@vanguardiasur.com.ar>
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

This commit adds support for the Core Divider clocks of the Armada
380 SoCs. Similarly to Armada 370 and XP, the Core Divider clocks of
the 380 have gate capabilities. The only difference is the register layout.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/clk/mvebu/clk-corediv.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/mvebu/clk-corediv.c b/drivers/clk/mvebu/clk-corediv.c
index 4da6076..911dbb6 100644
--- a/drivers/clk/mvebu/clk-corediv.c
+++ b/drivers/clk/mvebu/clk-corediv.c
@@ -204,6 +204,22 @@ static const struct clk_corediv_soc_desc armada370_corediv_soc = {
 	.ratio_offset = 0x8,
 };
 
+static const struct clk_corediv_soc_desc armada380_corediv_soc = {
+	.descs = mvebu_corediv_desc,
+	.ndescs = ARRAY_SIZE(mvebu_corediv_desc),
+	.ops = {
+		.enable = clk_corediv_enable,
+		.disable = clk_corediv_disable,
+		.is_enabled = clk_corediv_is_enabled,
+		.recalc_rate = clk_corediv_recalc_rate,
+		.round_rate = clk_corediv_round_rate,
+		.set_rate = clk_corediv_set_rate,
+	},
+	.ratio_reload = BIT(8),
+	.enable_bit_offset = 16,
+	.ratio_offset = 0x4,
+};
+
 static const struct clk_corediv_soc_desc armada375_corediv_soc = {
 	.descs = mvebu_corediv_desc,
 	.ndescs = ARRAY_SIZE(mvebu_corediv_desc),
@@ -290,3 +306,10 @@ static void __init armada375_corediv_clk_init(struct device_node *node)
 }
 CLK_OF_DECLARE(armada375_corediv_clk, "marvell,armada-375-corediv-clock",
 	       armada375_corediv_clk_init);
+
+static void __init armada380_corediv_clk_init(struct device_node *node)
+{
+	return mvebu_corediv_clk_init(node, &armada380_corediv_soc);
+}
+CLK_OF_DECLARE(armada380_corediv_clk, "marvell,armada-380-corediv-clock",
+	       armada380_corediv_clk_init);
-- 
1.9.0
