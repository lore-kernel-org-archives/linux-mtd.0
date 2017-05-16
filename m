Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQd-0002hQ-Ks
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
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Subject: [PATCH v2 09/53] kgdb.rst: Adjust ReST markups
Date: Tue, 16 May 2017 09:16:01 -0300
Message-Id: <821c6df87761af9a56702f1dec61549ee1cf3109.1494935649.git.mchehab@s-opensource.com>
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

The automatic conversion didn't work too well for this file.
It added weird html blocks inside it, and did some weird
things for literals. Manually fix it, in order to present
a nice display at html/pdf outputs.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/dev-tools/kgdb.rst | 489 +++++++++++++++++++--------------------
 1 file changed, 233 insertions(+), 256 deletions(-)

diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
index ea01541806c8..75273203a35a 100644
--- a/Documentation/dev-tools/kgdb.rst
+++ b/Documentation/dev-tools/kgdb.rst
@@ -51,28 +51,29 @@ Compiling a kernel
 Kernel config options for kgdb
 ------------------------------
 
-To enable ``CONFIG_KGDB`` you should look under "Kernel hacking" /
-"Kernel debugging" and select "KGDB: kernel debugger".
+To enable ``CONFIG_KGDB`` you should look under
+:menuselection:`Kernel hacking --> Kernel debugging` and select
+:menuselection:`KGDB: kernel debugger`.
 
 While it is not a hard requirement that you have symbols in your vmlinux
 file, gdb tends not to be very useful without the symbolic data, so you
-will want to turn on ``CONFIG_DEBUG_INFO`` which is called "Compile the
-kernel with debug info" in the config menu.
+will want to turn on ``CONFIG_DEBUG_INFO`` which is called
+:menuselection:`Compile the kernel with debug info` in the config menu.
 
 It is advised, but not required, that you turn on the
-``CONFIG_FRAME_POINTER`` kernel option which is called "Compile the
-kernel with frame pointers" in the config menu. This option inserts code
+``CONFIG_FRAME_POINTER`` kernel option which is called :menuselection:`Compile
+the kernel with frame pointers` in the config menu. This option inserts code
 to into the compiled executable which saves the frame information in
 registers or on the stack at different points which allows a debugger
 such as gdb to more accurately construct stack back traces while
 debugging the kernel.
 
 If the architecture that you are using supports the kernel option
-CONFIG_STRICT_KERNEL_RWX, you should consider turning it off. This
+``CONFIG_STRICT_KERNEL_RWX``, you should consider turning it off. This
 option will prevent the use of software breakpoints because it marks
 certain regions of the kernel's memory space as read-only. If kgdb
 supports it for the architecture you are using, you can use hardware
-breakpoints if you desire to run with the CONFIG_STRICT_KERNEL_RWX
+breakpoints if you desire to run with the ``CONFIG_STRICT_KERNEL_RWX``
 option turned on, else you need to turn off this option.
 
 Next you should choose one of more I/O drivers to interconnect debugging
@@ -80,17 +81,14 @@ host and debugged target. Early boot debugging requires a KGDB I/O
 driver that supports early debugging and the driver must be built into
 the kernel directly. Kgdb I/O driver configuration takes place via
 kernel or module parameters which you can learn more about in the in the
-section that describes the parameter "kgdboc".
+section that describes the parameter kgdboc.
 
-Here is an example set of .config symbols to enable or disable for kgdb:
+Here is an example set of ``.config`` symbols to enable or disable for kgdb::
 
--  # CONFIG_STRICT_KERNEL_RWX is not set
-
--  CONFIG_FRAME_POINTER=y
-
--  CONFIG_KGDB=y
-
--  CONFIG_KGDB_SERIAL_CONSOLE=y
+  # CONFIG_STRICT_KERNEL_RWX is not set
+  CONFIG_FRAME_POINTER=y
+  CONFIG_KGDB=y
+  CONFIG_KGDB_SERIAL_CONSOLE=y
 
 Kernel config options for kdb
 -----------------------------
@@ -99,34 +97,29 @@ Kdb is quite a bit more complex than the simple gdbstub sitting on top
 of the kernel's debug core. Kdb must implement a shell, and also adds
 some helper functions in other parts of the kernel, responsible for
 printing out interesting data such as what you would see if you ran
-"lsmod", or "ps". In order to build kdb into the kernel you follow the
+``lsmod``, or ``ps``. In order to build kdb into the kernel you follow the
 same steps as you would for kgdb.
 
 The main config option for kdb is ``CONFIG_KGDB_KDB`` which is called
-"KGDB_KDB: include kdb frontend for kgdb" in the config menu. In theory
-you would have already also selected an I/O driver such as the
-CONFIG_KGDB_SERIAL_CONSOLE interface if you plan on using kdb on a
+:menuselection:`KGDB_KDB: include kdb frontend for kgdb` in the config menu.
+In theory you would have already also selected an I/O driver such as the
+``CONFIG_KGDB_SERIAL_CONSOLE`` interface if you plan on using kdb on a
 serial port, when you were configuring kgdb.
 
 If you want to use a PS/2-style keyboard with kdb, you would select
-CONFIG_KDB_KEYBOARD which is called "KGDB_KDB: keyboard as input
-device" in the config menu. The CONFIG_KDB_KEYBOARD option is not used
-for anything in the gdb interface to kgdb. The CONFIG_KDB_KEYBOARD
+``CONFIG_KDB_KEYBOARD`` which is called :menuselection:`KGDB_KDB: keyboard as
+input device` in the config menu. The ``CONFIG_KDB_KEYBOARD`` option is not
+used for anything in the gdb interface to kgdb. The ``CONFIG_KDB_KEYBOARD``
 option only works with kdb.
 
-Here is an example set of .config symbols to enable/disable kdb:
-
--  # CONFIG_STRICT_KERNEL_RWX is not set
-
--  CONFIG_FRAME_POINTER=y
-
--  CONFIG_KGDB=y
-
--  CONFIG_KGDB_SERIAL_CONSOLE=y
-
--  CONFIG_KGDB_KDB=y
-
--  CONFIG_KDB_KEYBOARD=y
+Here is an example set of ``.config`` symbols to enable/disable kdb::
+
+  # CONFIG_STRICT_KERNEL_RWX is not set
+  CONFIG_FRAME_POINTER=y
+  CONFIG_KGDB=y
+  CONFIG_KGDB_SERIAL_CONSOLE=y
+  CONFIG_KGDB_KDB=y
+  CONFIG_KDB_KEYBOARD=y
 
 Kernel Debugger Boot Arguments
 ==============================
@@ -164,7 +157,9 @@ with kdb while allowing the full graphics console applications to run.
 kgdboc arguments
 ~~~~~~~~~~~~~~~~
 
-Usage: ``kgdboc=[kms][[,]kbd][[,]serial_device][,baud]``
+Usage::
+
+	kgdboc=[kms][[,]kbd][[,]serial_device][,baud]
 
 The order listed above must be observed if you use any of the optional
 configurations together.
@@ -186,11 +181,15 @@ Using loadable module or built-in
 
 1. As a kernel built-in:
 
-   Use the kernel boot argument: ``kgdboc=<tty-device>,[baud]``
+   Use the kernel boot argument::
+
+	kgdboc=<tty-device>,[baud]
 
 2. As a kernel loadable module:
 
-   Use the command: ``modprobe kgdboc kgdboc=<tty-device>,[baud]``
+   Use the command::
+
+	modprobe kgdboc kgdboc=<tty-device>,[baud]
 
    Here are two examples of how you might format the kgdboc string. The
    first is for an x86 target using the first serial port. The second
@@ -206,16 +205,18 @@ Configure kgdboc at runtime with sysfs
 At run time you can enable or disable kgdboc by echoing a parameters
 into the sysfs. Here are two examples:
 
-1. Enable kgdboc on ttyS0
+1. Enable kgdboc on ttyS0::
 
-   ``echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc``
+	echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
 
-2. Disable kgdboc
+2. Disable kgdboc::
 
-   ``echo "" > /sys/module/kgdboc/parameters/kgdboc``
+	echo "" > /sys/module/kgdboc/parameters/kgdboc
 
-NOTE: You do not need to specify the baud if you are configuring the
-console on tty which is already configured or open.
+.. note::
+
+   You do not need to specify the baud if you are configuring the
+   console on tty which is already configured or open.
 
 More examples
 ^^^^^^^^^^^^^
@@ -224,35 +225,42 @@ You can configure kgdboc to use the keyboard, and/or a serial device
 depending on if you are using kdb and/or kgdb, in one of the following
 scenarios.
 
-1. kdb and kgdb over only a serial port
+1. kdb and kgdb over only a serial port::
 
-   ``kgdboc=<serial_device>[,baud]``
+	kgdboc=<serial_device>[,baud]
 
-   Example: ``kgdboc=ttyS0,115200``
+   Example::
 
-2. kdb and kgdb with keyboard and a serial port
+	kgdboc=ttyS0,115200
 
-   ``kgdboc=kbd,<serial_device>[,baud]``
+2. kdb and kgdb with keyboard and a serial port::
 
-   Example: ``kgdboc=kbd,ttyS0,115200``
+	kgdboc=kbd,<serial_device>[,baud]
 
-3. kdb with a keyboard
+   Example::
 
-   ``kgdboc=kbd``
+	kgdboc=kbd,ttyS0,115200
 
-4. kdb with kernel mode setting
+3. kdb with a keyboard::
 
-   ``kgdboc=kms,kbd``
+	kgdboc=kbd
 
-5. kdb with kernel mode setting and kgdb over a serial port
+4. kdb with kernel mode setting::
 
-   ``kgdboc=kms,kbd,ttyS0,115200``
+	kgdboc=kms,kbd
 
-NOTE: Kgdboc does not support interrupting the target via the gdb remote
-protocol. You must manually send a sysrq-g unless you have a proxy that
-splits console output to a terminal program. A console proxy has a
-separate TCP port for the debugger and a separate TCP port for the
-"human" console. The proxy can take care of sending the sysrq-g for you.
+5. kdb with kernel mode setting and kgdb over a serial port::
+
+	kgdboc=kms,kbd,ttyS0,115200
+
+.. note::
+
+   Kgdboc does not support interrupting the target via the gdb remote
+   protocol. You must manually send a :kbd:`SysRq-G` unless you have a proxy
+   that splits console output to a terminal program. A console proxy has a
+   separate TCP port for the debugger and a separate TCP port for the
+   "human" console. The proxy can take care of sending the :kbd:`SysRq-G`
+   for you.
 
 When using kgdboc with no debugger proxy, you can end up connecting the
 debugger at one of two entry points. If an exception occurs after you
@@ -260,14 +268,14 @@ have loaded kgdboc, a message should print on the console stating it is
 waiting for the debugger. In this case you disconnect your terminal
 program and then connect the debugger in its place. If you want to
 interrupt the target system and forcibly enter a debug session you have
-to issue a Sysrq sequence and then type the letter ``g``. Then you
+to issue a :kbd:`Sysrq` sequence and then type the letter :kbd:`g`. Then you
 disconnect the terminal session and connect gdb. Your options if you
-don't like this are to hack gdb to send the sysrq-g for you as well as
+don't like this are to hack gdb to send the :kbd:`SysRq-G` for you as well as
 on the initial connect, or to use a debugger proxy that allows an
 unmodified gdb to do the debugging.
 
-Kernel parameter: kgdbwait
---------------------------
+Kernel parameter: ``kgdbwait``
+------------------------------
 
 The Kernel command line option ``kgdbwait`` makes kgdb wait for a
 debugger connection during booting of a kernel. You can only use this
@@ -281,54 +289,64 @@ The kernel will stop and wait as early as the I/O driver and
 architecture allows when you use this option. If you build the kgdb I/O
 driver as a loadable kernel module kgdbwait will not do anything.
 
-Kernel parameter: kgdbcon
--------------------------
+Kernel parameter: ``kgdbcon``
+-----------------------------
 
-The kgdbcon feature allows you to see printk() messages inside gdb while
-gdb is connected to the kernel. Kdb does not make use of the kgdbcon
+The ``kgdbcon`` feature allows you to see :c:func:`printk` messages inside gdb
+while gdb is connected to the kernel. Kdb does not make use of the kgdbcon
 feature.
 
 Kgdb supports using the gdb serial protocol to send console messages to
 the debugger when the debugger is connected and running. There are two
 ways to activate this feature.
 
-1. Activate with the kernel command line option:
+1. Activate with the kernel command line option::
 
-   ``kgdbcon``
+	kgdbcon
 
-2. Use sysfs before configuring an I/O driver
+2. Use sysfs before configuring an I/O driver::
 
-   ``echo 1 > /sys/module/kgdb/parameters/kgdb_use_con``
+	echo 1 > /sys/module/kgdb/parameters/kgdb_use_con
 
-   NOTE: If you do this after you configure the kgdb I/O driver, the
+.. note::
+
+   If you do this after you configure the kgdb I/O driver, the
    setting will not take effect until the next point the I/O is
    reconfigured.
 
-IMPORTANT NOTE: You cannot use kgdboc + kgdbcon on a tty that is an
-active system console. An example of incorrect usage is
-``console=ttyS0,115200 kgdboc=ttyS0 kgdbcon``
+.. important::
+
+   You cannot use kgdboc + kgdbcon on a tty that is an
+   active system console. An example of incorrect usage is::
+
+	console=ttyS0,115200 kgdboc=ttyS0 kgdbcon
 
 It is possible to use this option with kgdboc on a tty that is not a
 system console.
 
-Run time parameter: kgdbreboot
-------------------------------
+Run time parameter: ``kgdbreboot``
+----------------------------------
 
 The kgdbreboot feature allows you to change how the debugger deals with
 the reboot notification. You have 3 choices for the behavior. The
 default behavior is always set to 0.
 
-1. echo -1 > /sys/module/debug_core/parameters/kgdbreboot
+.. tabularcolumns:: |p{0.4cm}|p{11.5cm}|p{5.6cm}|
 
-   Ignore the reboot notification entirely.
+.. flat-table::
+  :widths: 1 10 8
 
-2. echo 0 > /sys/module/debug_core/parameters/kgdbreboot
+  * - 1
+    - ``echo -1 > /sys/module/debug_core/parameters/kgdbreboot``
+    - Ignore the reboot notification entirely.
 
-   Send the detach message to any attached debugger client.
+  * - 2
+    - ``echo 0 > /sys/module/debug_core/parameters/kgdbreboot``
+    - Send the detach message to any attached debugger client.
 
-3. echo 1 > /sys/module/debug_core/parameters/kgdbreboot
-
-   Enter the debugger on reboot notify.
+  * - 3
+    - ``echo 1 > /sys/module/debug_core/parameters/kgdbreboot``
+    - Enter the debugger on reboot notify.
 
 Using kdb
 =========
@@ -338,66 +356,56 @@ Quick start for kdb on a serial port
 
 This is a quick example of how to use kdb.
 
-1. Configure kgdboc at boot using kernel parameters:
+1. Configure kgdboc at boot using kernel parameters::
 
-   -  ``console=ttyS0,115200 kgdboc=ttyS0,115200``
+	console=ttyS0,115200 kgdboc=ttyS0,115200
 
    OR
 
    Configure kgdboc after the kernel has booted; assuming you are using
-   a serial port console:
+   a serial port console::
 
-   -  ``echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc``
+	echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
 
 2. Enter the kernel debugger manually or by waiting for an oops or
    fault. There are several ways you can enter the kernel debugger
-   manually; all involve using the sysrq-g, which means you must have
-   enabled CONFIG_MAGIC_SYSRQ=y in your kernel config.
+   manually; all involve using the :kbd:`SysRq-G`, which means you must have
+   enabled ``CONFIG_MAGIC_SysRq=y`` in your kernel config.
 
-   -  When logged in as root or with a super user session you can run:
+   -  When logged in as root or with a super user session you can run::
 
-      ``echo g > /proc/sysrq-trigger``
+	echo g > /proc/sysrq-trigger
 
    -  Example using minicom 2.2
 
-      Press: ``Control-a``
-
-      Press: ``f``
-
-      Press: ``g``
+      Press: :kbd:`CTRL-A` :kbd:`f` :kbd:`g`
 
    -  When you have telneted to a terminal server that supports sending
       a remote break
 
-      Press: ``Control-]``
+      Press: :kbd:`CTRL-]`
 
-      Type in:\ ``send break``
+      Type in: ``send break``
 
-      Press: ``Enter``
+      Press: :kbd:`Enter` :kbd:`g`
 
-      Press: ``g``
-
-3. From the kdb prompt you can run the "help" command to see a complete
+3. From the kdb prompt you can run the ``help`` command to see a complete
    list of the commands that are available.
 
    Some useful commands in kdb include:
 
-   -  lsmod -- Shows where kernel modules are loaded
-
-   -  ps -- Displays only the active processes
-
-   -  ps A -- Shows all the processes
-
-   -  summary -- Shows kernel version info and memory usage
-
-   -  bt -- Get a backtrace of the current process using dump_stack()
-
-   -  dmesg -- View the kernel syslog buffer
-
-   -  go -- Continue the system
+   =========== =================================================================
+   ``lsmod``   Shows where kernel modules are loaded
+   ``ps``      Displays only the active processes
+   ``ps A``    Shows all the processes
+   ``summary`` Shows kernel version info and memory usage
+   ``bt``      Get a backtrace of the current process using :c:func:`dump_stack`
+   ``dmesg``   View the kernel syslog buffer
+   ``go``      Continue the system
+   =========== =================================================================
 
 4. When you are done using kdb you need to consider rebooting the system
-   or using the "go" command to resuming normal kernel execution. If you
+   or using the ``go`` command to resuming normal kernel execution. If you
    have paused the kernel for a lengthy period of time, applications
    that rely on timely networking or anything to do with real wall clock
    time could be adversely affected, so you should take this into
@@ -408,50 +416,50 @@ Quick start for kdb using a keyboard connected console
 
 This is a quick example of how to use kdb with a keyboard.
 
-1. Configure kgdboc at boot using kernel parameters:
+1. Configure kgdboc at boot using kernel parameters::
 
-   -  ``kgdboc=kbd``
+	kgdboc=kbd
 
    OR
 
-   Configure kgdboc after the kernel has booted:
+   Configure kgdboc after the kernel has booted::
 
-   -  ``echo kbd > /sys/module/kgdboc/parameters/kgdboc``
+	echo kbd > /sys/module/kgdboc/parameters/kgdboc
 
 2. Enter the kernel debugger manually or by waiting for an oops or
    fault. There are several ways you can enter the kernel debugger
-   manually; all involve using the sysrq-g, which means you must have
-   enabled CONFIG_MAGIC_SYSRQ=y in your kernel config.
+   manually; all involve using the :kbd:`SysRq-G`, which means you must have
+   enabled ``CONFIG_MAGIC_SysRq=y`` in your kernel config.
 
-   -  When logged in as root or with a super user session you can run:
+   -  When logged in as root or with a super user session you can run::
 
-      ``echo g > /proc/sysrq-trigger``
+	echo g > /proc/sysrq-trigger
 
-   -  Example using a laptop keyboard
+   -  Example using a laptop keyboard:
 
-      Press and hold down: ``Alt``
+      Press and hold down: :kbd:`Alt`
 
-      Press and hold down: ``Fn``
+      Press and hold down: :kbd:`Fn`
 
-      Press and release the key with the label: ``SysRq``
+      Press and release the key with the label: :kbd:`SysRq`
 
-      Release: ``Fn``
+      Release: :kbd:`Fn`
 
-      Press and release: ``g``
+      Press and release: :kbd:`g`
 
-      Release: ``Alt``
+      Release: :kbd:`Alt`
 
    -  Example using a PS/2 101-key keyboard
 
-      Press and hold down: ``Alt``
+      Press and hold down: :kbd:`Alt`
 
-      Press and release the key with the label: ``SysRq``
+      Press and release the key with the label: :kbd:`SysRq`
 
-      Press and release: ``g``
+      Press and release: :kbd:`g`
 
-      Release: ``Alt``
+      Release: :kbd:`Alt`
 
-3. Now type in a kdb command such as "help", "dmesg", "bt" or "go" to
+3. Now type in a kdb command such as ``help``, ``dmesg``, ``bt`` or ``go`` to
    continue kernel execution.
 
 Using kgdb / gdb
@@ -477,61 +485,51 @@ Connecting with gdb to a serial port
 
 1. Configure kgdboc
 
-   Configure kgdboc at boot using kernel parameters:
+   Configure kgdboc at boot using kernel parameters::
 
-   -  ``kgdboc=ttyS0,115200``
+	kgdboc=ttyS0,115200
 
    OR
 
-   Configure kgdboc after the kernel has booted:
+   Configure kgdboc after the kernel has booted::
 
-   -  ``echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc``
+	echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
 
 2. Stop kernel execution (break into the debugger)
 
    In order to connect to gdb via kgdboc, the kernel must first be
    stopped. There are several ways to stop the kernel which include
-   using kgdbwait as a boot argument, via a sysrq-g, or running the
+   using kgdbwait as a boot argument, via a :kbd:`SysRq-G`, or running the
    kernel until it takes an exception where it waits for the debugger to
    attach.
 
-   -  When logged in as root or with a super user session you can run:
+   -  When logged in as root or with a super user session you can run::
 
-      ``echo g > /proc/sysrq-trigger``
+	echo g > /proc/sysrq-trigger
 
    -  Example using minicom 2.2
 
-      Press: ``Control-a``
-
-      Press: ``f``
-
-      Press: ``g``
+      Press: :kbd:`CTRL-A` :kbd:`f` :kbd:`g`
 
    -  When you have telneted to a terminal server that supports sending
       a remote break
 
-      Press: ``Control-]``
+      Press: :kbd:`CTRL-]`
 
-      Type in:\ ``send break``
+      Type in: ``send break``
 
-      Press: ``Enter``
-
-      Press: ``g``
+      Press: :kbd:`Enter` :kbd:`g`
 
 3. Connect from gdb
 
-   Example (using a directly connected port):
-
-   ::
+   Example (using a directly connected port)::
 
            % gdb ./vmlinux
            (gdb) set remotebaud 115200
            (gdb) target remote /dev/ttyS0
 
 
-   Example (kgdb to a terminal server on TCP port 2012):
-
-   ::
+   Example (kgdb to a terminal server on TCP port 2012)::
 
            % gdb ./vmlinux
            (gdb) target remote 192.168.2.2:2012
@@ -543,12 +541,13 @@ Connecting with gdb to a serial port
    If you are having problems connecting or something is going seriously
    wrong while debugging, it will most often be the case that you want
    to enable gdb to be verbose about its target communications. You do
-   this prior to issuing the ``target
-       remote`` command by typing in: ``set debug remote 1``
+   this prior to issuing the ``target remote`` command by typing in::
+
+	set debug remote 1
 
 Remember if you continue in gdb, and need to "break in" again, you need
-to issue an other sysrq-g. It is easy to create a simple entry point by
-putting a breakpoint at ``sys_sync`` and then you can run "sync" from a
+to issue an other :kbd:`SysRq-G`. It is easy to create a simple entry point by
+putting a breakpoint at ``sys_sync`` and then you can run ``sync`` from a
 shell or script to break into the debugger.
 
 kgdb and kdb interoperability
@@ -565,22 +564,26 @@ Switching from kgdb to kdb
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 There are two ways to switch from kgdb to kdb: you can use gdb to issue
-a maintenance packet, or you can blindly type the command $3#33.
+a maintenance packet, or you can blindly type the command ``$3#33``.
 Whenever the kernel debugger stops in kgdb mode it will print the
 message ``KGDB or $3#33 for KDB``. It is important to note that you have
 to type the sequence correctly in one pass. You cannot type a backspace
 or delete because kgdb will interpret that as part of the debug stream.
 
-1. Change from kgdb to kdb by blindly typing:
+1. Change from kgdb to kdb by blindly typing::
 
-   ``$3#33``
+	$3#33
 
-2. Change from kgdb to kdb with gdb
+2. Change from kgdb to kdb with gdb::
 
-   ``maintenance packet 3``
+	maintenance packet 3
 
-   NOTE: Now you must kill gdb. Typically you press control-z and issue
-   the command: kill -9 %
+   .. note::
+
+     Now you must kill gdb. Typically you press :kbd:`CTRL-Z` and issue
+     the command::
+
+	kill -9 %
 
 Change from kdb to kgdb
 ~~~~~~~~~~~~~~~~~~~~~~~
@@ -592,9 +595,9 @@ shell looks for the typical first commands that gdb would issue with the
 gdb remote protocol and if it sees one of those commands it
 automatically changes into kgdb mode.
 
-1. From kdb issue the command:
+1. From kdb issue the command::
 
-   ``kgdb``
+	kgdb
 
    Now disconnect your terminal program and connect gdb in its place
 
@@ -613,13 +616,7 @@ are things like lsmod, dmesg, ps or possibly some of the memory
 information commands. To see all the kdb commands you can run
 ``monitor help``.
 
-Example:
-
-.. raw:: html
-
-   <div class="informalexample">
-
-::
+Example::
 
     (gdb) monitor ps
     1 idle process (state I) and
@@ -632,30 +629,25 @@ Example:
     0xc78789c0      944        1  0    0   S  0xc7878bf4  sh
     (gdb)
 
-
-.. raw:: html
-
-   </div>
-
 kgdb Test Suite
 ===============
 
 When kgdb is enabled in the kernel config you can also elect to enable
-the config parameter KGDB_TESTS. Turning this on will enable a special
+the config parameter ``KGDB_TESTS``. Turning this on will enable a special
 kgdb I/O module which is designed to test the kgdb internal functions.
 
 The kgdb tests are mainly intended for developers to test the kgdb
 internals as well as a tool for developing a new kgdb architecture
 specific implementation. These tests are not really for end users of the
 Linux kernel. The primary source of documentation would be to look in
-the drivers/misc/kgdbts.c file.
+the ``drivers/misc/kgdbts.c`` file.
 
 The kgdb test suite can also be configured at compile time to run the
 core set of tests by setting the kernel config parameter
-KGDB_TESTS_ON_BOOT. This particular option is aimed at automated
+``KGDB_TESTS_ON_BOOT``. This particular option is aimed at automated
 regression testing and does not require modifying the kernel boot config
 arguments. If this is turned on, the kgdb test suite can be disabled by
-specifying "kgdbts=" as a kernel boot argument.
+specifying ``kgdbts=`` as a kernel boot argument.
 
 Kernel Debugger Internals
 =========================
@@ -667,7 +659,7 @@ The kernel debugger is organized into a number of components:
 
 1. The debug core
 
-   The debug core is found in kernel/debugger/debug_core.c. It
+   The debug core is found in ``kernel/debugger/debug_core.c``. It
    contains:
 
    -  A generic OS exception handler which includes sync'ing the
@@ -688,20 +680,20 @@ The kernel debugger is organized into a number of components:
 
    -  The structures and callback API for atomic kernel mode setting.
 
-      NOTE: kgdboc is where the kms callbacks are invoked.
+      .. note:: kgdboc is where the kms callbacks are invoked.
 
 2. kgdb arch-specific implementation
 
-   This implementation is generally found in arch/\*/kernel/kgdb.c. As
-   an example, arch/x86/kernel/kgdb.c contains the specifics to
+   This implementation is generally found in ``arch/*/kernel/kgdb.c``. As
+   an example, ``arch/x86/kernel/kgdb.c`` contains the specifics to
    implement HW breakpoint as well as the initialization to dynamically
    register and unregister for the trap handlers on this architecture.
    The arch-specific portion implements:
 
    -  contains an arch-specific trap catcher which invokes
-      kgdb_handle_exception() to start kgdb about doing its work
+      :c:func:`kgdb_handle_exception` to start kgdb about doing its work
 
-   -  translation to and from gdb specific packet format to pt_regs
+   -  translation to and from gdb specific packet format to :c:type:`pt_regs`
 
    -  Registration and unregistration of architecture specific trap
       hooks
@@ -714,7 +706,7 @@ The kernel debugger is organized into a number of components:
 
 3. gdbstub frontend (aka kgdb)
 
-   The gdbstub is located in kernel/debug/gdbstub.c. It contains:
+   The gdbstub is located in ``kernel/debug/gdbstub.c``. It contains:
 
    -  All the logic to implement the gdb serial protocol
 
@@ -733,18 +725,18 @@ The kernel debugger is organized into a number of components:
 
    -  A registration API to register additional kdb shell commands.
 
-      -  A good example of a self-contained kdb module is the "ftdump"
+      -  A good example of a self-contained kdb module is the ``ftdump``
          command for dumping the ftrace buffer. See:
-         kernel/trace/trace_kdb.c
+         ``kernel/trace/trace_kdb.c``
 
       -  For an example of how to dynamically register a new kdb command
          you can build the kdb_hello.ko kernel module from
-         samples/kdb/kdb_hello.c. To build this example you can set
-         CONFIG_SAMPLES=y and CONFIG_SAMPLE_KDB=m in your kernel
-         config. Later run "modprobe kdb_hello" and the next time you
-         enter the kdb shell, you can run the "hello" command.
+         ``samples/kdb/kdb_hello.c``. To build this example you can set
+         ``CONFIG_SAMPLES=y`` and ``CONFIG_SAMPLE_KDB=m`` in your kernel
+         config. Later run ``modprobe kdb_hello`` and the next time you
+         enter the kdb shell, you can run the ``hello`` command.
 
-   -  The implementation for kdb_printf() which emits messages directly
+   -  The implementation for :c:func:`kdb_printf` which emits messages directly
       to I/O drivers, bypassing the kernel log.
 
    -  SW / HW breakpoint management for the kdb shell
@@ -780,21 +772,24 @@ architecture, and at that point you must create an architecture specific
 kgdb implementation.
 
 There are a few flags which must be set on every architecture in their
-<asm/kgdb.h> file. These are:
+``asm/kgdb.h`` file. These are:
 
--  NUMREGBYTES: The size in bytes of all of the registers, so that we
-   can ensure they will all fit into a packet.
+-  ``NUMREGBYTES``:
+     The size in bytes of all of the registers, so that we
+     can ensure they will all fit into a packet.
 
--  BUFMAX: The size in bytes of the buffer GDB will read into. This must
-   be larger than NUMREGBYTES.
+-  ``BUFMAX``:
+     The size in bytes of the buffer GDB will read into. This must
+     be larger than NUMREGBYTES.
 
--  CACHE_FLUSH_IS_SAFE: Set to 1 if it is always safe to call
-   flush_cache_range or flush_icache_range. On some architectures,
-   these functions may not be safe to call on SMP since we keep other
-   CPUs in a holding pattern.
+-  ``CACHE_FLUSH_IS_SAFE``:
+     Set to 1 if it is always safe to call
+     flush_cache_range or flush_icache_range. On some architectures,
+     these functions may not be safe to call on SMP since we keep other
+     CPUs in a holding pattern.
 
 There are also the following functions for the common backend, found in
-kernel/kgdb.c, that must be supplied by the architecture-specific
+``kernel/kgdb.c``, that must be supplied by the architecture-specific
 backend unless marked as (optional), in which case a default function
 maybe used if the architecture does not need to provide a specific
 implementation.
@@ -818,9 +813,9 @@ invokes a callback in the serial core which in turn uses the callback in
 the UART driver.
 
 When using kgdboc with a UART, the UART driver must implement two
-callbacks in the ``struct uart_ops``. Example from drivers/8250.c:
+callbacks in the :c:type:`struct uart_ops <uart_ops>`.
+Example from ``drivers/8250.c``::
 
-::
 
     #ifdef CONFIG_CONSOLE_POLL
         .poll_get_char = serial8250_get_poll_char,
@@ -838,46 +833,41 @@ consider, because failing here is most likely going to mean pressing the
 reset button.
 
 kgdboc and keyboards
-~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~
 
 The kgdboc driver contains logic to configure communications with an
 attached keyboard. The keyboard infrastructure is only compiled into the
-kernel when CONFIG_KDB_KEYBOARD=y is set in the kernel configuration.
+kernel when ``CONFIG_KDB_KEYBOARD=y`` is set in the kernel configuration.
 
 The core polled keyboard driver driver for PS/2 type keyboards is in
-drivers/char/kdb_keyboard.c. This driver is hooked into the debug core
+``drivers/char/kdb_keyboard.c``. This driver is hooked into the debug core
 when kgdboc populates the callback in the array called
-``kdb_poll_funcs[]``. The kdb_get_kbd_char() is the top-level
+:c:type:`kdb_poll_funcs[]`. The :c:func:`kdb_get_kbd_char` is the top-level
 function which polls hardware for single character input.
 
 kgdboc and kms
-~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~
 
 The kgdboc driver contains logic to request the graphics display to
-switch to a text context when you are using "kgdboc=kms,kbd", provided
+switch to a text context when you are using ``kgdboc=kms,kbd``, provided
 that you have a video driver which has a frame buffer console and atomic
 kernel mode setting support.
 
 Every time the kernel debugger is entered it calls
-kgdboc_pre_exp_handler() which in turn calls con_debug_enter() in
-the virtual console layer. On resuming kernel execution, the kernel
-debugger calls kgdboc_post_exp_handler() which in turn calls
-con_debug_leave().
+:c:func:`kgdboc_pre_exp_handler` which in turn calls :c:func:`con_debug_enter`
+in the virtual console layer. On resuming kernel execution, the kernel
+debugger calls :c:func:`kgdboc_post_exp_handler` which in turn calls
+:c:func:`con_debug_leave`.
 
 Any video driver that wants to be compatible with the kernel debugger
-and the atomic kms callbacks must implement the mode_set_base_atomic,
-fb_debug_enter and fb_debug_leave operations. For the
-fb_debug_enter and fb_debug_leave the option exists to use the
+and the atomic kms callbacks must implement the ``mode_set_base_atomic``,
+``fb_debug_enter`` and ``fb_debug_leave operations``. For the
+``fb_debug_enter`` and ``fb_debug_leave`` the option exists to use the
 generic drm fb helper functions or implement something custom for the
 hardware. The following example shows the initialization of the
 .mode_set_base_atomic operation in
-drivers/gpu/drm/i915/intel_display.c:
+drivers/gpu/drm/i915/intel_display.c::
 
-.. raw:: html
-
-   <div class="informalexample">
-
-::
 
     static const struct drm_crtc_helper_funcs intel_helper_funcs = {
     [...]
@@ -886,19 +876,10 @@ drivers/gpu/drm/i915/intel_display.c:
     };
 
 
-.. raw:: html
-
-   </div>
-
 Here is an example of how the i915 driver initializes the
 fb_debug_enter and fb_debug_leave functions to use the generic drm
-helpers in drivers/gpu/drm/i915/intel_fb.c:
+helpers in ``drivers/gpu/drm/i915/intel_fb.c``::
 
-.. raw:: html
-
-   <div class="informalexample">
-
-::
 
     static struct fb_ops intelfb_ops = {
     [...]
@@ -908,23 +889,19 @@ helpers in drivers/gpu/drm/i915/intel_fb.c:
     };
 
 
-.. raw:: html
-
-   </div>
-
 Credits
 =======
 
 The following people have contributed to this document:
 
-1. Amit Kale\ amitkale@linsyssoft.com
+1. Amit Kale <amitkale@linsyssoft.com>
 
-2. Tom Rini\ trini@kernel.crashing.org
+2. Tom Rini <trini@kernel.crashing.org>
 
 In March 2008 this document was completely rewritten by:
 
--  Jason Wessel\ jason.wessel@windriver.com
+-  Jason Wessel <jason.wessel@windriver.com>
 
 In Jan 2010 this document was updated to include kdb.
 
--  Jason Wessel\ jason.wessel@windriver.com
+-  Jason Wessel <jason.wessel@windriver.com>
-- 
2.9.3
