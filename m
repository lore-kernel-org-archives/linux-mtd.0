Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWl5-00027e-2P
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:31:15 +0000
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
Subject: [PATCH 09/30] kernel-per-CPU-kthreads.txt: standardize document format
Date: Thu, 18 May 2017 22:24:01 -0300
Message-Id: <6920d4abfe81c1f2fd52430bd988fc55ebced6aa.1495156975.git.mchehab@s-opensource.com>
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
using ReST markups for it to be parseable by Sphinx:

- Use title markups;
- use "-" for bulletted lists;
- Split Name/Purpose on two lines, in order to make visually
  easier to read (in text format), and to bold the title
  (on ReST output)
- Add blank lines to split bulleted lists;
- use sub-titles for the several kthread softirq types;
- mark one literal var with asterisk as such, in order to
  avoid an error warning on Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/kernel-per-CPU-kthreads.txt | 156 +++++++++++++++++++++++-------
 1 file changed, 121 insertions(+), 35 deletions(-)

diff --git a/Documentation/kernel-per-CPU-kthreads.txt b/Documentation/kernel-per-CPU-kthreads.txt
index df31e30b6a02..5a09a4a99ecc 100644
--- a/Documentation/kernel-per-CPU-kthreads.txt
+++ b/Documentation/kernel-per-CPU-kthreads.txt
@@ -1,27 +1,29 @@
-REDUCING OS JITTER DUE TO PER-CPU KTHREADS
+==========================================
+Reducing OS jitter due to per-cpu kthreads
+==========================================
 
 This document lists per-CPU kthreads in the Linux kernel and presents
 options to control their OS jitter.  Note that non-per-CPU kthreads are
 not listed here.  To reduce OS jitter from non-per-CPU kthreads, bind
 them to a "housekeeping" CPU dedicated to such work.
 
+References
+==========
 
-REFERENCES
+-	Documentation/IRQ-affinity.txt:  Binding interrupts to sets of CPUs.
 
-o	Documentation/IRQ-affinity.txt:  Binding interrupts to sets of CPUs.
+-	Documentation/cgroup-v1:  Using cgroups to bind tasks to sets of CPUs.
 
-o	Documentation/cgroup-v1:  Using cgroups to bind tasks to sets of CPUs.
-
-o	man taskset:  Using the taskset command to bind tasks to sets
+-	man taskset:  Using the taskset command to bind tasks to sets
 	of CPUs.
 
-o	man sched_setaffinity:  Using the sched_setaffinity() system
+-	man sched_setaffinity:  Using the sched_setaffinity() system
 	call to bind tasks to sets of CPUs.
 
-o	/sys/devices/system/cpu/cpuN/online:  Control CPU N's hotplug state,
+-	/sys/devices/system/cpu/cpuN/online:  Control CPU N's hotplug state,
 	writing "0" to offline and "1" to online.
 
-o	In order to locate kernel-generated OS jitter on CPU N:
+-	In order to locate kernel-generated OS jitter on CPU N:
 
 		cd /sys/kernel/debug/tracing
 		echo 1 > max_graph_depth # Increase the "1" for more detail
@@ -29,12 +31,17 @@ o	In order to locate kernel-generated OS jitter on CPU N:
 		# run workload
 		cat per_cpu/cpuN/trace
 
+kthreads
+========
 
-KTHREADS
+Name:
+  ehca_comp/%u
+
+Purpose:
+  Periodically process Infiniband-related work.
 
-Name: ehca_comp/%u
-Purpose: Periodically process Infiniband-related work.
 To reduce its OS jitter, do any of the following:
+
 1.	Don't use eHCA Infiniband hardware, instead choosing hardware
 	that does not require per-CPU kthreads.  This will prevent these
 	kthreads from being created in the first place.  (This will
@@ -46,26 +53,45 @@ To reduce its OS jitter, do any of the following:
 	provisioned only on selected CPUs.
 
 
-Name: irq/%d-%s
-Purpose: Handle threaded interrupts.
+Name:
+  irq/%d-%s
+
+Purpose:
+  Handle threaded interrupts.
+
 To reduce its OS jitter, do the following:
+
 1.	Use irq affinity to force the irq threads to execute on
 	some other CPU.
 
-Name: kcmtpd_ctr_%d
-Purpose: Handle Bluetooth work.
+Name:
+  kcmtpd_ctr_%d
+
+Purpose:
+  Handle Bluetooth work.
+
 To reduce its OS jitter, do one of the following:
+
 1.	Don't use Bluetooth, in which case these kthreads won't be
 	created in the first place.
 2.	Use irq affinity to force Bluetooth-related interrupts to
 	occur on some other CPU and furthermore initiate all
 	Bluetooth activity on some other CPU.
 
-Name: ksoftirqd/%u
-Purpose: Execute softirq handlers when threaded or when under heavy load.
+Name:
+  ksoftirqd/%u
+
+Purpose:
+  Execute softirq handlers when threaded or when under heavy load.
+
 To reduce its OS jitter, each softirq vector must be handled
 separately as follows:
-TIMER_SOFTIRQ:  Do all of the following:
+
+TIMER_SOFTIRQ
+-------------
+
+Do all of the following:
+
 1.	To the extent possible, keep the CPU out of the kernel when it
 	is non-idle, for example, by avoiding system calls and by forcing
 	both kernel threads and interrupts to execute elsewhere.
@@ -76,34 +102,59 @@ TIMER_SOFTIRQ:  Do all of the following:
 	first one back online.  Once you have onlined the CPUs in question,
 	do not offline any other CPUs, because doing so could force the
 	timer back onto one of the CPUs in question.
-NET_TX_SOFTIRQ and NET_RX_SOFTIRQ:  Do all of the following:
+
+NET_TX_SOFTIRQ and NET_RX_SOFTIRQ
+---------------------------------
+
+Do all of the following:
+
 1.	Force networking interrupts onto other CPUs.
 2.	Initiate any network I/O on other CPUs.
 3.	Once your application has started, prevent CPU-hotplug operations
 	from being initiated from tasks that might run on the CPU to
 	be de-jittered.  (It is OK to force this CPU offline and then
 	bring it back online before you start your application.)
-BLOCK_SOFTIRQ:  Do all of the following:
+
+BLOCK_SOFTIRQ
+-------------
+
+Do all of the following:
+
 1.	Force block-device interrupts onto some other CPU.
 2.	Initiate any block I/O on other CPUs.
 3.	Once your application has started, prevent CPU-hotplug operations
 	from being initiated from tasks that might run on the CPU to
 	be de-jittered.  (It is OK to force this CPU offline and then
 	bring it back online before you start your application.)
-IRQ_POLL_SOFTIRQ:  Do all of the following:
+
+IRQ_POLL_SOFTIRQ
+----------------
+
+Do all of the following:
+
 1.	Force block-device interrupts onto some other CPU.
 2.	Initiate any block I/O and block-I/O polling on other CPUs.
 3.	Once your application has started, prevent CPU-hotplug operations
 	from being initiated from tasks that might run on the CPU to
 	be de-jittered.  (It is OK to force this CPU offline and then
 	bring it back online before you start your application.)
-TASKLET_SOFTIRQ: Do one or more of the following:
+
+TASKLET_SOFTIRQ
+---------------
+
+Do one or more of the following:
+
 1.	Avoid use of drivers that use tasklets.  (Such drivers will contain
 	calls to things like tasklet_schedule().)
 2.	Convert all drivers that you must use from tasklets to workqueues.
 3.	Force interrupts for drivers using tasklets onto other CPUs,
 	and also do I/O involving these drivers on other CPUs.
-SCHED_SOFTIRQ: Do all of the following:
+
+SCHED_SOFTIRQ
+-------------
+
+Do all of the following:
+
 1.	Avoid sending scheduler IPIs to the CPU to be de-jittered,
 	for example, ensure that at most one runnable kthread is present
 	on that CPU.  If a thread that expects to run on the de-jittered
@@ -121,7 +172,12 @@ SCHED_SOFTIRQ: Do all of the following:
 	forcing both kernel threads and interrupts to execute elsewhere.
 	This further reduces the number of scheduler-clock interrupts
 	received by the de-jittered CPU.
-HRTIMER_SOFTIRQ:  Do all of the following:
+
+HRTIMER_SOFTIRQ
+---------------
+
+Do all of the following:
+
 1.	To the extent possible, keep the CPU out of the kernel when it
 	is non-idle.  For example, avoid system calls and force both
 	kernel threads and interrupts to execute elsewhere.
@@ -132,9 +188,15 @@ HRTIMER_SOFTIRQ:  Do all of the following:
 	back online.  Once you have onlined the CPUs in question, do not
 	offline any other CPUs, because doing so could force the timer
 	back onto one of the CPUs in question.
-RCU_SOFTIRQ:  Do at least one of the following:
+
+RCU_SOFTIRQ
+-----------
+
+Do at least one of the following:
+
 1.	Offload callbacks and keep the CPU in either dyntick-idle or
 	adaptive-ticks state by doing all of the following:
+
 	a.	Build with CONFIG_RCU_NOCB_CPU=y, CONFIG_RCU_NOCB_CPU_ALL=y,
 		CONFIG_NO_HZ_FULL=y, and, in addition ensure that the CPU
 		to be de-jittered is marked as an adaptive-ticks CPU using
@@ -144,8 +206,10 @@ RCU_SOFTIRQ:  Do at least one of the following:
 		when it is non-idle, for example, by avoiding system
 		calls and by forcing both kernel threads and interrupts
 		to execute elsewhere.
+
 2.	Enable RCU to do its processing remotely via dyntick-idle by
 	doing all of the following:
+
 	a.	Build with CONFIG_NO_HZ=y and CONFIG_RCU_FAST_NO_HZ=y.
 	b.	Ensure that the CPU goes idle frequently, allowing other
 		CPUs to detect that it has passed through an RCU quiescent
@@ -157,15 +221,20 @@ RCU_SOFTIRQ:  Do at least one of the following:
 		calls and by forcing both kernel threads and interrupts
 		to execute elsewhere.
 
-Name: kworker/%u:%d%s (cpu, id, priority)
-Purpose: Execute workqueue requests
+Name:
+  kworker/%u:%d%s (cpu, id, priority)
+
+Purpose:
+  Execute workqueue requests
+
 To reduce its OS jitter, do any of the following:
+
 1.	Run your workload at a real-time priority, which will allow
 	preempting the kworker daemons.
 2.	A given workqueue can be made visible in the sysfs filesystem
 	by passing the WQ_SYSFS to that workqueue's alloc_workqueue().
 	Such a workqueue can be confined to a given subset of the
-	CPUs using the /sys/devices/virtual/workqueue/*/cpumask sysfs
+	CPUs using the ``/sys/devices/virtual/workqueue/*/cpumask`` sysfs
 	files.	The set of WQ_SYSFS workqueues can be displayed using
 	"ls sys/devices/virtual/workqueue".  That said, the workqueues
 	maintainer would like to caution people against indiscriminately
@@ -175,6 +244,7 @@ To reduce its OS jitter, do any of the following:
 	to remove it, even if its addition was a mistake.
 3.	Do any of the following needed to avoid jitter that your
 	application cannot tolerate:
+
 	a.	Build your kernel with CONFIG_SLUB=y rather than
 		CONFIG_SLAB=y, thus avoiding the slab allocator's periodic
 		use of each CPU's workqueues to run its cache_reap()
@@ -188,6 +258,7 @@ To reduce its OS jitter, do any of the following:
 		be able to build your kernel with CONFIG_CPU_FREQ=n to
 		avoid the CPU-frequency governor periodically running
 		on each CPU, including cs_dbs_timer() and od_dbs_timer().
+
 		WARNING:  Please check your CPU specifications to
 		make sure that this is safe on your particular system.
 	d.	As of v3.18, Christoph Lameter's on-demand vmstat workers
@@ -224,9 +295,14 @@ To reduce its OS jitter, do any of the following:
 		CONFIG_PMAC_RACKMETER=n to disable the CPU-meter,
 		avoiding OS jitter from rackmeter_do_timer().
 
-Name: rcuc/%u
-Purpose: Execute RCU callbacks in CONFIG_RCU_BOOST=y kernels.
+Name:
+  rcuc/%u
+
+Purpose:
+  Execute RCU callbacks in CONFIG_RCU_BOOST=y kernels.
+
 To reduce its OS jitter, do at least one of the following:
+
 1.	Build the kernel with CONFIG_PREEMPT=n.  This prevents these
 	kthreads from being created in the first place, and also obviates
 	the need for RCU priority boosting.  This approach is feasible
@@ -247,9 +323,14 @@ To reduce its OS jitter, do at least one of the following:
 	CPU, again preventing the rcuc/%u kthreads from having any work
 	to do.
 
-Name: rcuob/%d, rcuop/%d, and rcuos/%d
-Purpose: Offload RCU callbacks from the corresponding CPU.
+Name:
+  rcuob/%d, rcuop/%d, and rcuos/%d
+
+Purpose:
+  Offload RCU callbacks from the corresponding CPU.
+
 To reduce its OS jitter, do at least one of the following:
+
 1.	Use affinity, cgroups, or other mechanism to force these kthreads
 	to execute on some other CPU.
 2.	Build with CONFIG_RCU_NOCB_CPU=n, which will prevent these
@@ -257,9 +338,14 @@ To reduce its OS jitter, do at least one of the following:
 	note that this will not eliminate OS jitter, but will instead
 	shift it to RCU_SOFTIRQ.
 
-Name: watchdog/%u
-Purpose: Detect software lockups on each CPU.
+Name:
+  watchdog/%u
+
+Purpose:
+  Detect software lockups on each CPU.
+
 To reduce its OS jitter, do at least one of the following:
+
 1.	Build with CONFIG_LOCKUP_DETECTOR=n, which will prevent these
 	kthreads from being created in the first place.
 2.	Boot with "nosoftlockup=0", which will also prevent these kthreads
-- 
2.9.4
