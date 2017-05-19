Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdc-0000PM-Pm
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:44 +0000
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
Subject: [PATCH 09/31] cpu-load: standardize document format
Date: Thu, 18 May 2017 22:22:14 -0300
Message-Id: <08c1896acb6094127366b6b017a5efb0794a51fd.1495156488.git.mchehab@s-opensource.com>
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

- mark literals;
- Adjust document title;
- Use a list for references.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/cpu-load.txt | 117 +++++++++++++++++++++++----------------------
 1 file changed, 59 insertions(+), 58 deletions(-)

diff --git a/Documentation/cpu-load.txt b/Documentation/cpu-load.txt
index 287224e57cfc..2d01ce43d2a2 100644
--- a/Documentation/cpu-load.txt
+++ b/Documentation/cpu-load.txt
@@ -1,9 +1,10 @@
+========
 CPU load
---------
+========
 
-Linux exports various bits of information via `/proc/stat' and
-`/proc/uptime' that userland tools, such as top(1), use to calculate
-the average time system spent in a particular state, for example:
+Linux exports various bits of information via ``/proc/stat`` and
+``/proc/uptime`` that userland tools, such as top(1), use to calculate
+the average time system spent in a particular state, for example::
 
     $ iostat
     Linux 2.6.18.3-exp (linmac)     02/20/2007
@@ -17,7 +18,7 @@ Here the system thinks that over the default sampling period the
 system spent 10.01% of the time doing work in user space, 2.92% in the
 kernel, and was overall 81.63% of the time idle.
 
-In most cases the `/proc/stat' information reflects the reality quite
+In most cases the ``/proc/stat``	 information reflects the reality quite
 closely, however due to the nature of how/when the kernel collects
 this data sometimes it can not be trusted at all.
 
@@ -33,78 +34,78 @@ Example
 -------
 
 If we imagine the system with one task that periodically burns cycles
-in the following manner:
+in the following manner::
 
- time line between two timer interrupts
-|--------------------------------------|
- ^                                    ^
- |_ something begins working          |
-                                      |_ something goes to sleep
-                                     (only to be awaken quite soon)
+     time line between two timer interrupts
+    |--------------------------------------|
+     ^                                    ^
+     |_ something begins working          |
+                                          |_ something goes to sleep
+                                         (only to be awaken quite soon)
 
 In the above situation the system will be 0% loaded according to the
-`/proc/stat' (since the timer interrupt will always happen when the
+``/proc/stat`` (since the timer interrupt will always happen when the
 system is executing the idle handler), but in reality the load is
 closer to 99%.
 
 One can imagine many more situations where this behavior of the kernel
-will lead to quite erratic information inside `/proc/stat'.
+will lead to quite erratic information inside ``/proc/stat``::
 
 
-/* gcc -o hog smallhog.c */
-#include <time.h>
-#include <limits.h>
-#include <signal.h>
-#include <sys/time.h>
-#define HIST 10
+	/* gcc -o hog smallhog.c */
+	#include <time.h>
+	#include <limits.h>
+	#include <signal.h>
+	#include <sys/time.h>
+	#define HIST 10
 
-static volatile sig_atomic_t stop;
+	static volatile sig_atomic_t stop;
 
-static void sighandler (int signr)
-{
-     (void) signr;
-     stop = 1;
-}
-static unsigned long hog (unsigned long niters)
-{
-     stop = 0;
-     while (!stop && --niters);
-     return niters;
-}
-int main (void)
-{
-     int i;
-     struct itimerval it = { .it_interval = { .tv_sec = 0, .tv_usec = 1 },
-                             .it_value = { .tv_sec = 0, .tv_usec = 1 } };
-     sigset_t set;
-     unsigned long v[HIST];
-     double tmp = 0.0;
-     unsigned long n;
-     signal (SIGALRM, &sighandler);
-     setitimer (ITIMER_REAL, &it, NULL);
+	static void sighandler (int signr)
+	{
+	(void) signr;
+	stop = 1;
+	}
+	static unsigned long hog (unsigned long niters)
+	{
+	stop = 0;
+	while (!stop && --niters);
+	return niters;
+	}
+	int main (void)
+	{
+	int i;
+	struct itimerval it = { .it_interval = { .tv_sec = 0, .tv_usec = 1 },
+				.it_value = { .tv_sec = 0, .tv_usec = 1 } };
+	sigset_t set;
+	unsigned long v[HIST];
+	double tmp = 0.0;
+	unsigned long n;
+	signal (SIGALRM, &sighandler);
+	setitimer (ITIMER_REAL, &it, NULL);
 
-     hog (ULONG_MAX);
-     for (i = 0; i < HIST; ++i) v[i] = ULONG_MAX - hog (ULONG_MAX);
-     for (i = 0; i < HIST; ++i) tmp += v[i];
-     tmp /= HIST;
-     n = tmp - (tmp / 3.0);
+	hog (ULONG_MAX);
+	for (i = 0; i < HIST; ++i) v[i] = ULONG_MAX - hog (ULONG_MAX);
+	for (i = 0; i < HIST; ++i) tmp += v[i];
+	tmp /= HIST;
+	n = tmp - (tmp / 3.0);
 
-     sigemptyset (&set);
-     sigaddset (&set, SIGALRM);
+	sigemptyset (&set);
+	sigaddset (&set, SIGALRM);
 
-     for (;;) {
-         hog (n);
-         sigwait (&set, &i);
-     }
-     return 0;
-}
+	for (;;) {
+		hog (n);
+		sigwait (&set, &i);
+	}
+	return 0;
+	}
 
 
 References
 ----------
 
-http://lkml.org/lkml/2007/2/12/6
-Documentation/filesystems/proc.txt (1.8)
+- http://lkml.org/lkml/2007/2/12/6
+- Documentation/filesystems/proc.txt (1.8)
 
 
 Thanks
-- 
2.9.4
