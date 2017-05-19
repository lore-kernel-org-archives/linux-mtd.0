Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWeB-0005dv-R4
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:05 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 30/31] io_ordering.txt: standardize document format
Date: Thu, 18 May 2017 22:22:35 -0300
Message-Id: <359ec40fc84e5007d0ae206d615976595892a210.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- Add a title;
- mark literal-blocks as such.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/io_ordering.txt | 61 +++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/Documentation/io_ordering.txt b/Documentation/io_ordering.txt
index 9faae6f26d32..01d2875b5076 100644
--- a/Documentation/io_ordering.txt
+++ b/Documentation/io_ordering.txt
@@ -1,3 +1,6 @@
+Ordering I/O writes to memory-mapped addresses
+==============================================
+
 On some platforms, so-called memory-mapped I/O is weakly ordered.  On such
 platforms, driver writers are responsible for ensuring that I/O writes to
 memory-mapped addresses on their device arrive in the order intended.  This is
@@ -8,39 +11,39 @@ critical section of code protected by spinlocks.  This would ensure that
 subsequent writes to I/O space arrived only after all prior writes (much like a
 memory barrier op, mb(), only with respect to I/O).
 
-A more concrete example from a hypothetical device driver:
+A more concrete example from a hypothetical device driver::
 
-        ...
-CPU A:  spin_lock_irqsave(&dev_lock, flags)
-CPU A:  val = readl(my_status);
-CPU A:  ...
-CPU A:  writel(newval, ring_ptr);
-CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
-        ...
-CPU B:  spin_lock_irqsave(&dev_lock, flags)
-CPU B:  val = readl(my_status);
-CPU B:  ...
-CPU B:  writel(newval2, ring_ptr);
-CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
-        ...
+		...
+	CPU A:  spin_lock_irqsave(&dev_lock, flags)
+	CPU A:  val = readl(my_status);
+	CPU A:  ...
+	CPU A:  writel(newval, ring_ptr);
+	CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
+		...
+	CPU B:  spin_lock_irqsave(&dev_lock, flags)
+	CPU B:  val = readl(my_status);
+	CPU B:  ...
+	CPU B:  writel(newval2, ring_ptr);
+	CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
+		...
 
 In the case above, the device may receive newval2 before it receives newval,
-which could cause problems.  Fixing it is easy enough though:
+which could cause problems.  Fixing it is easy enough though::
 
-        ...
-CPU A:  spin_lock_irqsave(&dev_lock, flags)
-CPU A:  val = readl(my_status);
-CPU A:  ...
-CPU A:  writel(newval, ring_ptr);
-CPU A:  (void)readl(safe_register); /* maybe a config register? */
-CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
-        ...
-CPU B:  spin_lock_irqsave(&dev_lock, flags)
-CPU B:  val = readl(my_status);
-CPU B:  ...
-CPU B:  writel(newval2, ring_ptr);
-CPU B:  (void)readl(safe_register); /* maybe a config register? */
-CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
+		...
+	CPU A:  spin_lock_irqsave(&dev_lock, flags)
+	CPU A:  val = readl(my_status);
+	CPU A:  ...
+	CPU A:  writel(newval, ring_ptr);
+	CPU A:  (void)readl(safe_register); /* maybe a config register? */
+	CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
+		...
+	CPU B:  spin_lock_irqsave(&dev_lock, flags)
+	CPU B:  val = readl(my_status);
+	CPU B:  ...
+	CPU B:  writel(newval2, ring_ptr);
+	CPU B:  (void)readl(safe_register); /* maybe a config register? */
+	CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
 
 Here, the reads from safe_register will cause the I/O chipset to flush any
 pending writes before actually posting the read to the chipset, preventing
-- 
2.9.4
