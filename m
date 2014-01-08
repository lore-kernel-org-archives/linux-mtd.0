Received: from 8.mo3.mail-out.ovh.net ([87.98.172.249]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0u4m-0006jb-De
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 14:25:44 +0000
Received: from mail408.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id A0A2AFF9ADE
 for <linux-mtd@lists.infradead.org>; Wed,  8 Jan 2014 15:25:20 +0100 (CET)
From: Boris BREZILLON <b.brezillon@overkiz.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Grant Likely <grant.likely@linaro.org>
Subject: [RFC PATCH 4/9] of: mtd: add NAND timings bindings documentation
Date: Wed,  8 Jan 2014 15:21:59 +0100
Message-Id: <1389190924-26226-5-git-send-email-b.brezillon@overkiz.com>
In-Reply-To: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, dev@linux-sunxi.org,
 linux-kernel@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a NAND timing properties to NAND dt doc.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 Documentation/devicetree/bindings/mtd/nand.txt |   34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index 03855c8..0dff600 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -5,3 +5,37 @@
   "soft_bch".
 - nand-bus-width : 8 or 16 bus width if not present 8
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
+
+nand timings definition expressed in nanoseconds (found in NAND datasheets):
+ - tCLS-min : CLE setup time
+ - tCLH-min : CLE Hold time
+ - tCS-min : CE# setup time
+ - tCH-min : CE# hold time
+ - tWP-min : WE# pulse width
+ - tALS-min : ALE setup time
+ - tALH-min : ALE hold time
+ - tDS-min : Data setup time
+ - tDH-min : Data hold time
+ - tWC-min : Write cycle time
+ - tWH-min : WE# high hold time
+ - tR-max : Data transfer from cell to register
+ - tAR-min : ALE to RE# delay
+ - tCLR-min : CLE to RE# delay
+ - tRR-min : Ready to RE# low
+ - tRP-min : RE# pulse width
+ - tWB-max : WE# high to busy
+ - tRC-min : Read cycle time
+ - tREA-max : RE# access time
+ - tRHZ-max : RE# high to output high Z
+ - tCHZ-max : CE# high to output high Z
+ - tRHOH-min : RE# high to output hold
+ - tRLOH-min : RE# low to output hold
+ - tCOH-min : RE# or CE# high to output hold
+ - tREH-min : RE# high hold time
+ - tWHR-min : WE# high to RE# low
+ - tRHW-min : RE# high to WE# low
+ - tIR-min : Output high Z to RE# low
+ - tCR-min : CE# low to RE# low
+ - tADL-min : Address to data loading time
+ - tRST-max : Device resetting time
+ - tWW-min : Write protection time
-- 
1.7.9.5
