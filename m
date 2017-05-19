Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWqJ-0007Bw-No
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:36:41 +0000
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
 Robert Love <rml@tech9.net>, kpreempt-tech@lists.sourceforge.net
Subject: [PATCH 03/29] preempt-locking.txt: standardize document format
Date: Thu, 18 May 2017 22:25:47 -0300
Message-Id: <e9ca70f5325b033da27652d47beb38ae7c6b4de5.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
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

- mark titles;
- mark literal blocks;
- adjust identation where needed;
- use :Author: for authorship.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/preempt-locking.txt | 40 ++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/Documentation/preempt-locking.txt b/Documentation/preempt-locking.txt
index e89ce6624af2..c945062be66c 100644
--- a/Documentation/preempt-locking.txt
+++ b/Documentation/preempt-locking.txt
@@ -1,10 +1,13 @@
-		  Proper Locking Under a Preemptible Kernel:
-		       Keeping Kernel Code Preempt-Safe
-			 Robert Love <rml@tech9.net>
-			  Last Updated: 28 Aug 2002
+===========================================================================
+Proper Locking Under a Preemptible Kernel: Keeping Kernel Code Preempt-Safe
+===========================================================================
 
+:Author: Robert Love <rml@tech9.net>
+:Last Updated: 28 Aug 2002
 
-INTRODUCTION
+
+Introduction
+============
 
 
 A preemptible kernel creates new locking issues.  The issues are the same as
@@ -17,9 +20,10 @@ requires protecting these situations.
  
 
 RULE #1: Per-CPU data structures need explicit protection
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 
-Two similar problems arise. An example code snippet:
+Two similar problems arise. An example code snippet::
 
 	struct this_needs_locking tux[NR_CPUS];
 	tux[smp_processor_id()] = some_value;
@@ -35,6 +39,7 @@ You can also use put_cpu() and get_cpu(), which will disable preemption.
 
 
 RULE #2: CPU state must be protected.
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 
 Under preemption, the state of the CPU must be protected.  This is arch-
@@ -52,6 +57,7 @@ However, fpu__restore() must be called with preemption disabled.
 
 
 RULE #3: Lock acquire and release must be performed by same task
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 
 A lock acquired in one task must be released by the same task.  This
@@ -61,17 +67,20 @@ like this, acquire and release the task in the same code path and
 have the caller wait on an event by the other task.
 
 
-SOLUTION
+Solution
+========
 
 
 Data protection under preemption is achieved by disabling preemption for the
 duration of the critical region.
 
-preempt_enable()		decrement the preempt counter
-preempt_disable()		increment the preempt counter
-preempt_enable_no_resched()	decrement, but do not immediately preempt
-preempt_check_resched()		if needed, reschedule
-preempt_count()			return the preempt counter
+::
+
+  preempt_enable()		decrement the preempt counter
+  preempt_disable()		increment the preempt counter
+  preempt_enable_no_resched()	decrement, but do not immediately preempt
+  preempt_check_resched()	if needed, reschedule
+  preempt_count()		return the preempt counter
 
 The functions are nestable.  In other words, you can call preempt_disable
 n-times in a code path, and preemption will not be reenabled until the n-th
@@ -89,7 +98,7 @@ So use this implicit preemption-disabling property only if you know that the
 affected codepath does not do any of this. Best policy is to use this only for
 small, atomic code that you wrote and which calls no complex functions.
 
-Example:
+Example::
 
 	cpucache_t *cc; /* this is per-CPU */
 	preempt_disable();
@@ -102,7 +111,7 @@ Example:
 	return 0;
 
 Notice how the preemption statements must encompass every reference of the
-critical variables.  Another example:
+critical variables.  Another example::
 
 	int buf[NR_CPUS];
 	set_cpu_val(buf);
@@ -114,7 +123,8 @@ This code is not preempt-safe, but see how easily we can fix it by simply
 moving the spin_lock up two lines.
 
 
-PREVENTING PREEMPTION USING INTERRUPT DISABLING
+Preventing preemption using interrupt disabling
+===============================================
 
 
 It is possible to prevent a preemption event using local_irq_disable and
-- 
2.9.4
