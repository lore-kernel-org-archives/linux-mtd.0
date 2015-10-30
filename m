Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsGO0-0002uG-L2
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 20:34:57 +0000
Received: by pasz6 with SMTP id z6so83791988pas.2
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 13:34:35 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v4] mtd: ofpart: document the lock flag.
Date: Fri, 30 Oct 2015 13:34:00 -0700
Message-Id: <1446237240-10695-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michal Suchanek <hramrach@gmail.com>

The lock flag of ofpart is undocumented. Add to binding doc.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
---
It seems my reasoning here [1] was wrong (thanks Sascha!). This is a rewrite of
Michal's binding doc from [2].

Note that this property is still broken for the CONFIG_MTD_PARTITIONED_MASTER=y
case.

[1] http://lists.infradead.org/pipermail/linux-mtd/2015-October/062822.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2015-August/061155.html

 Documentation/devicetree/bindings/mtd/partition.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index 8e5557da1955..a7d4d35550e3 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -23,6 +23,8 @@ Optional properties:
   partition should only be mounted read-only. This is usually used for flash
   partitions containing early-boot firmware images or data which should not be
   clobbered.
+- lock : Do not unlock the partition at initialization time (not supported on
+  all devices)
 
 Examples:
 
-- 
2.6.0.rc2.230.g3dd15c0
