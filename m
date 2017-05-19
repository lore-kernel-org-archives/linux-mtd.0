Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWew-0005gd-BX
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:58 +0000
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
 Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 11/30] kprobes.txt: standardize document format
Date: Thu, 18 May 2017 22:24:03 -0300
Message-Id: <93a4ddafd210f3e0acd622a24d983614cf581c82.1495156975.git.mchehab@s-opensource.com>
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

- comment the contents;
- add proper markups for titles;
- mark literal blocks as such;
- use :Author: for authorship;
- use the right markups for footnotes;
- escape some literals that would otherwise cause problems;
- fix identation and add blank lines where needed.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/kprobes.txt | 450 +++++++++++++++++++++++++++-------------------
 1 file changed, 265 insertions(+), 185 deletions(-)

diff --git a/Documentation/kprobes.txt b/Documentation/kprobes.txt
index 1f6d45abfe42..48146e093b1a 100644
--- a/Documentation/kprobes.txt
+++ b/Documentation/kprobes.txt
@@ -1,30 +1,36 @@
-Title	: Kernel Probes (Kprobes)
-Authors	: Jim Keniston <jkenisto@us.ibm.com>
-	: Prasanna S Panchamukhi <prasanna.panchamukhi@gmail.com>
-	: Masami Hiramatsu <mhiramat@redhat.com>
+=======================
+Kernel Probes (Kprobes)
+=======================
 
-CONTENTS
+:Author: Jim Keniston <jkenisto@us.ibm.com>
+:Author: Prasanna S Panchamukhi <prasanna.panchamukhi@gmail.com>
+:Author: Masami Hiramatsu <mhiramat@redhat.com>
 
-1. Concepts: Kprobes, Jprobes, Return Probes
-2. Architectures Supported
-3. Configuring Kprobes
-4. API Reference
-5. Kprobes Features and Limitations
-6. Probe Overhead
-7. TODO
-8. Kprobes Example
-9. Jprobes Example
-10. Kretprobes Example
-Appendix A: The kprobes debugfs interface
-Appendix B: The kprobes sysctl interface
+.. CONTENTS
 
-1. Concepts: Kprobes, Jprobes, Return Probes
+  1. Concepts: Kprobes, Jprobes, Return Probes
+  2. Architectures Supported
+  3. Configuring Kprobes
+  4. API Reference
+  5. Kprobes Features and Limitations
+  6. Probe Overhead
+  7. TODO
+  8. Kprobes Example
+  9. Jprobes Example
+  10. Kretprobes Example
+  Appendix A: The kprobes debugfs interface
+  Appendix B: The kprobes sysctl interface
+
+Concepts: Kprobes, Jprobes, Return Probes
+=========================================
 
 Kprobes enables you to dynamically break into any kernel routine and
 collect debugging and performance information non-disruptively. You
-can trap at almost any kernel code address(*), specifying a handler
+can trap at almost any kernel code address [1]_, specifying a handler
 routine to be invoked when the breakpoint is hit.
-(*: some parts of the kernel code can not be trapped, see 1.5 Blacklist)
+
+.. [1] some parts of the kernel code can not be trapped, see
+       :ref:`kprobes_blacklist`)
 
 There are currently three types of probes: kprobes, jprobes, and
 kretprobes (also called return probes).  A kprobe can be inserted
@@ -40,8 +46,8 @@ registration function such as register_kprobe() specifies where
 the probe is to be inserted and what handler is to be called when
 the probe is hit.
 
-There are also register_/unregister_*probes() functions for batch
-registration/unregistration of a group of *probes. These functions
+There are also ``register_/unregister_*probes()`` functions for batch
+registration/unregistration of a group of ``*probes``. These functions
 can speed up unregistration process when you have to unregister
 a lot of probes at once.
 
@@ -53,7 +59,8 @@ a post_handler, and how to use the maxactive and nmissed fields of
 a kretprobe.  But if you're in a hurry to start using Kprobes, you
 can skip ahead to section 2.
 
-1.1 How Does a Kprobe Work?
+How Does a Kprobe Work?
+-----------------------
 
 When a kprobe is registered, Kprobes makes a copy of the probed
 instruction and replaces the first byte(s) of the probed instruction
@@ -75,7 +82,8 @@ After the instruction is single-stepped, Kprobes executes the
 "post_handler," if any, that is associated with the kprobe.
 Execution then continues with the instruction following the probepoint.
 
-1.2 How Does a Jprobe Work?
+How Does a Jprobe Work?
+-----------------------
 
 A jprobe is implemented using a kprobe that is placed on a function's
 entry point.  It employs a simple mirroring principle to allow
@@ -113,9 +121,11 @@ more than eight function arguments, an argument of more than sixteen
 bytes, or more than 64 bytes of argument data, depending on
 architecture).
 
-1.3 Return Probes
+Return Probes
+-------------
 
-1.3.1 How Does a Return Probe Work?
+How Does a Return Probe Work?
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 When you call register_kretprobe(), Kprobes establishes a kprobe at
 the entry to the function.  When the probed function is called and this
@@ -150,7 +160,8 @@ zero when the return probe is registered, and is incremented every
 time the probed function is entered but there is no kretprobe_instance
 object available for establishing the return probe.
 
-1.3.2 Kretprobe entry-handler
+Kretprobe entry-handler
+^^^^^^^^^^^^^^^^^^^^^^^
 
 Kretprobes also provides an optional user-specified handler which runs
 on function entry. This handler is specified by setting the entry_handler
@@ -174,7 +185,8 @@ In case probed function is entered but there is no kretprobe_instance
 object available, then in addition to incrementing the nmissed count,
 the user entry_handler invocation is also skipped.
 
-1.4 How Does Jump Optimization Work?
+How Does Jump Optimization Work?
+--------------------------------
 
 If your kernel is built with CONFIG_OPTPROBES=y (currently this flag
 is automatically set 'y' on x86/x86-64, non-preemptive kernel) and
@@ -182,53 +194,60 @@ the "debug.kprobes_optimization" kernel parameter is set to 1 (see
 sysctl(8)), Kprobes tries to reduce probe-hit overhead by using a jump
 instruction instead of a breakpoint instruction at each probepoint.
 
-1.4.1 Init a Kprobe
+Init a Kprobe
+^^^^^^^^^^^^^
 
 When a probe is registered, before attempting this optimization,
 Kprobes inserts an ordinary, breakpoint-based kprobe at the specified
 address. So, even if it's not possible to optimize this particular
 probepoint, there'll be a probe there.
 
-1.4.2 Safety Check
+Safety Check
+^^^^^^^^^^^^
 
 Before optimizing a probe, Kprobes performs the following safety checks:
 
 - Kprobes verifies that the region that will be replaced by the jump
-instruction (the "optimized region") lies entirely within one function.
-(A jump instruction is multiple bytes, and so may overlay multiple
-instructions.)
+  instruction (the "optimized region") lies entirely within one function.
+  (A jump instruction is multiple bytes, and so may overlay multiple
+  instructions.)
 
 - Kprobes analyzes the entire function and verifies that there is no
-jump into the optimized region.  Specifically:
+  jump into the optimized region.  Specifically:
+
   - the function contains no indirect jump;
   - the function contains no instruction that causes an exception (since
-  the fixup code triggered by the exception could jump back into the
-  optimized region -- Kprobes checks the exception tables to verify this);
-  and
+    the fixup code triggered by the exception could jump back into the
+    optimized region -- Kprobes checks the exception tables to verify this);
   - there is no near jump to the optimized region (other than to the first
-  byte).
+    byte).
 
 - For each instruction in the optimized region, Kprobes verifies that
-the instruction can be executed out of line.
+  the instruction can be executed out of line.
 
-1.4.3 Preparing Detour Buffer
+Preparing Detour Buffer
+^^^^^^^^^^^^^^^^^^^^^^^
 
 Next, Kprobes prepares a "detour" buffer, which contains the following
 instruction sequence:
+
 - code to push the CPU's registers (emulating a breakpoint trap)
 - a call to the trampoline code which calls user's probe handlers.
 - code to restore registers
 - the instructions from the optimized region
 - a jump back to the original execution path.
 
-1.4.4 Pre-optimization
+Pre-optimization
+^^^^^^^^^^^^^^^^
 
 After preparing the detour buffer, Kprobes verifies that none of the
 following situations exist:
+
 - The probe has either a break_handler (i.e., it's a jprobe) or a
-post_handler.
+  post_handler.
 - Other instructions in the optimized region are probed.
 - The probe is disabled.
+
 In any of the above cases, Kprobes won't start optimizing the probe.
 Since these are temporary situations, Kprobes tries to start
 optimizing it again if the situation is changed.
@@ -240,21 +259,23 @@ Kprobes returns control to the original instruction path by setting
 the CPU's instruction pointer to the copied code in the detour buffer
 -- thus at least avoiding the single-step.
 
-1.4.5 Optimization
+Optimization
+^^^^^^^^^^^^
 
 The Kprobe-optimizer doesn't insert the jump instruction immediately;
 rather, it calls synchronize_sched() for safety first, because it's
 possible for a CPU to be interrupted in the middle of executing the
-optimized region(*).  As you know, synchronize_sched() can ensure
+optimized region [3]_.  As you know, synchronize_sched() can ensure
 that all interruptions that were active when synchronize_sched()
 was called are done, but only if CONFIG_PREEMPT=n.  So, this version
-of kprobe optimization supports only kernels with CONFIG_PREEMPT=n.(**)
+of kprobe optimization supports only kernels with CONFIG_PREEMPT=n [4]_.
 
 After that, the Kprobe-optimizer calls stop_machine() to replace
 the optimized region with a jump instruction to the detour buffer,
 using text_poke_smp().
 
-1.4.6 Unoptimization
+Unoptimization
+^^^^^^^^^^^^^^
 
 When an optimized kprobe is unregistered, disabled, or blocked by
 another kprobe, it will be unoptimized.  If this happens before
@@ -263,15 +284,15 @@ optimized list.  If the optimization has been done, the jump is
 replaced with the original code (except for an int3 breakpoint in
 the first byte) by using text_poke_smp().
 
-(*)Please imagine that the 2nd instruction is interrupted and then
-the optimizer replaces the 2nd instruction with the jump *address*
-while the interrupt handler is running. When the interrupt
-returns to original address, there is no valid instruction,
-and it causes an unexpected result.
+.. [3] Please imagine that the 2nd instruction is interrupted and then
+   the optimizer replaces the 2nd instruction with the jump *address*
+   while the interrupt handler is running. When the interrupt
+   returns to original address, there is no valid instruction,
+   and it causes an unexpected result.
 
-(**)This optimization-safety checking may be replaced with the
-stop-machine method that ksplice uses for supporting a CONFIG_PREEMPT=y
-kernel.
+.. [4] This optimization-safety checking may be replaced with the
+   stop-machine method that ksplice uses for supporting a CONFIG_PREEMPT=y
+   kernel.
 
 NOTE for geeks:
 The jump optimization changes the kprobe's pre_handler behavior.
@@ -280,11 +301,17 @@ path by changing regs->ip and returning 1.  However, when the probe
 is optimized, that modification is ignored.  Thus, if you want to
 tweak the kernel's execution path, you need to suppress optimization,
 using one of the following techniques:
+
 - Specify an empty function for the kprobe's post_handler or break_handler.
- or
+
+or
+
 - Execute 'sysctl -w debug.kprobes_optimization=n'
 
-1.5 Blacklist
+.. _kprobes_blacklist:
+
+Blacklist
+---------
 
 Kprobes can probe most of the kernel except itself. This means
 that there are some functions where kprobes cannot probe. Probing
@@ -297,7 +324,8 @@ to specify a blacklisted function.
 Kprobes checks the given probe address against the blacklist and
 rejects registering it, if the given address is in the blacklist.
 
-2. Architectures Supported
+Architectures Supported
+=======================
 
 Kprobes, jprobes, and return probes are implemented on the following
 architectures:
@@ -312,7 +340,8 @@ architectures:
 - mips
 - s390
 
-3. Configuring Kprobes
+Configuring Kprobes
+===================
 
 When configuring the kernel using make menuconfig/xconfig/oldconfig,
 ensure that CONFIG_KPROBES is set to "y". Under "General setup", look
@@ -331,7 +360,8 @@ it useful to "Compile the kernel with debug info" (CONFIG_DEBUG_INFO),
 so you can use "objdump -d -l vmlinux" to see the source-to-object
 code mapping.
 
-4. API Reference
+API Reference
+=============
 
 The Kprobes API includes a "register" function and an "unregister"
 function for each type of probe. The API also includes "register_*probes"
@@ -340,10 +370,13 @@ Here are terse, mini-man-page specifications for these functions and
 the associated probe handlers that you'll write. See the files in the
 samples/kprobes/ sub-directory for examples.
 
-4.1 register_kprobe
+register_kprobe
+---------------
 
-#include <linux/kprobes.h>
-int register_kprobe(struct kprobe *kp);
+::
+
+	#include <linux/kprobes.h>
+	int register_kprobe(struct kprobe *kp);
 
 Sets a breakpoint at the address kp->addr.  When the breakpoint is
 hit, Kprobes calls kp->pre_handler.  After the probed instruction
@@ -354,61 +387,68 @@ kp->fault_handler.  Any or all handlers can be NULL. If kp->flags
 is set KPROBE_FLAG_DISABLED, that kp will be registered but disabled,
 so, its handlers aren't hit until calling enable_kprobe(kp).
 
-NOTE:
-1. With the introduction of the "symbol_name" field to struct kprobe,
-the probepoint address resolution will now be taken care of by the kernel.
-The following will now work:
+.. note::
+
+   1. With the introduction of the "symbol_name" field to struct kprobe,
+      the probepoint address resolution will now be taken care of by the kernel.
+      The following will now work::
 
 	kp.symbol_name = "symbol_name";
 
-(64-bit powerpc intricacies such as function descriptors are handled
-transparently)
+      (64-bit powerpc intricacies such as function descriptors are handled
+      transparently)
 
-2. Use the "offset" field of struct kprobe if the offset into the symbol
-to install a probepoint is known. This field is used to calculate the
-probepoint.
+   2. Use the "offset" field of struct kprobe if the offset into the symbol
+      to install a probepoint is known. This field is used to calculate the
+      probepoint.
 
-3. Specify either the kprobe "symbol_name" OR the "addr". If both are
-specified, kprobe registration will fail with -EINVAL.
+   3. Specify either the kprobe "symbol_name" OR the "addr". If both are
+      specified, kprobe registration will fail with -EINVAL.
 
-4. With CISC architectures (such as i386 and x86_64), the kprobes code
-does not validate if the kprobe.addr is at an instruction boundary.
-Use "offset" with caution.
+   4. With CISC architectures (such as i386 and x86_64), the kprobes code
+      does not validate if the kprobe.addr is at an instruction boundary.
+      Use "offset" with caution.
 
 register_kprobe() returns 0 on success, or a negative errno otherwise.
 
-User's pre-handler (kp->pre_handler):
-#include <linux/kprobes.h>
-#include <linux/ptrace.h>
-int pre_handler(struct kprobe *p, struct pt_regs *regs);
+User's pre-handler (kp->pre_handler)::
+
+	#include <linux/kprobes.h>
+	#include <linux/ptrace.h>
+	int pre_handler(struct kprobe *p, struct pt_regs *regs);
 
 Called with p pointing to the kprobe associated with the breakpoint,
 and regs pointing to the struct containing the registers saved when
 the breakpoint was hit.  Return 0 here unless you're a Kprobes geek.
 
-User's post-handler (kp->post_handler):
-#include <linux/kprobes.h>
-#include <linux/ptrace.h>
-void post_handler(struct kprobe *p, struct pt_regs *regs,
-	unsigned long flags);
+User's post-handler (kp->post_handler)::
+
+	#include <linux/kprobes.h>
+	#include <linux/ptrace.h>
+	void post_handler(struct kprobe *p, struct pt_regs *regs,
+			  unsigned long flags);
 
 p and regs are as described for the pre_handler.  flags always seems
 to be zero.
 
-User's fault-handler (kp->fault_handler):
-#include <linux/kprobes.h>
-#include <linux/ptrace.h>
-int fault_handler(struct kprobe *p, struct pt_regs *regs, int trapnr);
+User's fault-handler (kp->fault_handler)::
+
+	#include <linux/kprobes.h>
+	#include <linux/ptrace.h>
+	int fault_handler(struct kprobe *p, struct pt_regs *regs, int trapnr);
 
 p and regs are as described for the pre_handler.  trapnr is the
 architecture-specific trap number associated with the fault (e.g.,
 on i386, 13 for a general protection fault or 14 for a page fault).
 Returns 1 if it successfully handled the exception.
 
-4.2 register_jprobe
+register_jprobe
+---------------
 
-#include <linux/kprobes.h>
-int register_jprobe(struct jprobe *jp)
+::
+
+	#include <linux/kprobes.h>
+	int register_jprobe(struct jprobe *jp)
 
 Sets a breakpoint at the address jp->kp.addr, which must be the address
 of the first instruction of a function.  When the breakpoint is hit,
@@ -423,10 +463,13 @@ declaration must match.
 
 register_jprobe() returns 0 on success, or a negative errno otherwise.
 
-4.3 register_kretprobe
+register_kretprobe
+------------------
 
-#include <linux/kprobes.h>
-int register_kretprobe(struct kretprobe *rp);
+::
+
+	#include <linux/kprobes.h>
+	int register_kretprobe(struct kretprobe *rp);
 
 Establishes a return probe for the function whose address is
 rp->kp.addr.  When that function returns, Kprobes calls rp->handler.
@@ -436,14 +479,17 @@ register_kretprobe(); see "How Does a Return Probe Work?" for details.
 register_kretprobe() returns 0 on success, or a negative errno
 otherwise.
 
-User's return-probe handler (rp->handler):
-#include <linux/kprobes.h>
-#include <linux/ptrace.h>
-int kretprobe_handler(struct kretprobe_instance *ri, struct pt_regs *regs);
+User's return-probe handler (rp->handler)::
+
+	#include <linux/kprobes.h>
+	#include <linux/ptrace.h>
+	int kretprobe_handler(struct kretprobe_instance *ri,
+			      struct pt_regs *regs);
 
 regs is as described for kprobe.pre_handler.  ri points to the
 kretprobe_instance object, of which the following fields may be
 of interest:
+
 - ret_addr: the return address
 - rp: points to the corresponding kretprobe object
 - task: points to the corresponding task struct
@@ -456,74 +502,94 @@ the architecture's ABI.
 
 The handler's return value is currently ignored.
 
-4.4 unregister_*probe
+unregister_*probe
+------------------
 
-#include <linux/kprobes.h>
-void unregister_kprobe(struct kprobe *kp);
-void unregister_jprobe(struct jprobe *jp);
-void unregister_kretprobe(struct kretprobe *rp);
+::
+
+	#include <linux/kprobes.h>
+	void unregister_kprobe(struct kprobe *kp);
+	void unregister_jprobe(struct jprobe *jp);
+	void unregister_kretprobe(struct kretprobe *rp);
 
 Removes the specified probe.  The unregister function can be called
 at any time after the probe has been registered.
 
-NOTE:
-If the functions find an incorrect probe (ex. an unregistered probe),
-they clear the addr field of the probe.
+.. note::
 
-4.5 register_*probes
+   If the functions find an incorrect probe (ex. an unregistered probe),
+   they clear the addr field of the probe.
 
-#include <linux/kprobes.h>
-int register_kprobes(struct kprobe **kps, int num);
-int register_kretprobes(struct kretprobe **rps, int num);
-int register_jprobes(struct jprobe **jps, int num);
+register_*probes
+----------------
+
+::
+
+	#include <linux/kprobes.h>
+	int register_kprobes(struct kprobe **kps, int num);
+	int register_kretprobes(struct kretprobe **rps, int num);
+	int register_jprobes(struct jprobe **jps, int num);
 
 Registers each of the num probes in the specified array.  If any
 error occurs during registration, all probes in the array, up to
 the bad probe, are safely unregistered before the register_*probes
 function returns.
-- kps/rps/jps: an array of pointers to *probe data structures
+
+- kps/rps/jps: an array of pointers to ``*probe`` data structures
 - num: the number of the array entries.
 
-NOTE:
-You have to allocate(or define) an array of pointers and set all
-of the array entries before using these functions.
+.. note::
 
-4.6 unregister_*probes
+   You have to allocate(or define) an array of pointers and set all
+   of the array entries before using these functions.
 
-#include <linux/kprobes.h>
-void unregister_kprobes(struct kprobe **kps, int num);
-void unregister_kretprobes(struct kretprobe **rps, int num);
-void unregister_jprobes(struct jprobe **jps, int num);
+unregister_*probes
+------------------
+
+::
+
+	#include <linux/kprobes.h>
+	void unregister_kprobes(struct kprobe **kps, int num);
+	void unregister_kretprobes(struct kretprobe **rps, int num);
+	void unregister_jprobes(struct jprobe **jps, int num);
 
 Removes each of the num probes in the specified array at once.
 
-NOTE:
-If the functions find some incorrect probes (ex. unregistered
-probes) in the specified array, they clear the addr field of those
-incorrect probes. However, other probes in the array are
-unregistered correctly.
+.. note::
 
-4.7 disable_*probe
+   If the functions find some incorrect probes (ex. unregistered
+   probes) in the specified array, they clear the addr field of those
+   incorrect probes. However, other probes in the array are
+   unregistered correctly.
 
-#include <linux/kprobes.h>
-int disable_kprobe(struct kprobe *kp);
-int disable_kretprobe(struct kretprobe *rp);
-int disable_jprobe(struct jprobe *jp);
+disable_*probe
+--------------
 
-Temporarily disables the specified *probe. You can enable it again by using
+::
+
+	#include <linux/kprobes.h>
+	int disable_kprobe(struct kprobe *kp);
+	int disable_kretprobe(struct kretprobe *rp);
+	int disable_jprobe(struct jprobe *jp);
+
+Temporarily disables the specified ``*probe``. You can enable it again by using
 enable_*probe(). You must specify the probe which has been registered.
 
-4.8 enable_*probe
+enable_*probe
+-------------
 
-#include <linux/kprobes.h>
-int enable_kprobe(struct kprobe *kp);
-int enable_kretprobe(struct kretprobe *rp);
-int enable_jprobe(struct jprobe *jp);
+::
 
-Enables *probe which has been disabled by disable_*probe(). You must specify
+	#include <linux/kprobes.h>
+	int enable_kprobe(struct kprobe *kp);
+	int enable_kretprobe(struct kretprobe *rp);
+	int enable_jprobe(struct jprobe *jp);
+
+Enables ``*probe`` which has been disabled by disable_*probe(). You must specify
 the probe which has been registered.
 
-5. Kprobes Features and Limitations
+Kprobes Features and Limitations
+================================
 
 Kprobes allows multiple probes at the same address.  Currently,
 however, there cannot be multiple jprobes on the same function at
@@ -538,7 +604,7 @@ are discussed in this section.
 
 The register_*probe functions will return -EINVAL if you attempt
 to install a probe in the code that implements Kprobes (mostly
-kernel/kprobes.c and arch/*/kernel/kprobes.c, but also functions such
+kernel/kprobes.c and ``arch/*/kernel/kprobes.c``, but also functions such
 as do_page_fault and notifier_call_chain).
 
 If you install a probe in an inline-able function, Kprobes makes
@@ -602,19 +668,21 @@ explain it, we introduce some terminology. Imagine a 3-instruction
 sequence consisting of a two 2-byte instructions and one 3-byte
 instruction.
 
-        IA
-         |
-[-2][-1][0][1][2][3][4][5][6][7]
-        [ins1][ins2][  ins3 ]
-	[<-     DCR       ->]
-	   [<- JTPR ->]
+::
 
-ins1: 1st Instruction
-ins2: 2nd Instruction
-ins3: 3rd Instruction
-IA:  Insertion Address
-JTPR: Jump Target Prohibition Region
-DCR: Detoured Code Region
+		IA
+		|
+	[-2][-1][0][1][2][3][4][5][6][7]
+		[ins1][ins2][  ins3 ]
+		[<-     DCR       ->]
+		[<- JTPR ->]
+
+	ins1: 1st Instruction
+	ins2: 2nd Instruction
+	ins3: 3rd Instruction
+	IA:  Insertion Address
+	JTPR: Jump Target Prohibition Region
+	DCR: Detoured Code Region
 
 The instructions in DCR are copied to the out-of-line buffer
 of the kprobe, because the bytes in DCR are replaced by
@@ -628,7 +696,8 @@ d) DCR must not straddle the border between functions.
 Anyway, these limitations are checked by the in-kernel instruction
 decoder, so you don't need to worry about that.
 
-6. Probe Overhead
+Probe Overhead
+==============
 
 On a typical CPU in use in 2005, a kprobe hit takes 0.5 to 1.0
 microseconds to process.  Specifically, a benchmark that hits the same
@@ -638,70 +707,80 @@ return-probe hit typically takes 50-75% longer than a kprobe hit.
 When you have a return probe set on a function, adding a kprobe at
 the entry to that function adds essentially no overhead.
 
-Here are sample overhead figures (in usec) for different architectures.
-k = kprobe; j = jprobe; r = return probe; kr = kprobe + return probe
-on same function; jr = jprobe + return probe on same function
+Here are sample overhead figures (in usec) for different architectures::
 
-i386: Intel Pentium M, 1495 MHz, 2957.31 bogomips
-k = 0.57 usec; j = 1.00; r = 0.92; kr = 0.99; jr = 1.40
+  k = kprobe; j = jprobe; r = return probe; kr = kprobe + return probe
+  on same function; jr = jprobe + return probe on same function::
 
-x86_64: AMD Opteron 246, 1994 MHz, 3971.48 bogomips
-k = 0.49 usec; j = 0.76; r = 0.80; kr = 0.82; jr = 1.07
+  i386: Intel Pentium M, 1495 MHz, 2957.31 bogomips
+  k = 0.57 usec; j = 1.00; r = 0.92; kr = 0.99; jr = 1.40
 
-ppc64: POWER5 (gr), 1656 MHz (SMT disabled, 1 virtual CPU per physical CPU)
-k = 0.77 usec; j = 1.31; r = 1.26; kr = 1.45; jr = 1.99
+  x86_64: AMD Opteron 246, 1994 MHz, 3971.48 bogomips
+  k = 0.49 usec; j = 0.76; r = 0.80; kr = 0.82; jr = 1.07
 
-6.1 Optimized Probe Overhead
+  ppc64: POWER5 (gr), 1656 MHz (SMT disabled, 1 virtual CPU per physical CPU)
+  k = 0.77 usec; j = 1.31; r = 1.26; kr = 1.45; jr = 1.99
+
+Optimized Probe Overhead
+------------------------
 
 Typically, an optimized kprobe hit takes 0.07 to 0.1 microseconds to
-process. Here are sample overhead figures (in usec) for x86 architectures.
-k = unoptimized kprobe, b = boosted (single-step skipped), o = optimized kprobe,
-r = unoptimized kretprobe, rb = boosted kretprobe, ro = optimized kretprobe.
+process. Here are sample overhead figures (in usec) for x86 architectures::
 
-i386: Intel(R) Xeon(R) E5410, 2.33GHz, 4656.90 bogomips
-k = 0.80 usec; b = 0.33; o = 0.05; r = 1.10; rb = 0.61; ro = 0.33
+  k = unoptimized kprobe, b = boosted (single-step skipped), o = optimized kprobe,
+  r = unoptimized kretprobe, rb = boosted kretprobe, ro = optimized kretprobe.
 
-x86-64: Intel(R) Xeon(R) E5410, 2.33GHz, 4656.90 bogomips
-k = 0.99 usec; b = 0.43; o = 0.06; r = 1.24; rb = 0.68; ro = 0.30
+  i386: Intel(R) Xeon(R) E5410, 2.33GHz, 4656.90 bogomips
+  k = 0.80 usec; b = 0.33; o = 0.05; r = 1.10; rb = 0.61; ro = 0.33
 
-7. TODO
+  x86-64: Intel(R) Xeon(R) E5410, 2.33GHz, 4656.90 bogomips
+  k = 0.99 usec; b = 0.43; o = 0.06; r = 1.24; rb = 0.68; ro = 0.30
+
+TODO
+====
 
 a. SystemTap (http://sourceware.org/systemtap): Provides a simplified
-programming interface for probe-based instrumentation.  Try it out.
+   programming interface for probe-based instrumentation.  Try it out.
 b. Kernel return probes for sparc64.
 c. Support for other architectures.
 d. User-space probes.
 e. Watchpoint probes (which fire on data references).
 
-8. Kprobes Example
+Kprobes Example
+===============
 
 See samples/kprobes/kprobe_example.c
 
-9. Jprobes Example
+Jprobes Example
+===============
 
 See samples/kprobes/jprobe_example.c
 
-10. Kretprobes Example
+Kretprobes Example
+==================
 
 See samples/kprobes/kretprobe_example.c
 
 For additional information on Kprobes, refer to the following URLs:
-http://www-106.ibm.com/developerworks/library/l-kprobes.html?ca=dgr-lnxw42Kprobe
-http://www.redhat.com/magazine/005mar05/features/kprobes/
-http://www-users.cs.umn.edu/~boutcher/kprobes/
-http://www.linuxsymposium.org/2006/linuxsymposium_procv2.pdf (pages 101-115)
 
+- http://www-106.ibm.com/developerworks/library/l-kprobes.html?ca=dgr-lnxw42Kprobe
+- http://www.redhat.com/magazine/005mar05/features/kprobes/
+- http://www-users.cs.umn.edu/~boutcher/kprobes/
+- http://www.linuxsymposium.org/2006/linuxsymposium_procv2.pdf (pages 101-115)
+
+
+The kprobes debugfs interface
+=============================
 
-Appendix A: The kprobes debugfs interface
 
 With recent kernels (> 2.6.20) the list of registered kprobes is visible
 under the /sys/kernel/debug/kprobes/ directory (assuming debugfs is mounted at //sys/kernel/debug).
 
-/sys/kernel/debug/kprobes/list: Lists all registered probes on the system
+/sys/kernel/debug/kprobes/list: Lists all registered probes on the system::
 
-c015d71a  k  vfs_read+0x0
-c011a316  j  do_fork+0x0
-c03dedc5  r  tcp_v4_rcv+0x0
+	c015d71a  k  vfs_read+0x0
+	c011a316  j  do_fork+0x0
+	c03dedc5  r  tcp_v4_rcv+0x0
 
 The first column provides the kernel address where the probe is inserted.
 The second column identifies the type of probe (k - kprobe, r - kretprobe
@@ -725,7 +804,8 @@ change each probe's disabling state. This means that disabled kprobes (marked
 [DISABLED]) will be not enabled if you turn ON all kprobes by this knob.
 
 
-Appendix B: The kprobes sysctl interface
+The kprobes sysctl interface
+============================
 
 /proc/sys/debug/kprobes-optimization: Turn kprobes optimization ON/OFF.
 
-- 
2.9.4
