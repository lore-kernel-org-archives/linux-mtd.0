Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQF-0001MJ-VN
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:06 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 47/53] irq: update genericirq book location
Date: Tue, 16 May 2017 09:16:39 -0300
Message-Id: <c0c6e0850514c16814c37f64a9a1bcc6c52a19ab.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This book got converted from DocBook. Update its references to
point to the current location.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 kernel/irq/chip.c    | 2 +-
 kernel/irq/handle.c  | 2 +-
 kernel/irq/irqdesc.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 686be4b73018..4188a0a7691f 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -7,7 +7,7 @@
  * This file contains the core interrupt handling code, for irq-chip
  * based architectures.
  *
- * Detailed information is available in Documentation/DocBook/genericirq
+ * Detailed information is available in Documentation/core-api/genericirq.rst
  */
 
 #include <linux/irq.h>
diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
index d3f24905852c..bbf9a7174283 100644
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@ -6,7 +6,7 @@
  *
  * This file contains the core interrupt handling code.
  *
- * Detailed information is available in Documentation/DocBook/genericirq
+ * Detailed information is available in Documentation/core-api/genericirq.rst
  *
  */
 
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 00bb0aeea1d0..22e443133987 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -4,7 +4,7 @@
  *
  * This file contains the interrupt descriptor management code
  *
- * Detailed information is available in Documentation/DocBook/genericirq
+ * Detailed information is available in Documentation/core-api/genericirq.rst
  *
  */
 #include <linux/irq.h>
-- 
2.9.3
