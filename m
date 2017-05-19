Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWfG-0005jy-Ji
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:25:13 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH 19/30] memory-barriers.txt: use literals for variables
Date: Thu, 18 May 2017 22:24:11 -0300
Message-Id: <49c7957e1dc7c80a1b25dcb80072d5130c06c3fa.1495156975.git.mchehab@s-opensource.com>
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

From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

The minimal adjustments on this file were not enough
to make it build clean with Sphinx:

  Documentation/memory-barriers.rst:192: WARNING: Inline emphasis start-string without end-string.
  Documentation/memory-barriers.rst:603: WARNING: Inline emphasis start-string without end-string.
  Documentation/memory-barriers.rst:1065: WARNING: Inline emphasis start-string without end-string.
  Documentation/memory-barriers.rst:1068: WARNING: Inline emphasis start-string without end-string.
  Documentation/memory-barriers.rst:2289: WARNING: Inline emphasis start-string without end-string.
  Documentation/memory-barriers.rst:2289: WARNING: Inline emphasis start-string without end-string.
  Documentation/memory-barriers.rst:3091: WARNING: Inline emphasis start-string without end-string.

What happens there is that, while some vars are inside
'var' or `var`, most of them aren't, and some start with
asterisk.

Standardize it by always use ``literal``. As a bonus,
the output will use the same monospaced fonts as the
literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/memory-barriers.txt | 154 +++++++++++++++++++-------------------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
index f37b418b3022..df3438ba49c6 100644
--- a/Documentation/memory-barriers.txt
+++ b/Documentation/memory-barriers.txt
@@ -181,16 +181,16 @@ As a further example, consider this sequence of events::
 	B = 4;		Q = P;
 	P = &B		D = *Q;
 
-There is an obvious data dependency here, as the value loaded into D depends on
-the address retrieved from P by CPU 2.  At the end of the sequence, any of the
+There is an obvious data dependency here, as the value loaded into ``D`` depends on
+the address retrieved from ``P`` by CPU 2.  At the end of the sequence, any of the
 following results are possible::
 
 	(Q == &A) and (D == 1)
 	(Q == &B) and (D == 2)
 	(Q == &B) and (D == 4)
 
-Note that CPU 2 will never try and load C into D because the CPU will load P
-into Q before issuing the load of *Q.
+Note that CPU 2 will never try and load ``C`` into ``D`` because the CPU will load ``P``
+into ``Q`` before issuing the load of ``*Q``.
 
 
 Device operations
@@ -199,8 +199,8 @@ Device operations
 Some devices present their control interfaces as collections of memory
 locations, but the order in which the control registers are accessed is very
 important.  For instance, imagine an ethernet card with a set of internal
-registers that are accessed through an address port register (A) and a data
-port register (D).  To read internal register 5, the following code might then
+registers that are accessed through an address port register (``A``) and a data
+port register (``D``).  To read internal register 5, the following code might then
 be used::
 
 	*A = 5;
@@ -558,12 +558,12 @@ following sequence of events::
 			      D = *Q;
 
 There's a clear data dependency here, and it would seem that by the end of the
-sequence, Q must be either &A or &B, and that::
+sequence, ``Q`` must be either ``&A`` or ``&B``, and that::
 
 	(Q == &A) implies (D == 1)
 	(Q == &B) implies (D == 4)
 
-But!  CPU 2's perception of P may be updated _before_ its perception of B, thus
+But!  CPU 2's perception of ``P`` may be updated _before_ its perception of ``B``, thus
 leading to the following situation::
 
 	(Q == &B) and (D == 2) ????
@@ -600,8 +600,8 @@ A data-dependency barrier must also order against dependent writes::
 			      <data dependency barrier>
 			      *Q = 5;
 
-The data-dependency barrier must order the read into Q with the store
-into *Q.  This prohibits this outcome::
+The data-dependency barrier must order the read into ``Q`` with the store
+into ``*Q``.  This prohibits this outcome::
 
 	(Q == &B) && (B == 4)
 
@@ -615,11 +615,11 @@ prevents such records from being lost.
 [!] Note that this extremely counterintuitive situation arises most easily on
 machines with split caches, so that, for example, one cache bank processes
 even-numbered cache lines and the other bank processes odd-numbered cache
-lines.  The pointer P might be stored in an odd-numbered cache line, and the
-variable B might be stored in an even-numbered cache line.  Then, if the
+lines.  The pointer ``P`` might be stored in an odd-numbered cache line, and the
+variable ``B`` might be stored in an even-numbered cache line.  Then, if the
 even-numbered bank of the reading CPU's cache is extremely busy while the
-odd-numbered bank is idle, one can see the new value of the pointer P (&B),
-but the old value of the variable B (2).
+odd-numbered bank is idle, one can see the new value of the pointer ``P`` (``&B``),
+but the old value of the variable ``B`` (2).
 
 
 The data dependency barrier is very important to the RCU system,
@@ -651,7 +651,7 @@ following bit of code::
 This will not have the desired effect because there is no actual data
 dependency, but rather a control dependency that the CPU may short-circuit
 by attempting to predict the outcome in advance, so that other CPUs see
-the load from b as having happened before the load from a.  In such a
+the load from ``b`` as having happened before the load from ``a``.  In such a
 case what's actually required is::
 
 	q = READ_ONCE(a);
@@ -671,12 +671,12 @@ for load-store control dependencies, as in the following example::
 Control dependencies pair normally with other types of barriers.
 That said, please note that neither READ_ONCE() nor WRITE_ONCE()
 are optional! Without the READ_ONCE(), the compiler might combine the
-load from 'a' with other loads from 'a'.  Without the WRITE_ONCE(),
-the compiler might combine the store to 'b' with other stores to 'b'.
+load from ``a`` with other loads from ``a``.  Without the WRITE_ONCE(),
+the compiler might combine the store to ``b`` with other stores to ``b``.
 Either can result in highly counterintuitive effects on ordering.
 
 Worse yet, if the compiler is able to prove (say) that the value of
-variable 'a' is always non-zero, it would be well within its rights
+variable ``a`` is always non-zero, it would be well within its rights
 to optimize the original example by eliminating the "if" statement
 as follows::
 
@@ -713,8 +713,8 @@ optimization levels::
 		do_something_else();
 	}
 
-Now there is no conditional between the load from 'a' and the store to
-'b', which means that the CPU is within its rights to reorder them:
+Now there is no conditional between the load from ``a`` and the store to
+``b``, which means that the CPU is within its rights to reorder them:
 The conditional is absolutely required, and must be present in the
 assembly code even after all compiler optimizations have been applied.
 Therefore, if you need ordering in this example, you need explicit
@@ -742,9 +742,9 @@ ordering is guaranteed only when the stores differ, for example::
 	}
 
 The initial READ_ONCE() is still required to prevent the compiler from
-proving the value of 'a'.
+proving the value of ``a``.
 
-In addition, you need to be careful what you do with the local variable 'q',
+In addition, you need to be careful what you do with the local variable ``q``,
 otherwise the compiler might be able to guess the value and again remove
 the needed conditional.  For example::
 
@@ -757,7 +757,7 @@ the needed conditional.  For example::
 		do_something_else();
 	}
 
-If MAX is defined to be 1, then the compiler knows that (q % MAX) is
+If MAX is defined to be 1, then the compiler knows that ``(q % MAX)`` is
 equal to zero, in which case the compiler is within its rights to
 transform the above code into the following::
 
@@ -766,7 +766,7 @@ transform the above code into the following::
 	do_something_else();
 
 Given this transformation, the CPU is not required to respect the ordering
-between the load from variable 'a' and the store to variable 'b'.  It is
+between the load from variable ``a`` and the store to variable ``b``.  It is
 tempting to add a barrier(), but this does not help.  The conditional
 is gone, and the barrier won't bring it back.  Therefore, if you are
 relying on this ordering, you should make sure that MAX is greater than
@@ -782,7 +782,7 @@ one, perhaps as follows::
 		do_something_else();
 	}
 
-Please note once again that the stores to 'b' differ.  If they were
+Please note once again that the stores to ``b`` differ.  If they were
 identical, as noted earlier, the compiler could pull this store outside
 of the 'if' statement.
 
@@ -819,8 +819,8 @@ not necessarily apply to code following the if-statement::
 
 It is tempting to argue that there in fact is ordering because the
 compiler cannot reorder volatile accesses and also cannot reorder
-the writes to 'b' with the condition.  Unfortunately for this line
-of reasoning, the compiler might compile the two writes to 'b' as
+the writes to ``b`` with the condition.  Unfortunately for this line
+of reasoning, the compiler might compile the two writes to ``b`` as
 conditional-move instructions, as in this fanciful pseudo-assembly
 language::
 
@@ -832,7 +832,7 @@ language::
 	st $1,c
 
 A weakly ordered CPU would have no dependency of any sort between the load
-from 'a' and the store to 'c'.  The control dependencies would extend
+from ``a`` and the store to ``c``.  The control dependencies would extend
 only to the pair of cmov instructions and the store depending on them.
 In short, control dependencies apply only to the stores in the then-clause
 and else-clause of the if-statement in question (including functions
@@ -840,7 +840,7 @@ invoked by those two clauses), not to code following that if-statement.
 
 Finally, control dependencies do -not- provide transitivity.  This is
 demonstrated by two related examples, with the initial values of
-'x' and 'y' both being zero::
+``x`` and ``y`` both being zero::
 
 	CPU 0                     CPU 1
 	=======================   =======================
@@ -994,9 +994,9 @@ Consider the following sequence of events::
 	STORE E = 5
 
 This sequence of events is committed to the memory coherence system in an order
-that the rest of the system might perceive as the unordered set of { STORE A,
-STORE B, STORE C } all occurring before the unordered set of { STORE D, STORE E
-}::
+that the rest of the system might perceive as the unordered set of ``{ STORE A,
+STORE B, STORE C }`` all occurring before the unordered set of ``{ STORE D, STORE E
+}``::
 
 	+-------+       :      :
 	|       |       +------+
@@ -1062,11 +1062,11 @@ effectively random order, despite the write barrier issued by CPU 1::
 	                                        :       :
 
 
-In the above example, CPU 2 perceives that B is 7, despite the load of *C
-(which would be B) coming after the LOAD of C.
+In the above example, CPU 2 perceives that ``B`` is 7, despite the load of ``*C``
+(which would be ``B``) coming after the LOAD of ``C``.
 
-If, however, a data dependency barrier were to be placed between the load of C
-and the load of *C (ie: B) on CPU 2::
+If, however, a data dependency barrier were to be placed between the load of ``C``
+and the load of ``*C`` (ie: ``B``) on CPU 2::
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -1142,8 +1142,8 @@ some effectively random order, despite the write barrier issued by CPU 1::
 	                                        :       :
 
 
-If, however, a read barrier were to be placed between the load of B and the
-load of A on CPU 2::
+If, however, a read barrier were to be placed between the load of ``B`` and the
+load of ``A`` on CPU 2::
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -1179,7 +1179,7 @@ then the partial ordering imposed by CPU 1 will be perceived correctly by CPU
 
 
 To illustrate this more completely, consider what could happen if the code
-contained a load of A either side of the read barrier::
+contained a load of ``A`` either side of the read barrier::
 
 	CPU 1			CPU 2
 	=======================	=======================
@@ -1192,7 +1192,7 @@ contained a load of A either side of the read barrier::
 				<read barrier>
 				LOAD A [second load of A]
 
-Even though the two loads of A both occur after the load of B, they may both
+Even though the two loads of ``A`` both occur after the load of ``B``, they may both
 come up with different values::
 
 	+-------+       :      :                :       :
@@ -1218,7 +1218,7 @@ come up with different values::
 	                                        :       :       +-------+
 
 
-But it may be that the update to A from CPU 1 becomes perceptible to CPU 2
+But it may be that the update to ``A`` from CPU 1 becomes perceptible to CPU 2
 before the read barrier completes anyway::
 
 	+-------+       :      :                :       :
@@ -1244,9 +1244,9 @@ before the read barrier completes anyway::
 	                                        :       :       +-------+
 
 
-The guarantee is that the second load will always come up with A == 1 if the
-load of B came up with B == 2.  No such guarantee exists for the first load of
-A; that may come up with either A == 0 or A == 1.
+The guarantee is that the second load will always come up with ``A`` == 1 if the
+load of ``B`` came up with ``B`` == 2.  No such guarantee exists for the first load of
+``A``; that may come up with either ``A`` == 0 or ``A`` == 1.
 
 
 Read memory barriers vs load speculation
@@ -1360,21 +1360,21 @@ demonstrates transitivity::
 				<general barrier>	<general barrier>
 				LOAD Y			LOAD X
 
-Suppose that CPU 2's load from X returns 1 and its load from Y returns 0.
-This indicates that CPU 2's load from X in some sense follows CPU 1's
-store to X and that CPU 2's load from Y in some sense preceded CPU 3's
-store to Y.  The question is then "Can CPU 3's load from X return 0?"
+Suppose that CPU 2's load from ``X`` returns 1 and its load from ``Y`` returns 0.
+This indicates that CPU 2's load from ``X`` in some sense follows CPU 1's
+store to ``X`` and that CPU 2's load from ``Y`` in some sense preceded CPU 3's
+store to ``Y``.  The question is then "Can CPU 3's load from ``X`` return 0?"
 
-Because CPU 2's load from X in some sense came after CPU 1's store, it
-is natural to expect that CPU 3's load from X must therefore return 1.
+Because CPU 2's load from ``X`` in some sense came after CPU 1's store, it
+is natural to expect that CPU 3's load from ``X`` must therefore return 1.
 This expectation is an example of transitivity: if a load executing on
 CPU A follows a load from the same variable executing on CPU B, then
 CPU A's load must either return the same value that CPU B's load did,
 or must return some later value.
 
 In the Linux kernel, use of general memory barriers guarantees
-transitivity.  Therefore, in the above example, if CPU 2's load from X
-returns 1 and its load from Y returns 0, then CPU 3's load from X must
+transitivity.  Therefore, in the above example, if CPU 2's load from ``X``
+returns 1 and its load from ``Y`` returns 0, then CPU 3's load from ``X`` must
 also return 1.
 
 However, transitivity is -not- guaranteed for read or write barriers.
@@ -1389,8 +1389,8 @@ is changed to a read barrier as shown below::
 				LOAD Y			LOAD X
 
 This substitution destroys transitivity: in this example, it is perfectly
-legal for CPU 2's load from X to return 1, its load from Y to return 0,
-and CPU 3's load from X to return 0.
+legal for CPU 2's load from ``X`` to return 1, its load from ``Y`` to return 0,
+and CPU 3's load from ``X`` to return 0.
 
 The key point is that although CPU 2's read barrier orders its pair
 of loads, it does not guarantee to order CPU 1's store.  Therefore, if
@@ -1530,7 +1530,7 @@ of optimizations:
 	a[0] = x;
 	a[1] = x;
 
-     Might result in an older value of x stored in a[1] than in a[0].
+     Might result in an older value of ``x`` stored in ``a[1]`` than in ``a[0]``.
      Prevent both the compiler and the CPU from doing this as follows::
 
 	a[0] = READ_ONCE(x);
@@ -1562,7 +1562,7 @@ of optimizations:
  (#) The compiler is within its rights to reload a variable, for example,
      in cases where high register pressure prevents the compiler from
      keeping all data of interest in registers.  The compiler might
-     therefore optimize the variable 'tmp' out of our previous example::
+     therefore optimize the variable ``tmp`` out of our previous example::
 
 	while (tmp = a)
 		do_something_with(tmp);
@@ -1591,7 +1591,7 @@ of optimizations:
 
  (#) The compiler is within its rights to omit a load entirely if it knows
      what the value will be.  For example, if the compiler can prove that
-     the value of variable 'a' is always zero, it can optimize this code::
+     the value of variable ``a`` is always zero, it can optimize this code::
 
 	while (tmp = a)
 		do_something_with(tmp);
@@ -1603,7 +1603,7 @@ of optimizations:
      This transformation is a win for single-threaded code because it
      gets rid of a load and a branch.  The problem is that the compiler
      will carry out its proof assuming that the current CPU is the only
-     one updating variable 'a'.  If variable 'a' is shared, then the
+     one updating variable ``a``.  If variable ``a`` is shared, then the
      compiler's proof will be erroneous.  Use READ_ONCE() to tell the
      compiler that it doesn't know as much as it thinks it does::
 
@@ -1620,7 +1620,7 @@ of optimizations:
      Then the compiler knows that the result of the "%" operator applied
      to MAX will always be zero, again allowing the compiler to optimize
      the code into near-nonexistence.  (It will still load from the
-     variable 'a'.)
+     variable ``a``.)
 
  (#) Similarly, the compiler is within its rights to omit a store entirely
      if it knows that the variable already has the value being stored.
@@ -1633,9 +1633,9 @@ of optimizations:
 	... Code that does not store to variable a ...
 	a = 0;
 
-     The compiler sees that the value of variable 'a' is already zero, so
+     The compiler sees that the value of variable ``a`` is already zero, so
      it might well omit the second store.  This would come as a fatal
-     surprise if some other CPU might have stored to variable 'a' in the
+     surprise if some other CPU might have stored to variable ``a`` in the
      meantime.
 
      Use WRITE_ONCE() to prevent the compiler from making this sort of
@@ -1689,7 +1689,7 @@ of optimizations:
 
      Note that the READ_ONCE() and WRITE_ONCE() wrappers in
      interrupt_handler() are needed if this interrupt handler can itself
-     be interrupted by something that also accesses 'flag' and 'msg',
+     be interrupted by something that also accesses ``flag`` and ``msg``,
      for example, a nested interrupt or an NMI.  Otherwise, READ_ONCE()
      and WRITE_ONCE() are not needed in interrupt_handler() other than
      for documentation purposes.  (Note also that nested interrupts
@@ -1727,7 +1727,7 @@ of optimizations:
      In single-threaded code, this is not only safe, but also saves
      a branch.  Unfortunately, in concurrent code, this optimization
      could cause some other CPU to see a spurious value of 42 -- even
-     if variable 'a' was never zero -- when loading variable 'b'.
+     if variable ``a`` was never zero -- when loading variable ``b``.
      Use WRITE_ONCE() to prevent this as follows::
 
 	if (a)
@@ -1779,7 +1779,7 @@ of optimizations:
      volatile markings, the compiler would be well within its rights to
      implement these three assignment statements as a pair of 32-bit
      loads followed by a pair of 32-bit stores.  This would result in
-     load tearing on 'foo1.b' and store tearing on 'foo2.b'.  READ_ONCE()
+     load tearing on ``foo1.b`` and store tearing on ``foo2.b``.  READ_ONCE()
      and WRITE_ONCE() again prevent tearing in this example::
 
 	foo2.a = foo1.a;
@@ -1788,7 +1788,7 @@ of optimizations:
 
 All that aside, it is never necessary to use READ_ONCE() and
 WRITE_ONCE() on a variable that has been marked volatile.  For example,
-because 'jiffies' is marked volatile, it is never necessary to
+because ``jiffies`` is marked volatile, it is never necessary to
 say READ_ONCE(jiffies).  The reason for this is that READ_ONCE() and
 WRITE_ONCE() are implemented as volatile casts, which has no effect when
 its argument is already marked volatile.
@@ -1816,12 +1816,12 @@ All memory barriers except the data dependency barriers imply a compiler
 barrier.  Data dependencies do not impose any additional compiler ordering.
 
 Aside: In the case of data dependencies, the compiler would be expected
-to issue the loads in the correct order (eg. `a[b]` would have to load
-the value of b before loading a[b]), however there is no guarantee in
-the C specification that the compiler may not speculate the value of b
-(eg. is equal to 1) and load a before b (eg. tmp = a[1]; if (b != 1)
-tmp = a[b]; ).  There is also the problem of a compiler reloading b after
-having loaded a[b], thus having a newer copy of b than a[b].  A consensus
+to issue the loads in the correct order (eg. ``a[b]`` would have to load
+the value of ``b`` before loading ``a[b]``), however there is no guarantee in
+the C specification that the compiler may not speculate the value of ``b``
+(eg. is equal to 1) and load ``a`` before ``b`` (eg. ``tmp`` = ``a[1]``; if (``b`` != 1)
+``tmp = ``a[b]``; ).  There is also the problem of a compiler reloading b after
+having loaded ``a[b]``, thus having a newer copy of ``b`` than ``a[b]``.  A consensus
 has not yet been reached about these problems, however the READ_ONCE()
 macro is a good place to start looking.
 
@@ -2197,7 +2197,7 @@ events, where X and Y are both initially zero::
 	wake_up();			  load from Y sees 1, no memory barrier
 					load from X might see 0
 
-In contrast, if a wakeup does occur, CPU 2's load from X would be guaranteed
+In contrast, if a wakeup does occur, CPU 2's load from ``X`` would be guaranteed
 to see 1.
 
 The available waker functions include::
@@ -2274,7 +2274,7 @@ conflict on any particular lock.
 Acquires vs memory accesses
 ---------------------------
 
-Consider the following: the system has a pair of spinlocks (M) and (Q), and
+Consider the following: the system has a pair of spinlocks (``M``) and (``Q``), and
 three CPUs; then should the following sequence of events occur::
 
 	CPU 1				CPU 2
@@ -2286,8 +2286,8 @@ three CPUs; then should the following sequence of events occur::
 	RELEASE M			RELEASE Q
 	WRITE_ONCE(*D, d);		WRITE_ONCE(*H, h);
 
-Then there is no guarantee as to what order CPU 3 will see the accesses to *A
-through *H occur in, other than the constraints imposed by the separate locks
+Then there is no guarantee as to what order CPU 3 will see the accesses to ``*A``
+through ``*H`` occur in, other than the constraints imposed by the separate locks
 on the separate CPUs.  It might, for example, see::
 
 	*E, ACQUIRE M, ACQUIRE Q, *G, *C, *F, *A, *B, RELEASE Q, *D, *H, RELEASE M
@@ -2896,7 +2896,7 @@ now imagine that the second CPU wants to read those values::
 
 The above pair of reads may then fail to happen in the expected order, as the
 cacheline holding p may get updated in one of the second CPU's caches whilst
-the update to the cacheline holding v is delayed in the other of the second
+the update to the cacheline holding ``v`` is delayed in the other of the second
 CPU's caches by some other cache event::
 
 	CPU 1		CPU 2		COMMENT
@@ -3089,7 +3089,7 @@ may be reduced to::
 	*A = W;
 
 since, without either a write barrier or an WRITE_ONCE(), it can be
-assumed that the effect of the storage of V to *A is lost.  Similarly::
+assumed that the effect of the storage of ``V`` to ``*A`` is lost.  Similarly::
 
 	*A = Y;
 	Z = *A;
-- 
2.9.4
