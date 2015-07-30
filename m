Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZL8Lu-0002Vt-9F
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 11:19:52 +0000
Message-Id: <fb7502adf85840a7961b711a40456bbbde6be56a.1438340815.git.hramrach@gmail.com>
In-Reply-To: <cover.1438340815.git.hramrach@gmail.com>
References: <cover.1438340815.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Jul 2015 12:19:26 +0200
Subject: [PATCH v2 4/5] mtd: ofpart: document the lock flag.
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
index 367ce4e..19a1203 100644
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
