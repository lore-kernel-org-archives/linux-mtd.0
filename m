Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWew-0005ga-Bd
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:57 +0000
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
Subject: [PATCH 20/30] memory-hotplug.txt: standardize document format
Date: Thu, 18 May 2017 22:24:12 -0300
Message-Id: <508cb03af0b8b8c1fc2e31d88d19e2e844810d25.1495156975.git.mchehab@s-opensource.com>
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

- use :Created: and :Updated: for the timestamps;
- comment its internal index;
- adjust titles and use proper markup;
- Whitespace fixes;
- Use cross references where needed;
- Use bulleted lists where needed;
- mark literal blocks;
- Use the ReST notation for a table.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/memory-hotplug.txt | 357 +++++++++++++++++++++------------------
 1 file changed, 195 insertions(+), 162 deletions(-)

diff --git a/Documentation/memory-hotplug.txt b/Documentation/memory-hotplug.txt
index 670f3ded0802..e2d1f455dcc7 100644
--- a/Documentation/memory-hotplug.txt
+++ b/Documentation/memory-hotplug.txt
@@ -2,43 +2,48 @@
 Memory Hotplug
 ==============
 
-Created:					Jul 28 2007
-Add description of notifier of memory hotplug	Oct 11 2007
+:Created:							Jul 28 2007
+:Updated: Add description of notifier of memory hotplug:	Oct 11 2007
 
 This document is about memory hotplug including how-to-use and current status.
 Because Memory Hotplug is still under development, contents of this text will
 be changed often.
 
-1. Introduction
-  1.1 purpose of memory hotplug
-  1.2. Phases of memory hotplug
-  1.3. Unit of Memory online/offline operation
-2. Kernel Configuration
-3. sysfs files for memory hotplug
-4. Physical memory hot-add phase
-  4.1 Hardware(Firmware) Support
-  4.2 Notify memory hot-add event by hand
-5. Logical Memory hot-add phase
-  5.1. State of memory
-  5.2. How to online memory
-6. Logical memory remove
-  6.1 Memory offline and ZONE_MOVABLE
-  6.2. How to offline memory
-7. Physical memory remove
-8. Memory hotplug event notifier
-9. Future Work List
-
-Note(1): x86_64's has special implementation for memory hotplug.
-         This text does not describe it.
-Note(2): This text assumes that sysfs is mounted at /sys.
-
-
----------------
-1. Introduction
----------------
-
-1.1 purpose of memory hotplug
-------------
+.. CONTENTS
+
+  1. Introduction
+    1.1 purpose of memory hotplug
+    1.2. Phases of memory hotplug
+    1.3. Unit of Memory online/offline operation
+  2. Kernel Configuration
+  3. sysfs files for memory hotplug
+  4. Physical memory hot-add phase
+    4.1 Hardware(Firmware) Support
+    4.2 Notify memory hot-add event by hand
+  5. Logical Memory hot-add phase
+    5.1. State of memory
+    5.2. How to online memory
+  6. Logical memory remove
+    6.1 Memory offline and ZONE_MOVABLE
+    6.2. How to offline memory
+  7. Physical memory remove
+  8. Memory hotplug event notifier
+  9. Future Work List
+
+
+.. note::
+
+    (1) x86_64's has special implementation for memory hotplug.
+        This text does not describe it.
+    (2) This text assumes that sysfs is mounted at /sys.
+
+
+Introduction
+============
+
+purpose of memory hotplug
+-------------------------
+
 Memory Hotplug allows users to increase/decrease the amount of memory.
 Generally, there are two purposes.
 
@@ -53,9 +58,11 @@ hardware which supports memory power management.
 Linux memory hotplug is designed for both purpose.
 
 
-1.2. Phases of memory hotplug
----------------
-There are 2 phases in Memory Hotplug.
+Phases of memory hotplug
+------------------------
+
+There are 2 phases in Memory Hotplug:
+
   1) Physical Memory Hotplug phase
   2) Logical Memory Hotplug phase.
 
@@ -70,7 +77,7 @@ management tables, and makes sysfs files for new memory's operation.
 If firmware supports notification of connection of new memory to OS,
 this phase is triggered automatically. ACPI can notify this event. If not,
 "probe" operation by system administration is used instead.
-(see Section 4.).
+(see :ref:`memory_hotplug_physical_mem`).
 
 Logical Memory Hotplug phase is to change memory state into
 available/unavailable for users. Amount of memory from user's view is
@@ -83,11 +90,12 @@ Logical Memory Hotplug phase is triggered by write of sysfs file by system
 administrator. For the hot-add case, it must be executed after Physical Hotplug
 phase by hand.
 (However, if you writes udev's hotplug scripts for memory hotplug, these
- phases can be execute in seamless way.)
+phases can be execute in seamless way.)
 
 
-1.3. Unit of Memory online/offline operation
-------------
+Unit of Memory online/offline operation
+---------------------------------------
+
 Memory hotplug uses SPARSEMEM memory model which allows memory to be divided
 into chunks of the same size. These chunks are called "sections". The size of
 a memory section is architecture dependent. For example, power uses 16MiB, ia64
@@ -97,46 +105,50 @@ Memory sections are combined into chunks referred to as "memory blocks". The
 size of a memory block is architecture dependent and represents the logical
 unit upon which memory online/offline operations are to be performed. The
 default size of a memory block is the same as memory section size unless an
-architecture specifies otherwise. (see Section 3.)
+architecture specifies otherwise. (see :ref:`memory_hotplug_sysfs_files`.)
 
 To determine the size (in bytes) of a memory block please read this file:
 
 /sys/devices/system/memory/block_size_bytes
 
 
------------------------
-2. Kernel Configuration
------------------------
+Kernel Configuration
+====================
+
 To use memory hotplug feature, kernel must be compiled with following
 config options.
 
-- For all memory hotplug
-    Memory model -> Sparse Memory  (CONFIG_SPARSEMEM)
-    Allow for memory hot-add       (CONFIG_MEMORY_HOTPLUG)
+- For all memory hotplug:
+    - Memory model -> Sparse Memory  (CONFIG_SPARSEMEM)
+    - Allow for memory hot-add       (CONFIG_MEMORY_HOTPLUG)
 
-- To enable memory removal, the following are also necessary
-    Allow for memory hot remove    (CONFIG_MEMORY_HOTREMOVE)
-    Page Migration                 (CONFIG_MIGRATION)
+- To enable memory removal, the following are also necessary:
+    - Allow for memory hot remove    (CONFIG_MEMORY_HOTREMOVE)
+    - Page Migration                 (CONFIG_MIGRATION)
 
-- For ACPI memory hotplug, the following are also necessary
-    Memory hotplug (under ACPI Support menu) (CONFIG_ACPI_HOTPLUG_MEMORY)
-    This option can be kernel module.
+- For ACPI memory hotplug, the following are also necessary:
+    - Memory hotplug (under ACPI Support menu) (CONFIG_ACPI_HOTPLUG_MEMORY)
+    - This option can be kernel module.
 
 - As a related configuration, if your box has a feature of NUMA-node hotplug
   via ACPI, then this option is necessary too.
-    ACPI0004,PNP0A05 and PNP0A06 Container Driver (under ACPI Support menu)
-    (CONFIG_ACPI_CONTAINER).
-    This option can be kernel module too.
 
+    - ACPI0004,PNP0A05 and PNP0A06 Container Driver (under ACPI Support menu)
+      (CONFIG_ACPI_CONTAINER).
+
+     This option can be kernel module too.
+
+
+.. _memory_hotplug_sysfs_files:
+
+sysfs files for memory hotplug
+==============================
 
---------------------------------
-3 sysfs files for memory hotplug
---------------------------------
 All memory blocks have their device information in sysfs.  Each memory block
-is described under /sys/devices/system/memory as
+is described under /sys/devices/system/memory as:
 
-/sys/devices/system/memory/memoryXXX
-(XXX is the memory block id.)
+	/sys/devices/system/memory/memoryXXX
+	(XXX is the memory block id.)
 
 For the memory block covered by the sysfs directory.  It is expected that all
 memory sections in this range are present and no memory holes exist in the
@@ -145,43 +157,53 @@ the existence of one should not affect the hotplug capabilities of the memory
 block.
 
 For example, assume 1GiB memory block size. A device for a memory starting at
-0x100000000 is /sys/device/system/memory/memory4
-(0x100000000 / 1Gib = 4)
+0x100000000 is /sys/device/system/memory/memory4::
+
+	(0x100000000 / 1Gib = 4)
+
 This device covers address range [0x100000000 ... 0x140000000)
 
 Under each memory block, you can see 5 files:
 
-/sys/devices/system/memory/memoryXXX/phys_index
-/sys/devices/system/memory/memoryXXX/phys_device
-/sys/devices/system/memory/memoryXXX/state
-/sys/devices/system/memory/memoryXXX/removable
-/sys/devices/system/memory/memoryXXX/valid_zones
+- /sys/devices/system/memory/memoryXXX/phys_index
+- /sys/devices/system/memory/memoryXXX/phys_device
+- /sys/devices/system/memory/memoryXXX/state
+- /sys/devices/system/memory/memoryXXX/removable
+- /sys/devices/system/memory/memoryXXX/valid_zones
+
+=================== ============================================================
+``phys_index``      read-only and contains memory block id, same as XXX.
+``state``           read-write
+
+                    - at read:  contains online/offline state of memory.
+                    - at write: user can specify "online_kernel",
 
-'phys_index'      : read-only and contains memory block id, same as XXX.
-'state'           : read-write
-                    at read:  contains online/offline state of memory.
-                    at write: user can specify "online_kernel",
                     "online_movable", "online", "offline" command
                     which will be performed on all sections in the block.
-'phys_device'     : read-only: designed to show the name of physical memory
+``phys_device``     read-only: designed to show the name of physical memory
                     device.  This is not well implemented now.
-'removable'       : read-only: contains an integer value indicating
+``removable``       read-only: contains an integer value indicating
                     whether the memory block is removable or not
                     removable.  A value of 1 indicates that the memory
                     block is removable and a value of 0 indicates that
                     it is not removable. A memory block is removable only if
                     every section in the block is removable.
-'valid_zones'     : read-only: designed to show which zones this memory block
+``valid_zones``     read-only: designed to show which zones this memory block
 		    can be onlined to.
-		    The first column shows it's default zone.
+
+		    The first column shows it`s default zone.
+
 		    "memory6/valid_zones: Normal Movable" shows this memoryblock
 		    can be onlined to ZONE_NORMAL by default and to ZONE_MOVABLE
 		    by online_movable.
+
 		    "memory7/valid_zones: Movable Normal" shows this memoryblock
 		    can be onlined to ZONE_MOVABLE by default and to ZONE_NORMAL
 		    by online_kernel.
+=================== ============================================================
+
+.. note::
 
-NOTE:
   These directories/files appear after physical memory hotplug phase.
 
 If CONFIG_NUMA is enabled the memoryXXX/ directories can also be accessed
@@ -193,13 +215,14 @@ For example:
 A backlink will also be created:
 /sys/devices/system/memory/memory9/node0 -> ../../node/node0
 
+.. _memory_hotplug_physical_mem:
 
---------------------------------
-4. Physical memory hot-add phase
---------------------------------
+Physical memory hot-add phase
+=============================
+
+Hardware(Firmware) Support
+--------------------------
 
-4.1 Hardware(Firmware) Support
-------------
 On x86_64/ia64 platform, memory hotplug by ACPI is supported.
 
 In general, the firmware (ACPI) which supports memory hotplug defines
@@ -209,7 +232,8 @@ script. This will be done automatically.
 
 But scripts for memory hotplug are not contained in generic udev package(now).
 You may have to write it by yourself or online/offline memory by hand.
-Please see "How to online memory", "How to offline memory" in this text.
+Please see :ref:`memory_hotplug_how_to_online_memory` and
+:ref:`memory_hotplug_how_to_offline_memory`.
 
 If firmware supports NUMA-node hotplug, and defines an object _HID "ACPI0004",
 "PNP0A05", or "PNP0A06", notification is asserted to it, and ACPI handler
@@ -217,8 +241,9 @@ calls hotplug code for all of objects which are defined in it.
 If memory device is found, memory hotplug code will be called.
 
 
-4.2 Notify memory hot-add event by hand
-------------
+Notify memory hot-add event by hand
+-----------------------------------
+
 On some architectures, the firmware may not notify the kernel of a memory
 hotplug event.  Therefore, the memory "probe" interface is supported to
 explicitly notify the kernel.  This interface depends on
@@ -229,45 +254,48 @@ notification.
 Probe interface is located at
 /sys/devices/system/memory/probe
 
-You can tell the physical address of new memory to the kernel by
+You can tell the physical address of new memory to the kernel by::
 
-% echo start_address_of_new_memory > /sys/devices/system/memory/probe
+	% echo start_address_of_new_memory > /sys/devices/system/memory/probe
 
 Then, [start_address_of_new_memory, start_address_of_new_memory +
 memory_block_size] memory range is hot-added. In this case, hotplug script is
 not called (in current implementation). You'll have to online memory by
-yourself.  Please see "How to online memory" in this text.
+yourself.  Please see :ref:`memory_hotplug_how_to_online_memory`.
 
 
-------------------------------
-5. Logical Memory hot-add phase
-------------------------------
+Logical Memory hot-add phase
+============================
 
-5.1. State of memory
-------------
-To see (online/offline) state of a memory block, read 'state' file.
+State of memory
+---------------
 
-% cat /sys/device/system/memory/memoryXXX/state
+To see (online/offline) state of a memory block, read 'state' file::
 
+	% cat /sys/device/system/memory/memoryXXX/state
 
-If the memory block is online, you'll read "online".
-If the memory block is offline, you'll read "offline".
 
+- If the memory block is online, you'll read "online".
+- If the memory block is offline, you'll read "offline".
+
+
+.. _memory_hotplug_how_to_online_memory:
+
+How to online memory
+--------------------
 
-5.2. How to online memory
-------------
 When the memory is hot-added, the kernel decides whether or not to "online"
-it according to the policy which can be read from "auto_online_blocks" file:
+it according to the policy which can be read from "auto_online_blocks" file::
 
-% cat /sys/devices/system/memory/auto_online_blocks
+	% cat /sys/devices/system/memory/auto_online_blocks
 
 The default depends on the CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE kernel config
 option. If it is disabled the default is "offline" which means the newly added
 memory is not in a ready-to-use state and you have to "online" the newly added
 memory blocks manually. Automatic onlining can be requested by writing "online"
-to "auto_online_blocks" file:
+to "auto_online_blocks" file::
 
-% echo online > /sys/devices/system/memory/auto_online_blocks
+	% echo online > /sys/devices/system/memory/auto_online_blocks
 
 This sets a global policy and impacts all memory blocks that will subsequently
 be hotplugged. Currently offline blocks keep their state. It is possible, under
@@ -277,20 +305,22 @@ online. User space tools can check their "state" files
 
 If the automatic onlining wasn't requested, failed, or some memory block was
 offlined it is possible to change the individual block's state by writing to the
-"state" file:
+"state" file::
 
-% echo online > /sys/devices/system/memory/memoryXXX/state
+	% echo online > /sys/devices/system/memory/memoryXXX/state
 
 This onlining will not change the ZONE type of the target memory block,
-If the memory block is in ZONE_NORMAL, you can change it to ZONE_MOVABLE:
+If the memory block is in ZONE_NORMAL, you can change it to ZONE_MOVABLE::
 
-% echo online_movable > /sys/devices/system/memory/memoryXXX/state
-(NOTE: current limit: this memory block must be adjacent to ZONE_MOVABLE)
+	% echo online_movable > /sys/devices/system/memory/memoryXXX/state
 
-And if the memory block is in ZONE_MOVABLE, you can change it to ZONE_NORMAL:
+.. note:: current limit: this memory block must be adjacent to ZONE_MOVABLE
 
-% echo online_kernel > /sys/devices/system/memory/memoryXXX/state
-(NOTE: current limit: this memory block must be adjacent to ZONE_NORMAL)
+And if the memory block is in ZONE_MOVABLE, you can change it to ZONE_NORMAL::
+
+	% echo online_kernel > /sys/devices/system/memory/memoryXXX/state
+
+.. note:: current limit: this memory block must be adjacent to ZONE_NORMAL
 
 After this, memory block XXX's state will be 'online' and the amount of
 available memory will be increased.
@@ -300,12 +330,12 @@ This may be changed in future.
 
 
 
-------------------------
-6. Logical memory remove
-------------------------
+Logical memory remove
+=====================
+
+Memory offline and ZONE_MOVABLE
+-------------------------------
 
-6.1 Memory offline and ZONE_MOVABLE
-------------
 Memory offlining is more complicated than memory online. Because memory offline
 has to make the whole memory block be unused, memory offline can fail if
 the memory block includes memory which cannot be freed.
@@ -330,24 +360,27 @@ Assume the system has "TOTAL" amount of memory at boot time, this boot option
 creates ZONE_MOVABLE as following.
 
 1) When kernelcore=YYYY boot option is used,
-  Size of memory not for movable pages (not for offline) is YYYY.
-  Size of memory for movable pages (for offline) is TOTAL-YYYY.
+   Size of memory not for movable pages (not for offline) is YYYY.
+   Size of memory for movable pages (for offline) is TOTAL-YYYY.
 
 2) When movablecore=ZZZZ boot option is used,
-  Size of memory not for movable pages (not for offline) is TOTAL - ZZZZ.
-  Size of memory for movable pages (for offline) is ZZZZ.
+   Size of memory not for movable pages (not for offline) is TOTAL - ZZZZ.
+   Size of memory for movable pages (for offline) is ZZZZ.
 
+.. note::
 
-Note: Unfortunately, there is no information to show which memory block belongs
-to ZONE_MOVABLE. This is TBD.
+   Unfortunately, there is no information to show which memory block belongs
+   to ZONE_MOVABLE. This is TBD.
 
+.. _memory_hotplug_how_to_offline_memory:
+
+How to offline memory
+---------------------
 
-6.2. How to offline memory
-------------
 You can offline a memory block by using the same sysfs interface that was used
-in memory onlining.
+in memory onlining::
 
-% echo offline > /sys/devices/system/memory/memoryXXX/state
+	% echo offline > /sys/devices/system/memory/memoryXXX/state
 
 If offline succeeds, the state of the memory block is changed to be "offline".
 If it fails, some error core (like -EBUSY) will be returned by the kernel.
@@ -361,22 +394,22 @@ able to offline it (or not). (For example, a page is referred to by some kernel
 internal call and released soon.)
 
 Consideration:
-Memory hotplug's design direction is to make the possibility of memory offlining
-higher and to guarantee unplugging memory under any situation. But it needs
-more work. Returning -EBUSY under some situation may be good because the user
-can decide to retry more or not by himself. Currently, memory offlining code
-does some amount of retry with 120 seconds timeout.
+  Memory hotplug's design direction is to make the possibility of memory
+  offlining higher and to guarantee unplugging memory under any situation. But
+  it needs more work. Returning -EBUSY under some situation may be good because
+  the user can decide to retry more or not by himself. Currently, memory
+  offlining code does some amount of retry with 120 seconds timeout.
+
+Physical memory remove
+======================
 
--------------------------
-7. Physical memory remove
--------------------------
 Need more implementation yet....
  - Notification completion of remove works by OS to firmware.
  - Guard from remove if not yet.
 
---------------------------------
-8. Memory hotplug event notifier
---------------------------------
+Memory hotplug event notifier
+=============================
+
 Hotplugging events are sent to a notification queue.
 
 There are six types of notification defined in include/linux/memory.h:
@@ -406,14 +439,14 @@ MEM_CANCEL_OFFLINE
 MEM_OFFLINE
   Generated after offlining memory is complete.
 
-A callback routine can be registered by calling
+A callback routine can be registered by calling::
 
   hotplug_memory_notifier(callback_func, priority)
 
 Callback functions with higher values of priority are called before callback
 functions with lower values.
 
-A callback function must have the following prototype:
+A callback function must have the following prototype::
 
   int callback_func(
     struct notifier_block *self, unsigned long action, void *arg);
@@ -421,27 +454,28 @@ A callback function must have the following prototype:
 The first argument of the callback function (self) is a pointer to the block
 of the notifier chain that points to the callback function itself.
 The second argument (action) is one of the event types described above.
-The third argument (arg) passes a pointer of struct memory_notify.
+The third argument (arg) passes a pointer of struct memory_notify::
 
-struct memory_notify {
-       unsigned long start_pfn;
-       unsigned long nr_pages;
-       int status_change_nid_normal;
-       int status_change_nid_high;
-       int status_change_nid;
-}
+	struct memory_notify {
+		unsigned long start_pfn;
+		unsigned long nr_pages;
+		int status_change_nid_normal;
+		int status_change_nid_high;
+		int status_change_nid;
+	}
 
-start_pfn is start_pfn of online/offline memory.
-nr_pages is # of pages of online/offline memory.
-status_change_nid_normal is set node id when N_NORMAL_MEMORY of nodemask
-is (will be) set/clear, if this is -1, then nodemask status is not changed.
-status_change_nid_high is set node id when N_HIGH_MEMORY of nodemask
-is (will be) set/clear, if this is -1, then nodemask status is not changed.
-status_change_nid is set node id when N_MEMORY of nodemask is (will be)
-set/clear. It means a new(memoryless) node gets new memory by online and a
-node loses all memory. If this is -1, then nodemask status is not changed.
-If status_changed_nid* >= 0, callback should create/discard structures for the
-node if necessary.
+- start_pfn is start_pfn of online/offline memory.
+- nr_pages is # of pages of online/offline memory.
+- status_change_nid_normal is set node id when N_NORMAL_MEMORY of nodemask
+  is (will be) set/clear, if this is -1, then nodemask status is not changed.
+- status_change_nid_high is set node id when N_HIGH_MEMORY of nodemask
+  is (will be) set/clear, if this is -1, then nodemask status is not changed.
+- status_change_nid is set node id when N_MEMORY of nodemask is (will be)
+  set/clear. It means a new(memoryless) node gets new memory by online and a
+  node loses all memory. If this is -1, then nodemask status is not changed.
+
+  If status_changed_nid* >= 0, callback should create/discard structures for the
+  node if necessary.
 
 The callback routine shall return one of the values
 NOTIFY_DONE, NOTIFY_OK, NOTIFY_BAD, NOTIFY_STOP
@@ -455,9 +489,9 @@ further processing of the notification queue.
 
 NOTIFY_STOP stops further processing of the notification queue.
 
---------------
-9. Future Work
---------------
+Future Work
+===========
+
   - allowing memory hot-add to ZONE_MOVABLE. maybe we need some switch like
     sysctl or new control file.
   - showing memory block and physical device relationship.
@@ -465,4 +499,3 @@ NOTIFY_STOP stops further processing of the notification queue.
   - support HugeTLB page migration and offlining.
   - memmap removing at memory offline.
   - physical remove memory.
-
-- 
2.9.4
