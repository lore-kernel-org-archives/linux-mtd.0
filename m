Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPCTS-0007Jv-Gu
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 17:37:01 +0000
Received: by mail-pf0-x230.google.com with SMTP id p64so34004930pfb.1
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2016 10:36:43 -0700 (PDT)
From: Ray Jui <ray.jui@broadcom.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Prafulla Kota <prafulla.kota@broadcom.com>, Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH 2/2] arm64: dts: Updated NAND DT properties for NS2 SVK
Date: Mon, 18 Jul 2016 10:36:17 -0700
Message-Id: <1468863377-31862-3-git-send-email-ray.jui@broadcom.com>
In-Reply-To: <1468863377-31862-1-git-send-email-ray.jui@broadcom.com>
References: <1468863377-31862-1-git-send-email-ray.jui@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds NAND DT properties for NS2 SVK to configure the bus
width width and OOB sector size

Signed-off-by: Prafulla Kota <prafulla.kota@broadcom.com>
Signed-off-by: Ray Jui <ray.jui@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
index 54ca40c..5ef0407 100644
--- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
@@ -128,6 +128,8 @@
 		nand-ecc-mode = "hw";
 		nand-ecc-strength = <8>;
 		nand-ecc-step-size = <512>;
+		nand-bus-width = <16>;
+		brcm,nand-oob-sector-size = <16>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 	};
-- 
2.1.4
