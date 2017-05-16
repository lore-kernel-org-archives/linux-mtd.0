Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbPc-0001IE-2Y
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:17:16 +0000
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
Subject: [PATCH v2 07/53] locking.rst: Update some ReST markups
Date: Tue, 16 May 2017 09:15:59 -0300
Message-Id: <dc89fca93ec05a2125b1dfa78efe0e8c7668c8fb.1494935649.git.mchehab@s-opensource.com>
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

Correct a few minor issues with ReST notation used on
this file (produced by an automatic tool).

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/kernel-hacking/locking.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index b70c2c4eb147..f937c0fd11aa 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -93,13 +93,13 @@ Locking in the Linux Kernel
 ===========================
 
 If I could give you one piece of advice: never sleep with anyone crazier
-than yourself. But if I had to give you advice on locking: *keep it
-simple*.
+than yourself. But if I had to give you advice on locking: **keep it
+simple**.
 
 Be reluctant to introduce new locks.
 
 Strangely enough, this last one is the exact reverse of my advice when
-you *have* slept with someone crazier than yourself. And you should
+you **have** slept with someone crazier than yourself. And you should
 think about getting a big dog.
 
 Two Main Types of Kernel Locks: Spinlocks and Mutexes
@@ -311,7 +311,7 @@ Pete Zaitcev gives the following summary:
 Table of Minimum Requirements
 -----------------------------
 
-The following table lists the *minimum* locking requirements between
+The following table lists the **minimum** locking requirements between
 various contexts. In some cases, the same context can only be running on
 one CPU at a time, so no locking is required for that context (eg. a
 particular thread can only run on one CPU at a time, but if it needs
@@ -703,7 +703,7 @@ reference count, but they are more complicated.
 Using Atomic Operations For The Reference Count
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-In practice, ``atomic_t`` would usually be used for refcnt. There are a
+In practice, :c:type:`atomic_t` would usually be used for refcnt. There are a
 number of atomic operations defined in ``include/asm/atomic.h``: these
 are guaranteed to be seen atomically from all CPUs in the system, so no
 lock is required. In this case, it is simpler than using spinlocks,
@@ -1321,7 +1321,7 @@ from user context, and can sleep.
 
    -  :c:func:`put_user()`
 
--  ``kmalloc(GFP_KERNEL)``
+-  :c:func:`kmalloc(GFP_KERNEL) <kmalloc>`
 
 -  :c:func:`mutex_lock_interruptible()` and
    :c:func:`mutex_lock()`
@@ -1431,10 +1431,10 @@ tasklet
 timer
   A dynamically-registrable software interrupt, which is run at (or close
   to) a given time. When running, it is just like a tasklet (in fact, they
-  are called from the TIMER_SOFTIRQ).
+  are called from the ``TIMER_SOFTIRQ``).
 
 UP
-  Uni-Processor: Non-SMP. (CONFIG_SMP=n).
+  Uni-Processor: Non-SMP. (``CONFIG_SMP=n``).
 
 User Context
   The kernel executing on behalf of a particular process (ie. a system
-- 
2.9.3
