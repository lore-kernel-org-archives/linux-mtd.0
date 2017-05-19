Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWpu-00078D-Uy
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:36:16 +0000
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
Subject: [PATCH 18/29] static-keys.txt: standardize document format
Date: Thu, 18 May 2017 22:26:02 -0300
Message-Id: <b3428067546db78470c8360c2b967c24baf50f85.1495157082.git.mchehab@s-opensource.com>
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
- Mark titles;
- Add a warning mark;
- Mark literals and literal blocks;
- Adjust identation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/static-keys.txt | 199 ++++++++++++++++++++++--------------------
 1 file changed, 104 insertions(+), 95 deletions(-)

diff --git a/Documentation/static-keys.txt b/Documentation/static-keys.txt
index ef419fd0897f..b83dfa1c0602 100644
--- a/Documentation/static-keys.txt
+++ b/Documentation/static-keys.txt
@@ -1,30 +1,34 @@
-			Static Keys
-			-----------
+===========
+Static Keys
+===========
 
-DEPRECATED API:
+.. warning::
 
-The use of 'struct static_key' directly, is now DEPRECATED. In addition
-static_key_{true,false}() is also DEPRECATED. IE DO NOT use the following:
+   DEPRECATED API:
 
-struct static_key false = STATIC_KEY_INIT_FALSE;
-struct static_key true = STATIC_KEY_INIT_TRUE;
-static_key_true()
-static_key_false()
+   The use of 'struct static_key' directly, is now DEPRECATED. In addition
+   static_key_{true,false}() is also DEPRECATED. IE DO NOT use the following::
 
-The updated API replacements are:
+	struct static_key false = STATIC_KEY_INIT_FALSE;
+	struct static_key true = STATIC_KEY_INIT_TRUE;
+	static_key_true()
+	static_key_false()
 
-DEFINE_STATIC_KEY_TRUE(key);
-DEFINE_STATIC_KEY_FALSE(key);
-DEFINE_STATIC_KEY_ARRAY_TRUE(keys, count);
-DEFINE_STATIC_KEY_ARRAY_FALSE(keys, count);
-static_branch_likely()
-static_branch_unlikely()
+   The updated API replacements are::
 
-0) Abstract
+	DEFINE_STATIC_KEY_TRUE(key);
+	DEFINE_STATIC_KEY_FALSE(key);
+	DEFINE_STATIC_KEY_ARRAY_TRUE(keys, count);
+	DEFINE_STATIC_KEY_ARRAY_FALSE(keys, count);
+	static_branch_likely()
+	static_branch_unlikely()
+
+Abstract
+========
 
 Static keys allows the inclusion of seldom used features in
 performance-sensitive fast-path kernel code, via a GCC feature and a code
-patching technique. A quick example:
+patching technique. A quick example::
 
 	DEFINE_STATIC_KEY_FALSE(key);
 
@@ -45,7 +49,8 @@ The static_branch_unlikely() branch will be generated into the code with as litt
 impact to the likely code path as possible.
 
 
-1) Motivation
+Motivation
+==========
 
 
 Currently, tracepoints are implemented using a conditional branch. The
@@ -60,7 +65,8 @@ possible. Although tracepoints are the original motivation for this work, other
 kernel code paths should be able to make use of the static keys facility.
 
 
-2) Solution
+Solution
+========
 
 
 gcc (v4.5) adds a new 'asm goto' statement that allows branching to a label:
@@ -71,7 +77,7 @@ Using the 'asm goto', we can create branches that are either taken or not taken
 by default, without the need to check memory. Then, at run-time, we can patch
 the branch site to change the branch direction.
 
-For example, if we have a simple branch that is disabled by default:
+For example, if we have a simple branch that is disabled by default::
 
 	if (static_branch_unlikely(&key))
 		printk("I am the true branch\n");
@@ -87,14 +93,15 @@ optimization.
 This lowlevel patching mechanism is called 'jump label patching', and it gives
 the basis for the static keys facility.
 
-3) Static key label API, usage and examples:
+Static key label API, usage and examples
+========================================
 
 
-In order to make use of this optimization you must first define a key:
+In order to make use of this optimization you must first define a key::
 
 	DEFINE_STATIC_KEY_TRUE(key);
 
-or:
+or::
 
 	DEFINE_STATIC_KEY_FALSE(key);
 
@@ -102,14 +109,14 @@ or:
 The key must be global, that is, it can't be allocated on the stack or dynamically
 allocated at run-time.
 
-The key is then used in code as:
+The key is then used in code as::
 
         if (static_branch_unlikely(&key))
                 do unlikely code
         else
                 do likely code
 
-Or:
+Or::
 
         if (static_branch_likely(&key))
                 do likely code
@@ -120,15 +127,15 @@ Keys defined via DEFINE_STATIC_KEY_TRUE(), or DEFINE_STATIC_KEY_FALSE, may
 be used in either static_branch_likely() or static_branch_unlikely()
 statements.
 
-Branch(es) can be set true via:
+Branch(es) can be set true via::
 
-static_branch_enable(&key);
+	static_branch_enable(&key);
 
-or false via:
+or false via::
 
-static_branch_disable(&key);
+	static_branch_disable(&key);
 
-The branch(es) can then be switched via reference counts:
+The branch(es) can then be switched via reference counts::
 
 	static_branch_inc(&key);
 	...
@@ -142,11 +149,11 @@ static_branch_inc(), will change the branch back to true. Likewise, if the
 key is initialized false, a 'static_branch_inc()', will change the branch to
 true. And then a 'static_branch_dec()', will again make the branch false.
 
-Where an array of keys is required, it can be defined as:
+Where an array of keys is required, it can be defined as::
 
 	DEFINE_STATIC_KEY_ARRAY_TRUE(keys, count);
 
-or:
+or::
 
 	DEFINE_STATIC_KEY_ARRAY_FALSE(keys, count);
 
@@ -159,96 +166,98 @@ simply fall back to a traditional, load, test, and jump sequence. Also, the
 struct jump_entry table must be at least 4-byte aligned because the
 static_key->entry field makes use of the two least significant bits.
 
-* select HAVE_ARCH_JUMP_LABEL, see: arch/x86/Kconfig
+* ``select HAVE_ARCH_JUMP_LABEL``,
+    see: arch/x86/Kconfig
 
-* #define JUMP_LABEL_NOP_SIZE, see: arch/x86/include/asm/jump_label.h
+* ``#define JUMP_LABEL_NOP_SIZE``,
+    see: arch/x86/include/asm/jump_label.h
 
-* __always_inline bool arch_static_branch(struct static_key *key, bool branch), see:
-					arch/x86/include/asm/jump_label.h
+* ``__always_inline bool arch_static_branch(struct static_key *key, bool branch)``,
+    see: arch/x86/include/asm/jump_label.h
 
-* __always_inline bool arch_static_branch_jump(struct static_key *key, bool branch),
-					see: arch/x86/include/asm/jump_label.h
+* ``__always_inline bool arch_static_branch_jump(struct static_key *key, bool branch)``,
+    see: arch/x86/include/asm/jump_label.h
 
-* void arch_jump_label_transform(struct jump_entry *entry, enum jump_label_type type),
-					see: arch/x86/kernel/jump_label.c
+* ``void arch_jump_label_transform(struct jump_entry *entry, enum jump_label_type type)``,
+    see: arch/x86/kernel/jump_label.c
 
-* __init_or_module void arch_jump_label_transform_static(struct jump_entry *entry, enum jump_label_type type),
-					see: arch/x86/kernel/jump_label.c
+* ``__init_or_module void arch_jump_label_transform_static(struct jump_entry *entry, enum jump_label_type type)``,
+    see: arch/x86/kernel/jump_label.c
 
-
-* struct jump_entry, see: arch/x86/include/asm/jump_label.h
+* ``struct jump_entry``,
+    see: arch/x86/include/asm/jump_label.h
 
 
 5) Static keys / jump label analysis, results (x86_64):
 
 
 As an example, let's add the following branch to 'getppid()', such that the
-system call now looks like:
+system call now looks like::
 
-SYSCALL_DEFINE0(getppid)
-{
+  SYSCALL_DEFINE0(getppid)
+  {
         int pid;
 
-+       if (static_branch_unlikely(&key))
-+               printk("I am the true branch\n");
+  +     if (static_branch_unlikely(&key))
+  +             printk("I am the true branch\n");
 
         rcu_read_lock();
         pid = task_tgid_vnr(rcu_dereference(current->real_parent));
         rcu_read_unlock();
 
         return pid;
-}
+  }
 
-The resulting instructions with jump labels generated by GCC is:
+The resulting instructions with jump labels generated by GCC is::
 
-ffffffff81044290 <sys_getppid>:
-ffffffff81044290:       55                      push   %rbp
-ffffffff81044291:       48 89 e5                mov    %rsp,%rbp
-ffffffff81044294:       e9 00 00 00 00          jmpq   ffffffff81044299 <sys_getppid+0x9>
-ffffffff81044299:       65 48 8b 04 25 c0 b6    mov    %gs:0xb6c0,%rax
-ffffffff810442a0:       00 00
-ffffffff810442a2:       48 8b 80 80 02 00 00    mov    0x280(%rax),%rax
-ffffffff810442a9:       48 8b 80 b0 02 00 00    mov    0x2b0(%rax),%rax
-ffffffff810442b0:       48 8b b8 e8 02 00 00    mov    0x2e8(%rax),%rdi
-ffffffff810442b7:       e8 f4 d9 00 00          callq  ffffffff81051cb0 <pid_vnr>
-ffffffff810442bc:       5d                      pop    %rbp
-ffffffff810442bd:       48 98                   cltq
-ffffffff810442bf:       c3                      retq
-ffffffff810442c0:       48 c7 c7 e3 54 98 81    mov    $0xffffffff819854e3,%rdi
-ffffffff810442c7:       31 c0                   xor    %eax,%eax
-ffffffff810442c9:       e8 71 13 6d 00          callq  ffffffff8171563f <printk>
-ffffffff810442ce:       eb c9                   jmp    ffffffff81044299 <sys_getppid+0x9>
+  ffffffff81044290 <sys_getppid>:
+  ffffffff81044290:       55                      push   %rbp
+  ffffffff81044291:       48 89 e5                mov    %rsp,%rbp
+  ffffffff81044294:       e9 00 00 00 00          jmpq   ffffffff81044299 <sys_getppid+0x9>
+  ffffffff81044299:       65 48 8b 04 25 c0 b6    mov    %gs:0xb6c0,%rax
+  ffffffff810442a0:       00 00
+  ffffffff810442a2:       48 8b 80 80 02 00 00    mov    0x280(%rax),%rax
+  ffffffff810442a9:       48 8b 80 b0 02 00 00    mov    0x2b0(%rax),%rax
+  ffffffff810442b0:       48 8b b8 e8 02 00 00    mov    0x2e8(%rax),%rdi
+  ffffffff810442b7:       e8 f4 d9 00 00          callq  ffffffff81051cb0 <pid_vnr>
+  ffffffff810442bc:       5d                      pop    %rbp
+  ffffffff810442bd:       48 98                   cltq
+  ffffffff810442bf:       c3                      retq
+  ffffffff810442c0:       48 c7 c7 e3 54 98 81    mov    $0xffffffff819854e3,%rdi
+  ffffffff810442c7:       31 c0                   xor    %eax,%eax
+  ffffffff810442c9:       e8 71 13 6d 00          callq  ffffffff8171563f <printk>
+  ffffffff810442ce:       eb c9                   jmp    ffffffff81044299 <sys_getppid+0x9>
 
-Without the jump label optimization it looks like:
+Without the jump label optimization it looks like::
 
-ffffffff810441f0 <sys_getppid>:
-ffffffff810441f0:       8b 05 8a 52 d8 00       mov    0xd8528a(%rip),%eax        # ffffffff81dc9480 <key>
-ffffffff810441f6:       55                      push   %rbp
-ffffffff810441f7:       48 89 e5                mov    %rsp,%rbp
-ffffffff810441fa:       85 c0                   test   %eax,%eax
-ffffffff810441fc:       75 27                   jne    ffffffff81044225 <sys_getppid+0x35>
-ffffffff810441fe:       65 48 8b 04 25 c0 b6    mov    %gs:0xb6c0,%rax
-ffffffff81044205:       00 00
-ffffffff81044207:       48 8b 80 80 02 00 00    mov    0x280(%rax),%rax
-ffffffff8104420e:       48 8b 80 b0 02 00 00    mov    0x2b0(%rax),%rax
-ffffffff81044215:       48 8b b8 e8 02 00 00    mov    0x2e8(%rax),%rdi
-ffffffff8104421c:       e8 2f da 00 00          callq  ffffffff81051c50 <pid_vnr>
-ffffffff81044221:       5d                      pop    %rbp
-ffffffff81044222:       48 98                   cltq
-ffffffff81044224:       c3                      retq
-ffffffff81044225:       48 c7 c7 13 53 98 81    mov    $0xffffffff81985313,%rdi
-ffffffff8104422c:       31 c0                   xor    %eax,%eax
-ffffffff8104422e:       e8 60 0f 6d 00          callq  ffffffff81715193 <printk>
-ffffffff81044233:       eb c9                   jmp    ffffffff810441fe <sys_getppid+0xe>
-ffffffff81044235:       66 66 2e 0f 1f 84 00    data32 nopw %cs:0x0(%rax,%rax,1)
-ffffffff8104423c:       00 00 00 00
+  ffffffff810441f0 <sys_getppid>:
+  ffffffff810441f0:       8b 05 8a 52 d8 00       mov    0xd8528a(%rip),%eax        # ffffffff81dc9480 <key>
+  ffffffff810441f6:       55                      push   %rbp
+  ffffffff810441f7:       48 89 e5                mov    %rsp,%rbp
+  ffffffff810441fa:       85 c0                   test   %eax,%eax
+  ffffffff810441fc:       75 27                   jne    ffffffff81044225 <sys_getppid+0x35>
+  ffffffff810441fe:       65 48 8b 04 25 c0 b6    mov    %gs:0xb6c0,%rax
+  ffffffff81044205:       00 00
+  ffffffff81044207:       48 8b 80 80 02 00 00    mov    0x280(%rax),%rax
+  ffffffff8104420e:       48 8b 80 b0 02 00 00    mov    0x2b0(%rax),%rax
+  ffffffff81044215:       48 8b b8 e8 02 00 00    mov    0x2e8(%rax),%rdi
+  ffffffff8104421c:       e8 2f da 00 00          callq  ffffffff81051c50 <pid_vnr>
+  ffffffff81044221:       5d                      pop    %rbp
+  ffffffff81044222:       48 98                   cltq
+  ffffffff81044224:       c3                      retq
+  ffffffff81044225:       48 c7 c7 13 53 98 81    mov    $0xffffffff81985313,%rdi
+  ffffffff8104422c:       31 c0                   xor    %eax,%eax
+  ffffffff8104422e:       e8 60 0f 6d 00          callq  ffffffff81715193 <printk>
+  ffffffff81044233:       eb c9                   jmp    ffffffff810441fe <sys_getppid+0xe>
+  ffffffff81044235:       66 66 2e 0f 1f 84 00    data32 nopw %cs:0x0(%rax,%rax,1)
+  ffffffff8104423c:       00 00 00 00
 
 Thus, the disable jump label case adds a 'mov', 'test' and 'jne' instruction
 vs. the jump label case just has a 'no-op' or 'jmp 0'. (The jmp 0, is patched
 to a 5 byte atomic no-op instruction at boot-time.) Thus, the disabled jump
-label case adds:
+label case adds::
 
-6 (mov) + 2 (test) + 2 (jne) = 10 - 5 (5 byte jump 0) = 5 addition bytes.
+  6 (mov) + 2 (test) + 2 (jne) = 10 - 5 (5 byte jump 0) = 5 addition bytes.
 
 If we then include the padding bytes, the jump label code saves, 16 total bytes
 of instruction memory for this small function. In this case the non-jump label
@@ -262,7 +271,7 @@ Since there are a number of static key API uses in the scheduler paths,
 'pipe-test' (also known as 'perf bench sched pipe') can be used to show the
 performance improvement. Testing done on 3.3.0-rc2:
 
-jump label disabled:
+jump label disabled::
 
  Performance counter stats for 'bash -c /tmp/pipe-test' (50 runs):
 
@@ -279,7 +288,7 @@ jump label disabled:
 
        1.601607384 seconds time elapsed                                          ( +-  0.07% )
 
-jump label enabled:
+jump label enabled::
 
  Performance counter stats for 'bash -c /tmp/pipe-test' (50 runs):
 
-- 
2.9.4
