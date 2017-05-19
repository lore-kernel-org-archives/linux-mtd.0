Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWew-0005gX-EC
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:54 +0000
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
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>
Subject: [PATCH 30/30] pi-futex.txt: standardize document format
Date: Thu, 18 May 2017 22:24:22 -0300
Message-Id: <51c9b9faf5c6ff4fa21028cefb74221c6d63ae07.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
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
using ReST markups for it to be parseable by Sphinx.

This document requires just minor adjustments to match
the standard documentation style:

- promote document name;
- remove extra collons on some chapter titles;
- use "-" for a bulleted list.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/pi-futex.txt | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/pi-futex.txt b/Documentation/pi-futex.txt
index 9a5bc8651c29..aafddbee7377 100644
--- a/Documentation/pi-futex.txt
+++ b/Documentation/pi-futex.txt
@@ -1,5 +1,6 @@
+======================
 Lightweight PI-futexes
-----------------------
+======================
 
 We are calling them lightweight for 3 reasons:
 
@@ -25,8 +26,8 @@ determinism and well-bound latencies. Even in the worst-case, PI will
 improve the statistical distribution of locking related application
 delays.
 
-The longer reply:
------------------
+The longer reply
+----------------
 
 Firstly, sharing locks between multiple tasks is a common programming
 technique that often cannot be replaced with lockless algorithms. As we
@@ -71,8 +72,8 @@ deterministic execution of the high-prio task: any medium-priority task
 could preempt the low-prio task while it holds the shared lock and
 executes the critical section, and could delay it indefinitely.
 
-Implementation:
----------------
+Implementation
+--------------
 
 As mentioned before, the userspace fastpath of PI-enabled pthread
 mutexes involves no kernel work at all - they behave quite similarly to
@@ -83,8 +84,8 @@ entering the kernel.
 
 To handle the slowpath, we have added two new futex ops:
 
-  FUTEX_LOCK_PI
-  FUTEX_UNLOCK_PI
+  - FUTEX_LOCK_PI
+  - FUTEX_UNLOCK_PI
 
 If the lock-acquire fastpath fails, [i.e. an atomic transition from 0 to
 TID fails], then FUTEX_LOCK_PI is called. The kernel does all the
-- 
2.9.4
