Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdG-0000LM-BJ
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:08 +0000
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
Subject: [PATCH 10/31] cputopology.txt: standardize document format
Date: Thu, 18 May 2017 22:22:15 -0300
Message-Id: <1204117803e4bf860e4307a9eb2dd02accec1210.1495156488.git.mchehab@s-opensource.com>
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

- Add a title for the document;
- mark literals;
- use table markup for existing table.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/cputopology.txt | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/Documentation/cputopology.txt b/Documentation/cputopology.txt
index 127c9d8c2174..c6e7e9196a8b 100644
--- a/Documentation/cputopology.txt
+++ b/Documentation/cputopology.txt
@@ -1,3 +1,6 @@
+===========================================
+How CPU topology info is exported via sysfs
+===========================================
 
 Export CPU topology info via sysfs. Items (attributes) are similar
 to /proc/cpuinfo output of some architectures:
@@ -75,24 +78,26 @@ CONFIG_SCHED_BOOK and CONFIG_DRAWER are currently only used on s390, where
 they reflect the cpu and cache hierarchy.
 
 For an architecture to support this feature, it must define some of
-these macros in include/asm-XXX/topology.h:
-#define topology_physical_package_id(cpu)
-#define topology_core_id(cpu)
-#define topology_book_id(cpu)
-#define topology_drawer_id(cpu)
-#define topology_sibling_cpumask(cpu)
-#define topology_core_cpumask(cpu)
-#define topology_book_cpumask(cpu)
-#define topology_drawer_cpumask(cpu)
+these macros in include/asm-XXX/topology.h::
 
-The type of **_id macros is int.
-The type of **_cpumask macros is (const) struct cpumask *. The latter
-correspond with appropriate **_siblings sysfs attributes (except for
+	#define topology_physical_package_id(cpu)
+	#define topology_core_id(cpu)
+	#define topology_book_id(cpu)
+	#define topology_drawer_id(cpu)
+	#define topology_sibling_cpumask(cpu)
+	#define topology_core_cpumask(cpu)
+	#define topology_book_cpumask(cpu)
+	#define topology_drawer_cpumask(cpu)
+
+The type of ``**_id macros`` is int.
+The type of ``**_cpumask macros`` is ``(const) struct cpumask *``. The latter
+correspond with appropriate ``**_siblings`` sysfs attributes (except for
 topology_sibling_cpumask() which corresponds with thread_siblings).
 
 To be consistent on all architectures, include/linux/topology.h
 provides default definitions for any of the above macros that are
 not defined by include/asm-XXX/topology.h:
+
 1) physical_package_id: -1
 2) core_id: 0
 3) sibling_cpumask: just the given CPU
@@ -107,6 +112,7 @@ Additionally, CPU topology information is provided under
 /sys/devices/system/cpu and includes these files.  The internal
 source for the output is in brackets ("[]").
 
+    =========== ==========================================================
     kernel_max: the maximum CPU index allowed by the kernel configuration.
 		[NR_CPUS-1]
 
@@ -122,6 +128,7 @@ source for the output is in brackets ("[]").
 
     present:	CPUs that have been identified as being present in the
 		system. [cpu_present_mask]
+    =========== ==========================================================
 
 The format for the above output is compatible with cpulist_parse()
 [see <linux/cpumask.h>].  Some examples follow.
@@ -129,7 +136,7 @@ The format for the above output is compatible with cpulist_parse()
 In this example, there are 64 CPUs in the system but cpus 32-63 exceed
 the kernel max which is limited to 0..31 by the NR_CPUS config option
 being 32.  Note also that CPUs 2 and 4-31 are not online but could be
-brought online as they are both present and possible.
+brought online as they are both present and possible::
 
      kernel_max: 31
         offline: 2,4-31,32-63
@@ -140,7 +147,7 @@ brought online as they are both present and possible.
 In this example, the NR_CPUS config option is 128, but the kernel was
 started with possible_cpus=144.  There are 4 CPUs in the system and cpu2
 was manually taken offline (and is the only CPU that can be brought
-online.)
+online.)::
 
      kernel_max: 127
         offline: 2,4-127,128-143
-- 
2.9.4
