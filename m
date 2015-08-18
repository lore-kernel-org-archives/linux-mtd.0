Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRiuH-00011t-OP
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 15:34:34 +0000
Date: 18 Aug 2015 15:34:08 -0000
Message-Id: <83fbf31ad895446837f8e01f77a1ff7c63d62251.1439911625.git.hramrach@gmail.com>
In-Reply-To: <cover.1439911625.git.hramrach@gmail.com>
References: <cover.1439911625.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v3 4/5] mtd: ofpart: document the lock flag.
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The lock flag of ofpart is undocumented. Add to binding doc.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 Documentation/devicetree/bindings/mtd/partition.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index 8c2aff7..7fa9c08 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -29,6 +29,7 @@ Optional properties:
   partition should only be mounted read-only. This is usually used for flash
   partitions containing early-boot firmware images or data which should not be
   clobbered.
+- lock : Clear always locked after reset flag
 
 Examples:
 
-- 
2.1.4
