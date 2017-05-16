Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQH-0001Lk-TA
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:19 +0000
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
Subject: [PATCH v2 02/53] kernel-hacking: update document
Date: Tue, 16 May 2017 09:15:54 -0300
Message-Id: <dca1e58e3f1c82a840abaafb9328f84ae69a9926.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This document is fairly updated. Yet, some stuff moved to
other kernel headers. So, update to point to the right
places.

While here, adjust some minor ReST markups.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/kernel-hacking/hacking.rst | 179 +++++++++++++++++--------------
 1 file changed, 98 insertions(+), 81 deletions(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index 75597e627791..1a456b60a7cf 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -56,7 +56,7 @@ interrupts. You can sleep, by calling :c:func:`schedule()`.
 
 In user context, the ``current`` pointer (indicating the task we are
 currently executing) is valid, and :c:func:`in_interrupt()`
-(``include/linux/interrupt.h``) is false.
+(``include/linux/preempt.h``) is false.
 
 .. warning::
 
@@ -114,12 +114,12 @@ time, although different tasklets can run simultaneously.
     Kuznetsov had at the time.
 
 You can tell you are in a softirq (or tasklet) using the
-:c:func:`in_softirq()` macro (``include/linux/interrupt.h``).
+:c:func:`in_softirq()` macro (``include/linux/preempt.h``).
 
 .. warning::
 
-    Beware that this will return a false positive if a bh lock (see
-    below) is held.
+    Beware that this will return a false positive if a
+    :ref:`botton half lock <local_bh_disable>` is held.
 
 Some Basic Rules
 ================
@@ -154,9 +154,7 @@ The Linux kernel is portable
 ioctls: Not writing a new system call
 =====================================
 
-A system call generally looks like this
-
-::
+A system call generally looks like this::
 
     asmlinkage long sys_mycall(int arg)
     {
@@ -175,7 +173,9 @@ If all your routine does is read or write some parameter, consider
 implementing a :c:func:`sysfs()` interface instead.
 
 Inside the ioctl you're in user context to a process. When a error
-occurs you return a negated errno (see ``include/linux/errno.h``),
+occurs you return a negated errno (see
+``include/uapi/asm-generic/errno-base.h``,
+``include/uapi/asm-generic/errno.h`` and ``include/linux/errno.h``),
 otherwise you return 0.
 
 After you slept you should check if a signal occurred: the Unix/Linux
@@ -195,9 +195,7 @@ some data structure.
 If you're doing longer computations: first think userspace. If you
 **really** want to do it in kernel you should regularly check if you need
 to give up the CPU (remember there is cooperative multitasking per CPU).
-Idiom:
-
-::
+Idiom::
 
     cond_resched(); /* Will sleep */
 
@@ -231,26 +229,24 @@ Really.
 Common Routines
 ===============
 
-:c:func:`printk()` ``include/linux/kernel.h``
----------------------------------------------
+:c:func:`printk()`
+------------------
+
+Defined in ``include/linux/printk.h``
 
 :c:func:`printk()` feeds kernel messages to the console, dmesg, and
 the syslog daemon. It is useful for debugging and reporting errors, and
 can be used inside interrupt context, but use with caution: a machine
 which has its console flooded with printk messages is unusable. It uses
 a format string mostly compatible with ANSI C printf, and C string
-concatenation to give it a first "priority" argument:
-
-::
+concatenation to give it a first "priority" argument::
 
     printk(KERN_INFO "i = %u\n", i);
 
 
-See ``include/linux/kernel.h``; for other ``KERN_`` values; these are
+See ``include/linux/kern_levels.h``; for other ``KERN_`` values; these are
 interpreted by syslog as the level. Special case: for printing an IP
-address use
-
-::
+address use::
 
     __be32 ipaddress;
     printk(KERN_INFO "my ip: %pI4\n", &ipaddress);
@@ -270,8 +266,10 @@ overruns. Make sure that will be enough.
     on top of its printf function: "Printf should not be used for
     chit-chat". You should follow that advice.
 
-:c:func:`copy_[to/from]_user()` / :c:func:`get_user()` / :c:func:`put_user()` ``include/linux/uaccess.h``
----------------------------------------------------------------------------------------------------------
+:c:func:`copy_to_user()` / :c:func:`copy_from_user()` / :c:func:`get_user()` / :c:func:`put_user()`
+---------------------------------------------------------------------------------------------------
+
+Defined in ``include/linux/uaccess.h`` / ``asm/uaccess.h``
 
 **[SLEEPS]**
 
@@ -297,8 +295,10 @@ The functions may sleep implicitly. This should never be called outside
 user context (it makes no sense), with interrupts disabled, or a
 spinlock held.
 
-:c:func:`kmalloc()`/:c:func:`kfree()` ``include/linux/slab.h``
---------------------------------------------------------------
+:c:func:`kmalloc()`/:c:func:`kfree()`
+-------------------------------------
+
+Defined in ``include/linux/slab.h``
 
 **[MAY SLEEP: SEE BELOW]**
 
@@ -324,9 +324,9 @@ message, then maybe you called a sleeping allocation function from
 interrupt context without ``GFP_ATOMIC``. You should really fix that.
 Run, don't walk.
 
-If you are allocating at least ``PAGE_SIZE`` (``include/asm/page.h``)
-bytes, consider using :c:func:`__get_free_pages()`
-(``include/linux/mm.h``). It takes an order argument (0 for page sized,
+If you are allocating at least ``PAGE_SIZE`` (``asm/page.h`` or
+``asm/page_types.h``) bytes, consider using :c:func:`__get_free_pages()`
+(``include/linux/gfp.h``). It takes an order argument (0 for page sized,
 1 for double page, 2 for four pages etc.) and the same memory priority
 flag word as above.
 
@@ -344,24 +344,30 @@ routine.
 Before inventing your own cache of often-used objects consider using a
 slab cache in ``include/linux/slab.h``
 
-:c:func:`current()` ``include/asm/current.h``
----------------------------------------------
+:c:func:`current()`
+-------------------
+
+Defined in ``include/asm/current.h``
 
 This global variable (really a macro) contains a pointer to the current
 task structure, so is only valid in user context. For example, when a
 process makes a system call, this will point to the task structure of
 the calling process. It is **not NULL** in interrupt context.
 
-:c:func:`mdelay()`/:c:func:`udelay()` ``include/asm/delay.h`` ``include/linux/delay.h``
----------------------------------------------------------------------------------------
+:c:func:`mdelay()`/:c:func:`udelay()`
+-------------------------------------
+
+Defined in ``include/asm/delay.h`` / ``include/linux/delay.h``
 
 The :c:func:`udelay()` and :c:func:`ndelay()` functions can be
 used for small pauses. Do not use large values with them as you risk
 overflow - the helper function :c:func:`mdelay()` is useful here, or
 consider :c:func:`msleep()`.
 
-:c:func:`cpu_to_be32()`/:c:func:`be32_to_cpu()`/:c:func:`cpu_to_le32()`/:c:func:`le32_to_cpu()` ``include/asm/byteorder.h``
----------------------------------------------------------------------------------------------------------------------------
+:c:func:`cpu_to_be32()`/:c:func:`be32_to_cpu()`/:c:func:`cpu_to_le32()`/:c:func:`le32_to_cpu()`
+-----------------------------------------------------------------------------------------------
+
+Defined in ``include/asm/byteorder.h``
 
 The :c:func:`cpu_to_be32()` family (where the "32" can be replaced
 by 64 or 16, and the "be" can be replaced by "le") are the general way
@@ -375,8 +381,10 @@ to the given type, and return the converted value. The other variation
 is the "in-situ" family, such as :c:func:`cpu_to_be32s()`, which
 convert value referred to by the pointer, and return void.
 
-:c:func:`local_irq_save()`/:c:func:`local_irq_restore()` ``include/linux/irqflags.h``
--------------------------------------------------------------------------------------
+:c:func:`local_irq_save()`/:c:func:`local_irq_restore()`
+--------------------------------------------------------
+
+Defined in ``include/linux/irqflags.h``
 
 These routines disable hard interrupts on the local CPU, and restore
 them. They are reentrant; saving the previous state in their one
@@ -384,16 +392,23 @@ them. They are reentrant; saving the previous state in their one
 enabled, you can simply use :c:func:`local_irq_disable()` and
 :c:func:`local_irq_enable()`.
 
-:c:func:`local_bh_disable()`/:c:func:`local_bh_enable()` ``include/linux/interrupt.h``
---------------------------------------------------------------------------------------
+.. _local_bh_disable:
+
+:c:func:`local_bh_disable()`/:c:func:`local_bh_enable()`
+--------------------------------------------------------
+
+Defined in ``include/linux/bottom_half.h``
+
 
 These routines disable soft interrupts on the local CPU, and restore
 them. They are reentrant; if soft interrupts were disabled before, they
 will still be disabled after this pair of functions has been called.
 They prevent softirqs and tasklets from running on the current CPU.
 
-:c:func:`smp_processor_id()`() ``include/asm/smp.h``
-----------------------------------------------------
+:c:func:`smp_processor_id()`
+----------------------------
+
+Defined in ``include/linux/smp.h``
 
 :c:func:`get_cpu()` disables preemption (so you won't suddenly get
 moved to another CPU) and returns the current processor number, between
@@ -405,8 +420,10 @@ If you know you cannot be preempted by another task (ie. you are in
 interrupt context, or have preemption disabled) you can use
 smp_processor_id().
 
-``__init``/``__exit``/``__initdata`` ``include/linux/init.h``
--------------------------------------------------------------
+``__init``/``__exit``/``__initdata``
+------------------------------------
+
+Defined in  ``include/linux/init.h``
 
 After boot, the kernel frees up a special section; functions marked with
 ``__init`` and data structures marked with ``__initdata`` are dropped
@@ -415,10 +432,13 @@ initialization. ``__exit`` is used to declare a function which is only
 required on exit: the function will be dropped if this file is not
 compiled as a module. See the header file for use. Note that it makes no
 sense for a function marked with ``__init`` to be exported to modules
-with :c:func:`EXPORT_SYMBOL()` - this will break.
+with :c:func:`EXPORT_SYMBOL()` or :c:func:`EXPORT_SYMBOL_GPL()`- this
+will break.
 
-:c:func:`__initcall()`/:c:func:`module_init()` ``include/linux/init.h``
------------------------------------------------------------------------
+:c:func:`__initcall()`/:c:func:`module_init()`
+----------------------------------------------
+
+Defined in  ``include/linux/init.h`` / ``include/linux/module.h``
 
 Many parts of the kernel are well served as a module
 (dynamically-loadable parts of the kernel). Using the
@@ -438,8 +458,11 @@ to fail (unfortunately, this has no effect if the module is compiled
 into the kernel). This function is called in user context with
 interrupts enabled, so it can sleep.
 
-:c:func:`module_exit()` ``include/linux/init.h``
-------------------------------------------------
+:c:func:`module_exit()`
+-----------------------
+
+
+Defined in  ``include/linux/module.h``
 
 This macro defines the function to be called at module removal time (or
 never, in the case of the file compiled into the kernel). It will only
@@ -450,8 +473,10 @@ it returns.
 Note that this macro is optional: if it is not present, your module will
 not be removable (except for 'rmmod -f').
 
-:c:func:`try_module_get()`/:c:func:`module_put()` ``include/linux/module.h``
-----------------------------------------------------------------------------
+:c:func:`try_module_get()`/:c:func:`module_put()`
+-------------------------------------------------
+
+Defined in ``include/linux/module.h``
 
 These manipulate the module usage count, to protect against removal (a
 module also can't be removed if another module uses one of its exported
@@ -472,8 +497,8 @@ Wait Queues ``include/linux/wait.h``
 
 A wait queue is used to wait for someone to wake you up when a certain
 condition is true. They must be used carefully to ensure there is no
-race condition. You declare a ``wait_queue_head_t``, and then processes
-which want to wait for that condition declare a ``wait_queue_t``
+race condition. You declare a :c:type:`wait_queue_head_t`, and then processes
+which want to wait for that condition declare a :c:type:`wait_queue_t`
 referring to themselves, and place that in the queue.
 
 Declaring
@@ -490,15 +515,15 @@ Queuing
 Placing yourself in the waitqueue is fairly complex, because you must
 put yourself in the queue before checking the condition. There is a
 macro to do this: :c:func:`wait_event_interruptible()`
-``include/linux/wait.h`` The first argument is the wait queue head, and
+(``include/linux/wait.h``) The first argument is the wait queue head, and
 the second is an expression which is evaluated; the macro returns 0 when
-this expression is true, or -ERESTARTSYS if a signal is received. The
+this expression is true, or ``-ERESTARTSYS`` if a signal is received. The
 :c:func:`wait_event()` version ignores signals.
 
 Waking Up Queued Tasks
 ----------------------
 
-Call :c:func:`wake_up()` ``include/linux/wait.h``;, which will wake
+Call :c:func:`wake_up()` (``include/linux/wait.h``);, which will wake
 up every process in the queue. The exception is if one has
 ``TASK_EXCLUSIVE`` set, in which case the remainder of the queue will
 not be woken. There are other variants of this basic function available
@@ -508,9 +533,9 @@ Atomic Operations
 =================
 
 Certain operations are guaranteed atomic on all platforms. The first
-class of operations work on ``atomic_t`` ``include/asm/atomic.h``; this
-contains a signed integer (at least 32 bits long), and you must use
-these functions to manipulate or read atomic_t variables.
+class of operations work on :c:type:`atomic_t` (``include/asm/atomic.h``);
+this contains a signed integer (at least 32 bits long), and you must use
+these functions to manipulate or read :c:type:`atomic_t` variables.
 :c:func:`atomic_read()` and :c:func:`atomic_set()` get and set
 the counter, :c:func:`atomic_add()`, :c:func:`atomic_sub()`,
 :c:func:`atomic_inc()`, :c:func:`atomic_dec()`, and
@@ -534,7 +559,7 @@ true if the bit was previously set; these are particularly useful for
 atomically setting flags.
 
 It is possible to call these operations with bit indices greater than
-BITS_PER_LONG. The resulting behavior is strange on big-endian
+``BITS_PER_LONG``. The resulting behavior is strange on big-endian
 platforms though so it is a good idea not to do this.
 
 Symbols
@@ -546,14 +571,18 @@ be used anywhere in the kernel). However, for modules, a special
 exported symbol table is kept which limits the entry points to the
 kernel proper. Modules can also export symbols.
 
-:c:func:`EXPORT_SYMBOL()` ``include/linux/export.h``
-----------------------------------------------------
+:c:func:`EXPORT_SYMBOL()`
+-------------------------
+
+Defined in ``include/linux/export.h``
 
 This is the classic method of exporting a symbol: dynamically loaded
 modules will be able to use the symbol as normal.
 
-:c:func:`EXPORT_SYMBOL_GPL()` ``include/linux/export.h``
---------------------------------------------------------
+:c:func:`EXPORT_SYMBOL_GPL()`
+-----------------------------
+
+Defined in ``include/linux/export.h``
 
 Similar to :c:func:`EXPORT_SYMBOL()` except that the symbols
 exported by :c:func:`EXPORT_SYMBOL_GPL()` can only be seen by
@@ -579,11 +608,11 @@ Return Conventions
 ------------------
 
 For code called in user context, it's very common to defy C convention,
-and return 0 for success, and a negative error number (eg. -EFAULT) for
+and return 0 for success, and a negative error number (eg. ``-EFAULT``) for
 failure. This can be unintuitive at first, but it's fairly widespread in
 the kernel.
 
-Using :c:func:`ERR_PTR()` ``include/linux/err.h``; to encode a
+Using :c:func:`ERR_PTR()` (``include/linux/err.h``) to encode a
 negative error number into a pointer, and :c:func:`IS_ERR()` and
 :c:func:`PTR_ERR()` to get it back out again: avoids a separate
 pointer parameter for the error number. Icky, but in a good way.
@@ -603,9 +632,7 @@ Initializing structure members
 ------------------------------
 
 The preferred method of initializing structures is to use designated
-initialisers, as defined by ISO C99, eg:
-
-::
+initialisers, as defined by ISO C99, eg::
 
     static struct block_device_operations opt_fops = {
             .open               = opt_open,
@@ -716,18 +743,14 @@ Kernel Cantrips
 
 Some favorites from browsing the source. Feel free to add to this list.
 
-``arch/x86/include/asm/delay.h:``
-
-::
+``arch/x86/include/asm/delay.h``::
 
     #define ndelay(n) (__builtin_constant_p(n) ? \
             ((n) > 20000 ? __bad_ndelay() : __const_udelay((n) * 5ul)) : \
             __ndelay(n))
 
 
-``include/linux/fs.h``:
-
-::
+``include/linux/fs.h``::
 
     /*
      * Kernel pointers have redundant information, so we can use a
@@ -741,9 +764,7 @@ Some favorites from browsing the source. Feel free to add to this list.
      #define PTR_ERR(ptr)    ((long)(ptr))
      #define IS_ERR(ptr)     ((unsigned long)(ptr) > (unsigned long)(-1000))
 
-``arch/x86/include/asm/uaccess_32.h:``
-
-::
+``arch/x86/include/asm/uaccess_32.h:``::
 
     #define copy_to_user(to,from,n)                         \
             (__builtin_constant_p(n) ?                      \
@@ -751,9 +772,7 @@ Some favorites from browsing the source. Feel free to add to this list.
              __generic_copy_to_user((to),(from),(n)))
 
 
-``arch/sparc/kernel/head.S:``
-
-::
+``arch/sparc/kernel/head.S:``::
 
     /*
      * Sun people can't spell worth damn. "compatability" indeed.
@@ -772,9 +791,7 @@ Some favorites from browsing the source. Feel free to add to this list.
             .asciz "compatible"
 
 
-``arch/sparc/lib/checksum.S:``
-
-::
+``arch/sparc/lib/checksum.S:``::
 
             /* Sun, you just can't beat me, you just can't.  Stop trying,
              * give up.  I'm serious, I am going to kick the living shit
-- 
2.9.3
