Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWhT-0005yC-3C
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:27:28 +0000
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
Subject: [PATCH 21/29] this_cpu_ops.txt: standardize document format
Date: Thu, 18 May 2017 22:26:05 -0300
Message-Id: <70e089d404aa13de6370f80b3f9b1ef750ddac71.1495157082.git.mchehab@s-opensource.com>
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
- promote document title one level;
- mark literal blocks;
- move authorship to the beginning of the file and use markups.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/this_cpu_ops.txt | 49 ++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/Documentation/this_cpu_ops.txt b/Documentation/this_cpu_ops.txt
index 2cbf71975381..5cb8b883ae83 100644
--- a/Documentation/this_cpu_ops.txt
+++ b/Documentation/this_cpu_ops.txt
@@ -1,5 +1,9 @@
+===================
 this_cpu operations
--------------------
+===================
+
+:Author: Christoph Lameter, August 4th, 2014
+:Author: Pranith Kumar, Aug 2nd, 2014
 
 this_cpu operations are a way of optimizing access to per cpu
 variables associated with the *currently* executing processor. This is
@@ -39,7 +43,7 @@ operations.
 
 The following this_cpu() operations with implied preemption protection
 are defined. These operations can be used without worrying about
-preemption and interrupts.
+preemption and interrupts::
 
 	this_cpu_read(pcp)
 	this_cpu_write(pcp, val)
@@ -67,14 +71,14 @@ to relocate a per cpu relative address to the proper per cpu area for
 the processor. So the relocation to the per cpu base is encoded in the
 instruction via a segment register prefix.
 
-For example:
+For example::
 
 	DEFINE_PER_CPU(int, x);
 	int z;
 
 	z = this_cpu_read(x);
 
-results in a single instruction
+results in a single instruction::
 
 	mov ax, gs:[x]
 
@@ -84,16 +88,16 @@ this_cpu_ops such sequence also required preempt disable/enable to
 prevent the kernel from moving the thread to a different processor
 while the calculation is performed.
 
-Consider the following this_cpu operation:
+Consider the following this_cpu operation::
 
 	this_cpu_inc(x)
 
-The above results in the following single instruction (no lock prefix!)
+The above results in the following single instruction (no lock prefix!)::
 
 	inc gs:[x]
 
 instead of the following operations required if there is no segment
-register:
+register::
 
 	int *y;
 	int cpu;
@@ -121,8 +125,10 @@ has to be paid for this optimization is the need to add up the per cpu
 counters when the value of a counter is needed.
 
 
-Special operations:
--------------------
+Special operations
+------------------
+
+::
 
 	y = this_cpu_ptr(&x)
 
@@ -153,11 +159,15 @@ Therefore the use of x or &x outside of the context of per cpu
 operations is invalid and will generally be treated like a NULL
 pointer dereference.
 
+::
+
 	DEFINE_PER_CPU(int, x);
 
 In the context of per cpu operations the above implies that x is a per
 cpu variable. Most this_cpu operations take a cpu variable.
 
+::
+
 	int __percpu *p = &x;
 
 &x and hence p is the *offset* of a per cpu variable. this_cpu_ptr()
@@ -168,7 +178,7 @@ strange.
 Operations on a field of a per cpu structure
 --------------------------------------------
 
-Let's say we have a percpu structure
+Let's say we have a percpu structure::
 
 	struct s {
 		int n,m;
@@ -177,14 +187,14 @@ Let's say we have a percpu structure
 	DEFINE_PER_CPU(struct s, p);
 
 
-Operations on these fields are straightforward
+Operations on these fields are straightforward::
 
 	this_cpu_inc(p.m)
 
 	z = this_cpu_cmpxchg(p.m, 0, 1);
 
 
-If we have an offset to struct s:
+If we have an offset to struct s::
 
 	struct s __percpu *ps = &p;
 
@@ -194,7 +204,7 @@ If we have an offset to struct s:
 
 
 The calculation of the pointer may require the use of this_cpu_ptr()
-if we do not make use of this_cpu ops later to manipulate fields:
+if we do not make use of this_cpu ops later to manipulate fields::
 
 	struct s *pp;
 
@@ -206,7 +216,7 @@ if we do not make use of this_cpu ops later to manipulate fields:
 
 
 Variants of this_cpu ops
--------------------------
+------------------------
 
 this_cpu ops are interrupt safe. Some architectures do not support
 these per cpu local operations. In that case the operation must be
@@ -222,7 +232,7 @@ preemption. If a per cpu variable is not used in an interrupt context
 and the scheduler cannot preempt, then they are safe. If any interrupts
 still occur while an operation is in progress and if the interrupt too
 modifies the variable, then RMW actions can not be guaranteed to be
-safe.
+safe::
 
 	__this_cpu_read(pcp)
 	__this_cpu_write(pcp, val)
@@ -279,7 +289,7 @@ unless absolutely necessary. Please consider using an IPI to wake up
 the remote CPU and perform the update to its per cpu area.
 
 To access per-cpu data structure remotely, typically the per_cpu_ptr()
-function is used:
+function is used::
 
 
 	DEFINE_PER_CPU(struct data, datap);
@@ -289,7 +299,7 @@ function is used:
 This makes it explicit that we are getting ready to access a percpu
 area remotely.
 
-You can also do the following to convert the datap offset to an address
+You can also do the following to convert the datap offset to an address::
 
 	struct data *p = this_cpu_ptr(&datap);
 
@@ -305,7 +315,7 @@ the following scenario that occurs because two per cpu variables
 share a cache-line but the relaxed synchronization is applied to
 only one process updating the cache-line.
 
-Consider the following example
+Consider the following example::
 
 
 	struct test {
@@ -327,6 +337,3 @@ mind that a remote write will evict the cache line from the processor
 that most likely will access it. If the processor wakes up and finds a
 missing local cache line of a per cpu area, its performance and hence
 the wake up times will be affected.
-
-Christoph Lameter, August 4th, 2014
-Pranith Kumar, Aug 2nd, 2014
-- 
2.9.4
