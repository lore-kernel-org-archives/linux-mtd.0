Received: from 20.mo5.mail-out.ovh.net ([91.121.55.239])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT7LQ-0004H2-Bb
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 13:29:12 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 933AE6CAE3
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 14:28:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/3] dt-bindings: mtd: add a common label property to all mtd
 devices
Date: Mon, 16 Jan 2017 14:27:04 +0100
Message-Id: <1484573225-19095-3-git-send-email-clg@kaod.org>
In-Reply-To: <1484573225-19095-1-git-send-email-clg@kaod.org>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
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

This can be used to easily identify a specific chip on a system with
multiple chips.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 Documentation/devicetree/bindings/mtd/common.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/common.txt

diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
new file mode 100644
index 000000000000..a781641a3b00
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/common.txt
@@ -0,0 +1,12 @@
+* Common properties of all MTD devices
+
+Optional properties:
+- label : name to assign to mtd. If omitted, the label is the MTD device name.
+
+Example:
+
+	flash@0 {
+		label = "System-firmware";
+
+		/* flash type specific properties */
+	};
-- 
2.7.4
