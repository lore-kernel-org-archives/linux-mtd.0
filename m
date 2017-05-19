Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdl-0000Ou-Q4
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:50 +0000
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
Subject: [PATCH 22/31] futex-requeue-pi.txt: standardize document format
Date: Thu, 18 May 2017 22:22:27 -0300
Message-Id: <d84d18fa0cd82f4d2e5a1fe9751ea97c22de8a23.1495156488.git.mchehab@s-opensource.com>
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

- promote level for the document title;
- mark literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/futex-requeue-pi.txt | 83 +++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/Documentation/futex-requeue-pi.txt b/Documentation/futex-requeue-pi.txt
index 77b36f59d16b..14ab5787b9a7 100644
--- a/Documentation/futex-requeue-pi.txt
+++ b/Documentation/futex-requeue-pi.txt
@@ -1,5 +1,6 @@
+================
 Futex Requeue PI
-----------------
+================
 
 Requeueing of tasks from a non-PI futex to a PI futex requires
 special handling in order to ensure the underlying rt_mutex is never
@@ -20,28 +21,28 @@ implementation would wake the highest-priority waiter, and leave the
 rest to the natural wakeup inherent in unlocking the mutex
 associated with the condvar.
 
-Consider the simplified glibc calls:
+Consider the simplified glibc calls::
 
-/* caller must lock mutex */
-pthread_cond_wait(cond, mutex)
-{
-	lock(cond->__data.__lock);
-	unlock(mutex);
-	do {
-	   unlock(cond->__data.__lock);
-	   futex_wait(cond->__data.__futex);
-	   lock(cond->__data.__lock);
-	} while(...)
-	unlock(cond->__data.__lock);
-	lock(mutex);
-}
+	/* caller must lock mutex */
+	pthread_cond_wait(cond, mutex)
+	{
+		lock(cond->__data.__lock);
+		unlock(mutex);
+		do {
+		unlock(cond->__data.__lock);
+		futex_wait(cond->__data.__futex);
+		lock(cond->__data.__lock);
+		} while(...)
+		unlock(cond->__data.__lock);
+		lock(mutex);
+	}
 
-pthread_cond_broadcast(cond)
-{
-	lock(cond->__data.__lock);
-	unlock(cond->__data.__lock);
-	futex_requeue(cond->data.__futex, cond->mutex);
-}
+	pthread_cond_broadcast(cond)
+	{
+		lock(cond->__data.__lock);
+		unlock(cond->__data.__lock);
+		futex_requeue(cond->data.__futex, cond->mutex);
+	}
 
 Once pthread_cond_broadcast() requeues the tasks, the cond->mutex
 has waiters. Note that pthread_cond_wait() attempts to lock the
@@ -53,29 +54,29 @@ In order to support PI-aware pthread_condvar's, the kernel needs to
 be able to requeue tasks to PI futexes.  This support implies that
 upon a successful futex_wait system call, the caller would return to
 user space already holding the PI futex.  The glibc implementation
-would be modified as follows:
+would be modified as follows::
 
 
-/* caller must lock mutex */
-pthread_cond_wait_pi(cond, mutex)
-{
-	lock(cond->__data.__lock);
-	unlock(mutex);
-	do {
-	   unlock(cond->__data.__lock);
-	   futex_wait_requeue_pi(cond->__data.__futex);
-	   lock(cond->__data.__lock);
-	} while(...)
-	unlock(cond->__data.__lock);
-        /* the kernel acquired the mutex for us */
-}
+	/* caller must lock mutex */
+	pthread_cond_wait_pi(cond, mutex)
+	{
+		lock(cond->__data.__lock);
+		unlock(mutex);
+		do {
+		unlock(cond->__data.__lock);
+		futex_wait_requeue_pi(cond->__data.__futex);
+		lock(cond->__data.__lock);
+		} while(...)
+		unlock(cond->__data.__lock);
+		/* the kernel acquired the mutex for us */
+	}
 
-pthread_cond_broadcast_pi(cond)
-{
-	lock(cond->__data.__lock);
-	unlock(cond->__data.__lock);
-	futex_requeue_pi(cond->data.__futex, cond->mutex);
-}
+	pthread_cond_broadcast_pi(cond)
+	{
+		lock(cond->__data.__lock);
+		unlock(cond->__data.__lock);
+		futex_requeue_pi(cond->data.__futex, cond->mutex);
+	}
 
 The actual glibc implementation will likely test for PI and make the
 necessary changes inside the existing calls rather than creating new
-- 
2.9.4
