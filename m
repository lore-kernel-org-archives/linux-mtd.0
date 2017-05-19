Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWey-0005ge-3g
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:25:01 +0000
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
Subject: [PATCH 18/30] memory-barriers.txt: standardize document format
Date: Thu, 18 May 2017 22:24:10 -0300
Message-Id: <8f30277e9dcf70b8eec99bdedbaafe9434fd5ca8.1495156975.git.mchehab@s-opensource.com>
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

- use (#) instead of (*) as the latter is not recognized.
  As a bonus, using (#) will make it to auto-number paragraphs
  on PDF/LaTeX and HTML outputs;
- use the ReST markup for auto-numbered footnotes;
- comment the internal CONTENTS table;
- use "::" instead of ":" in order to mark literal blocks and
  ascii artwork;
- use the ReST markups for a table;
- use "-" for some bulleted lists that aren't marked;
- Use :Author: for authorship;
- Don't use capital leters on titles.

NOTE:

Trying to build this file with Sphinx will produce
some warnings:
	Documentation/memory-barriers.rst:192: WARNING: Inline emphasis start-string without end-string.

That's because, on several places, it use asterisks like "*Q"
to identify variables.

As asterisks are used for emphasis, it expects an end
asterisk to put everything between them in italics.

In order to avoid it, either one of the notation below
is needed:
	- \*Q
	- "*Q"
	- ``*Q``

The first notation can be confusing for the ones reading the
file in its ascii format. So, I don't think it is a good
idea to use it.

The other two notations would be OK. ``*Q`` gives the
additional bonus of using a different font for html/pdf
output.

For now, as we're just standardizing the document
notation, let's not touch it, but we should later
revisit this, when moving this file to one of the Kernel
books.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/memory-barriers.txt | 660 +++++++++++++++++++-------------------
 1 file changed, 329 insertions(+), 331 deletions(-)

diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
index 732f10ea382e..f37b418b3022 100644
--- a/Documentation/memory-barriers.txt
+++ b/Documentation/memory-barriers.txt
@@ -1,14 +1,13 @@
-			 ============================
-			 LINUX KERNEL MEMORY BARRIERS
-			 ============================
+============================
+Linux kernel memory barriers
+============================
 
-By: David Howells <dhowells@redhat.com>
-    Paul E. McKenney <paulmck@linux.vnet.ibm.com>
-    Will Deacon <will.deacon@arm.com>
-    Peter Zijlstra <peterz@infradead.org>
+:Author: David Howells <dhowells@redhat.com>
+:Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
+:Author: Will Deacon <will.deacon@arm.com>
+:Author: Peter Zijlstra <peterz@infradead.org>
 
-==========
-DISCLAIMER
+Disclaimer
 ==========
 
 This document is not a specification; it is intentionally (for the sake of
@@ -35,16 +34,14 @@ architecture because the way that arch works renders an explicit barrier
 unnecessary in that case.
 
 
-========
-CONTENTS
-========
+.. CONTENTS
 
- (*) Abstract memory access model.
+ (#) Abstract memory access model.
 
      - Device operations.
      - Guarantees.
 
- (*) What are memory barriers?
+ (#) What are memory barriers?
 
      - Varieties of memory barrier.
      - What may not be assumed about memory barriers?
@@ -55,58 +52,57 @@ CONTENTS
      - Read memory barriers vs load speculation.
      - Transitivity
 
- (*) Explicit kernel barriers.
+ (#) Explicit kernel barriers.
 
      - Compiler barrier.
      - CPU memory barriers.
      - MMIO write barrier.
 
- (*) Implicit kernel memory barriers.
+ (#) Implicit kernel memory barriers.
 
      - Lock acquisition functions.
      - Interrupt disabling functions.
      - Sleep and wake-up functions.
      - Miscellaneous functions.
 
- (*) Inter-CPU acquiring barrier effects.
+ (#) Inter-CPU acquiring barrier effects.
 
      - Acquires vs memory accesses.
      - Acquires vs I/O accesses.
 
- (*) Where are memory barriers needed?
+ (#) Where are memory barriers needed?
 
      - Interprocessor interaction.
      - Atomic operations.
      - Accessing devices.
      - Interrupts.
 
- (*) Kernel I/O barrier effects.
+ (#) Kernel I/O barrier effects.
 
- (*) Assumed minimum execution ordering model.
+ (#) Assumed minimum execution ordering model.
 
- (*) The effects of the cpu cache.
+ (#) The effects of the cpu cache.
 
      - Cache coherency.
      - Cache coherency vs DMA.
      - Cache coherency vs MMIO.
 
- (*) The things CPUs get up to.
+ (#) The things CPUs get up to.
 
      - And then there's the Alpha.
      - Virtual Machine Guests.
 
- (*) Example uses.
+ (#) Example uses.
 
      - Circular buffers.
 
- (*) References.
+ (#) References.
 
 
-============================
-ABSTRACT MEMORY ACCESS MODEL
+Abstract memory access model
 ============================
 
-Consider the following abstract model of the system:
+Consider the following abstract model of the system::
 
 		            :                :
 		            :                :
@@ -143,7 +139,7 @@ CPU are perceived by the rest of the system as the operations cross the
 interface between the CPU and rest of the system (the dotted lines).
 
 
-For example, consider the following sequence of events:
+For example, consider the following sequence of events::
 
 	CPU 1		CPU 2
 	===============	===============
@@ -152,7 +148,7 @@ For example, consider the following sequence of events:
 	B = 4;		y = A;
 
 The set of accesses as seen by the memory system in the middle can be arranged
-in 24 different combinations:
+in 24 different combinations::
 
 	STORE A=3,	STORE B=4,	y=LOAD A->3,	x=LOAD B->4
 	STORE A=3,	STORE B=4,	x=LOAD B->4,	y=LOAD A->3
@@ -164,7 +160,7 @@ in 24 different combinations:
 	STORE B=4, ...
 	...
 
-and can thus result in four different combinations of values:
+and can thus result in four different combinations of values::
 
 	x == 2, y == 1
 	x == 2, y == 3
@@ -177,7 +173,7 @@ perceived by the loads made by another CPU in the same order as the stores were
 committed.
 
 
-As a further example, consider this sequence of events:
+As a further example, consider this sequence of events::
 
 	CPU 1		CPU 2
 	===============	===============
@@ -187,7 +183,7 @@ As a further example, consider this sequence of events:
 
 There is an obvious data dependency here, as the value loaded into D depends on
 the address retrieved from P by CPU 2.  At the end of the sequence, any of the
-following results are possible:
+following results are possible::
 
 	(Q == &A) and (D == 1)
 	(Q == &B) and (D == 2)
@@ -197,7 +193,7 @@ Note that CPU 2 will never try and load C into D because the CPU will load P
 into Q before issuing the load of *Q.
 
 
-DEVICE OPERATIONS
+Device operations
 -----------------
 
 Some devices present their control interfaces as collections of memory
@@ -205,12 +201,12 @@ locations, but the order in which the control registers are accessed is very
 important.  For instance, imagine an ethernet card with a set of internal
 registers that are accessed through an address port register (A) and a data
 port register (D).  To read internal register 5, the following code might then
-be used:
+be used::
 
 	*A = 5;
 	x = *D;
 
-but this might show up as either of the following two sequences:
+but this might show up as either of the following two sequences::
 
 	STORE *A = 5, x = LOAD *D
 	x = LOAD *D, STORE *A = 5
@@ -219,17 +215,17 @@ the second of which will almost certainly result in a malfunction, since it set
 the address _after_ attempting to read the register.
 
 
-GUARANTEES
+Guarantees
 ----------
 
 There are some minimal guarantees that may be expected of a CPU:
 
- (*) On any given CPU, dependent memory accesses will be issued in order, with
-     respect to itself.  This means that for:
+ (#) On any given CPU, dependent memory accesses will be issued in order, with
+     respect to itself.  This means that for::
 
 	Q = READ_ONCE(P); smp_read_barrier_depends(); D = READ_ONCE(*Q);
 
-     the CPU will issue the following memory operations:
+     the CPU will issue the following memory operations::
 
 	Q = LOAD P, D = LOAD *Q
 
@@ -239,20 +235,20 @@ There are some minimal guarantees that may be expected of a CPU:
      should normally use something like rcu_dereference() instead of
      open-coding smp_read_barrier_depends().
 
- (*) Overlapping loads and stores within a particular CPU will appear to be
-     ordered within that CPU.  This means that for:
+ (#) Overlapping loads and stores within a particular CPU will appear to be
+     ordered within that CPU.  This means that for::
 
 	a = READ_ONCE(*X); WRITE_ONCE(*X, b);
 
-     the CPU will only issue the following sequence of memory operations:
+     the CPU will only issue the following sequence of memory operations::
 
 	a = LOAD *X, STORE *X = b
 
-     And for:
+     And for::
 
 	WRITE_ONCE(*X, c); d = READ_ONCE(*X);
 
-     the CPU will only issue:
+     the CPU will only issue::
 
 	STORE *X = c, d = LOAD *X
 
@@ -261,18 +257,18 @@ There are some minimal guarantees that may be expected of a CPU:
 
 And there are a number of things that _must_ or _must_not_ be assumed:
 
- (*) It _must_not_ be assumed that the compiler will do what you want
+ (#) It _must_not_ be assumed that the compiler will do what you want
      with memory references that are not protected by READ_ONCE() and
      WRITE_ONCE().  Without them, the compiler is within its rights to
      do all sorts of "creative" transformations, which are covered in
      the COMPILER BARRIER section.
 
- (*) It _must_not_ be assumed that independent loads and stores will be issued
-     in the order given.  This means that for:
+ (#) It _must_not_ be assumed that independent loads and stores will be issued
+     in the order given.  This means that for::
 
 	X = *A; Y = *B; *D = Z;
 
-     we may get any of the following sequences:
+     we may get any of the following sequences::
 
 	X = LOAD *A,  Y = LOAD *B,  STORE *D = Z
 	X = LOAD *A,  STORE *D = Z, Y = LOAD *B
@@ -281,22 +277,22 @@ And there are a number of things that _must_ or _must_not_ be assumed:
 	STORE *D = Z, X = LOAD *A,  Y = LOAD *B
 	STORE *D = Z, Y = LOAD *B,  X = LOAD *A
 
- (*) It _must_ be assumed that overlapping memory accesses may be merged or
-     discarded.  This means that for:
+ (#) It _must_ be assumed that overlapping memory accesses may be merged or
+     discarded.  This means that for::
 
 	X = *A; Y = *(A + 4);
 
-     we may get any one of the following sequences:
+     we may get any one of the following sequences::
 
 	X = LOAD *A; Y = LOAD *(A + 4);
 	Y = LOAD *(A + 4); X = LOAD *A;
 	{X, Y} = LOAD {*A, *(A + 4) };
 
-     And for:
+     And for::
 
 	*A = X; *(A + 4) = Y;
 
-     we may get any of:
+     we may get any of::
 
 	STORE *A = X; STORE *(A + 4) = Y;
 	STORE *(A + 4) = Y; STORE *A = X;
@@ -304,18 +300,18 @@ And there are a number of things that _must_ or _must_not_ be assumed:
 
 And there are anti-guarantees:
 
- (*) These guarantees do not apply to bitfields, because compilers often
+ (#) These guarantees do not apply to bitfields, because compilers often
      generate code to modify these using non-atomic read-modify-write
      sequences.  Do not attempt to use bitfields to synchronize parallel
      algorithms.
 
- (*) Even in cases where bitfields are protected by locks, all fields
+ (#) Even in cases where bitfields are protected by locks, all fields
      in a given bitfield must be protected by one lock.  If two fields
      in a given bitfield are protected by different locks, the compiler's
      non-atomic read-modify-write sequences can cause an update to one
      field to corrupt the value of an adjacent field.
 
- (*) These guarantees apply only to properly aligned and sized scalar
+ (#) These guarantees apply only to properly aligned and sized scalar
      variables.  "Properly sized" currently means variables that are
      the same size as "char", "short", "int" and "long".  "Properly
      aligned" means the natural alignment, thus no constraints for
@@ -347,8 +343,7 @@ And there are anti-guarantees:
 		sizes of those intervening bit-fields happen to be.
 
 
-=========================
-WHAT ARE MEMORY BARRIERS?
+What are memory barriers?
 =========================
 
 As can be seen above, independent memory operations are effectively performed
@@ -366,8 +361,7 @@ branch prediction and various types of caching.  Memory barriers are used to
 override or suppress these tricks, allowing the code to sanely control the
 interaction of multiple CPUs and/or devices.
 
-
-VARIETIES OF MEMORY BARRIER
+Varieties of memory barrier
 ---------------------------
 
 Memory barriers come in four basic varieties:
@@ -515,36 +509,36 @@ more substantial guarantees, but they may _not_ be relied upon outside of arch
 specific code.
 
 
-WHAT MAY NOT BE ASSUMED ABOUT MEMORY BARRIERS?
+What may not be assumed about memory barriers?
 ----------------------------------------------
 
 There are certain things that the Linux kernel memory barriers do not guarantee:
 
- (*) There is no guarantee that any of the memory accesses specified before a
+ (#) There is no guarantee that any of the memory accesses specified before a
      memory barrier will be _complete_ by the completion of a memory barrier
      instruction; the barrier can be considered to draw a line in that CPU's
      access queue that accesses of the appropriate type may not cross.
 
- (*) There is no guarantee that issuing a memory barrier on one CPU will have
+ (#) There is no guarantee that issuing a memory barrier on one CPU will have
      any direct effect on another CPU or any other hardware in the system.  The
      indirect effect will be the order in which the second CPU sees the effects
      of the first CPU's accesses occur, but see the next point:
 
- (*) There is no guarantee that a CPU will see the correct order of effects
+ (#) There is no guarantee that a CPU will see the correct order of effects
      from a second CPU's accesses, even _if_ the second CPU uses a memory
      barrier, unless the first CPU _also_ uses a matching memory barrier (see
      the subsection on "SMP Barrier Pairing").
 
- (*) There is no guarantee that some intervening piece of off-the-CPU
-     hardware[*] will not reorder the memory accesses.  CPU cache coherency
+ (#) There is no guarantee that some intervening piece of off-the-CPU
+     hardware [1]_ will not reorder the memory accesses.  CPU cache coherency
      mechanisms should propagate the indirect effects of a memory barrier
      between CPUs, but might not do so in order.
 
-	[*] For information on bus mastering DMA and coherency please read:
+	.. [1] For information on bus mastering DMA and coherency please read:
 
-	    Documentation/PCI/pci.txt
-	    Documentation/DMA-API-HOWTO.txt
-	    Documentation/DMA-API.txt
+	   - Documentation/PCI/pci.txt
+	   - Documentation/DMA-API-HOWTO.txt
+	   - Documentation/DMA-API.txt
 
 
 DATA DEPENDENCY BARRIERS
@@ -552,7 +546,7 @@ DATA DEPENDENCY BARRIERS
 
 The usage requirements of data dependency barriers are a little subtle, and
 it's not always obvious that they're needed.  To illustrate, consider the
-following sequence of events:
+following sequence of events::
 
 	CPU 1		      CPU 2
 	===============	      ===============
@@ -564,13 +558,13 @@ following sequence of events:
 			      D = *Q;
 
 There's a clear data dependency here, and it would seem that by the end of the
-sequence, Q must be either &A or &B, and that:
+sequence, Q must be either &A or &B, and that::
 
 	(Q == &A) implies (D == 1)
 	(Q == &B) implies (D == 4)
 
 But!  CPU 2's perception of P may be updated _before_ its perception of B, thus
-leading to the following situation:
+leading to the following situation::
 
 	(Q == &B) and (D == 2) ????
 
@@ -579,7 +573,7 @@ isn't, and this behaviour can be observed on certain real CPUs (such as the DEC
 Alpha).
 
 To deal with this, a data dependency barrier or better must be inserted
-between the address load and the data load:
+between the address load and the data load::
 
 	CPU 1		      CPU 2
 	===============	      ===============
@@ -594,7 +588,7 @@ between the address load and the data load:
 This enforces the occurrence of one of the two implications, and prevents the
 third possibility from arising.
 
-A data-dependency barrier must also order against dependent writes:
+A data-dependency barrier must also order against dependent writes::
 
 	CPU 1		      CPU 2
 	===============	      ===============
@@ -607,7 +601,7 @@ A data-dependency barrier must also order against dependent writes:
 			      *Q = 5;
 
 The data-dependency barrier must order the read into Q with the store
-into *Q.  This prohibits this outcome:
+into *Q.  This prohibits this outcome::
 
 	(Q == &B) && (B == 4)
 
@@ -637,7 +631,7 @@ target appearing to be incompletely initialised.
 See also the subsection on "Cache Coherency" for a more thorough example.
 
 
-CONTROL DEPENDENCIES
+Control dependencies
 --------------------
 
 Control dependencies can be a bit tricky because current compilers do
@@ -646,7 +640,7 @@ the compiler's ignorance from breaking your code.
 
 A load-load control dependency requires a full read memory barrier, not
 simply a data dependency barrier to make it work correctly.  Consider the
-following bit of code:
+following bit of code::
 
 	q = READ_ONCE(a);
 	if (q) {
@@ -658,7 +652,7 @@ This will not have the desired effect because there is no actual data
 dependency, but rather a control dependency that the CPU may short-circuit
 by attempting to predict the outcome in advance, so that other CPUs see
 the load from b as having happened before the load from a.  In such a
-case what's actually required is:
+case what's actually required is::
 
 	q = READ_ONCE(a);
 	if (q) {
@@ -667,7 +661,7 @@ case what's actually required is:
 	}
 
 However, stores are not speculated.  This means that ordering -is- provided
-for load-store control dependencies, as in the following example:
+for load-store control dependencies, as in the following example::
 
 	q = READ_ONCE(a);
 	if (q) {
@@ -684,7 +678,7 @@ Either can result in highly counterintuitive effects on ordering.
 Worse yet, if the compiler is able to prove (say) that the value of
 variable 'a' is always non-zero, it would be well within its rights
 to optimize the original example by eliminating the "if" statement
-as follows:
+as follows::
 
 	q = a;
 	b = 1;  /* BUG: Compiler and CPU can both reorder!!! */
@@ -692,7 +686,7 @@ as follows:
 So don't leave out the READ_ONCE().
 
 It is tempting to try to enforce ordering on identical stores on both
-branches of the "if" statement as follows:
+branches of the "if" statement as follows::
 
 	q = READ_ONCE(a);
 	if (q) {
@@ -706,7 +700,7 @@ branches of the "if" statement as follows:
 	}
 
 Unfortunately, current compilers will transform this as follows at high
-optimization levels:
+optimization levels::
 
 	q = READ_ONCE(a);
 	barrier();
@@ -724,7 +718,7 @@ Now there is no conditional between the load from 'a' and the store to
 The conditional is absolutely required, and must be present in the
 assembly code even after all compiler optimizations have been applied.
 Therefore, if you need ordering in this example, you need explicit
-memory barriers, for example, smp_store_release():
+memory barriers, for example, smp_store_release()::
 
 	q = READ_ONCE(a);
 	if (q) {
@@ -736,7 +730,7 @@ memory barriers, for example, smp_store_release():
 	}
 
 In contrast, without explicit memory barriers, two-legged-if control
-ordering is guaranteed only when the stores differ, for example:
+ordering is guaranteed only when the stores differ, for example::
 
 	q = READ_ONCE(a);
 	if (q) {
@@ -752,7 +746,7 @@ proving the value of 'a'.
 
 In addition, you need to be careful what you do with the local variable 'q',
 otherwise the compiler might be able to guess the value and again remove
-the needed conditional.  For example:
+the needed conditional.  For example::
 
 	q = READ_ONCE(a);
 	if (q % MAX) {
@@ -765,7 +759,7 @@ the needed conditional.  For example:
 
 If MAX is defined to be 1, then the compiler knows that (q % MAX) is
 equal to zero, in which case the compiler is within its rights to
-transform the above code into the following:
+transform the above code into the following::
 
 	q = READ_ONCE(a);
 	WRITE_ONCE(b, 2);
@@ -776,7 +770,7 @@ between the load from variable 'a' and the store to variable 'b'.  It is
 tempting to add a barrier(), but this does not help.  The conditional
 is gone, and the barrier won't bring it back.  Therefore, if you are
 relying on this ordering, you should make sure that MAX is greater than
-one, perhaps as follows:
+one, perhaps as follows::
 
 	q = READ_ONCE(a);
 	BUILD_BUG_ON(MAX <= 1); /* Order load from a with store to b. */
@@ -793,7 +787,7 @@ identical, as noted earlier, the compiler could pull this store outside
 of the 'if' statement.
 
 You must also be careful not to rely too much on boolean short-circuit
-evaluation.  Consider this example:
+evaluation.  Consider this example::
 
 	q = READ_ONCE(a);
 	if (q || 1 > 0)
@@ -801,7 +795,7 @@ evaluation.  Consider this example:
 
 Because the first condition cannot fault and the second condition is
 always true, the compiler can transform this example as following,
-defeating control dependency:
+defeating control dependency::
 
 	q = READ_ONCE(a);
 	WRITE_ONCE(b, 1);
@@ -813,7 +807,7 @@ the compiler to use the results.
 
 In addition, control dependencies apply only to the then-clause and
 else-clause of the if-statement in question.  In particular, it does
-not necessarily apply to code following the if-statement:
+not necessarily apply to code following the if-statement::
 
 	q = READ_ONCE(a);
 	if (q) {
@@ -828,7 +822,7 @@ compiler cannot reorder volatile accesses and also cannot reorder
 the writes to 'b' with the condition.  Unfortunately for this line
 of reasoning, the compiler might compile the two writes to 'b' as
 conditional-move instructions, as in this fanciful pseudo-assembly
-language:
+language::
 
 	ld r1,a
 	cmp r1,$0
@@ -846,7 +840,7 @@ invoked by those two clauses), not to code following that if-statement.
 
 Finally, control dependencies do -not- provide transitivity.  This is
 demonstrated by two related examples, with the initial values of
-'x' and 'y' both being zero:
+'x' and 'y' both being zero::
 
 	CPU 0                     CPU 1
 	=======================   =======================
@@ -858,7 +852,7 @@ demonstrated by two related examples, with the initial values of
 
 The above two-CPU example will never trigger the assert().  However,
 if control dependencies guaranteed transitivity (which they do not),
-then adding the following CPU would guarantee a related assertion:
+then adding the following CPU would guarantee a related assertion::
 
 	CPU 2
 	=====================
@@ -879,14 +873,14 @@ site: https://www.cl.cam.ac.uk/~pes20/ppcmem/index.html.
 
 In summary:
 
-  (*) Control dependencies can order prior loads against later stores.
+  (#) Control dependencies can order prior loads against later stores.
       However, they do -not- guarantee any other sort of ordering:
       Not prior loads against later loads, nor prior stores against
       later anything.  If you need these other forms of ordering,
       use smp_rmb(), smp_wmb(), or, in the case of prior stores and
       later loads, smp_mb().
 
-  (*) If both legs of the "if" statement begin with identical stores to
+  (#) If both legs of the "if" statement begin with identical stores to
       the same variable, then those stores must be ordered, either by
       preceding both of them with smp_mb() or by using smp_store_release()
       to carry out the stores.  Please note that it is -not- sufficient
@@ -895,30 +889,30 @@ In summary:
       destroy the control dependency while respecting the letter of the
       barrier() law.
 
-  (*) Control dependencies require at least one run-time conditional
+  (#) Control dependencies require at least one run-time conditional
       between the prior load and the subsequent store, and this
       conditional must involve the prior load.  If the compiler is able
       to optimize the conditional away, it will have also optimized
       away the ordering.  Careful use of READ_ONCE() and WRITE_ONCE()
       can help to preserve the needed conditional.
 
-  (*) Control dependencies require that the compiler avoid reordering the
+  (#) Control dependencies require that the compiler avoid reordering the
       dependency into nonexistence.  Careful use of READ_ONCE() or
       atomic{,64}_read() can help to preserve your control dependency.
       Please see the COMPILER BARRIER section for more information.
 
-  (*) Control dependencies apply only to the then-clause and else-clause
+  (#) Control dependencies apply only to the then-clause and else-clause
       of the if-statement containing the control dependency, including
       any functions that these two clauses call.  Control dependencies
       do -not- apply to code following the if-statement containing the
       control dependency.
 
-  (*) Control dependencies pair normally with other types of barriers.
+  (#) Control dependencies pair normally with other types of barriers.
 
-  (*) Control dependencies do -not- provide transitivity.  If you
+  (#) Control dependencies do -not- provide transitivity.  If you
       need transitivity, use smp_mb().
 
-  (*) Compilers do not understand control dependencies.  It is therefore
+  (#) Compilers do not understand control dependencies.  It is therefore
       your job to ensure that they do not break your code.
 
 
@@ -935,7 +929,7 @@ including of course general barriers.  A write barrier pairs with a data
 dependency barrier, a control dependency, an acquire barrier, a release
 barrier, a read barrier, or a general barrier.  Similarly a read barrier,
 control dependency, or a data dependency barrier pairs with a write
-barrier, an acquire barrier, a release barrier, or a general barrier:
+barrier, an acquire barrier, a release barrier, or a general barrier::
 
 	CPU 1		      CPU 2
 	===============	      ===============
@@ -945,7 +939,7 @@ barrier, an acquire barrier, a release barrier, or a general barrier:
 			      <read barrier>
 			      y = READ_ONCE(a);
 
-Or:
+Or::
 
 	CPU 1		      CPU 2
 	===============	      ===============================
@@ -955,7 +949,7 @@ Or:
 			      <data dependency barrier>
 			      y = *x;
 
-Or even:
+Or even::
 
 	CPU 1		      CPU 2
 	===============	      ===============================
@@ -973,7 +967,7 @@ the "weaker" type.
 
 [!] Note that the stores before the write barrier would normally be expected to
 match the loads after the read barrier or the data dependency barrier, and vice
-versa:
+versa::
 
 	CPU 1                               CPU 2
 	===================                 ===================
@@ -984,11 +978,11 @@ versa:
 	WRITE_ONCE(d, 4);    }----   --->{  y = READ_ONCE(b);
 
 
-EXAMPLES OF MEMORY BARRIER SEQUENCES
+Examples of memory barrier sequences
 ------------------------------------
 
 Firstly, write barriers act as partial orderings on store operations.
-Consider the following sequence of events:
+Consider the following sequence of events::
 
 	CPU 1
 	=======================
@@ -1002,7 +996,7 @@ Consider the following sequence of events:
 This sequence of events is committed to the memory coherence system in an order
 that the rest of the system might perceive as the unordered set of { STORE A,
 STORE B, STORE C } all occurring before the unordered set of { STORE D, STORE E
-}:
+}::
 
 	+-------+       :      :
 	|       |       +------+
@@ -1026,7 +1020,7 @@ STORE B, STORE C } all occurring before the unordered set of { STORE D, STORE E
 
 
 Secondly, data dependency barriers act as partial orderings on data-dependent
-loads.  Consider the following sequence of events:
+loads.  Consider the following sequence of events::
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -1039,7 +1033,7 @@ loads.  Consider the following sequence of events:
 				LOAD *C (reads B)
 
 Without intervention, CPU 2 may perceive the events on CPU 1 in some
-effectively random order, despite the write barrier issued by CPU 1:
+effectively random order, despite the write barrier issued by CPU 1::
 
 	+-------+       :      :                :       :
 	|       |       +------+                +-------+  | Sequence of update
@@ -1072,7 +1066,7 @@ In the above example, CPU 2 perceives that B is 7, despite the load of *C
 (which would be B) coming after the LOAD of C.
 
 If, however, a data dependency barrier were to be placed between the load of C
-and the load of *C (ie: B) on CPU 2:
+and the load of *C (ie: B) on CPU 2::
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -1085,7 +1079,7 @@ and the load of *C (ie: B) on CPU 2:
 				<data dependency barrier>
 				LOAD *C (reads B)
 
-then the following will occur:
+then the following will occur::
 
 	+-------+       :      :                :       :
 	|       |       +------+                +-------+
@@ -1113,7 +1107,7 @@ then the following will occur:
 
 
 And thirdly, a read barrier acts as a partial order on loads.  Consider the
-following sequence of events:
+following sequence of events::
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -1125,7 +1119,7 @@ following sequence of events:
 				LOAD A
 
 Without intervention, CPU 2 may then choose to perceive the events on CPU 1 in
-some effectively random order, despite the write barrier issued by CPU 1:
+some effectively random order, despite the write barrier issued by CPU 1::
 
 	+-------+       :      :                :       :
 	|       |       +------+                +-------+
@@ -1149,7 +1143,7 @@ some effectively random order, despite the write barrier issued by CPU 1:
 
 
 If, however, a read barrier were to be placed between the load of B and the
-load of A on CPU 2:
+load of A on CPU 2::
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -1162,7 +1156,7 @@ load of A on CPU 2:
 				LOAD A
 
 then the partial ordering imposed by CPU 1 will be perceived correctly by CPU
-2:
+2::
 
 	+-------+       :      :                :       :
 	|       |       +------+                +-------+
@@ -1185,7 +1179,7 @@ then the partial ordering imposed by CPU 1 will be perceived correctly by CPU
 
 
 To illustrate this more completely, consider what could happen if the code
-contained a load of A either side of the read barrier:
+contained a load of A either side of the read barrier::
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -1199,7 +1193,7 @@ contained a load of A either side of the read barrier:
 				LOAD A [second load of A]
 
 Even though the two loads of A both occur after the load of B, they may both
-come up with different values:
+come up with different values::
 
 	+-------+       :      :                :       :
 	|       |       +------+                +-------+
@@ -1225,7 +1219,7 @@ come up with different values:
 
 
 But it may be that the update to A from CPU 1 becomes perceptible to CPU 2
-before the read barrier completes anyway:
+before the read barrier completes anyway::
 
 	+-------+       :      :                :       :
 	|       |       +------+                +-------+
@@ -1255,7 +1249,7 @@ load of B came up with B == 2.  No such guarantee exists for the first load of
 A; that may come up with either A == 0 or A == 1.
 
 
-READ MEMORY BARRIERS VS LOAD SPECULATION
+Read memory barriers vs load speculation
 ----------------------------------------
 
 Many CPUs speculate with loads: that is they see that they will need to load an
@@ -1269,7 +1263,7 @@ It may turn out that the CPU didn't actually need the value - perhaps because a
 branch circumvented the load - in which case it can discard the value or just
 cache it for later use.
 
-Consider:
+Consider::
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -1278,7 +1272,7 @@ Consider:
 				DIVIDE		} take a long time to perform
 				LOAD A
 
-Which might appear as this:
+Which might appear as this::
 
 	                                        :       :       +-------+
 	                                        +-------+       |       |
@@ -1297,7 +1291,7 @@ Which might appear as this:
 
 
 Placing a read barrier or a data dependency barrier just before the second
-load:
+load::
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -1309,7 +1303,7 @@ load:
 
 will force any value speculatively obtained to be reconsidered to an extent
 dependent on the type of barrier used.  If there was no change made to the
-speculated memory location, then the speculated value will just be used:
+speculated memory location, then the speculated value will just be used::
 
 	                                        :       :       +-------+
 	                                        +-------+       |       |
@@ -1331,7 +1325,7 @@ speculated memory location, then the speculated value will just be used:
 
 
 but if there was an update or an invalidation from another CPU pending, then
-the speculation will be cancelled and the value reloaded:
+the speculation will be cancelled and the value reloaded::
 
 	                                        :       :       +-------+
 	                                        +-------+       |       |
@@ -1352,12 +1346,12 @@ the speculation will be cancelled and the value reloaded:
 	retrieved                               :       :       +-------+
 
 
-TRANSITIVITY
+Transitivity
 ------------
 
 Transitivity is a deeply intuitive notion about ordering that is not
 always provided by real computer systems.  The following example
-demonstrates transitivity:
+demonstrates transitivity::
 
 	CPU 1			CPU 2			CPU 3
 	=======================	=======================	=======================
@@ -1385,7 +1379,7 @@ also return 1.
 
 However, transitivity is -not- guaranteed for read or write barriers.
 For example, suppose that CPU 2's general barrier in the above example
-is changed to a read barrier as shown below:
+is changed to a read barrier as shown below::
 
 	CPU 1			CPU 2			CPU 3
 	=======================	=======================	=======================
@@ -1409,7 +1403,7 @@ General barriers provide "global transitivity", so that all CPUs will
 agree on the order of operations.  In contrast, a chain of release-acquire
 pairs provides only "local transitivity", so that only those CPUs on
 the chain are guaranteed to agree on the combined order of the accesses.
-For example, switching to C code in deference to Herman Hollerith:
+For example, switching to C code in deference to Herman Hollerith::
 
 	int u, v, x, y, z;
 
@@ -1443,23 +1437,23 @@ For example, switching to C code in deference to Herman Hollerith:
 
 Because cpu0(), cpu1(), and cpu2() participate in a local transitive
 chain of smp_store_release()/smp_load_acquire() pairs, the following
-outcome is prohibited:
+outcome is prohibited::
 
 	r0 == 1 && r1 == 1 && r2 == 1
 
 Furthermore, because of the release-acquire relationship between cpu0()
 and cpu1(), cpu1() must see cpu0()'s writes, so that the following
-outcome is prohibited:
+outcome is prohibited::
 
 	r1 == 1 && r5 == 0
 
 However, the transitivity of release-acquire is local to the participating
 CPUs and does not apply to cpu3().  Therefore, the following outcome
-is possible:
+is possible::
 
 	r0 == 0 && r1 == 1 && r2 == 1 && r3 == 0 && r4 == 0
 
-As an aside, the following outcome is also possible:
+As an aside, the following outcome is also possible::
 
 	r0 == 0 && r1 == 1 && r2 == 1 && r3 == 0 && r4 == 0 && r5 == 1
 
@@ -1476,7 +1470,7 @@ intended order.
 However, please keep in mind that smp_load_acquire() is not magic.
 In particular, it simply reads from its argument with ordering.  It does
 -not- ensure that any particular value will be read.  Therefore, the
-following outcome is possible:
+following outcome is possible::
 
 	r0 == 0 && r1 == 0 && r2 == 0 && r5 == 0
 
@@ -1487,25 +1481,24 @@ To reiterate, if your code requires global transitivity, use general
 barriers throughout.
 
 
-========================
-EXPLICIT KERNEL BARRIERS
+Explicit kernel barriers
 ========================
 
 The Linux kernel has a variety of different barriers that act at different
 levels:
 
-  (*) Compiler barrier.
+  (#) Compiler barrier.
 
-  (*) CPU memory barriers.
+  (#) CPU memory barriers.
 
-  (*) MMIO write barrier.
+  (#) MMIO write barrier.
 
 
-COMPILER BARRIER
+Compiler barrier
 ----------------
 
 The Linux kernel has an explicit compiler barrier function that prevents the
-compiler from moving the memory accesses either side of it to the other side:
+compiler from moving the memory accesses either side of it to the other side::
 
 	barrier();
 
@@ -1516,12 +1509,12 @@ accesses flagged by the READ_ONCE() or WRITE_ONCE().
 
 The barrier() function has the following effects:
 
- (*) Prevents the compiler from reordering accesses following the
+ (#) Prevents the compiler from reordering accesses following the
      barrier() to precede any accesses preceding the barrier().
      One example use for this property is to ease communication between
      interrupt-handler code and the code that was interrupted.
 
- (*) Within a loop, forces the compiler to load the variables used
+ (#) Within a loop, forces the compiler to load the variables used
      in that loop's conditional on each pass through that loop.
 
 The READ_ONCE() and WRITE_ONCE() functions can prevent any number of
@@ -1529,16 +1522,16 @@ optimizations that, while perfectly safe in single-threaded code, can
 be fatal in concurrent code.  Here are some examples of these sorts
 of optimizations:
 
- (*) The compiler is within its rights to reorder loads and stores
+ (#) The compiler is within its rights to reorder loads and stores
      to the same variable, and in some cases, the CPU is within its
      rights to reorder loads to the same variable.  This means that
-     the following code:
+     the following code::
 
 	a[0] = x;
 	a[1] = x;
 
      Might result in an older value of x stored in a[1] than in a[0].
-     Prevent both the compiler and the CPU from doing this as follows:
+     Prevent both the compiler and the CPU from doing this as follows::
 
 	a[0] = READ_ONCE(x);
 	a[1] = READ_ONCE(x);
@@ -1546,36 +1539,36 @@ of optimizations:
      In short, READ_ONCE() and WRITE_ONCE() provide cache coherence for
      accesses from multiple CPUs to a single variable.
 
- (*) The compiler is within its rights to merge successive loads from
+ (#) The compiler is within its rights to merge successive loads from
      the same variable.  Such merging can cause the compiler to "optimize"
-     the following code:
+     the following code::
 
 	while (tmp = a)
 		do_something_with(tmp);
 
      into the following code, which, although in some sense legitimate
      for single-threaded code, is almost certainly not what the developer
-     intended:
+     intended::
 
 	if (tmp = a)
 		for (;;)
 			do_something_with(tmp);
 
-     Use READ_ONCE() to prevent the compiler from doing this to you:
+     Use READ_ONCE() to prevent the compiler from doing this to you::
 
 	while (tmp = READ_ONCE(a))
 		do_something_with(tmp);
 
- (*) The compiler is within its rights to reload a variable, for example,
+ (#) The compiler is within its rights to reload a variable, for example,
      in cases where high register pressure prevents the compiler from
      keeping all data of interest in registers.  The compiler might
-     therefore optimize the variable 'tmp' out of our previous example:
+     therefore optimize the variable 'tmp' out of our previous example::
 
 	while (tmp = a)
 		do_something_with(tmp);
 
      This could result in the following code, which is perfectly safe in
-     single-threaded code, but can be fatal in concurrent code:
+     single-threaded code, but can be fatal in concurrent code::
 
 	while (a)
 		do_something_with(a);
@@ -1585,7 +1578,7 @@ of optimizations:
      a was modified by some other CPU between the "while" statement and
      the call to do_something_with().
 
-     Again, use READ_ONCE() to prevent the compiler from doing this:
+     Again, use READ_ONCE() to prevent the compiler from doing this::
 
 	while (tmp = READ_ONCE(a))
 		do_something_with(tmp);
@@ -1596,14 +1589,14 @@ of optimizations:
      single-threaded code, so you need to tell the compiler about cases
      where it is not safe.
 
- (*) The compiler is within its rights to omit a load entirely if it knows
+ (#) The compiler is within its rights to omit a load entirely if it knows
      what the value will be.  For example, if the compiler can prove that
-     the value of variable 'a' is always zero, it can optimize this code:
+     the value of variable 'a' is always zero, it can optimize this code::
 
 	while (tmp = a)
 		do_something_with(tmp);
 
-     Into this:
+     Into this::
 
 	do { } while (0);
 
@@ -1612,14 +1605,14 @@ of optimizations:
      will carry out its proof assuming that the current CPU is the only
      one updating variable 'a'.  If variable 'a' is shared, then the
      compiler's proof will be erroneous.  Use READ_ONCE() to tell the
-     compiler that it doesn't know as much as it thinks it does:
+     compiler that it doesn't know as much as it thinks it does::
 
 	while (tmp = READ_ONCE(a))
 		do_something_with(tmp);
 
      But please note that the compiler is also closely watching what you
      do with the value after the READ_ONCE().  For example, suppose you
-     do the following and MAX is a preprocessor macro with the value 1:
+     do the following and MAX is a preprocessor macro with the value 1::
 
 	while ((tmp = READ_ONCE(a)) % MAX)
 		do_something_with(tmp);
@@ -1629,12 +1622,12 @@ of optimizations:
      the code into near-nonexistence.  (It will still load from the
      variable 'a'.)
 
- (*) Similarly, the compiler is within its rights to omit a store entirely
+ (#) Similarly, the compiler is within its rights to omit a store entirely
      if it knows that the variable already has the value being stored.
      Again, the compiler assumes that the current CPU is the only one
      storing into the variable, which can cause the compiler to do the
      wrong thing for shared variables.  For example, suppose you have
-     the following:
+     the following::
 
 	a = 0;
 	... Code that does not store to variable a ...
@@ -1646,15 +1639,15 @@ of optimizations:
      meantime.
 
      Use WRITE_ONCE() to prevent the compiler from making this sort of
-     wrong guess:
+     wrong guess::
 
 	WRITE_ONCE(a, 0);
 	... Code that does not store to variable a ...
 	WRITE_ONCE(a, 0);
 
- (*) The compiler is within its rights to reorder memory accesses unless
+ (#) The compiler is within its rights to reorder memory accesses unless
      you tell it not to.  For example, consider the following interaction
-     between process-level code and an interrupt handler:
+     between process-level code and an interrupt handler::
 
 	void process_level(void)
 	{
@@ -1670,7 +1663,7 @@ of optimizations:
 
      There is nothing to prevent the compiler from transforming
      process_level() to the following, in fact, this might well be a
-     win for single-threaded code:
+     win for single-threaded code::
 
 	void process_level(void)
 	{
@@ -1680,7 +1673,7 @@ of optimizations:
 
      If the interrupt occurs between these two statement, then
      interrupt_handler() might be passed a garbled msg.  Use WRITE_ONCE()
-     to prevent this as follows:
+     to prevent this as follows::
 
 	void process_level(void)
 	{
@@ -1717,15 +1710,15 @@ of optimizations:
      respect the order in which the READ_ONCE()s and WRITE_ONCE()s occur,
      though the CPU of course need not do so.
 
- (*) The compiler is within its rights to invent stores to a variable,
-     as in the following example:
+ (#) The compiler is within its rights to invent stores to a variable,
+     as in the following example::
 
 	if (a)
 		b = a;
 	else
 		b = 42;
 
-     The compiler might save a branch by optimizing this as follows:
+     The compiler might save a branch by optimizing this as follows::
 
 	b = 42;
 	if (a)
@@ -1735,7 +1728,7 @@ of optimizations:
      a branch.  Unfortunately, in concurrent code, this optimization
      could cause some other CPU to see a spurious value of 42 -- even
      if variable 'a' was never zero -- when loading variable 'b'.
-     Use WRITE_ONCE() to prevent this as follows:
+     Use WRITE_ONCE() to prevent this as follows::
 
 	if (a)
 		WRITE_ONCE(b, a);
@@ -1747,13 +1740,13 @@ of optimizations:
      poor performance and scalability.  Use READ_ONCE() to prevent
      invented loads.
 
- (*) For aligned memory locations whose size allows them to be accessed
+ (#) For aligned memory locations whose size allows them to be accessed
      with a single memory-reference instruction, prevents "load tearing"
      and "store tearing," in which a single large access is replaced by
      multiple smaller accesses.  For example, given an architecture having
      16-bit store instructions with 7-bit immediate fields, the compiler
      might be tempted to use two 16-bit store-immediate instructions to
-     implement the following 32-bit store:
+     implement the following 32-bit store::
 
 	p = 0x00010002;
 
@@ -1763,12 +1756,12 @@ of optimizations:
      This optimization can therefore be a win in single-threaded code.
      In fact, a recent bug (since fixed) caused GCC to incorrectly use
      this optimization in a volatile store.  In the absence of such bugs,
-     use of WRITE_ONCE() prevents store tearing in the following example:
+     use of WRITE_ONCE() prevents store tearing in the following example::
 
 	WRITE_ONCE(p, 0x00010002);
 
      Use of packed structures can also result in load and store tearing,
-     as in this example:
+     as in this example::
 
 	struct __attribute__((__packed__)) foo {
 		short a;
@@ -1787,7 +1780,7 @@ of optimizations:
      implement these three assignment statements as a pair of 32-bit
      loads followed by a pair of 32-bit stores.  This would result in
      load tearing on 'foo1.b' and store tearing on 'foo2.b'.  READ_ONCE()
-     and WRITE_ONCE() again prevent tearing in this example:
+     and WRITE_ONCE() again prevent tearing in this example::
 
 	foo2.a = foo1.a;
 	WRITE_ONCE(foo2.b, READ_ONCE(foo1.b));
@@ -1804,17 +1797,19 @@ Please note that these compiler barriers have no direct effect on the CPU,
 which may then reorder things however it wishes.
 
 
-CPU MEMORY BARRIERS
+CPU memory barriers
 -------------------
 
 The Linux kernel has eight basic CPU memory barriers:
 
+	===============	=======================	===========================
 	TYPE		MANDATORY		SMP CONDITIONAL
 	===============	=======================	===========================
 	GENERAL		mb()			smp_mb()
 	WRITE		wmb()			smp_wmb()
 	READ		rmb()			smp_rmb()
 	DATA DEPENDENCY	read_barrier_depends()	smp_read_barrier_depends()
+	===============	=======================	===========================
 
 
 All memory barriers except the data dependency barriers imply a compiler
@@ -1849,15 +1844,15 @@ compiler and the CPU from reordering them.
 
 There are some more advanced barrier functions:
 
- (*) smp_store_mb(var, value)
+ (#) smp_store_mb(var, value)
 
      This assigns the value to the variable and then inserts a full memory
      barrier after it.  It isn't guaranteed to insert anything more than a
      compiler barrier in a UP compilation.
 
 
- (*) smp_mb__before_atomic();
- (*) smp_mb__after_atomic();
+ (#) smp_mb__before_atomic();
+ (#) smp_mb__after_atomic();
 
      These are for use with atomic (such as add, subtract, increment and
      decrement) functions that don't return a value, especially when used for
@@ -1867,7 +1862,7 @@ There are some more advanced barrier functions:
      value (such as set_bit and clear_bit).
 
      As an example, consider a piece of code that marks an object as being dead
-     and then decrements the object's reference count:
+     and then decrements the object's reference count::
 
 	obj->dead = 1;
 	smp_mb__before_atomic();
@@ -1880,7 +1875,7 @@ There are some more advanced barrier functions:
      operations" subsection for information on where to use these.
 
 
- (*) lockless_dereference();
+ (#) lockless_dereference();
 
      This can be thought of as a pointer-fetch wrapper around the
      smp_read_barrier_depends() data-dependency barrier.
@@ -1892,8 +1887,8 @@ There are some more advanced barrier functions:
      that can be used both with and without RCU.
 
 
- (*) dma_wmb();
- (*) dma_rmb();
+ (#) dma_wmb();
+ (#) dma_rmb();
 
      These are for use with consistent memory to guarantee the ordering
      of writes or reads of shared memory accessible to both the CPU and a
@@ -1902,7 +1897,7 @@ There are some more advanced barrier functions:
      For example, consider a device driver that shares memory with a device
      and uses a descriptor status value to indicate if the descriptor belongs
      to the device or the CPU, and a doorbell to notify it when new
-     descriptors are available:
+     descriptors are available::
 
 	if (desc->status != DEVICE_OWN) {
 		/* do not read data until we own descriptor */
@@ -1935,11 +1930,11 @@ There are some more advanced barrier functions:
      See Documentation/DMA-API.txt for more information on consistent memory.
 
 
-MMIO WRITE BARRIER
+MMIO write barrier
 ------------------
 
 The Linux kernel also has a special barrier for use with memory-mapped I/O
-writes:
+writes::
 
 	mmiowb();
 
@@ -1950,8 +1945,7 @@ CPU->Hardware interface and actually affect the hardware at some level.
 See the subsection "Acquires vs I/O accesses" for more information.
 
 
-===============================
-IMPLICIT KERNEL MEMORY BARRIERS
+Implicit kernel memory barriers
 ===============================
 
 Some of the other functions in the linux kernel imply memory barriers, amongst
@@ -1962,16 +1956,16 @@ provide more substantial guarantees, but these may not be relied upon outside
 of arch specific code.
 
 
-LOCK ACQUISITION FUNCTIONS
+Lock acquisition functions
 --------------------------
 
 The Linux kernel has a number of locking constructs:
 
- (*) spin locks
- (*) R/W spin locks
- (*) mutexes
- (*) semaphores
- (*) R/W semaphores
+ (#) spin locks
+ (#) R/W spin locks
+ (#) mutexes
+ (#) semaphores
+ (#) R/W semaphores
 
 In all cases there are variants on "ACQUIRE" operations and "RELEASE" operations
 for each construct.  These operations all imply certain barriers:
@@ -2019,14 +2013,14 @@ section may seep into the inside of the critical section.
 An ACQUIRE followed by a RELEASE may not be assumed to be full memory barrier
 because it is possible for an access preceding the ACQUIRE to happen after the
 ACQUIRE, and an access following the RELEASE to happen before the RELEASE, and
-the two accesses can themselves then cross:
+the two accesses can themselves then cross::
 
 	*A = a;
 	ACQUIRE M
 	RELEASE M
 	*B = b;
 
-may occur as:
+may occur as::
 
 	ACQUIRE M, STORE *B, STORE *A, RELEASE M
 
@@ -2039,14 +2033,14 @@ RELEASE may -not- be assumed to be a full memory barrier.
 Similarly, the reverse case of a RELEASE followed by an ACQUIRE does
 not imply a full memory barrier.  Therefore, the CPU's execution of the
 critical sections corresponding to the RELEASE and the ACQUIRE can cross,
-so that:
+so that::
 
 	*A = a;
 	RELEASE M
 	ACQUIRE N
 	*B = b;
 
-could occur as:
+could occur as::
 
 	ACQUIRE N, STORE *B, STORE *A, RELEASE M
 
@@ -2085,7 +2079,7 @@ with interrupt disabling operations.
 See also the section on "Inter-CPU acquiring barrier effects".
 
 
-As an example, consider the following:
+As an example, consider the following::
 
 	*A = a;
 	*B = b;
@@ -2096,13 +2090,13 @@ As an example, consider the following:
 	*E = e;
 	*F = f;
 
-The following sequence of events is acceptable:
+The following sequence of events is acceptable::
 
 	ACQUIRE, {*F,*A}, *E, {*C,*D}, *B, RELEASE
 
 	[+] Note that {*F,*A} indicates a combined access.
 
-But none of the following are:
+But none of the following are::
 
 	{*F,*A}, *B,	ACQUIRE, *C, *D,	RELEASE, *E
 	*A, *B, *C,	ACQUIRE, *D,		RELEASE, *E, *F
@@ -2111,7 +2105,7 @@ But none of the following are:
 
 
 
-INTERRUPT DISABLING FUNCTIONS
+Interrupt disabling functions
 -----------------------------
 
 Functions that disable interrupts (ACQUIRE equivalent) and enable interrupts
@@ -2120,7 +2114,7 @@ barriers are required in such a situation, they must be provided from some
 other means.
 
 
-SLEEP AND WAKE-UP FUNCTIONS
+Sleep and wake-up functions
 ---------------------------
 
 Sleeping and waking on an event flagged in global data can be viewed as an
@@ -2130,7 +2124,7 @@ these appear to happen in the right order, the primitives to begin the process
 of going to sleep, and the primitives to initiate a wake up imply certain
 barriers.
 
-Firstly, the sleeper normally follows something like this sequence of events:
+Firstly, the sleeper normally follows something like this sequence of events::
 
 	for (;;) {
 		set_current_state(TASK_UNINTERRUPTIBLE);
@@ -2140,7 +2134,7 @@ Firstly, the sleeper normally follows something like this sequence of events:
 	}
 
 A general memory barrier is interpolated automatically by set_current_state()
-after it has altered the task state:
+after it has altered the task state::
 
 	CPU 1
 	===============================
@@ -2150,14 +2144,14 @@ after it has altered the task state:
 	    <general barrier>
 	LOAD event_indicated
 
-set_current_state() may be wrapped by:
+set_current_state() may be wrapped by::
 
 	prepare_to_wait();
 	prepare_to_wait_exclusive();
 
 which therefore also imply a general memory barrier after setting the state.
 The whole sequence above is available in various canned forms, all of which
-interpolate the memory barrier in the right place:
+interpolate the memory barrier in the right place::
 
 	wait_event();
 	wait_event_interruptible();
@@ -2169,19 +2163,19 @@ interpolate the memory barrier in the right place:
 	wait_on_bit_lock();
 
 
-Secondly, code that performs a wake up normally follows something like this:
+Secondly, code that performs a wake up normally follows something like this::
 
 	event_indicated = 1;
 	wake_up(&event_wait_queue);
 
-or:
+or::
 
 	event_indicated = 1;
 	wake_up_process(event_daemon);
 
 A write memory barrier is implied by wake_up() and co.  if and only if they
 wake something up.  The barrier occurs before the task state is cleared, and so
-sits between the STORE to indicate the event and the STORE to set TASK_RUNNING:
+sits between the STORE to indicate the event and the STORE to set TASK_RUNNING::
 
 	CPU 1				CPU 2
 	===============================	===============================
@@ -2193,7 +2187,7 @@ sits between the STORE to indicate the event and the STORE to set TASK_RUNNING:
 
 To repeat, this write memory barrier is present if and only if something
 is actually awakened.  To see this, consider the following sequence of
-events, where X and Y are both initially zero:
+events, where X and Y are both initially zero::
 
 	CPU 1				CPU 2
 	===============================	===============================
@@ -2206,7 +2200,7 @@ events, where X and Y are both initially zero:
 In contrast, if a wakeup does occur, CPU 2's load from X would be guaranteed
 to see 1.
 
-The available waker functions include:
+The available waker functions include::
 
 	complete();
 	wake_up();
@@ -2228,7 +2222,7 @@ The available waker functions include:
 [!] Note that the memory barriers implied by the sleeper and the waker do _not_
 order multiple stores before the wake-up with respect to loads of those stored
 values after the sleeper has called set_current_state().  For instance, if the
-sleeper does:
+sleeper does::
 
 	set_current_state(TASK_INTERRUPTIBLE);
 	if (event_indicated)
@@ -2236,7 +2230,7 @@ sleeper does:
 	__set_current_state(TASK_RUNNING);
 	do_something(my_data);
 
-and the waker does:
+and the waker does::
 
 	my_data = value;
 	event_indicated = 1;
@@ -2245,7 +2239,7 @@ and the waker does:
 there's no guarantee that the change to event_indicated will be perceived by
 the sleeper as coming after the change to my_data.  In such a circumstance, the
 code on both sides must interpolate its own memory barriers between the
-separate data accesses.  Thus the above sleeper ought to do:
+separate data accesses.  Thus the above sleeper ought to do::
 
 	set_current_state(TASK_INTERRUPTIBLE);
 	if (event_indicated) {
@@ -2253,7 +2247,7 @@ separate data accesses.  Thus the above sleeper ought to do:
 		do_something(my_data);
 	}
 
-and the waker should do:
+and the waker should do::
 
 	my_data = value;
 	smp_wmb();
@@ -2261,16 +2255,15 @@ and the waker should do:
 	wake_up(&event_wait_queue);
 
 
-MISCELLANEOUS FUNCTIONS
+Miscelaneous functions
 -----------------------
 
 Other functions that imply barriers:
 
- (*) schedule() and similar imply full memory barriers.
+ (#) schedule() and similar imply full memory barriers.
 
 
-===================================
-INTER-CPU ACQUIRING BARRIER EFFECTS
+Inter-CPU acquiring barrier effects
 ===================================
 
 On SMP systems locking primitives give a more substantial form of barrier: one
@@ -2278,11 +2271,11 @@ that does affect memory access ordering on other CPUs, within the context of
 conflict on any particular lock.
 
 
-ACQUIRES VS MEMORY ACCESSES
+Acquires vs memory accesses
 ---------------------------
 
 Consider the following: the system has a pair of spinlocks (M) and (Q), and
-three CPUs; then should the following sequence of events occur:
+three CPUs; then should the following sequence of events occur::
 
 	CPU 1				CPU 2
 	===============================	===============================
@@ -2295,11 +2288,11 @@ three CPUs; then should the following sequence of events occur:
 
 Then there is no guarantee as to what order CPU 3 will see the accesses to *A
 through *H occur in, other than the constraints imposed by the separate locks
-on the separate CPUs.  It might, for example, see:
+on the separate CPUs.  It might, for example, see::
 
 	*E, ACQUIRE M, ACQUIRE Q, *G, *C, *F, *A, *B, RELEASE Q, *D, *H, RELEASE M
 
-But it won't see any of:
+But it won't see any of::
 
 	*B, *C or *D preceding ACQUIRE M
 	*A, *B or *C following RELEASE M
@@ -2308,7 +2301,7 @@ But it won't see any of:
 
 
 
-ACQUIRES VS I/O ACCESSES
+Acquires vs I/O accesses
 ------------------------
 
 Under certain circumstances (especially involving NUMA), I/O accesses within
@@ -2317,7 +2310,7 @@ PCI bridge, because the PCI bridge does not necessarily participate in the
 cache-coherence protocol, and is therefore incapable of issuing the required
 read memory barriers.
 
-For example:
+For example::
 
 	CPU 1				CPU 2
 	===============================	===============================
@@ -2330,7 +2323,7 @@ For example:
 					writel(5, DATA);
 					spin_unlock(Q);
 
-may be seen by the PCI bridge as follows:
+may be seen by the PCI bridge as follows::
 
 	STORE *ADDR = 0, STORE *ADDR = 4, STORE *DATA = 1, STORE *DATA = 5
 
@@ -2338,7 +2331,7 @@ which would probably cause the hardware to malfunction.
 
 
 What is necessary here is to intervene with an mmiowb() before dropping the
-spinlock, for example:
+spinlock, for example::
 
 	CPU 1				CPU 2
 	===============================	===============================
@@ -2359,7 +2352,7 @@ before either of the stores issued on CPU 2.
 
 Furthermore, following a store by a load from the same device obviates the need
 for the mmiowb(), because the load forces the store to complete before the load
-is performed:
+is performed::
 
 	CPU 1				CPU 2
 	===============================	===============================
@@ -2376,8 +2369,7 @@ is performed:
 See Documentation/driver-api/device-io.rst for more information.
 
 
-=================================
-WHERE ARE MEMORY BARRIERS NEEDED?
+Where are memory barriers needed?
 =================================
 
 Under normal operation, memory operation reordering is generally not going to
@@ -2385,16 +2377,16 @@ be a problem as a single-threaded linear piece of code will still appear to
 work correctly, even if it's in an SMP kernel.  There are, however, four
 circumstances in which reordering definitely _could_ be a problem:
 
- (*) Interprocessor interaction.
+ (#) Interprocessor interaction.
 
- (*) Atomic operations.
+ (#) Atomic operations.
 
- (*) Accessing devices.
+ (#) Accessing devices.
 
- (*) Interrupts.
+ (#) Interrupts.
 
 
-INTERPROCESSOR INTERACTION
+Interprocessor interaction
 --------------------------
 
 When there's a system with more than one processor, more than one CPU in the
@@ -2407,7 +2399,7 @@ a malfunction.
 
 Consider, for example, the R/W semaphore slow path.  Here a waiting process is
 queued on the semaphore, by virtue of it having a piece of its stack linked to
-the semaphore's list of waiting processes:
+the semaphore's list of waiting processes::
 
 	struct rw_semaphore {
 		...
@@ -2433,7 +2425,7 @@ To wake up a particular waiter, the up_read() or up_write() functions have to:
 
  (5) release the reference held on the waiter's task struct.
 
-In other words, it has to perform this sequence of events:
+In other words, it has to perform this sequence of events::
 
 	LOAD waiter->list.next;
 	LOAD waiter->task;
@@ -2451,7 +2443,7 @@ if the task pointer is cleared _before_ the next pointer in the list is read,
 another CPU might start processing the waiter and might clobber the waiter's
 stack before the up*() function has a chance to read the next pointer.
 
-Consider then what might happen to the above sequence of events:
+Consider then what might happen to the above sequence of events::
 
 	CPU 1				CPU 2
 	===============================	===============================
@@ -2474,7 +2466,7 @@ Consider then what might happen to the above sequence of events:
 This could be dealt with using the semaphore lock, but then the down_xxx()
 function has to needlessly get the spinlock again after being woken up.
 
-The way to deal with this is to insert a general SMP memory barrier:
+The way to deal with this is to insert a general SMP memory barrier::
 
 	LOAD waiter->list.next;
 	LOAD waiter->task;
@@ -2495,7 +2487,7 @@ right order without actually intervening in the CPU.  Since there's only one
 CPU, that CPU's dependency ordering logic will take care of everything else.
 
 
-ATOMIC OPERATIONS
+Atomic operations
 -----------------
 
 Whilst they are technically interprocessor interaction considerations, atomic
@@ -2506,7 +2498,7 @@ kernel.
 Any atomic operation that modifies some state in memory and returns information
 about the state (old or new) implies an SMP-conditional general memory barrier
 (smp_mb()) on each side of the actual operation (with the exception of
-explicit lock operations, described later).  These include:
+explicit lock operations, described later).  These include::
 
 	xchg();
 	atomic_xchg();			atomic_long_xchg();
@@ -2534,7 +2526,7 @@ such the implicit memory barrier effects are necessary.
 
 The following operations are potential problems as they do _not_ imply memory
 barriers, but might be used for implementing such things as RELEASE-class
-operations:
+operations::
 
 	atomic_set();
 	set_bit();
@@ -2547,7 +2539,7 @@ With these the appropriate explicit memory barrier should be used if necessary
 
 The following also do _not_ imply memory barriers, and so may require explicit
 memory barriers under some circumstances (smp_mb__before_atomic() for
-instance):
+instance)::
 
 	atomic_add();
 	atomic_sub();
@@ -2569,7 +2561,7 @@ specific order.
 Basically, each usage case has to be carefully considered as to whether memory
 barriers are needed or not.
 
-The following operations are special locking primitives:
+The following operations are special locking primitives::
 
 	test_and_set_bit_lock();
 	clear_bit_unlock();
@@ -2587,7 +2579,7 @@ and in such cases the special barrier primitives will be no-ops.
 See Documentation/atomic_ops.txt for more information.
 
 
-ACCESSING DEVICES
+Accessing devices
 -----------------
 
 Many devices can be memory mapped, and so appear to the CPU as if they're just
@@ -2633,7 +2625,7 @@ handled, thus the interrupt handler does not need to lock against that.
 
 However, consider a driver that was talking to an ethernet card that sports an
 address register and a data register.  If that driver's core talks to the card
-under interrupt-disablement and then the driver's interrupt handler is invoked:
+under interrupt-disablement and then the driver's interrupt handler is invoked::
 
 	LOCAL IRQ DISABLE
 	writew(ADDR, 3);
@@ -2645,7 +2637,7 @@ under interrupt-disablement and then the driver's interrupt handler is invoked:
 	</interrupt>
 
 The store to the data register might happen after the second store to the
-address register if ordering rules are sufficiently relaxed:
+address register if ordering rules are sufficiently relaxed::
 
 	STORE *ADDR = 3, STORE *ADDR = 4, STORE *DATA = y, q = LOAD *DATA
 
@@ -2666,14 +2658,13 @@ running on separate CPUs that communicate with each other.  If such a case is
 likely, then interrupt-disabling locks should be used to guarantee ordering.
 
 
-==========================
-KERNEL I/O BARRIER EFFECTS
+Kernel I/O barrier effects
 ==========================
 
 When accessing I/O memory, drivers should use the appropriate accessor
 functions:
 
- (*) inX(), outX():
+ (#) inX(), outX():
 
      These are intended to talk to I/O space rather than memory space, but
      that's primarily a CPU-specific concept.  The i386 and x86_64 processors
@@ -2695,7 +2686,7 @@ functions:
      They are not guaranteed to be fully ordered with respect to other types of
      memory and I/O operation.
 
- (*) readX(), writeX():
+ (#) readX(), writeX():
 
      Whether these are guaranteed to be fully ordered and uncombined with
      respect to each other on the issuing CPU depends on the characteristics
@@ -2708,12 +2699,12 @@ functions:
 
      However, intermediary hardware (such as a PCI bridge) may indulge in
      deferral if it so wishes; to flush a store, a load from the same location
-     is preferred[*], but a load from the same device or from configuration
+     is preferred [#]_, but a load from the same device or from configuration
      space should suffice for PCI.
 
-     [*] NOTE! attempting to load from the same location as was written to may
-	 cause a malfunction - consider the 16550 Rx/Tx serial registers for
-	 example.
+     .. [#] NOTE! attempting to load from the same location as was written to may
+	    cause a malfunction - consider the 16550 Rx/Tx serial registers for
+	    example.
 
      Used with prefetchable I/O memory, an mmiowb() barrier may be required to
      force stores to be ordered.
@@ -2721,7 +2712,7 @@ functions:
      Please refer to the PCI specification for more information on interactions
      between PCI transactions.
 
- (*) readX_relaxed(), writeX_relaxed()
+ (#) readX_relaxed(), writeX_relaxed()
 
      These are similar to readX() and writeX(), but provide weaker memory
      ordering guarantees.  Specifically, they do not guarantee ordering with
@@ -2731,14 +2722,13 @@ functions:
      the same peripheral are guaranteed to be ordered with respect to each
      other.
 
- (*) ioreadX(), iowriteX()
+ (#) ioreadX(), iowriteX()
 
      These will perform appropriately for the type of access they're actually
      doing, be it inX()/outX() or readX()/writeX().
 
 
-========================================
-ASSUMED MINIMUM EXECUTION ORDERING MODEL
+Assumed minimum execution ordering model
 ========================================
 
 It has to be assumed that the conceptual CPU is weakly-ordered but that it will
@@ -2750,13 +2740,13 @@ of arch-specific code.
 This means that it must be considered that the CPU will execute its instruction
 stream in any order it feels like - or even in parallel - provided that if an
 instruction in the stream depends on an earlier instruction, then that
-earlier instruction must be sufficiently complete[*] before the later
+earlier instruction must be sufficiently complete [#]_ before the later
 instruction may proceed; in other words: provided that the appearance of
 causality is maintained.
 
- [*] Some instructions have more than one effect - such as changing the
-     condition codes, changing registers or changing memory - and different
-     instructions may depend on different effects.
+ .. [#] Some instructions have more than one effect - such as changing the
+        condition codes, changing registers or changing memory - and different
+        instructions may depend on different effects.
 
 A CPU may also discard any instruction sequence that winds up having no
 ultimate effect.  For example, if two adjacent instructions both load an
@@ -2768,8 +2758,7 @@ stream in any way it sees fit, again provided the appearance of causality is
 maintained.
 
 
-============================
-THE EFFECTS OF THE CPU CACHE
+The effects of the CPU cache
 ============================
 
 The way cached memory operations are perceived across the system is affected to
@@ -2779,7 +2768,7 @@ memory coherence system that maintains the consistency of state in the system.
 As far as the way a CPU interacts with another part of the system through the
 caches goes, the memory system has to include the CPU's caches, and memory
 barriers for the most part act at the interface between the CPU and its cache
-(memory barriers logically act on the dotted line in the following diagram):
+(memory barriers logically act on the dotted line in the following diagram)::
 
 	    <--- CPU --->         :       <----------- Memory ----------->
 	                          :
@@ -2829,7 +2818,7 @@ the properties of the memory window through which devices are accessed and/or
 the use of any special device communication instructions the CPU may have.
 
 
-CACHE COHERENCY
+Cache coherency
 ---------------
 
 Life isn't quite as simple as it may appear above, however: for while the
@@ -2840,7 +2829,7 @@ become apparent in the same order on those other CPUs.
 
 
 Consider dealing with a system that has a pair of CPUs (1 & 2), each of which
-has a pair of parallel data caches (CPU 1 has A/B, and CPU 2 has C/D):
+has a pair of parallel data caches (CPU 1 has A/B, and CPU 2 has C/D)::
 
 	            :
 	            :                          +--------+
@@ -2864,26 +2853,26 @@ has a pair of parallel data caches (CPU 1 has A/B, and CPU 2 has C/D):
 
 Imagine the system has the following properties:
 
- (*) an odd-numbered cache line may be in cache A, cache C or it may still be
+ (#) an odd-numbered cache line may be in cache A, cache C or it may still be
      resident in memory;
 
- (*) an even-numbered cache line may be in cache B, cache D or it may still be
+ (#) an even-numbered cache line may be in cache B, cache D or it may still be
      resident in memory;
 
- (*) whilst the CPU core is interrogating one cache, the other cache may be
+ (#) whilst the CPU core is interrogating one cache, the other cache may be
      making use of the bus to access the rest of the system - perhaps to
      displace a dirty cacheline or to do a speculative load;
 
- (*) each cache has a queue of operations that need to be applied to that cache
+ (#) each cache has a queue of operations that need to be applied to that cache
      to maintain coherency with the rest of the system;
 
- (*) the coherency queue is not flushed by normal loads to lines already
+ (#) the coherency queue is not flushed by normal loads to lines already
      present in the cache, even though the contents of the queue may
      potentially affect those loads.
 
 Imagine, then, that two writes are made on the first CPU, with a write barrier
 between them to guarantee that they will appear to reach that CPU's caches in
-the requisite order:
+the requisite order::
 
 	CPU 1		CPU 2		COMMENT
 	===============	===============	=======================================
@@ -2897,7 +2886,7 @@ the requisite order:
 
 The write memory barrier forces the other CPUs in the system to perceive that
 the local CPU's caches have apparently been updated in the correct order.  But
-now imagine that the second CPU wants to read those values:
+now imagine that the second CPU wants to read those values::
 
 	CPU 1		CPU 2		COMMENT
 	===============	===============	=======================================
@@ -2908,7 +2897,7 @@ now imagine that the second CPU wants to read those values:
 The above pair of reads may then fail to happen in the expected order, as the
 cacheline holding p may get updated in one of the second CPU's caches whilst
 the update to the cacheline holding v is delayed in the other of the second
-CPU's caches by some other cache event:
+CPU's caches by some other cache event::
 
 	CPU 1		CPU 2		COMMENT
 	===============	===============	=======================================
@@ -2933,7 +2922,7 @@ as that committed on CPU 1.
 
 To intervene, we need to interpolate a data dependency barrier or a read
 barrier between the loads.  This will force the cache to commit its coherency
-queue before processing any further requests:
+queue before processing any further requests::
 
 	CPU 1		CPU 2		COMMENT
 	===============	===============	=======================================
@@ -2963,7 +2952,7 @@ cachelets for normal memory accesses.  The semantics of the Alpha removes the
 need for coordination in the absence of memory barriers.
 
 
-CACHE COHERENCY VS DMA
+Cache coherency vs DMA
 ----------------------
 
 Not all systems maintain cache coherency with respect to devices doing DMA.  In
@@ -2984,7 +2973,7 @@ cache on each CPU.
 See Documentation/cachetlb.txt for more information on cache management.
 
 
-CACHE COHERENCY VS MMIO
+Cache coherency vs MMIO
 -----------------------
 
 Memory mapped I/O usually takes place through memory locations that are part of
@@ -2999,13 +2988,12 @@ flushed between the cached memory write and the MMIO access if the two are in
 any way dependent.
 
 
-=========================
-THE THINGS CPUS GET UP TO
+The things CPUs get up to
 =========================
 
 A programmer might take it for granted that the CPU will perform memory
 operations in exactly the order specified, so that if the CPU is, for example,
-given the following piece of code to execute:
+given the following piece of code to execute::
 
 	a = READ_ONCE(*A);
 	WRITE_ONCE(*B, b);
@@ -3015,7 +3003,7 @@ given the following piece of code to execute:
 
 they would then expect that the CPU will complete the memory operation for each
 instruction before moving on to the next one, leading to a definite sequence of
-operations as seen by external observers in the system:
+operations as seen by external observers in the system::
 
 	LOAD *A, STORE *B, LOAD *C, LOAD *D, STORE *E.
 
@@ -3023,31 +3011,31 @@ operations as seen by external observers in the system:
 Reality is, of course, much messier.  With many CPUs and compilers, the above
 assumption doesn't hold because:
 
- (*) loads are more likely to need to be completed immediately to permit
+ (#) loads are more likely to need to be completed immediately to permit
      execution progress, whereas stores can often be deferred without a
      problem;
 
- (*) loads may be done speculatively, and the result discarded should it prove
+ (#) loads may be done speculatively, and the result discarded should it prove
      to have been unnecessary;
 
- (*) loads may be done speculatively, leading to the result having been fetched
+ (#) loads may be done speculatively, leading to the result having been fetched
      at the wrong time in the expected sequence of events;
 
- (*) the order of the memory accesses may be rearranged to promote better use
+ (#) the order of the memory accesses may be rearranged to promote better use
      of the CPU buses and caches;
 
- (*) loads and stores may be combined to improve performance when talking to
+ (#) loads and stores may be combined to improve performance when talking to
      memory or I/O hardware that can do batched accesses of adjacent locations,
      thus cutting down on transaction setup costs (memory and PCI devices may
      both be able to do this); and
 
- (*) the CPU's data cache may affect the ordering, and whilst cache-coherency
+ (#) the CPU's data cache may affect the ordering, and whilst cache-coherency
      mechanisms may alleviate this - once the store has actually hit the cache
      - there's no guarantee that the coherency management will be propagated in
      order to other CPUs.
 
 So what another CPU, say, might actually observe from the above piece of code
-is:
+is::
 
 	LOAD *A, ..., LOAD {*C,*D}, STORE *E, STORE *B
 
@@ -3056,7 +3044,7 @@ is:
 
 However, it is guaranteed that a CPU will be self-consistent: it will see its
 _own_ accesses appear to be correctly ordered, without the need for a memory
-barrier.  For instance with the following code:
+barrier.  For instance with the following code::
 
 	U = READ_ONCE(*A);
 	WRITE_ONCE(*A, V);
@@ -3066,7 +3054,7 @@ barrier.  For instance with the following code:
 	Z = READ_ONCE(*A);
 
 and assuming no intervention by an external influence, it can be assumed that
-the final result will appear to be:
+the final result will appear to be::
 
 	U == the original value of *A
 	X == W
@@ -3074,7 +3062,7 @@ the final result will appear to be:
 	*A == Y
 
 The code above may cause the CPU to generate the full sequence of memory
-accesses:
+accesses::
 
 	U=LOAD *A, STORE *A=V, STORE *A=W, X=LOAD *A, STORE *A=Y, Z=LOAD *A
 
@@ -3091,23 +3079,23 @@ and st.rel instructions (respectively) that prevent such reordering.
 The compiler may also combine, discard or defer elements of the sequence before
 the CPU even sees them.
 
-For instance:
+For instance::
 
 	*A = V;
 	*A = W;
 
-may be reduced to:
+may be reduced to::
 
 	*A = W;
 
 since, without either a write barrier or an WRITE_ONCE(), it can be
-assumed that the effect of the storage of V to *A is lost.  Similarly:
+assumed that the effect of the storage of V to *A is lost.  Similarly::
 
 	*A = Y;
 	Z = *A;
 
 may, without a memory barrier or an READ_ONCE() and WRITE_ONCE(), be
-reduced to:
+reduced to::
 
 	*A = Y;
 	Z = Y;
@@ -3115,7 +3103,7 @@ reduced to:
 and the LOAD operation never appear outside of the CPU.
 
 
-AND THEN THERE'S THE ALPHA
+And then there's the Alpha
 --------------------------
 
 The DEC Alpha CPU is one of the most relaxed CPUs there is.  Not only that,
@@ -3130,7 +3118,7 @@ The Alpha defines the Linux kernel's memory barrier model.
 See the subsection on "Cache Coherency" above.
 
 
-VIRTUAL MACHINE GUESTS
+Virtual machine guests
 ----------------------
 
 Guests running within virtual machines might be affected by SMP effects even if
@@ -3149,11 +3137,10 @@ in particular, they do not control MMIO effects: to control
 MMIO effects, use mandatory barriers.
 
 
-============
-EXAMPLE USES
+Example uses
 ============
 
-CIRCULAR BUFFERS
+Circular buffers
 ----------------
 
 Memory barriers can be used to implement circular buffering without the need
@@ -3164,58 +3151,69 @@ of a lock to serialise the producer with the consumer.  See:
 for details.
 
 
-==========
-REFERENCES
+
+References
 ==========
 
 Alpha AXP Architecture Reference Manual, Second Edition (Sites & Witek,
 Digital Press)
-	Chapter 5.2: Physical Address Space Characteristics
-	Chapter 5.4: Caches and Write Buffers
-	Chapter 5.5: Data Sharing
-	Chapter 5.6: Read/Write Ordering
+
+	- Chapter 5.2: Physical Address Space Characteristics
+	- Chapter 5.4: Caches and Write Buffers
+	- Chapter 5.5: Data Sharing
+	- Chapter 5.6: Read/Write Ordering
 
 AMD64 Architecture Programmer's Manual Volume 2: System Programming
-	Chapter 7.1: Memory-Access Ordering
-	Chapter 7.4: Buffering and Combining Memory Writes
+
+	- Chapter 7.1: Memory-Access Ordering
+	- Chapter 7.4: Buffering and Combining Memory Writes
 
 IA-32 Intel Architecture Software Developer's Manual, Volume 3:
 System Programming Guide
-	Chapter 7.1: Locked Atomic Operations
-	Chapter 7.2: Memory Ordering
-	Chapter 7.4: Serializing Instructions
+
+	- Chapter 7.1: Locked Atomic Operations
+	- Chapter 7.2: Memory Ordering
+	- Chapter 7.4: Serializing Instructions
 
 The SPARC Architecture Manual, Version 9
-	Chapter 8: Memory Models
-	Appendix D: Formal Specification of the Memory Models
-	Appendix J: Programming with the Memory Models
+
+	- Chapter 8: Memory Models
+	- Appendix D: Formal Specification of the Memory Models
+	- Appendix J: Programming with the Memory Models
 
 UltraSPARC Programmer Reference Manual
-	Chapter 5: Memory Accesses and Cacheability
-	Chapter 15: Sparc-V9 Memory Models
+
+	- Chapter 5: Memory Accesses and Cacheability
+	- Chapter 15: Sparc-V9 Memory Models
 
 UltraSPARC III Cu User's Manual
-	Chapter 9: Memory Models
+
+	- Chapter 9: Memory Models
 
 UltraSPARC IIIi Processor User's Manual
-	Chapter 8: Memory Models
+
+	- Chapter 8: Memory Models
 
 UltraSPARC Architecture 2005
-	Chapter 9: Memory
-	Appendix D: Formal Specifications of the Memory Models
+
+	- Chapter 9: Memory
+	- Appendix D: Formal Specifications of the Memory Models
 
 UltraSPARC T1 Supplement to the UltraSPARC Architecture 2005
-	Chapter 8: Memory Models
-	Appendix F: Caches and Cache Coherency
+
+	- Chapter 8: Memory Models
+	- Appendix F: Caches and Cache Coherency
 
 Solaris Internals, Core Kernel Architecture, p63-68:
-	Chapter 3.3: Hardware Considerations for Locks and
-			Synchronization
+
+	- Chapter 3.3: Hardware Considerations for Locks and Synchronization
 
 Unix Systems for Modern Architectures, Symmetric Multiprocessing and Caching
 for Kernel Programmers:
-	Chapter 13: Other Memory Models
+
+	- Chapter 13: Other Memory Models
 
 Intel Itanium Architecture Software Developer's Manual: Volume 1:
-	Section 2.6: Speculation
-	Section 4.4: Memory Access
+
+	- Section 2.6: Speculation
+	- Section 4.4: Memory Access
-- 
2.9.4
