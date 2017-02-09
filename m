Received: from 2.mo53.mail-out.ovh.net ([178.33.254.39])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbkvq-0003by-FZ
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 09:22:31 +0000
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo53.mail-out.ovh.net (Postfix) with ESMTP id 3C65B38382
 for <linux-mtd@lists.infradead.org>; Thu,  9 Feb 2017 10:22:05 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 2/2] dt-bindings: mtd: add a common label property to all
 mtd devices
Date: Thu,  9 Feb 2017 10:21:08 +0100
Message-Id: <1486632068-14894-3-git-send-email-clg@kaod.org>
In-Reply-To: <1486632068-14894-1-git-send-email-clg@kaod.org>
References: <1486632068-14894-1-git-send-email-clg@kaod.org>
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
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/common.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/common.txt

diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
new file mode 100644
index 000000000000..fc068b923d7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/common.txt
@@ -0,0 +1,15 @@
+* Common properties of all MTD devices
+
+Optional properties:
+- label: user-defined MTD device name. Can be used to assign user
+  friendly names to MTD devices (instead of the flash model or flash
+  controller based name) in order to ease flash device identification
+  and/or describe what they are used for.
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
