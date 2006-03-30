Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOs2S-000677-VJ
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 02:57:55 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Mar 2006 11:57:37 +0400
Message-ID: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
From: "Belyakov, Alexander" <alexander.belyakov@intel.com>
To: <linux-mtd@lists.infradead.org>
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>
Subject: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello again!

As it was promised I have split patch with striping and related stuff
into three parts.

1. Striping core itself (this message)
2. Thread switching workaround ([PATCH/RFC] CFI: Threads switching issue
fix)
3. CFI Common polling thread ([PATCH/RFC] CFI: Common polling thread
feature)

This very message mainly contains striping layer core code. And, Yes, I
have extended explanations on it.

Lets start with striping layer brief description.

1. INTRODUCTION
The basic purpose of striping is to increase performance of memory
(flash chip in our case) operations using two or more independent
devices. Data are split into parts of a user-defined size (interleave
size), and these data chunks are sent to each chip. As system has
several independent chips it is possible to write chunks of data
simultaneously increasing overall operation performance.

One may say that striping is quite similar to already existing in MTD
concatenation layer. That is not true since these layers have some sharp
distinctions. The first one is the purpose. Concatenation only purpose
is to make larger device from several smaller devices. Striping purpose
is to make devices operate faster. Next difference is provided access to
sub-devices. Concatenation layer provides linear access to sub-devices.
Striping provides interleaved access to sub-devices.

For those who are familiar with RAID techniques I can draw an analogy.
Concatenation is like JBOD in the world of hard drives. JBOD means "just
a bunch of disks". Meanwhile striping is like RAID (Redundant Arrays of
Inexpensive Disks) level 0. Note, this analogy is for basic concept
clarification purpose only.


2. IMPLEMENTATION NOTES
First of all striped device is still a MTD device from the users point
of view. Users use usual mtd->* operations when work with them.

Devices representing parts of striped device are called sub-devices.

Whole striping layer can be divided into two functional parts. The first
one is sub-devices interleaving algorithm. The second one is providing
simultaneous operation pieces delivery to independent chips.

2.1. Interleaving algorithm
The data are split into chunks of so called interleave size. And these
chunks are pushed to chip queues. For example, if we have 2 physically
independent flash devices and choose interleaving size of 128 bytes.
Then write operation with 1024 bytes of data is issued by some
application. Interleaving algorithm splits data in 8 chunks and pushes
them into chip queues. Fist chip queue get chunk 1, chunk 3, chunk 5 and
chunk 7. Second chip queue get chunk 2, chunk 4, chunk 6 and chunk 8. In
the best case these chunks will written to flashes in pairs: chunk 1 and
chunk 2 at one time, chunk 3 and chunk 4 next, then chunk 5 and chunk 6,
chunk 7 and chunk 8 are the last.

Next to be mentioned here is erase block construction. The resulting
erase block size is the least common multiple (LCM) of sub-devices erase
sizes multiplied on number of sub-devices to be striped. When one erases
an erase block of the striped device, in general case several physical
erase blocks of sub-devices are erased. The main idea here is the
virtual "merging" of sub-devices erase blocks. In case of striping
different size devices additional increase of striped device erase size
might appear. For example, if we have 3 equal erase size (say, A bytes)
devices we get the erase size of striped device (A*3) bytes in case of
equal size devices. If we have the same 3 devices but total size of one
of them is smaller then we get the erase size of striped device (A*3*2).

Bad block handling is another question here. If one marks striped device
block as bad then all sub-devices blocks representing that striped
device block will be marked as bad despite not all of them are actually
bad.

2.2. Threads
Simultaneous operation means separate threads. Each independent chip
which participates in creation of striped volume has its own worker
thread. Worker threads are created at the stage of striped device
initialization. Each worker thread has its own operation queue and
interleaving algorithm feeds them. Worker threads interact with flash
drivers (CFI, NAND subsystem).


3. POSSIBLE CONFIGURATIONS AND LIMITATIONS
It is possible to stripe devices of the same type. We can't stripe NOR
and NAND, but only NOR and NOR or NAND and NAND. Flashes of the same
type can differ in erase size and total size.=20

3.1. Number of devices
Theoretically it is possible to stripe any number of sub-devices. But in
case of striping non-power-of-two number of sub-devices one should
always remember that someone even inside MTD code can try to make
alignment check or something else that assumes erase size being
power-of-two number. So be careful.

3.2. Different size sub-devices
Sub-devices can be of different sizes. There is a plain and simple usage
case for that. For example, you have two independent chips in the system
of the same type and total size. But one of those chips contains
bootloader, kernel and rootfs. So you have only part of one chip
available. And it is good idea to stripe one MTD device representing
whole chip and another one representing free partition on chip with
bootloader and kernel. In that case you will not waste the space.

But due to some properties of interleaving algorithm it is very likely
get increased erase size in case of striping thre ore more devices with
different size.

3.3. Different erase size sub-devices
As it was said it is possible to stripe devices with different erase
size (quite uncommon case). In that case LCM of erase sizes multiplied
on number of devices produces erase size of striped volume.

3.4. Different speed devices
Important thing that striping two devices with essentially different
write/erase speed will not give significant performance increase since
striped device will work with the speed of the slowest sub-device.

3.5. XIP
Using striping with XIP will not lead to any performance increase.


4. HOWTO CONFIGURE (WITH EXAMPLES)
There are two possible ways to configure striped device.

4.1. Built-in module
Allow generic configuration of the MTD striped volumes via the kernel
configuration string. The format is as follows:

mtdstripe=3D<stripedef>[;<stripedef>]
<stripedef> :=3D =
<stripename>(<interleavesize>):<subdevname>,<subdevname>
	 =20
Example:
CONFIG_CMDLINE=3D"..........
mtdparts=3Dflash1:512k(blob)ro,2m(kernel)ro,16m(root),16m(vol1),8m(vol2);=
f
lash2:16m(vol3),8m(vol4)
mtdstripe=3Dstripe1(128):vol1,vol3;stripe2(128):vol2,vol4 ........."

In case of statically kernel link and kernel configuration string
parameters set striping is to be initialized by mphysmap module.

4.2. Standalone module
If you build mtdstripe.ko as a standalone module it is possible to pass
command line to the module via insmod. The format for the command line
is as follows:

insmod mtdstripe.ko byname=3D"<stripedef>[;<stripedef>]"
<stripedef> :=3D =
<stripename>(<interleavesize>):<subdevname>.<subdevname>
	 =20
or it is possible to use MTD device number from "cat /proc/mtd" instead
of names:
	 =20
insmod mtdstripe.ko bynumber=3D"<stripedef>[;<stripedef>]"
<stripedef> :=3D
<stripename>(<interleavesize>):<subdevnumber>.<subdevnumber>
	 =20
Examples:
insmod mtdstripe.ko
byname=3D"stripe1(128):vol1.vol3;stripe2(128):vol2.vol4"
insmod mtdstripe.ko bynumber=3D"stripe1(128):3.5;stripe2(128):4.6"
	 =20
Note: you should use '.' as a delimiter for sub-device names and number
here due to insmod arguments limitation

4.3. How to choose interleave size?
Sub-devices should belong to different (independent) physical flash
chips in order to get performance increase. Interleave size describes
striping granularity and it is very important from performance point of
view. Write operation performance increase should be expected only if
the amount of data to be written larger than interleave size. For
example, if we have 512 bytes interleave size, we see no write speed
boost for files smaller than 512 bytes. File systems have a write buffer
of well known size (let it be 4096 bytes). Thus it is not good idea to
set interleave size larger than 2048 byte if we are striping two flash
chips and going to use the file system on it. For NOR devices the bottom
border for interleave size is defined by flash buffer size (64 bytes,
128 bytes, etc). But such a small values affects read speed on striped
volumes. Read performance decrease on striped volume is due to large
number of read sub-operations. Thus, if you are going to stripe N
devices and launch a file system having write buffer of size B, the
better choice for interleave size is IS =3D B / N or somewhat smaller, =
but
not smaller than single flash chip buffer size.

For NAND you should use page size as interleave size value.


5. KNOWN ISSUES AND POSSIBLE SOLUTIONS
In order to provide real simultaneous writes is very important to be
sure that worker thread switches to another while device is flushing
data from buffer to the chip. The original MTD code has an issue with
such a switching. If we have two thread of the same priority, one of
them will monopolize CPU until all the data chunks from its queue are
flushed to the chip. Apparently such a behavior will not gives any
performance increase. Here is an example:

Say we have 2 physically independent flash devices (striping layer has 2
worker threads) with interleaving size of 128 bytes. Write operation
with 1024 bytes of data is issued. Interleaving algorithm splits data in
8 chunks and pushes them into worker thread queues. Fist chip queue get
chunk 1, chunk 3, chunk 5 and chunk 7. Second chip queue get chunk 2,
chunk 4, chunk 6 and chunk 8. At this point both worker threads have the
same priority equal (in simple case) to priority of the caller thread.
Write to flashes begins here.

Worker thread 1 puts chunk 1 to flash 1 buffer and get free time
flushing data to flash. At that free time worker thread 2 should get
control and write chunk 2 to flash 2. But it won't despite worker thread
1 invokes rescheduling. Since switching between two threads with equal
priority has some uncertainty. And data chunks will be written in the
following order:

chunk 1
chunk 3
chunk 5
chunk 7
chunk 2
chunk 4
chunk 6
chunk 8

instead of expected:

chunk 1   chunk 2
chunk 3   chunk 4
chunk 5   chunk 6
chunk 7   chunk 8

It is obvious that one will not get any performance increase in the
first case.

That is not only striping problem, but also a problem of several
instances of file system mounted on different flashes. These file
systems also will not work simultaneously despite they are using
independent chips.

Two of possible solutions are presented in separated mailing threads
accompanying this one.

5.1. Threads priority switching
The suggested in separate message ([PATCH/RFC] CFI: Threads switching
issue fix) solution deals with temporarily threads priority lowering for
time data is being written from chip buffer to media. The main idea here
is to lower priority slightly of the one worker thread before
rescheduling. That stimulates thread switching providing actually
simultaneous writing. After device has completed write operation thread
restores its original priority.=20

Another modification here is concerned with the split udelay time in
small chunks. Long udelays negatively affects striping performance since
udelay call is represented by loop and can not be interrupted by other
thread. Small udelay chunks provide more accurate and timely thread
switching.

5.2. Common polling thread (CPT)
Common polling thread is presented as new MTD module that is being used
by CFI layer. It creates single polling thread removing rescheduling
problem. Polling for operation completion status is being done in one
thread raising semaphore in worker threads on completion.

The suggested CPT solution can be turned on in kernel configuration
file.

See mailing thread "[PATCH/RFC] CFI: Common polling thread feature".


6. VALIDATION AND PERFORMANCE GAIN
Suggested striping solution has been validated on arm-based platforms
with different types of flash memory (Including NOR, Sibley and NAND
chips). It is stable and shows performance gain. For NOR and Sibley we
saw up to 85% performance gain in case of using two separate flash
devices. Unfortunately we were not able to check striped NAND
performance gain due to our hardware limitations.

7. PATCH
The diff file below is a patch containing MTD Striping layer core (to be
applied on MTD snapshot 20060315).

Kind Regards,
Alexander Belyakov



diff -uNr a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
--- a/drivers/mtd/Kconfig	2006-03-05 22:07:54.000000000 +0300
+++ b/drivers/mtd/Kconfig	2006-03-28 12:06:45.000000000 +0400
@@ -36,6 +36,57 @@
 	  file system spanning multiple physical flash chips. If unsure,
 	  say 'Y'.
=20
+config MTD_STRIPE
+	tristate "MTD striping support"
+	depends on MTD
+	help
+	  Support for stripinging several MTD devices into a single
+	  (virtual) one. This allows you to have -for example- a JFFS(2)
+	  file system interleaving multiple physical flash chips. If
unsure,
+	  say 'Y'.
+
+	  If you build mtdstripe.ko as a module it is possible to pass
+	  command line to the module via insmod
+	 =20
+	  The format for the command line is as follows:
+
+	  insmod mtdstripe.ko byname=3D"<stripedef>[;<stripedef>]"
+	  <stripedef> :=3D
<stripename>(<interleavesize>):<subdevname>.<subdevname>
+	 =20
+	  or it is possible to use MTD device number:
+	 =20
+	  insmod mtdstripe.ko bynumber=3D"<stripedef>[;<stripedef>]"
+	  <stripedef> :=3D
<stripename>(<interleavesize>):<subdevnumber>.<subdevnumber>
+	 =20
+	  Subdevices should belong to different physical flash chips
+	  in order to get performance increase
+
+	  Examples:
+	 =20
+	  insmod mtdstripe.ko
byname=3D"stripe1(128):vol1.vol3;stripe2(128):vol2.vol4"
+	  insmod mtdstripe.ko
bynumber=3D"stripe1(128):3.5;stripe2(128):4.6"
+	 =20
+	  Note: you should use '.' as a delimeter for subdevice names
here
+
+config MTD_CMDLINE_STRIPE
+	bool "Command line stripe configuration parsing"
+	depends on MTD_STRIPE =3D 'y'
+	---help---
+	  Allow generic configuration of the MTD striped volumes via the
kernel
+	  command line.=20
+
+	  The format for the command line is as follows:
+
+	  mtdstripe=3D<stripedef>[;<stripedef>]
+	  <stripedef> :=3D
<stripename>(<interleavesize>):<subdevname>,<subdevname>
+	 =20
+	  Subdevices should belong to different physical flash chips
+	  in order to get performance increase
+
+	  Example:
+	 =20
+	  mtdstripe=3Dstripe1(128):vol1,vol3;stripe2(128):vol2,vol4
+	 =20
 config MTD_PARTITIONS
 	bool "MTD partitioning support"
 	depends on MTD
diff -uNr a/drivers/mtd/Makefile b/drivers/mtd/Makefile
--- a/drivers/mtd/Makefile	2006-03-05 22:07:54.000000000 +0300
+++ b/drivers/mtd/Makefile	2006-03-28 12:10:48.000000000 +0400
@@ -9,6 +9,7 @@
 obj-$(CONFIG_MTD)		+=3D $(mtd-y)
=20
 obj-$(CONFIG_MTD_CONCAT)	+=3D mtdconcat.o
+obj-$(CONFIG_MTD_STRIPE)	+=3D mtdstripe.o
 obj-$(CONFIG_MTD_REDBOOT_PARTS) +=3D redboot.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) +=3D cmdlinepart.o
 obj-$(CONFIG_MTD_AFS_PARTS)	+=3D afs.o
diff -uNr a/drivers/mtd/maps/mphysmap.c b/drivers/mtd/maps/mphysmap.c
--- a/drivers/mtd/maps/mphysmap.c	2006-03-28 12:08:28.000000000
+0400
+++ b/drivers/mtd/maps/mphysmap.c	2006-03-28 12:10:48.000000000
+0400
@@ -12,6 +12,9 @@
 #ifdef CONFIG_MTD_PARTITIONS
 #include <linux/mtd/partitions.h>
 #endif
+#ifdef CONFIG_MTD_CMDLINE_STRIPE
+#include <linux/mtd/stripe.h>
+#endif
=20
 static struct map_info mphysmap_static_maps[] =3D {
 #if CONFIG_MTD_MULTI_PHYSMAP_1_WIDTH
@@ -155,6 +158,15 @@
 		};
 	};
 	up(&map_mutex);
+
+#ifdef CONFIG_MTD_CMDLINE_STRIPE
+#ifndef MODULE
+	if(mtd_stripe_init()) {
+	    printk(KERN_WARNING "MTD stripe initialization from cmdline
has failed\n");
+	}
+#endif
+#endif
+
 	return 0;
 }
=20
@@ -162,6 +174,13 @@
 static void __exit mphysmap_exit(void)
 {
 	int i;
+
+#ifdef CONFIG_MTD_CMDLINE_STRIPE
+#ifndef MODULE
+	mtd_stripe_exit();
+#endif
+#endif
+
 	down(&map_mutex);
 	for (i=3D0;
=20
i<sizeof(mphysmap_static_maps)/sizeof(mphysmap_static_maps[0]);
diff -uNr a/drivers/mtd/mtdstripe.c b/drivers/mtd/mtdstripe.c
--- a/drivers/mtd/mtdstripe.c	1970-01-01 03:00:00.000000000 +0300
+++ b/drivers/mtd/mtdstripe.c	2006-03-27 20:30:56.000000000 +0400
@@ -0,0 +1,3583 @@
+/*
########################################################################
#################################
+ ###   This software program is available to you under a choice of one
of two licenses. =20
+ ###   You may choose to be licensed under either the GNU General
Public License (GPL) Version 2,=20
+ ###   June 1991, available at http://www.fsf.org/copyleft/gpl.html, or
the Intel BSD + Patent License,=20
+ ###   the text of which follows:
+ ### =20
+ ###   Recipient has requested a license and Intel Corporation
("Intel") is willing to grant a=20
+ ###   license for the software entitled MTD stripe middle layer (the
"Software") being provided by=20
+ ###   Intel Corporation.
+ ### =20
+ ###   The following definitions apply to this License:=20
+ ### =20
+ ###   "Licensed Patents" means patent claims licensable by Intel
Corporation which are necessarily=20
+ ###   infringed by the use or sale of the Software alone or when
combined with the operating system=20
+ ###   referred to below.=20
+ ###   "Recipient" means the party to whom Intel delivers this
Software.
+ ###   "Licensee" means Recipient and those third parties that receive
a license to any operating system=20
+ ###   available under the GNU Public License version 2.0 or later.
+ ### =20
+ ###  Copyright (c) 1995-2005 Intel Corporation. All rights reserved.=20
+ ### =20
+ ###  The license is provided to Recipient and Recipient's Licensees
under the following terms. =20
+ ### =20
+ ###  Redistribution and use in source and binary forms of the
Software, with or without modification,=20
+ ###  are permitted provided that the following conditions are met:=20
+ ###  Redistributions of source code of the Software may retain the
above copyright notice, this list=20
+ ###  of conditions and the following disclaimer.=20
+ ### =20
+ ###  Redistributions in binary form of the Software may reproduce the
above copyright notice,=20
+ ###  this list of conditions and the following disclaimer in the
documentation and/or other materials=20
+ ###  provided with the distribution.=20
+ ### =20
+ ###  Neither the name of Intel Corporation nor the names of its
contributors shall be used to endorse=20
+ ###  or promote products derived from this Software without specific
prior written permission.
+ ### =20
+ ###  Intel hereby grants Recipient and Licensees a non-exclusive,
worldwide, royalty-free patent licens
+ ###  e under Licensed Patents to make, use, sell, offer to sell,
import and otherwise transfer the=20
+ ###  Software, if any, in source code and object code form. This
license shall include changes to=20
+ ###  the Software that are error corrections or other minor changes to
the Software that do not add=20
+ ###  functionality or features when the Software is incorporated in
any version of a operating system=20
+ ###  that has been distributed under the GNU General Public License
2.0 or later.  This patent license=20
+ ###  shall apply to the combination of the Software and any operating
system licensed under the=20
+ ###  GNU Public License version 2.0 or later if, at the time Intel
provides the Software to Recipient,=20
+ ###  such addition of the Software to the then publicly available
versions of such operating system=20
+ ###  available under the GNU Public License version 2.0 or later
(whether in gold, beta or alpha form)=20
+ ###  causes such combination to be covered by the Licensed Patents.
The patent license shall not apply=20
+ ###  to any other combinations which include the Software. No hardware
per se is licensed hereunder.=20
+ ###  =20
+ ###  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
CONTRIBUTORS "AS IS" AND ANY EXPRESS OR=20
+ ###  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND=20
+ ###  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
SHALL INTEL OR ITS CONTRIBUTORS BE=20
+ ###  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
OR CONSEQUENTIAL DAMAGES=20
+ ###  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA,
+ ###  OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN=20
+ ###  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT=20
+ ###  OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
OF SUCH DAMAGE."
+ ###
+
########################################################################
################################### */
+
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+
+#include <linux/mtd/mtd.h>
+#ifdef STANDALONE
+#include "stripe.h"
+#else
+#include <linux/mtd/stripe.h>
+#endif
+
+#ifdef CONFIG_MTD_CMDLINE_STRIPE
+#define CMDLINE_PARSER_STRIPE
+#else
+#ifdef MODULE
+#define CMDLINE_PARSER_STRIPE
+#endif
+#endif
+
+#ifdef MODULE
+static char *byname =3D NULL;
+static char *bynumber =3D NULL;
+MODULE_PARM(byname,"s");
+MODULE_PARM_DESC(byname,"Striping configuration by MTD device name");
+MODULE_PARM(bynumber,"s");
+MODULE_PARM_DESC(bynumber,"Striping configuration by MTD device
number");
+#endif
+
+extern struct semaphore mtd_table_mutex;
+extern struct mtd_info *mtd_table[];
+
+#ifdef CMDLINE_PARSER_STRIPE
+static char *cmdline;
+static struct mtd_stripe_info info; /* mtd stripe info head */
+#endif
+
+/*
+ * Striped device structure:
+ * Subdev points to an array of pointers to struct mtd_info objects
+ * which is allocated along with this structure
+ *
+ */
+struct mtd_stripe {
+    struct mtd_info mtd;
+    int num_subdev;
+    u_int32_t interleave_size;
+    u_int32_t *subdev_last_offset;
+    struct mtd_sw_thread_info *sw_threads;
+    struct mtd_info **subdev;
+};
+
+/* This structure is used for stripe_erase and stripe_lock/unlock
methods
+ * and contains erase regions for striped devices
+ */
+struct mtd_stripe_erase_bounds {
+    int need_erase;
+    u_int32_t addr;
+    u_int32_t len;
+};
+
+/* Write/erase thread info structure
+ */
+struct mtd_sw_thread_info {
+    struct task_struct *thread;
+    struct mtd_info *subdev;	/* corresponding subdevice pointer */
+    int sw_thread;		/* continue operations flag */
+=09
+    /* wait-for-data semaphore,
+     * up by stripe_write/erase (stripe_stop_write_thread),
+     * down by stripe_write_thread
+     */
+    struct semaphore sw_thread_wait;
+=09
+    /* start/stop semaphore,
+     * up by stripe_write_thread,
+     * down by stripe_start/stop_write_thread
+     */
+    struct semaphore sw_thread_startstop;
+=09
+    struct list_head list;	/* head of the operation list */
+    spinlock_t list_lock;	/* lock to remove race conditions
+				 * while adding/removing operations
+				 * to/from the list */
+};=09
+
+/* Single suboperation structure
+ */
+struct subop {
+    u_int32_t ofs;		/* offset of write/erase operation */
+    u_int32_t len;		/* length of the data to be
written/erased */
+    u_char *buf;		/* buffer with data to be written or
poiner=20
+				 * to original erase_info structure
+				 * in case of erase operation */
+    u_char *eccbuf;		/* buffer with FS provided oob data.
+				 * used for stripe_write_ecc operation
+				 * NOTE: stripe_write_oob() still uses
u_char *buf member */
+};
+
+/* Suboperation array structure
+ */
+struct subop_struct {
+    struct list_head list;	/* suboperation array queue */
+=09
+    u_int32_t ops_num;	 	/* number of suboperations in the array
*/
+    u_int32_t ops_num_max;	/* maximum allowed number of
suboperations */
+    struct subop *ops_array;	/* suboperations array */
+};
+
+/* Operation codes */
+#define MTD_STRIPE_OPCODE_READ		0x1
+#define MTD_STRIPE_OPCODE_WRITE		0x2
+#define MTD_STRIPE_OPCODE_READ_ECC	0x3
+#define MTD_STRIPE_OPCODE_WRITE_ECC	0x4
+#define MTD_STRIPE_OPCODE_WRITE_OOB	0x5
+#define MTD_STRIPE_OPCODE_ERASE		0x6
+
+/* Stripe operation structure
+ */
+struct mtd_stripe_op {
+    struct list_head list;	/* per thread (device) queue */
+=09
+    char opcode;		/* operation code */
+    int caller_id; /* reserved for thread ID issued this operation */
+    int op_prio; 		/* original operation prioriry */
+=09
+    struct semaphore sem;	/* operation completed semaphore */
+    struct subop_struct subops; /* suboperation structure */
+=09
+    int status;			/* operation completed status */
+    u_int32_t fail_addr;	/* fail address (for erase operation) */
+    u_char state;		/* state (for erase operation) */
+};
+
+#define SIZEOF_STRUCT_MTD_STRIPE_OP(num_ops) \
+	((sizeof(struct mtd_stripe_op) + (num_ops) * sizeof(struct
subop)))
+=09
+#define SIZEOF_STRUCT_MTD_STRIPE_SUBOP(num_ops) \
+	((sizeof(struct subop_struct) + (num_ops) * sizeof(struct
subop)))
+
+/*
+ * how to calculate the size required for the above structure,
+ * including the pointer array subdev points to:
+ */
+#define SIZEOF_STRUCT_MTD_STRIPE(num_subdev)	\
+	((sizeof(struct mtd_stripe) + (num_subdev) * sizeof(struct
mtd_info *) \
+	 + (num_subdev) * sizeof(u_int32_t) \
+	 + (num_subdev) * sizeof(struct mtd_sw_thread_info)))
+
+/*
+ * Given a pointer to the MTD object in the mtd_stripe structure,
+ * we can retrieve the pointer to that structure with this macro.
+ */
+#define STRIPE(x)  ((struct mtd_stripe *)(x))
+
+/* Forward functions declaration
+ */
+static int stripe_dev_erase(struct mtd_info *mtd, struct erase_info
*erase);
+
+/*
+ * Miscelaneus support routines
+ */
+=20
+/*
+ * searches for least common multiple of a and b
+ * returns: LCM or 0 in case of error
+ */
+u_int32_t
+lcm(u_int32_t a, u_int32_t b)
+{
+    u_int32_t lcm;
+    u_int32_t t1 =3D a;
+    u_int32_t t2 =3D b;
+   =20
+    if(a <=3D 0 || b <=3D 0)=20
+    {
+    	lcm =3D 0;
+	printk(KERN_ERR "lcm(): wrong arguments\n");
+    }
+    else if(a =3D=3D b)
+    {
+	/* trivial case */
+	lcm =3D a;
+    }
+    else
+    {
+        do
+        {
+            lcm =3D a;
+            a =3D b;
+            b =3D lcm - a*(lcm/a);
+        }
+        while(b!=3D0);
+=09
+	if(t1 % a)
+		lcm =3D (t2 / a) * t1;
+	else
+		lcm =3D (t1 / a) * t2;
+    }
+
+    return lcm;
+} /* int lcm(int a, int b) */
+
+u_int32_t last_offset(struct mtd_stripe *stripe, int subdev_num);
+
+/*
+ * Calculates last_offset for specific striped subdevice
+ * NOTE: subdev array MUST be sorted
+ * by subdevice size (from the smallest to the largest)
+ */
+u_int32_t
+last_offset(struct mtd_stripe *stripe, int subdev_num)
+{
+    u_int32_t offset =3D 0;
+=09
+    /* Interleave block count for previous subdevice in the array */
+    u_int32_t prev_dev_size_n =3D 0;
+=09
+    /* Current subdevice interleaved block count */
+    u_int32_t curr_size_n =3D stripe->subdev[subdev_num]->size /
stripe->interleave_size;
+=09
+    int i;
+=09
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	struct mtd_info *subdev =3D stripe->subdev[i];
+	/* subdevice interleaved block count */
+	u_int32_t size_n =3D subdev->size / stripe->interleave_size;
+	=09
+	if(i < subdev_num)
+	{
+	    if(size_n < curr_size_n)
+	    {
+    		offset +=3D (size_n - prev_dev_size_n) *
(stripe->num_subdev - i);
+		prev_dev_size_n =3D size_n;
+	    }
+	    else
+	    {
+		offset +=3D (size_n - prev_dev_size_n - 1) *
(stripe->num_subdev - i) + 1;
+		prev_dev_size_n =3D size_n - 1;
+	    }
+	}
+	else if (i =3D=3D subdev_num)
+	{
+	    offset +=3D (size_n - prev_dev_size_n - 1) *
(stripe->num_subdev - i) + 1;
+	    break;
+	}
+    }
+=09
+    return (offset * stripe->interleave_size);
+} /* u_int32_t last_offset(struct mtd_stripe *stripe, int subdev_num)
*/
+
+/* this routine returns oobavail size based on oobfree array
+ * since original mtd_info->oobavail field seems to be zeroed by
unknown reason
+ */
+int stripe_get_oobavail(struct mtd_info *mtd)
+{
+    int oobavail =3D 0;
+    uint32_t oobfree_max_num =3D 8; /* array size defined in mtd-abi.h =
*/
+    int i;
+   =20
+    for(i =3D 0; i < oobfree_max_num; i++)
+    {
+        if(mtd->oobinfo.oobfree[i][1])
+	    oobavail +=3D mtd->oobinfo.oobfree[i][1];
+    }
+       =20
+    return oobavail;
+}
+
+/* routine merges subdevs oobinfo into new mtd device oobinfo
+ * this should be made after subdevices sorting done for proper eccpos
and oobfree positioning
+ *
+ * returns: 0 - success */
+int stripe_merge_oobinfo(struct mtd_info *mtd, struct mtd_info
*subdev[], int num_devs)
+{
+    int ret =3D 0;
+    int i, j;
+    uint32_t eccpos_max_num =3D sizeof(mtd->oobinfo.eccpos) /
sizeof(uint32_t);
+    uint32_t eccpos_counter =3D 0;
+    uint32_t oobfree_max_num =3D 8; /* array size defined in mtd-abi.h =
*/
+    uint32_t oobfree_counter =3D 0;
+   =20
+    if(mtd->type !=3D MTD_NANDFLASH)
+	return 0;
+   =20
+    mtd->oobinfo.useecc =3D subdev[0]->oobinfo.useecc;
+    mtd->oobinfo.eccbytes =3D subdev[0]->oobinfo.eccbytes;
+    for(i =3D 1; i < num_devs; i++)
+    {
+	if(mtd->oobinfo.useecc !=3D subdev[i]->oobinfo.useecc ||
+	    mtd->oobinfo.eccbytes !=3D subdev[i]->oobinfo.eccbytes)
+	{
+	    printk(KERN_ERR "stripe_merge_oobinfo(): oobinfo parameters
is not compatible for all subdevices\n");
+	    return -EINVAL;
+	}
+    }
+   =20
+    mtd->oobinfo.eccbytes *=3D num_devs;
+   =20
+    /* drop old oobavail value */
+    mtd->oobavail =3D 0;
+   =20
+    /* merge oobfree space positions */
+    for(i =3D 0; i < num_devs; i++)
+    {
+	for(j =3D 0; j < oobfree_max_num; j++)
+	{
+	    if(subdev[i]->oobinfo.oobfree[j][1])
+	    {
+		if(oobfree_counter >=3D oobfree_max_num)
+		    break;
+
+		mtd->oobinfo.oobfree[oobfree_counter][0] =3D
subdev[i]->oobinfo.oobfree[j][0] +
+							    i *
subdev[i]->oobsize;
+		mtd->oobinfo.oobfree[oobfree_counter][1] =3D
subdev[i]->oobinfo.oobfree[j][1];
+							   =20
+		mtd->oobavail +=3D subdev[i]->oobinfo.oobfree[j][1];
+		oobfree_counter++;
+	    }
+	}
+    }
+   =20
+    /* merge ecc positions */
+    for(i =3D 0; i < num_devs; i++)
+    {
+	for(j =3D 0; j < eccpos_max_num; j++)
+	{
+	    if(subdev[i]->oobinfo.eccpos[j])
+	    {
+		if(eccpos_counter >=3D eccpos_max_num)
+		{
+		    printk(KERN_ERR "stripe_merge_oobinfo(): eccpos
merge error\n");
+		    return -EINVAL;
+		}
+
mtd->oobinfo.eccpos[eccpos_counter]=3Dsubdev[i]->oobinfo.eccpos[j] + i *
subdev[i]->oobsize;
+		eccpos_counter++;
+	    }
+	}
+    }
+   =20
+    return ret;
+}
+
+/* End of support routines */
+
+/* Multithreading support routines */
+
+/* Write to flash thread */
+static void
+stripe_write_thread(void *arg)
+{
+    struct mtd_sw_thread_info* info =3D (struct =
mtd_sw_thread_info*)arg;
+    struct mtd_stripe_op* op;
+    struct subop_struct* subops;
+    u_int32_t retsize;
+    int err;
+=09
+    int i;
+    struct list_head *pos;
+
+    /* erase operation stuff */=09
+    struct erase_info erase;	/* local copy */
+    struct erase_info *instr;	/* pointer to original */
+=09
+    info->thread =3D current;
+    up(&info->sw_thread_startstop);
+
+    while(info->sw_thread)
+    {
+	/* wait for downcoming write/erase operation */
+	down(&info->sw_thread_wait);
+	=09
+	/* issue operation to the device and remove it from the list
afterwards*/
+	spin_lock(&info->list_lock);
+	if(!list_empty(&info->list))
+	{
+	    op =3D list_entry(info->list.next,struct mtd_stripe_op, list);
+	}
+	else
+	{
+	    /* no operation in queue but sw_thread_wait has been rised.
+	     * it means stripe_stop_write_thread() has been called
+	     */
+	    op =3D NULL;
+	}
+	spin_unlock(&info->list_lock);
+
+        /* leave main thread loop if no ops */	=09
+	if(!op)
+	    break;
+	=09
+	err =3D 0;
+	op->status =3D 0;
+	=09
+	switch(op->opcode)
+	{
+	    case MTD_STRIPE_OPCODE_WRITE:
+	    case MTD_STRIPE_OPCODE_WRITE_OOB:
+		/* proceed with list head first */
+		subops =3D &op->subops;
+			=09
+		for(i =3D 0; i < subops->ops_num; i++)
+		{
+		    if(op->opcode =3D=3D MTD_STRIPE_OPCODE_WRITE)
+    			err =3D info->subdev->write(info->subdev,
subops->ops_array[i].ofs, subops->ops_array[i].len, &retsize,
subops->ops_array[i].buf);
+		    else
+			err =3D info->subdev->write_oob(info->subdev,
subops->ops_array[i].ofs, subops->ops_array[i].len, &retsize,
subops->ops_array[i].buf);
+		   =20
+		    if(err)
+		    {
+			op->status =3D -EINVAL;
+			printk(KERN_ERR "mtd_stripe: write operation
failed %d\n",err);
+				break;
+		    }
+		}
+			=09
+		if(!op->status)
+		{
+		    /* now proceed each list element except head */
+		    list_for_each(pos, &op->subops.list)
+		    {
+			subops =3D list_entry(pos, struct subop_struct,
list);
+			=09
+			for(i =3D 0; i < subops->ops_num; i++)
+			{
+			    if(op->opcode =3D=3D MTD_STRIPE_OPCODE_WRITE)
+				err =3D info->subdev->write(info->subdev,
subops->ops_array[i].ofs, subops->ops_array[i].len, &retsize,
subops->ops_array[i].buf);
+			    else
+				err =3D
info->subdev->write_oob(info->subdev, subops->ops_array[i].ofs,
subops->ops_array[i].len, &retsize, subops->ops_array[i].buf);
+			=09
+			    if(err)
+			    {
+				op->status =3D -EINVAL;
+				printk(KERN_ERR "mtd_stripe: write
operation failed %d\n",err);
+				break;
+			    }
+			}
+				=09
+			if(op->status)
+			    break;
+		    }
+		}
+		break;
+			=09
+	    case MTD_STRIPE_OPCODE_ERASE:
+		subops =3D &op->subops;
+		instr =3D (struct erase_info *)subops->ops_array[0].buf;
+			=09
+		/* make a local copy of original erase instruction to
avoid modifying the caller's struct */
+		erase =3D *instr;
+		erase.addr =3D subops->ops_array[0].ofs;
+		erase.len =3D subops->ops_array[0].len;
+
+		if ((err =3D stripe_dev_erase(info->subdev, &erase)))
+		{
+		    /* sanity check: should never happen since
+		     * block alignment has been checked early in
stripe_erase() */
+					=20
+		    if(erase.fail_addr !=3D 0xffffffff)
+			/* For now this adddres shows address
+			 * at failed subdevice,but not at "super" device
*/		   =20
+			op->fail_addr =3D erase.fail_addr;=20
+		}
+
+		op->status =3D err;
+		op->state =3D erase.state;
+		break;
+	=09
+	    case MTD_STRIPE_OPCODE_WRITE_ECC:
+		/* proceed with list head first */
+		subops =3D &op->subops;
+			=09
+		for(i =3D 0; i < subops->ops_num; i++)
+		{
+		    err =3D info->subdev->write_ecc(info->subdev,
subops->ops_array[i].ofs, subops->ops_array[i].len,
+						    &retsize,
subops->ops_array[i].buf,
+
subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
+		    if(err)
+		    {
+			op->status =3D -EINVAL;
+			printk(KERN_ERR "mtd_stripe: write operation
failed %d\n",err);
+				break;
+		    }
+		}
+			=09
+		if(!op->status)
+		{
+		    /* now proceed each list element except head */
+		    list_for_each(pos, &op->subops.list)
+		    {
+			subops =3D list_entry(pos, struct subop_struct,
list);
+			=09
+			for(i =3D 0; i < subops->ops_num; i++)
+			{
+			    err =3D info->subdev->write_ecc(info->subdev,
subops->ops_array[i].ofs, subops->ops_array[i].len,
+							    &retsize,
subops->ops_array[i].buf,
+
subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
+			    if(err)
+			    {
+				op->status =3D -EINVAL;
+				printk(KERN_ERR "mtd_stripe: write
operation failed %d\n",err);
+				break;
+			    }
+			}
+				=09
+			if(op->status)
+			    break;
+		    }
+		}
+		break;
+	   =20
+	    case MTD_STRIPE_OPCODE_READ_ECC:
+	    case MTD_STRIPE_OPCODE_READ:
+		/* proceed with list head first */
+		subops =3D &op->subops;
+			=09
+		for(i =3D 0; i < subops->ops_num; i++)
+		{
+		    if(op->opcode =3D=3D MTD_STRIPE_OPCODE_READ_ECC)
+		    {
+			err =3D info->subdev->read_ecc(info->subdev,
subops->ops_array[i].ofs, subops->ops_array[i].len,
+						    &retsize,
subops->ops_array[i].buf,
+
subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
+		    }
+		    else
+		    {
+			err =3D info->subdev->read(info->subdev,
subops->ops_array[i].ofs, subops->ops_array[i].len,
+					    &retsize,
subops->ops_array[i].buf);
+		    }
+		   =20
+		    if(err)
+		    {
+			op->status =3D -EINVAL;
+			printk(KERN_ERR "mtd_stripe: read operation
failed %d\n",err);
+				break;
+		    }
+		}
+			=09
+		if(!op->status)
+		{
+		    /* now proceed each list element except head */
+		    list_for_each(pos, &op->subops.list)
+		    {
+			subops =3D list_entry(pos, struct subop_struct,
list);
+			=09
+			for(i =3D 0; i < subops->ops_num; i++)
+			{
+			    if(op->opcode =3D=3D MTD_STRIPE_OPCODE_READ_ECC)
+			    {
+				err =3D
info->subdev->read_ecc(info->subdev, subops->ops_array[i].ofs,
subops->ops_array[i].len,
+							    &retsize,
subops->ops_array[i].buf,
+
subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
+			    }
+			    else
+			    {
+				err =3D info->subdev->read(info->subdev,
subops->ops_array[i].ofs, subops->ops_array[i].len,
+							    &retsize,
subops->ops_array[i].buf);
+			    }
+			   =20
+			    if(err)
+			    {
+				op->status =3D -EINVAL;
+				printk(KERN_ERR "mtd_stripe: read
operation failed %d\n",err);
+				break;
+			    }
+			}
+				=09
+			if(op->status)
+			    break;
+		    }
+		}
+	   =20
+		break;
+			=09
+	    default:
+		/* unknown operation code */
+		printk(KERN_ERR "mtd_stripe: invalid operation code %d",
op->opcode);
+		op->status =3D -EINVAL;
+		break;
+	};
+	=09
+	/* remove issued operation from the list */
+	spin_lock(&info->list_lock);
+	list_del(&op->list);
+	spin_unlock(&info->list_lock);
+	=09
+	/* raise semaphore to let stripe_write() or stripe_erase()
continue */
+	up(&op->sem);
+    }
+=09
+    info->thread =3D NULL;
+    up(&info->sw_thread_startstop);
+}
+
+/* Launches write to flash thread */
+int
+stripe_start_write_thread(struct mtd_sw_thread_info* info, struct
mtd_info *device)
+{
+    pid_t pid;
+    int ret =3D 0;
+=09
+    if(info->thread)
+	BUG();
+	=09
+    info->subdev =3D device;				/* set the
pointer to corresponding device */
+
+    init_MUTEX_LOCKED(&info->sw_thread_startstop);	/* init
start/stop semaphore */
+    info->sw_thread =3D 1; 				/* set continue
thread flag */
+    init_MUTEX_LOCKED(&info->sw_thread_wait);	/* init "wait for data"
semaphore */
+=09
+    INIT_LIST_HEAD(&info->list);			/* initialize
operation list head */
+=09
+    spin_lock_init(&info->list_lock);		/* init list lock */
+=09
+    pid =3D kernel_thread((int (*)(void *))stripe_write_thread, info,
CLONE_KERNEL); /* flags (3rd arg) TBD */
+    if (pid < 0)
+    {
+	printk(KERN_ERR "fork failed for MTD stripe thread: %d\n",
-pid);
+	ret =3D pid;
+    }
+    else
+    {
+	/* wait thread started */
+	DEBUG(MTD_DEBUG_LEVEL1, "MTD stripe: write thread has pid %d\n",
pid);
+	down(&info->sw_thread_startstop);
+    }
+=20
+    return ret;
+}
+
+/* Complete write to flash thread */
+void
+stripe_stop_write_thread(struct mtd_sw_thread_info* info)
+{
+    if(info->thread)
+    {
+	info->sw_thread =3D 0;			/* drop thread flag */
+	up(&info->sw_thread_wait);		/* let the thread
complete */
+	down(&info->sw_thread_startstop);	/* wait for thread
completion */
+	DEBUG(MTD_DEBUG_LEVEL1, "MTD stripe: writing thread has been
stopped\n");
+    }
+}
+
+/* Updates write/erase thread priority to max value
+ * based on operations in the queue
+ */
+void
+stripe_set_write_thread_prio(struct mtd_sw_thread_info* info)
+{
+    struct mtd_stripe_op *op;
+    int oldnice, newnice;
+    struct list_head *pos;
+   =20
+    newnice =3D oldnice =3D info->thread->static_prio - MAX_RT_PRIO - =
20;
+
+    spin_lock(&info->list_lock);
+    list_for_each(pos, &info->list)
+    {
+        op =3D list_entry(pos, struct mtd_stripe_op, list);
+	newnice =3D (op->op_prio < newnice) ? op->op_prio : newnice;
+    }
+    spin_unlock(&info->list_lock);
+   =20
+    newnice =3D (newnice < -20) ? -20 : newnice;
+   =20
+    if(oldnice !=3D newnice)
+	set_user_nice(info->thread, newnice);
+}
+
+/* add sub operation into the array
+   op - pointer to the operation structure
+   ofs - operation offset within subdevice
+   len - data to be written/erased
+   buf - pointer to the buffer with data to be written (NULL is erase
operation)
+  =20
+   returns: 0 - success
+*/
+static inline int
+stripe_add_subop(struct mtd_stripe_op *op, u_int32_t ofs, u_int32_t
len, const u_char *buf, const u_char *eccbuf)
+{
+    u_int32_t size;				/* number of items in
the new array (if any) */
+    struct subop_struct *subop;
+
+    if(!op)
+	BUG(); /* error */
+
+    /* get tail list element or head */=09
+    subop =3D list_entry(op->subops.list.prev, struct subop_struct,
list);
+	=09
+    /* check if current suboperation array is already filled or not */
+    if(subop->ops_num >=3D subop->ops_num_max)
+    {
+	/* array is full. allocate new one and add to list */
+	size =3D SIZEOF_STRUCT_MTD_STRIPE_SUBOP(op->subops.ops_num_max);
+	subop =3D kmalloc(size, GFP_KERNEL);
+	if(!subop)
+	{
+    	    printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
+	    return -ENOMEM;
+	}
+	=09
+	memset(subop, 0, size);
+	subop->ops_num =3D 0;
+	subop->ops_num_max =3D op->subops.ops_num_max;
+	subop->ops_array =3D (struct subop *)(subop + 1);
+	=09
+	list_add_tail(&subop->list, &op->subops.list);
+    }
+
+    subop->ops_array[subop->ops_num].ofs =3D ofs;
+    subop->ops_array[subop->ops_num].len =3D len;
+    subop->ops_array[subop->ops_num].buf =3D (u_char *)buf;
+    subop->ops_array[subop->ops_num].eccbuf =3D (u_char *)eccbuf;
+
+    subop->ops_num++;	/* increase stored suboperations counter */
+=09
+    return 0;
+}
+
+/* deallocates memory allocated by stripe_add_subop routine */
+static void
+stripe_destroy_op(struct mtd_stripe_op *op)
+{
+    struct subop_struct *subop;
+=09
+    while(!list_empty(&op->subops.list))
+    {
+	subop =3D list_entry(op->subops.list.next,struct subop_struct,
list);
+	list_del(&subop->list);
+	kfree(subop);
+    }
+}
+
+/* adds new operation to the thread queue and unlock wait semaphore for
specific thread */
+static void
+stripe_add_op(struct mtd_sw_thread_info* info, struct mtd_stripe_op*
op)
+{
+    if(!info || !op)
+    	BUG();
+=09
+    spin_lock(&info->list_lock);
+    list_add_tail(&op->list, &info->list);
+    spin_unlock(&info->list_lock);
+}
+
+/* End of multithreading support routines */
+
+
+/*=20
+ * MTD methods which look up the relevant subdevice, translate the
+ * effective address and pass through to the subdevice.
+ */
+
+
+/* sychroneous read from striped volume */
+static int
+stripe_read_sync(struct mtd_info *mtd, loff_t from, size_t len,
+	    size_t * retlen, u_char * buf)
+{
+    u_int32_t from_loc =3D (u_int32_t)from;	/* we can do this since
whole MTD size in current implementation has u_int32_t type */
+=09
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int err =3D -EINVAL;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to read/write
(bytes). used for "first" probably unaligned with erasesize data block
*/
+    size_t subdev_len;			/* data size to be read/written
from/to subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D len;		/* total data size to read/write
left (bytes) */
+    size_t retsize;			/* data read/written from/to
subdev (bytes) */
+
+    *retlen =3D 0;
+
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_sync(): offset =3D 0x%08x, =
size
=3D %d\n", from_loc, len);
+
+    /* Check whole striped device bounds here */
+    if(from_loc + len > mtd->size)
+    {
+	return err;
+    }
+=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(from_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+    	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((from_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((from_loc -
stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (from_loc / stripe->interleave_size) /
dev_count;
+	subdev_number =3D (from_loc / stripe->interleave_size) %
dev_count;
+    }
+
+    subdev_offset_low =3D from_loc % stripe->interleave_size;
+    subdev_len =3D (len_left < (stripe->interleave_size -
subdev_offset_low)) ? len_left : (stripe->interleave_size -
subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+=09
+    /* Synch read here */
+    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_sync(): device =3D %d, offset =
=3D
0x%08x, len =3D %d\n", subdev_number, subdev_offset_low, subdev_len);
+    err =3D
stripe->subdev[subdev_number]->read(stripe->subdev[subdev_number],
subdev_offset_low, subdev_len, &retsize, buf);
+    if(!err)
+    {
+	*retlen +=3D retsize;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	if(from_loc + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+    	    dev_count--;
+    }
+	=09
+    while(!err && len_left > 0 && dev_count > 0)
+    {
+    	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < stripe->interleave_size) ? len_left :
stripe->interleave_size;
+
+	/* Synch read here */
+	DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_sync(): device =3D %d, offset
=3D 0x%08x, len =3D %d\n", subdev_number, subdev_offset *
stripe->interleave_size, subdev_len);
+	err =3D
stripe->subdev[subdev_number]->read(stripe->subdev[subdev_number],
subdev_offset * stripe->interleave_size, subdev_len, &retsize, buf);
+	if(err)
+	    break;
+		=09
+	*retlen +=3D retsize;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	=09
+	if(from_loc + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+	    dev_count--;
+    }
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_sync(): read %d bytes\n",
*retlen);
+    return err;
+}
+
+
+/* asychroneous read from striped volume */
+static int
+stripe_read_async(struct mtd_info *mtd, loff_t from, size_t len,
+	    size_t * retlen, u_char * buf)
+{
+    u_int32_t from_loc =3D (u_int32_t)from;	/* we can do this since
whole MTD size in current implementation has u_int32_t type */
+=09
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int err =3D -EINVAL;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to read/write
(bytes). used for "first" probably unaligned with erasesize data block
*/
+    size_t subdev_len;			/* data size to be read/written
from/to subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D len;		/* total data size to read/write
left (bytes) */
+
+    struct mtd_stripe_op *ops;		/* operations array (one per
thread) */
+    u_int32_t size;			/* amount of memory to be
allocated for thread operations */
+    u_int32_t queue_size;
+
+    *retlen =3D 0;
+
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_async(): offset =3D 0x%08x, =
size
=3D %d\n", from_loc, len);
+
+    /* Check whole striped device bounds here */
+    if(from_loc + len > mtd->size)
+    {
+	return err;
+    }
+
+    /* allocate memory for multithread operations */
+    queue_size =3D len / stripe->interleave_size / stripe->num_subdev +
1;	/* default queue size. could be set to predefined value */
+    size =3D stripe->num_subdev *
SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
+    ops =3D kmalloc(size, GFP_KERNEL);
+    if(!ops)
+    {
+	printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
+	return -ENOMEM;
+    }
+=09
+    memset(ops, 0, size);
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	ops[i].opcode =3D MTD_STRIPE_OPCODE_READ;
+	ops[i].caller_id =3D 0; 			/* TBD */
+	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
to be unlocked by device thread */
+	//ops[i].status =3D 0;			/* TBD */
+
+	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
suboperation list head */
+
+	ops[i].subops.ops_num =3D 0;		/* to be increased later
here */
+	ops[i].subops.ops_num_max =3D queue_size;	/* total number of
suboperations can be stored in the array */
+	ops[i].subops.ops_array =3D (struct subop *)((char *)(ops +
stripe->num_subdev) + i * queue_size * sizeof(struct subop));
+    }
+=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(from_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+    	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((from_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((from_loc -
stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (from_loc / stripe->interleave_size) /
dev_count;
+	subdev_number =3D (from_loc / stripe->interleave_size) %
dev_count;
+    }
+
+    subdev_offset_low =3D from_loc % stripe->interleave_size;
+    subdev_len =3D (len_left < (stripe->interleave_size -
subdev_offset_low)) ? len_left : (stripe->interleave_size -
subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+=09
+    /* asynch read here */
+    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_async(): device =3D %d, offset =
=3D
0x%08x, len =3D %d\n", subdev_number, subdev_offset_low, subdev_len);
+    err =3D stripe_add_subop(&ops[subdev_number], subdev_offset_low,
subdev_len, buf, NULL);
+    if(!err)
+    {
+	*retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	if(from_loc + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+    	    dev_count--;
+    }
+	=09
+    while(!err && len_left > 0 && dev_count > 0)
+    {
+    	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < stripe->interleave_size) ? len_left :
stripe->interleave_size;
+
+	/* Synch read here */
+	DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_async(): device =3D %d,
offset =3D 0x%08x, len =3D %d\n", subdev_number, subdev_offset *
stripe->interleave_size, subdev_len);
+        err =3D stripe_add_subop(&ops[subdev_number], subdev_offset *
stripe->interleave_size, subdev_len, buf, NULL);
+	if(err)
+	    break;
+		=09
+	*retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	=09
+	if(from_loc + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+	    dev_count--;
+    }
+
+    /* Push operation into the corresponding threads queue and rise
semaphores */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	stripe_add_op(&stripe->sw_threads[i], &ops[i]);
+
+	/* set original operation priority */
+	ops[i].op_prio =3D current->static_prio - MAX_RT_PRIO - 20;
+	stripe_set_write_thread_prio(&stripe->sw_threads[i]);
+
+	up(&stripe->sw_threads[i].sw_thread_wait);
+    }
+=09
+    /* wait for all suboperations completed and check status */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	down(&ops[i].sem);
+	=09
+	/* set error if one of operations has failed */
+	if(ops[i].status)
+	    err =3D ops[i].status;
+    }
+
+    /* Deallocate all memory before exit */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	stripe_destroy_op(&ops[i]);
+    }
+    kfree(ops);
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_async(): read %d bytes\n",
*retlen);
+    return err;
+}
+
+
+static int
+stripe_read(struct mtd_info *mtd, loff_t from, size_t len,
+	    size_t * retlen, u_char * buf)
+{
+    int err;
+    if(mtd->type =3D=3D MTD_NANDFLASH)
+	err =3D stripe_read_async(mtd, from, len, retlen, buf);
+    else
+	err =3D stripe_read_sync(mtd, from, len, retlen, buf);
+
+    return err;
+}
+
+
+static int
+stripe_write(struct mtd_info *mtd, loff_t to, size_t len,
+	     size_t * retlen, const u_char * buf)
+{
+    u_int32_t to_loc =3D (u_int32_t)to;	/* we can do this since whole
MTD size in current implementation has u_int32_t type */
+
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int err =3D -EINVAL;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to read/write
(bytes). used for "first" probably unaligned block */
+    size_t subdev_len;			/* data size to be read/written
from/to subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D len;		/* total data size to read/write
left (bytes) */
+=09
+    struct mtd_stripe_op *ops;		/* operations array (one per
thread) */
+    u_int32_t size;			/* amount of memory to be
allocated for thread operations */
+    u_int32_t queue_size;
+
+    *retlen =3D 0;
+
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write(): offset =3D 0x%08x, size =
=3D
%d\n", to_loc, len);
+=09
+    /* check if no data is going to be written */
+    if(!len)
+        return 0;
+=09
+    /* Check whole striped device bounds here */
+    if(to_loc + len > mtd->size)
+        return err;
+=09
+    /* allocate memory for multithread operations */
+    queue_size =3D len / stripe->interleave_size / stripe->num_subdev +
1;	/* default queue size. could be set to predefined value */
+    size =3D stripe->num_subdev *
SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
+    ops =3D kmalloc(size, GFP_KERNEL);
+    if(!ops)
+    {
+	printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
+	return -ENOMEM;
+    }
+=09
+    memset(ops, 0, size);
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	ops[i].opcode =3D MTD_STRIPE_OPCODE_WRITE;
+	ops[i].caller_id =3D 0; 			/* TBD */
+	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
to be unlocked by device thread */
+	//ops[i].status =3D 0;			/* TBD */
+
+	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
suboperation list head */
+
+	ops[i].subops.ops_num =3D 0;		/* to be increased later
here */
+	ops[i].subops.ops_num_max =3D queue_size;	/* total number of
suboperations can be stored in the array */
+	ops[i].subops.ops_array =3D (struct subop *)((char *)(ops +
stripe->num_subdev) + i * queue_size * sizeof(struct subop));
+    }
+					=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(to_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((to_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((to_loc - stripe->subdev_last_offset[i
- 1]) / stripe->interleave_size) % dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (to_loc / stripe->interleave_size) / dev_count;
+	subdev_number =3D (to_loc / stripe->interleave_size) % dev_count;
+    }
+=09
+    subdev_offset_low =3D to_loc % stripe->interleave_size;
+    subdev_len =3D (len_left < (stripe->interleave_size -
subdev_offset_low)) ? len_left : (stripe->interleave_size -
subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+=09
+    /* Add suboperation to queue here */
+    err =3D stripe_add_subop(&ops[subdev_number], subdev_offset_low,
subdev_len, buf, NULL);
+    if(!err)
+    {
+	*retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	if(to_loc + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+    	    dev_count--;
+    }
+		=09
+    while(!err && len_left > 0 && dev_count > 0)
+    {
+	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < stripe->interleave_size) ? len_left :
stripe->interleave_size;
+
+	/* Add suboperation to queue here */
+	err =3D stripe_add_subop(&ops[subdev_number], subdev_offset *
stripe->interleave_size, subdev_len, buf, NULL);
+	if(err)
+	    break;
+		=09
+	*retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	=09
+	if(to_loc + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+	    dev_count--;
+    }
+   =20
+    /* Push operation into the corresponding threads queue and rise
semaphores */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	stripe_add_op(&stripe->sw_threads[i], &ops[i]);
+
+	/* set original operation priority */
+	ops[i].op_prio =3D current->static_prio - MAX_RT_PRIO - 20;
+	stripe_set_write_thread_prio(&stripe->sw_threads[i]);
+
+	up(&stripe->sw_threads[i].sw_thread_wait);
+    }
+=09
+    /* wait for all suboperations completed and check status */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	down(&ops[i].sem);
+	=09
+	/* set error if one of operations has failed */
+	if(ops[i].status)
+	    err =3D ops[i].status;
+    }
+
+    /* Deallocate all memory before exit */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	stripe_destroy_op(&ops[i]);
+    }
+    kfree(ops);
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write(): written %d bytes\n",
*retlen);
+    return err;
+}
+
+
+/* synchroneous ecc read from striped volume */
+static int
+stripe_read_ecc_sync(struct mtd_info *mtd, loff_t from, size_t len,
+		    size_t * retlen, u_char * buf, u_char * eccbuf,
+		    struct nand_oobinfo *oobsel)
+{
+    u_int32_t from_loc =3D (u_int32_t)from;	/* we can do this since
whole MTD size in current implementation has u_int32_t type */
+=09
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int err =3D -EINVAL;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to read/write
(bytes). used for "first" probably unaligned with erasesize data block
*/
+    size_t subdev_len;			/* data size to be read/written
from/to subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D len;		/* total data size to read/write
left (bytes) */
+    size_t retsize;			/* data read/written from/to
subdev (bytes) */
+   =20
+    *retlen =3D 0;
+
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_sync(): offset =3D 0x%08x,
size =3D %d\n", from_loc, len);
+   =20
+    if(oobsel !=3D NULL)
+    {
+        /* check if oobinfo is has been chandes by FS */
+	if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
+	{
+	    printk(KERN_ERR "stripe_read_ecc_sync(): oobinfo has been
changed by FS (not supported yet)\n");
+	    return err;
+	}
+    }
+
+    /* Check whole striped device bounds here */
+    if(from_loc + len > mtd->size)
+    {
+	return err;
+    }
+=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(from_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+    	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((from_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((from_loc -
stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (from_loc / stripe->interleave_size) /
dev_count;
+	subdev_number =3D (from_loc / stripe->interleave_size) %
dev_count;
+    }
+
+    subdev_offset_low =3D from_loc % stripe->interleave_size;
+    subdev_len =3D (len_left < (stripe->interleave_size -
subdev_offset_low)) ? len_left : (stripe->interleave_size -
subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+=09
+    /* Synch read here */
+    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_sync(): device =3D %d,
offset =3D 0x%08x, len =3D %d\n", subdev_number, subdev_offset_low,
subdev_len);
+    err =3D
stripe->subdev[subdev_number]->read_ecc(stripe->subdev[subdev_number],
subdev_offset_low, subdev_len, &retsize, buf, eccbuf,
&stripe->subdev[subdev_number]->oobinfo);
+    if(!err)
+    {
+	*retlen +=3D retsize;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	eccbuf +=3D stripe->subdev[subdev_number]->oobavail;
+=09
+	if(from_loc + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+    	    dev_count--;
+    }
+	=09
+    while(!err && len_left > 0 && dev_count > 0)
+    {
+    	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < stripe->interleave_size) ? len_left :
stripe->interleave_size;
+
+	/* Synch read here */
+	DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_sync(): device =3D %d,
offset =3D 0x%08x, len =3D %d\n", subdev_number, subdev_offset *
stripe->interleave_size, subdev_len);
+	err =3D
stripe->subdev[subdev_number]->read_ecc(stripe->subdev[subdev_number],
subdev_offset * stripe->interleave_size, subdev_len, &retsize, buf,
eccbuf, &stripe->subdev[subdev_number]->oobinfo);
+	if(err)
+	    break;
+		=09
+	*retlen +=3D retsize;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	eccbuf +=3D stripe->subdev[subdev_number]->oobavail;
+	=09
+	if(from + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+	    dev_count--;
+    }
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_sync(): read %d bytes\n",
*retlen);
+    return err;
+}
+
+
+/* asynchroneous ecc read from striped volume */
+static int
+stripe_read_ecc_async(struct mtd_info *mtd, loff_t from, size_t len,
+		    size_t * retlen, u_char * buf, u_char * eccbuf,
+		    struct nand_oobinfo *oobsel)
+{
+    u_int32_t from_loc =3D (u_int32_t)from;	/* we can do this since
whole MTD size in current implementation has u_int32_t type */
+=09
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int err =3D -EINVAL;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to read/write
(bytes). used for "first" probably unaligned with erasesize data block
*/
+    size_t subdev_len;			/* data size to be read/written
from/to subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D len;		/* total data size to read/write
left (bytes) */
+
+    struct mtd_stripe_op *ops;		/* operations array (one per
thread) */
+    u_int32_t size;			/* amount of memory to be
allocated for thread operations */
+    u_int32_t queue_size;
+   =20
+    *retlen =3D 0;
+
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_async(): offset =3D =
0x%08x,
size =3D %d\n", from_loc, len);
+   =20
+    if(oobsel !=3D NULL)
+    {
+        /* check if oobinfo is has been chandes by FS */
+	if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
+	{
+	    printk(KERN_ERR "stripe_read_ecc_async(): oobinfo has been
changed by FS (not supported yet)\n");
+	    return err;
+	}
+    }
+
+    /* Check whole striped device bounds here */
+    if(from_loc + len > mtd->size)
+    {
+	return err;
+    }
+
+    /* allocate memory for multithread operations */
+    queue_size =3D len / stripe->interleave_size / stripe->num_subdev +
1;	/* default queue size. could be set to predefined value */
+    size =3D stripe->num_subdev *
SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
+    ops =3D kmalloc(size, GFP_KERNEL);
+    if(!ops)
+    {
+	printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
+	return -ENOMEM;
+    }
+=09
+    memset(ops, 0, size);
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	ops[i].opcode =3D MTD_STRIPE_OPCODE_READ_ECC;
+	ops[i].caller_id =3D 0; 			/* TBD */
+	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
to be unlocked by device thread */
+	//ops[i].status =3D 0;			/* TBD */
+
+	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
suboperation list head */
+
+	ops[i].subops.ops_num =3D 0;		/* to be increased later
here */
+	ops[i].subops.ops_num_max =3D queue_size;	/* total number of
suboperations can be stored in the array */
+	ops[i].subops.ops_array =3D (struct subop *)((char *)(ops +
stripe->num_subdev) + i * queue_size * sizeof(struct subop));
+    }
+=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(from_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+    	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((from_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((from_loc -
stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (from_loc / stripe->interleave_size) /
dev_count;
+	subdev_number =3D (from_loc / stripe->interleave_size) %
dev_count;
+    }
+
+    subdev_offset_low =3D from_loc % stripe->interleave_size;
+    subdev_len =3D (len_left < (stripe->interleave_size -
subdev_offset_low)) ? len_left : (stripe->interleave_size -
subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+=09
+    /* Issue read operation here */
+    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_async(): device =3D %d,
offset =3D 0x%08x, len =3D %d\n", subdev_number, subdev_offset_low,
subdev_len);
+
+    err =3D stripe_add_subop(&ops[subdev_number], subdev_offset_low,
subdev_len, buf, eccbuf);
+    if(!err)
+    {
+	*retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	if(eccbuf)
+	    eccbuf +=3D stripe->subdev[subdev_number]->oobavail;
+=09
+	if(from_loc + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+    	    dev_count--;
+    }
+	=09
+    while(!err && len_left > 0 && dev_count > 0)
+    {
+    	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < stripe->interleave_size) ? len_left :
stripe->interleave_size;
+
+	/* Issue read operation here */
+	DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_async(): device =3D %d,
offset =3D 0x%08x, len =3D %d\n", subdev_number, subdev_offset *
stripe->interleave_size, subdev_len);
+
+	err =3D stripe_add_subop(&ops[subdev_number], subdev_offset *
stripe->interleave_size, subdev_len, buf, eccbuf);
+	if(err)
+	    break;
+
+	*retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	if(eccbuf)
+	    eccbuf +=3D stripe->subdev[subdev_number]->oobavail;
+	=09
+	if(from + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+	    dev_count--;
+    }
+
+    /* Push operation into the corresponding threads queue and rise
semaphores */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	stripe_add_op(&stripe->sw_threads[i], &ops[i]);
+
+	/* set original operation priority */
+	ops[i].op_prio =3D current->static_prio - MAX_RT_PRIO - 20;
+	stripe_set_write_thread_prio(&stripe->sw_threads[i]);
+
+	up(&stripe->sw_threads[i].sw_thread_wait);
+    }
+=09
+    /* wait for all suboperations completed and check status */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	down(&ops[i].sem);
+	=09
+	/* set error if one of operations has failed */
+	if(ops[i].status)
+	    err =3D ops[i].status;
+    }
+
+    /* Deallocate all memory before exit */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	stripe_destroy_op(&ops[i]);
+    }
+    kfree(ops);
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_async(): read %d bytes\n",
*retlen);
+    return err;
+}
+
+
+static int
+stripe_read_ecc(struct mtd_info *mtd, loff_t from, size_t len,
+	        size_t * retlen, u_char * buf, u_char * eccbuf,
+		struct nand_oobinfo *oobsel)
+{
+    int err;
+    if(mtd->type =3D=3D MTD_NANDFLASH)
+	err =3D stripe_read_ecc_async(mtd, from, len, retlen, buf, eccbuf,
oobsel);
+    else
+	err =3D stripe_read_ecc_sync(mtd, from, len, retlen, buf, eccbuf,
oobsel);
+   =20
+    return err;
+}
+
+
+static int
+stripe_write_ecc(struct mtd_info *mtd, loff_t to, size_t len,
+		 size_t * retlen, const u_char * buf, u_char * eccbuf,
+		 struct nand_oobinfo *oobsel)
+{
+    u_int32_t to_loc =3D (u_int32_t)to;	/* we can do this since whole
MTD size in current implementation has u_int32_t type */
+
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int err =3D -EINVAL;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to read/write
(bytes). used for "first" probably unaligned block */
+    size_t subdev_len;			/* data size to be read/written
from/to subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D len;		/* total data size to read/write
left (bytes) */
+=09
+    struct mtd_stripe_op *ops;		/* operations array (one per
thread) */
+    u_int32_t size;			/* amount of memory to be
allocated for thread operations */
+    u_int32_t queue_size;
+   =20
+    *retlen =3D 0;
+
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_ecc(): offset =3D 0x%08x, =
size
=3D %d\n", to_loc, len);
+
+    if(oobsel !=3D NULL)
+    {
+        /* check if oobinfo is has been chandes by FS */
+	if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
+	{
+	    printk(KERN_ERR "stripe_write_ecc(): oobinfo has been
changed by FS (not supported yet)\n");
+	    return err;
+	}
+    }
+=09
+    /* check if no data is going to be written */
+    if(!len)
+        return 0;
+=09
+    /* Check whole striped device bounds here */
+    if(to_loc + len > mtd->size)
+        return err;
+=09
+    /* allocate memory for multithread operations */
+    queue_size =3D len / stripe->interleave_size / stripe->num_subdev +
1;	/* default queue size */
+    size =3D stripe->num_subdev *
SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
+    ops =3D kmalloc(size, GFP_KERNEL);
+    if(!ops)
+    {
+	printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
+	return -ENOMEM;
+    }
+=09
+    memset(ops, 0, size);
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	ops[i].opcode =3D MTD_STRIPE_OPCODE_WRITE_ECC;
+	ops[i].caller_id =3D 0; 			/* TBD */
+	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
to be unlocked by device thread */
+	//ops[i].status =3D 0;			/* TBD */
+
+	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
suboperation list head */
+
+	ops[i].subops.ops_num =3D 0;		/* to be increased later
here */
+	ops[i].subops.ops_num_max =3D queue_size;	/* total number of
suboperations can be stored in the array */
+	ops[i].subops.ops_array =3D (struct subop *)((char *)(ops +
stripe->num_subdev) + i * queue_size * sizeof(struct subop));
+    }
+					=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(to_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((to_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((to_loc - stripe->subdev_last_offset[i
- 1]) / stripe->interleave_size) % dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (to_loc / stripe->interleave_size) / dev_count;
+	subdev_number =3D (to_loc / stripe->interleave_size) % dev_count;
+    }
+=09
+    subdev_offset_low =3D to_loc % stripe->interleave_size;
+    subdev_len =3D (len_left < (stripe->interleave_size -
subdev_offset_low)) ? len_left : (stripe->interleave_size -
subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+=09
+    /* Add suboperation to queue here */
+    err =3D stripe_add_subop(&ops[subdev_number], subdev_offset_low,
subdev_len, buf, eccbuf);
+    if(!err)
+    {
+	*retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	if(eccbuf)
+	    eccbuf +=3D stripe->subdev[subdev_number]->oobavail;
+=09
+	if(to_loc + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+    	    dev_count--;
+    }
+		=09
+    while(!err && len_left > 0 && dev_count > 0)
+    {
+	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < stripe->interleave_size) ? len_left :
stripe->interleave_size;
+
+	/* Add suboperation to queue here */
+	err =3D stripe_add_subop(&ops[subdev_number], subdev_offset *
stripe->interleave_size, subdev_len, buf, eccbuf);
+	if(err)
+	    break;
+		=09
+	*retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+	if(eccbuf)
+	    eccbuf +=3D stripe->subdev[subdev_number]->oobavail;
+	=09
+	if(to_loc + *retlen >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+	    dev_count--;
+    }
+   =20
+    /* Push operation into the corresponding threads queue and rise
semaphores */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	stripe_add_op(&stripe->sw_threads[i], &ops[i]);
+
+	/* set original operation priority */
+	ops[i].op_prio =3D current->static_prio - MAX_RT_PRIO - 20;
+	stripe_set_write_thread_prio(&stripe->sw_threads[i]);
+
+	up(&stripe->sw_threads[i].sw_thread_wait);
+    }
+=09
+    /* wait for all suboperations completed and check status */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	down(&ops[i].sem);
+	=09
+	/* set error if one of operations has failed */
+	if(ops[i].status)
+	    err =3D ops[i].status;
+    }
+
+    /* Deallocate all memory before exit */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	stripe_destroy_op(&ops[i]);
+    }
+    kfree(ops);
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_ecc(): written %d bytes\n",
*retlen);
+    return err;
+}
+
+
+static int
+stripe_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t * retlen, u_char * buf)
+{
+    u_int32_t from_loc =3D (u_int32_t)from;	/* we can do this since
whole MTD size in current implementation has u_int32_t type */
+=09
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int err =3D -EINVAL;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to read/write
(bytes). used for "first" probably unaligned with erasesize data block
*/
+    size_t subdev_len;			/* data size to be read/written
from/to subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D len;		/* total data size to read/write
left (bytes) */
+    size_t retsize;			/* data read/written from/to
subdev (bytes) */
+   =20
+    u_int32_t subdev_oobavail =3D stripe->subdev[0]->oobsize;
+=09
+    *retlen =3D 0;
+
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_oob(): offset =3D 0x%08x, size =
=3D
%d\n", from_loc, len);
+
+    /* Check whole striped device bounds here */
+    if(from_loc + len > mtd->size)
+    {
+	return err;
+    }
+=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(from_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+    	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((from_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((from_loc -
stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (from_loc / stripe->interleave_size) /
dev_count;
+	subdev_number =3D (from_loc / stripe->interleave_size) %
dev_count;
+    }
+
+    subdev_offset_low =3D from_loc % subdev_oobavail;
+    subdev_len =3D (len_left < (subdev_oobavail - subdev_offset_low)) ?
len_left : (subdev_oobavail - subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+=09
+    /* Synch read here */
+    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_oob(): device =3D %d, offset =
=3D
0x%08x, len =3D %d\n", subdev_number, subdev_offset_low, subdev_len);
+    err =3D
stripe->subdev[subdev_number]->read_oob(stripe->subdev[subdev_number],
subdev_offset_low, subdev_len, &retsize, buf);
+    if(!err)
+    {
+	*retlen +=3D retsize;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+
+	/* increase flash offset by interleave size since oob blocks=20
+	 * aligned with page size (i.e. interleave size) */
+	from_loc +=3D stripe->interleave_size;
+=09
+	if(from_loc >=3D stripe->subdev_last_offset[stripe->num_subdev -
dev_count])
+    	    dev_count--;
+    }
+	=09
+    while(!err && len_left > 0 && dev_count > 0)
+    {
+    	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < subdev_oobavail) ? len_left :
subdev_oobavail;
+
+	/* Synch read here */
+	DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_oob(): device =3D %d, offset
=3D 0x%08x, len =3D %d\n", subdev_number, subdev_offset *
stripe->interleave_size, subdev_len);
+	err =3D
stripe->subdev[subdev_number]->read_oob(stripe->subdev[subdev_number],
subdev_offset * stripe->interleave_size, subdev_len, &retsize, buf);
+	if(err)
+	    break;
+		=09
+	*retlen +=3D retsize;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+
+	/* increase flash offset by interleave size since oob blocks=20
+	 * aligned with page size (i.e. interleave size) */
+	from_loc +=3D stripe->interleave_size;
+	=09
+	if(from_loc >=3D stripe->subdev_last_offset[stripe->num_subdev -
dev_count])
+	    dev_count--;
+    }
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_oob(): read %d bytes\n",
*retlen);
+    return err;
+}
+
+static int
+stripe_write_oob(struct mtd_info *mtd, loff_t to, size_t len,
+		 size_t *retlen, const u_char * buf)
+{
+    u_int32_t to_loc =3D (u_int32_t)to;	/* we can do this since whole
MTD size in current implementation has u_int32_t type */
+
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int err =3D -EINVAL;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to read/write
(bytes). used for "first" probably unaligned block */
+    size_t subdev_len;			/* data size to be read/written
from/to subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D len;		/* total data size to read/write
left (bytes) */
+=09
+    struct mtd_stripe_op *ops;		/* operations array (one per
thread) */
+    u_int32_t size;			/* amount of memory to be
allocated for thread operations */
+    u_int32_t queue_size;
+   =20
+    //u_int32_t subdev_oobavail =3D stripe->subdev[0]->oobavail;
+    u_int32_t subdev_oobavail =3D stripe->subdev[0]->oobsize;
+
+    *retlen =3D 0;
+
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_oob(): offset =3D 0x%08x, =
size
=3D %d\n", to_loc, len);
+=09
+    /* check if no data is going to be written */
+    if(!len)
+        return 0;
+=09
+    /* Check whole striped device bounds here */
+    if(to_loc + len > mtd->size)
+        return err;
+=09
+    /* allocate memory for multithread operations */
+    queue_size =3D len / subdev_oobavail / stripe->num_subdev + 1;
/* default queue size. could be set to predefined value */
+    size =3D stripe->num_subdev *
SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
+    ops =3D kmalloc(size, GFP_KERNEL);
+    if(!ops)
+    {
+	printk(KERN_ERR "stripe_write_oob(): memory allocation
error!\n");
+	return -ENOMEM;
+    }
+=09
+    memset(ops, 0, size);
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	ops[i].opcode =3D MTD_STRIPE_OPCODE_WRITE_OOB;
+	ops[i].caller_id =3D 0; 			/* TBD */
+	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
to be unlocked by device thread */
+	//ops[i].status =3D 0;			/* TBD */
+
+	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
suboperation list head */
+
+	ops[i].subops.ops_num =3D 0;		/* to be increased later
here */
+	ops[i].subops.ops_num_max =3D queue_size;	/* total number of
suboperations can be stored in the array */
+	ops[i].subops.ops_array =3D (struct subop *)((char *)(ops +
stripe->num_subdev) + i * queue_size * sizeof(struct subop));
+    }
+					=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(to_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((to_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((to_loc - stripe->subdev_last_offset[i
- 1]) / stripe->interleave_size) % dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (to_loc / stripe->interleave_size) / dev_count;
+	subdev_number =3D (to_loc / stripe->interleave_size) % dev_count;
+    }
+=09
+    subdev_offset_low =3D to_loc % subdev_oobavail;
+    subdev_len =3D (len_left < (subdev_oobavail - subdev_offset_low)) ?
len_left : (subdev_oobavail - subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+=09
+    /* Add suboperation to queue here */
+    err =3D stripe_add_subop(&ops[subdev_number], subdev_offset_low,
subdev_len, buf, NULL);
+

+    if(!err)
+    {
+	*retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+=09
+	/* increase flash offset by interleave size since oob blocks=20
+	 * aligned with page size (i.e. interleave size) */
+	to_loc +=3D stripe->interleave_size;
+
+	if(to_loc >=3D stripe->subdev_last_offset[stripe->num_subdev -
dev_count])
+    	    dev_count--;
+    }
+		=09
+    while(!err && len_left > 0 && dev_count > 0)
+    {
+	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < subdev_oobavail) ? len_left :
subdev_oobavail;
+
+	/* Add suboperation to queue here */
+	err =3D stripe_add_subop(&ops[subdev_number], subdev_offset *
stripe->interleave_size, subdev_len, buf, NULL);
+	if(err)
+	    break;
+		=09
+	*retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	buf +=3D subdev_len;
+
+	/* increase flash offset by interleave size since oob blocks=20
+	 * aligned with page size (i.e. interleave size) */
+	to_loc +=3D stripe->interleave_size;
+	=09
+	if(to_loc >=3D stripe->subdev_last_offset[stripe->num_subdev -
dev_count])
+	    dev_count--;
+    }
+   =20
+    /* Push operation into the corresponding threads queue and rise
semaphores */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	stripe_add_op(&stripe->sw_threads[i], &ops[i]);
+
+	/* set original operation priority */
+	ops[i].op_prio =3D current->static_prio - MAX_RT_PRIO - 20;
+	stripe_set_write_thread_prio(&stripe->sw_threads[i]);
+
+	up(&stripe->sw_threads[i].sw_thread_wait);
+    }
+=09
+    /* wait for all suboperations completed and check status */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	down(&ops[i].sem);
+	=09
+	/* set error if one of operations has failed */
+	if(ops[i].status)
+	    err =3D ops[i].status;
+    }
+
+    /* Deallocate all memory before exit */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	stripe_destroy_op(&ops[i]);
+    }
+    kfree(ops);
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_oob(): written %d bytes\n",
*retlen);
+    return err;
+}
+
+/* this routine aimed to support striping on NOR_ECC
+ * it has been taken from cfi_cmdset_0001.c
+ */
+static int=20
+stripe_writev (struct mtd_info *mtd, const struct kvec *vecs, unsigned
long count,=20
+		loff_t to, size_t * retlen)
+{
+    int i, page, len, total_len, ret =3D 0, written =3D 0, cnt =3D 0,
towrite;
+    u_char *bufstart;
+    char* data_poi;
+    char* data_buf;
+    loff_t write_offset;
+    int rl_wr;
+
+    u_int32_t pagesize;
+
+    DEBUG(MTD_DEBUG_LEVEL2, "=3D=3D> stripe_writev()\n");
+
+#ifdef MTD_PROGRAM_REGIONS
+    /* Montavista patch for Sibley support detected */   =20
+    if(mtd->flags & MTD_PROGRAM_REGIONS)
+    {
+	pagesize =3D MTD_PROGREGION_SIZE(mtd);
+    }
+    else if(mtd->flags & MTD_ECC)
+    {
+	pagesize =3D mtd->eccsize;
+    }
+    else
+    {
+	printk(KERN_ERR "stripe_writev() has been called for device
without MTD_PROGRAM_REGIONS or MTD_ECC set\n");
+	return -EINVAL;
+    }
+#else
+    if(mtd->flags & MTD_ECC)
+    {
+	pagesize =3D mtd->eccsize;
+    }
+    else
+    {
+	printk(KERN_ERR "stripe_writev() has been called for device
without MTD_ECC set\n");
+	return -EINVAL;
+    }
+#endif
+   =20
+    data_buf =3D kmalloc(pagesize, GFP_KERNEL);
+   =20
+    /* Preset written len for early exit */
+    *retlen =3D 0;
+
+    /* Calculate total length of data */
+    total_len =3D 0;
+    for (i =3D 0; i < count; i++)
+    	total_len +=3D (int) vecs[i].iov_len;
+
+    /* check if no data is going to be written */
+    if(!total_len)
+    {
+	kfree(data_buf);
+	return 0;
+    }
+
+    /* Do not allow write past end of page */
+    if ((to + total_len) > mtd->size) {
+	DEBUG (MTD_DEBUG_LEVEL0, "stripe_writev(): Attempted write past
end of device\n");
+        kfree(data_buf);
+        return -EINVAL;
+    }
+
+    /* Setup start page */
+    page =3D ((int) to) / pagesize;
+    towrite =3D (page + 1) * pagesize - to;  /* rest of the page */
+    write_offset =3D to;
+    written =3D 0;=20
+    /* Loop until all iovecs' data has been written */
+    len =3D 0;
+    while (len < total_len) {
+        bufstart =3D (u_char *)vecs->iov_base;
+        bufstart +=3D written;
+        data_poi =3D bufstart;
+
+        /* If the given tuple is >=3D reet of page then
+         * write it out from the iov
+	 */
+	if ( (vecs->iov_len-written) >=3D towrite) {       /* The fastest
case is to write data by int * blocksize */
+	    ret =3D mtd->write(mtd, write_offset, towrite, &rl_wr,
data_poi);
+	    if(ret)
+	        break;
+    	    len +=3D towrite;
+            page ++;
+            write_offset =3D page * pagesize;
+            towrite =3D pagesize;
+            written +=3D towrite;
+            if(vecs->iov_len  =3D=3D written) {
+                vecs ++;
+                written =3D 0;
+            }
+  	}
+  	else=20
+  	{
+  	    cnt =3D 0;
+	    while(cnt < towrite ) {
+	        data_buf[cnt++] =3D ((u_char *)
vecs->iov_base)[written++];
+                if(vecs->iov_len =3D=3D written )
+                {
+		    if((cnt+len) =3D=3D total_len )
+            		break;
+                    vecs ++;
+	            written =3D 0;
+		}
+	    }
+	    data_poi =3D data_buf;
+	    ret =3D mtd->write(mtd, write_offset, cnt, &rl_wr, data_poi);
+	    if (ret)
+	        break;
+	    len +=3D cnt;
+            page ++;
+	    write_offset =3D page * pagesize;
+	    towrite =3D pagesize;
+  	}
+    }
+
+    if(retlen)
+	*retlen =3D len;
+    kfree(data_buf);
+   =20
+    DEBUG(MTD_DEBUG_LEVEL2, "<=3D=3D stripe_writev()\n");
+   =20
+    return ret;
+}
+
+
+static int=20
+stripe_writev_ecc (struct mtd_info *mtd, const struct kvec *vecs,
unsigned long count,=20
+		    loff_t to, size_t * retlen, u_char *eccbuf, struct
nand_oobinfo *oobsel)
+{
+    int i, page, len, total_len, ret =3D 0, written =3D 0, cnt =3D 0,
towrite;
+    u_char *bufstart;
+    char* data_poi;
+    char* data_buf;
+    loff_t write_offset;
+    data_buf =3D kmalloc(mtd->oobblock, GFP_KERNEL);
+    int rl_wr;
+   =20
+    DEBUG(MTD_DEBUG_LEVEL2, "=3D=3D> stripe_writev_ecc()\n");
+
+    if(oobsel !=3D NULL)
+    {
+        /* check if oobinfo is has been chandes by FS */
+	if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
+	{
+	    printk(KERN_ERR "stripe_writev_ecc(): oobinfo has been
changed by FS (not supported yet)\n");
+	    kfree(data_buf);
+	    return -EINVAL;
+	}
+    }
+   =20
+    if(!(mtd->flags & MTD_ECC))
+    {
+	printk(KERN_ERR "stripe_writev_ecc() has been called for device
without MTD_ECC set\n");
+	kfree(data_buf);
+	return -EINVAL;
+    }
+   =20
+    /* Preset written len for early exit */
+    *retlen =3D 0;
+
+    /* Calculate total length of data */
+    total_len =3D 0;
+    for (i =3D 0; i < count; i++)
+    	total_len +=3D (int) vecs[i].iov_len;
+
+    /* check if no data is going to be written */
+    if(!total_len)
+    {
+	kfree(data_buf);
+	return 0;
+    }
+
+    /* Do not allow write past end of page */
+    if ((to + total_len) > mtd->size) {
+	DEBUG (MTD_DEBUG_LEVEL0, "stripe_writev_ecc(): Attempted write
past end of device\n");
+        kfree(data_buf);
+        return -EINVAL;
+    }
+   =20
+    /* Check "to" and "len" alignment here */
+    /* NOTE: can't use if(to & (mtd->ooblock - 1)) alignment check here
since
+     * mtd->oobblock can be not-power-of-two number */
+    if((((int) to) % mtd->oobblock) || (total_len % mtd->oobblock))
+    {
+	printk(KERN_ERR "stripe_writev_ecc(): Attempted write not
aligned data!\n");
+        kfree(data_buf);
+        return -EINVAL;
+    }
+   =20
+    /* Setup start page. Notaligned data is not allowed for write_ecc.
*/
+    page =3D ((int) to) / mtd->oobblock;
+    towrite =3D (page + 1) * mtd->oobblock - to;  /* aligned with
oobblock */
+    write_offset =3D to;
+    written =3D 0;=20
+    /* Loop until all iovecs' data has been written */
+    len =3D 0;
+    while (len < total_len) {
+        bufstart =3D (u_char *)vecs->iov_base;
+        bufstart +=3D written;
+        data_poi =3D bufstart;
+
+        /* If the given tuple is >=3D reet of page then
+         * write it out from the iov
+	 */
+	if ( (vecs->iov_len-written) >=3D towrite) {       /* The fastest
case is to write data by int * blocksize */
+	    ret =3D mtd->write_ecc(mtd, write_offset, towrite, &rl_wr,
data_poi, eccbuf, oobsel);
+	    if(ret)
+	        break;
+	    len +=3D rl_wr;
+            page ++;
+            write_offset =3D page * mtd->oobblock;
+            towrite =3D mtd->oobblock;
+            written +=3D towrite;
+            if(vecs->iov_len  =3D=3D written) {
+                vecs ++;
+                written =3D 0;
+            }
+	   =20
+	    if(eccbuf)
+		eccbuf +=3D mtd->oobavail;
+  	}
+  	else=20
+  	{
+  	    cnt =3D 0;
+	    while(cnt < towrite ) {
+	        data_buf[cnt++] =3D ((u_char *)
vecs->iov_base)[written++];
+                if(vecs->iov_len =3D=3D written )
+                {
+		    if((cnt+len) =3D=3D total_len )
+            		break;
+                    vecs ++;
+	            written =3D 0;
+		}
+	    }
+	    data_poi =3D data_buf;
+	    ret =3D mtd->write_ecc(mtd, write_offset, cnt, &rl_wr,
data_poi, eccbuf, oobsel);
+	    if (ret)
+	        break;
+	    len +=3D rl_wr;
+            page ++;
+	    write_offset =3D page * mtd->oobblock;
+	    towrite =3D mtd->oobblock;
+	   =20
+	    if(eccbuf)
+		eccbuf +=3D mtd->oobavail;
+  	}
+    }
+
+    if(retlen)
+	*retlen =3D len;
+    kfree(data_buf);
+   =20
+    DEBUG(MTD_DEBUG_LEVEL2, "<=3D=3D stripe_writev_ecc()\n");
+
+    return ret;
+}
+
+
+static void
+stripe_erase_callback(struct erase_info *instr)
+{
+    wake_up((wait_queue_head_t *) instr->priv);
+}
+
+static int
+stripe_dev_erase(struct mtd_info *mtd, struct erase_info *erase)
+{
+    int err;
+    wait_queue_head_t waitq;
+    DECLARE_WAITQUEUE(wait, current);
+
+    init_waitqueue_head(&waitq);
+
+    erase->mtd =3D mtd;
+    erase->callback =3D stripe_erase_callback;
+    erase->priv =3D (unsigned long) &waitq;
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_dev_erase(): addr=3D0x%08x,
len=3D%d\n", erase->addr, erase->len);
+
+    /*
+     * FIXME: Allow INTERRUPTIBLE. Which means
+     * not having the wait_queue head on the stack.
+     */
+    err =3D mtd->erase(mtd, erase);
+    if (!err)
+    {
+	set_current_state(TASK_UNINTERRUPTIBLE);
+	add_wait_queue(&waitq, &wait);
+	if (erase->state !=3D MTD_ERASE_DONE
+	    && erase->state !=3D MTD_ERASE_FAILED)
+		schedule();
+	remove_wait_queue(&waitq, &wait);
+	set_current_state(TASK_RUNNING);
+
+	err =3D (erase->state =3D=3D MTD_ERASE_FAILED) ? -EIO : 0;
+    }
+    return err;
+}
+
+static int
+stripe_erase(struct mtd_info *mtd, struct erase_info *instr)
+{
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int i, err;
+    struct mtd_stripe_erase_bounds *erase_bounds;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to erase
(bytes) */
+    size_t subdev_len;			/* data size to be erased at
this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left;			/* total data size left to be
erased (bytes) */
+    size_t len_done;			/* total data size erased */
+    u_int32_t from;
+
+    struct mtd_stripe_op *ops;		/* operations array (one per
thread) */
+    u_int32_t size;			/* amount of memory to be
allocated for thread operations */
+    u_int32_t queue_size;
+
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_earse(): addr=3D0x%08x, =
len=3D%d\n",
instr->addr, instr->len);
+=09
+    if(!(mtd->flags & MTD_WRITEABLE))
+	return -EROFS;
+
+    if(instr->addr > stripe->mtd.size)
+	return -EINVAL;
+
+    if(instr->len + instr->addr > stripe->mtd.size)
+	return -EINVAL;
+
+    /*
+     * Check for proper erase block alignment of the to-be-erased area.
+     */
+    if(!stripe->mtd.numeraseregions)
+    {
+	/* striped device has uniform erase block size */
+	/* NOTE: can't use if(instr->addr & (stripe->mtd.erasesize - 1))
alignment check here
+	 * since stripe->mtd.erasesize can be not-power-of-two number */
+	if(instr->addr % stripe->mtd.erasesize || instr->len %
stripe->mtd.erasesize)
+	    return -EINVAL;
+    }
+    else
+    {
+	/* we should not get here */
+	return -EINVAL;
+    }
+
+    instr->fail_addr =3D 0xffffffff;
+
+    /* allocate memory for multithread operations */
+    queue_size =3D 1;	/* queue size for erase opration is 1 */
+    size =3D stripe->num_subdev *
SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
+    ops =3D kmalloc(size, GFP_KERNEL);
+    if(!ops)
+    {
+	printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
+	return -ENOMEM;
+    }
+=09
+    memset(ops, 0, size);
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+    	ops[i].opcode =3D MTD_STRIPE_OPCODE_ERASE;
+	ops[i].caller_id =3D 0; 			/* TBD */
+	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
to be unlocked by device thread */
+	//ops[i].status =3D 0;			/* TBD */
+	ops[i].fail_addr =3D 0xffffffff;
+
+	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
suboperation list head */
+
+	ops[i].subops.ops_num =3D 0;		/* to be increased later
here */
+	ops[i].subops.ops_num_max =3D queue_size;	/* total number of
suboperations can be stored in the array */
+	ops[i].subops.ops_array =3D (struct subop *)((char *)(ops +
stripe->num_subdev) + i * queue_size * sizeof(struct subop));
+    }
+=09
+    len_left =3D instr->len;
+    len_done =3D 0;
+    from =3D instr->addr;
+=09
+    /* allocate memory for erase boundaries for all subdevices */
+    erase_bounds =3D kmalloc(stripe->num_subdev * sizeof(struct
mtd_stripe_erase_bounds), GFP_KERNEL);
+    if(!erase_bounds)
+    {
+	kfree(ops);
+	return -ENOMEM;
+    }
+    memset(erase_bounds, 0, sizeof(struct mtd_stripe_erase_bounds) *
stripe->num_subdev);
+=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(from >=3D stripe->subdev_last_offset[i-1])
+	{
+	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((from - stripe->subdev_last_offset[i - 1])
/ stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((from - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) % dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (from / stripe->interleave_size) / dev_count;
+	subdev_number =3D (from / stripe->interleave_size) % dev_count;
+    }
+
+    /* Should by optimized for erase op */
+    subdev_offset_low =3D from % stripe->interleave_size;
+    subdev_len =3D (len_left < (stripe->interleave_size -
subdev_offset_low)) ? len_left : (stripe->interleave_size -
subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+=09
+    /* Add/extend block-to-be erased */
+    if(!erase_bounds[subdev_number].need_erase)
+    {
+	erase_bounds[subdev_number].need_erase =3D 1;
+	erase_bounds[subdev_number].addr =3D subdev_offset_low;
+    }
+    erase_bounds[subdev_number].len +=3D subdev_len;
+    len_left -=3D subdev_len;
+    len_done +=3D subdev_len;
+=09
+    if(from + len_done >=3D =
stripe->subdev_last_offset[stripe->num_subdev
- dev_count])
+	dev_count--;
+	=09
+    while(len_left > 0 && dev_count > 0)
+    {
+	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < stripe->interleave_size) ? len_left :
stripe->interleave_size; /* can by optimized for erase op*/
+=09
+	/* Add/extend block-to-be erased */
+	if(!erase_bounds[subdev_number].need_erase)
+	{
+	    erase_bounds[subdev_number].need_erase =3D 1;
+	    erase_bounds[subdev_number].addr =3D subdev_offset *
stripe->interleave_size;
+	}
+	erase_bounds[subdev_number].len +=3D subdev_len;
+	len_left -=3D subdev_len;
+	len_done +=3D subdev_len;
+
+        DEBUG(MTD_DEBUG_LEVEL3, "stripe_erase(): device =3D %d, addr =
=3D
0x%08x, len =3D %d\n", subdev_number, erase_bounds[subdev_number].addr,
erase_bounds[subdev_number].len);
+
+	if(from + len_done >=3D
stripe->subdev_last_offset[stripe->num_subdev - dev_count])
+	    dev_count--;
+    }
+	=09
+    /* now do the erase: */
+    err =3D 0;
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	if(erase_bounds[i].need_erase)
+	{
+	    if (!(stripe->subdev[i]->flags & MTD_WRITEABLE))
+	    {
+		err =3D -EROFS;
+		break;
+	    }
+	   =20
+	    stripe_add_subop(&ops[i], erase_bounds[i].addr,
erase_bounds[i].len, (u_char *)instr, NULL);
+	}
+    }
+	=09
+    /* Push operation queues into the corresponding threads */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+    	if(erase_bounds[i].need_erase)
+	{
+	    stripe_add_op(&stripe->sw_threads[i], &ops[i]);
+	   =20
+    	    /* set original operation priority */
+	    ops[i].op_prio =3D current->static_prio - MAX_RT_PRIO - 20;
+    	    stripe_set_write_thread_prio(&stripe->sw_threads[i]);
+	   =20
+	    up(&stripe->sw_threads[i].sw_thread_wait);
+	}
+    }
+=09
+    /* wait for all suboperations completed and check status */
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+    	if(erase_bounds[i].need_erase)
+	{
+	    down(&ops[i].sem);
+	=09
+	    /* set error if one of operations has failed */
+	    if(ops[i].status)
+	    {
+		err =3D ops[i].status;
+
+		/* FIX ME: For now this adddres shows address
+		 * at the last failed subdevice,
+		 * but not at the "super" device */
+		if(ops[i].fail_addr !=3D 0xffffffff)
+		    instr->fail_addr =3D ops[i].fail_addr;=20
+	    }
+					=09
+	    instr->state =3D ops[i].state;
+	}
+    }
+
+    /* Deallocate all memory before exit */
+    kfree(erase_bounds);
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	stripe_destroy_op(&ops[i]);
+    }
+    kfree(ops);
+
+    if(err)
+	return err;
+
+    if(instr->callback)
+    	instr->callback(instr);
+    return 0;
+}
+
+static int
+stripe_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+    u_int32_t ofs_loc =3D (u_int32_t)ofs;	/* we can do this since
whole MTD size in current implementation has u_int32_t type */
+=09
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int err =3D -EINVAL;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to lock
(bytes). used for "first" probably unaligned with erasesize data block
*/
+    size_t subdev_len;			/* data size to be locked @
subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D len;		/* total data size to lock left
(bytes) */
+=09
+    size_t retlen =3D 0;
+    struct mtd_stripe_erase_bounds *erase_bounds;
+
+    /* Check whole striped device bounds here */
+    if(ofs_loc + len > mtd->size)
+	return err;
+
+    /* allocate memory for lock boundaries for all subdevices */
+    erase_bounds =3D kmalloc(stripe->num_subdev * sizeof(struct
mtd_stripe_erase_bounds), GFP_KERNEL);
+    if(!erase_bounds)
+	return -ENOMEM;
+    memset(erase_bounds, 0, sizeof(struct mtd_stripe_erase_bounds) *
stripe->num_subdev);
+=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(ofs_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((ofs_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((ofs_loc - stripe->subdev_last_offset[i
- 1]) / stripe->interleave_size) % dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (ofs_loc / stripe->interleave_size) / dev_count;
+	subdev_number =3D (ofs_loc / stripe->interleave_size) % dev_count;
+    }
+
+    subdev_offset_low =3D ofs_loc % stripe->interleave_size;
+    subdev_len =3D (len_left < (stripe->interleave_size -
subdev_offset_low)) ? len_left : (stripe->interleave_size -
subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+
+    /* Add/extend block-to-be locked */
+    if(!erase_bounds[subdev_number].need_erase)
+    {
+	erase_bounds[subdev_number].need_erase =3D 1;
+	erase_bounds[subdev_number].addr =3D subdev_offset_low;
+    }
+    erase_bounds[subdev_number].len +=3D subdev_len;
+
+    retlen +=3D subdev_len;
+    len_left -=3D subdev_len;
+    if(ofs + retlen >=3D stripe->subdev_last_offset[stripe->num_subdev =
-
dev_count])
+	dev_count--;
+=09
+    while(len_left > 0 && dev_count > 0)
+    {
+	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < stripe->interleave_size) ? len_left :
stripe->interleave_size;
+	=09
+	/* Add/extend block-to-be locked */
+	if(!erase_bounds[subdev_number].need_erase)
+	{
+	    erase_bounds[subdev_number].need_erase =3D 1;
+	    erase_bounds[subdev_number].addr =3D subdev_offset *
stripe->interleave_size;
+	}
+	erase_bounds[subdev_number].len +=3D subdev_len;
+
+	retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	=09
+	if(ofs + retlen >=3D stripe->subdev_last_offset[stripe->num_subdev
- dev_count])
+	    dev_count--;
+    }
+
+    /* now do lock */
+    err =3D 0;
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	if(erase_bounds[i].need_erase)
+	{
+	    if (stripe->subdev[i]->lock)
+	    {
+   	       err =3D stripe->subdev[i]->lock(stripe->subdev[i],
erase_bounds[i].addr, erase_bounds[i].len);
+	       if(err)
+	 	   break;
+	    };	  =20
+	}
+    }
+
+    /* Free allocated memory here */
+    kfree(erase_bounds);
+=09
+    return err;
+}
+
+static int
+stripe_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+    u_int32_t ofs_loc =3D (u_int32_t)ofs;	/* we can do this since
whole MTD size in current implementation has u_int32_t type */
+=09
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int err =3D -EINVAL;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to unlock
(bytes). used for "first" probably unaligned with erasesize data block
*/
+    size_t subdev_len;			/* data size to be unlocked @
subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D len;		/* total data size to unlock
left (bytes) */
+=09
+    size_t retlen =3D 0;
+    struct mtd_stripe_erase_bounds *erase_bounds;
+
+    /* Check whole striped device bounds here */
+    if(ofs_loc + len > mtd->size)
+	return err;
+
+    /* allocate memory for unlock boundaries for all subdevices */
+    erase_bounds =3D kmalloc(stripe->num_subdev * sizeof(struct
mtd_stripe_erase_bounds), GFP_KERNEL);
+    if(!erase_bounds)
+	return -ENOMEM;
+    memset(erase_bounds, 0, sizeof(struct mtd_stripe_erase_bounds) *
stripe->num_subdev);
+=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(ofs_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((ofs_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((ofs_loc - stripe->subdev_last_offset[i
- 1]) / stripe->interleave_size) % dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (ofs_loc / stripe->interleave_size) / dev_count;
+	subdev_number =3D (ofs_loc / stripe->interleave_size) % dev_count;
+    }
+
+    subdev_offset_low =3D ofs_loc % stripe->interleave_size;
+    subdev_len =3D (len_left < (stripe->interleave_size -
subdev_offset_low)) ? len_left : (stripe->interleave_size -
subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+
+    /* Add/extend block-to-be unlocked */
+    if(!erase_bounds[subdev_number].need_erase)
+    {
+	erase_bounds[subdev_number].need_erase =3D 1;
+	erase_bounds[subdev_number].addr =3D subdev_offset_low;
+    }
+    erase_bounds[subdev_number].len +=3D subdev_len;
+
+    retlen +=3D subdev_len;
+    len_left -=3D subdev_len;
+    if(ofs + retlen >=3D stripe->subdev_last_offset[stripe->num_subdev =
-
dev_count])
+	dev_count--;
+=09
+    while(len_left > 0 && dev_count > 0)
+    {
+	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < stripe->interleave_size) ? len_left :
stripe->interleave_size;
+	=09
+	/* Add/extend block-to-be unlocked */
+	if(!erase_bounds[subdev_number].need_erase)
+	{
+	    erase_bounds[subdev_number].need_erase =3D 1;
+	    erase_bounds[subdev_number].addr =3D subdev_offset *
stripe->interleave_size;
+	}
+	erase_bounds[subdev_number].len +=3D subdev_len;
+
+	retlen +=3D subdev_len;
+	len_left -=3D subdev_len;
+	=09
+	if(ofs + retlen >=3D stripe->subdev_last_offset[stripe->num_subdev
- dev_count])
+	    dev_count--;
+    }
+
+    /* now do unlock */
+    err =3D 0;
+    for(i =3D 0; i < stripe->num_subdev; i++)
+    {
+	if(erase_bounds[i].need_erase)
+	{
+	    if (stripe->subdev[i]->unlock)
+	    {
+	       err =3D stripe->subdev[i]->unlock(stripe->subdev[i],
erase_bounds[i].addr, erase_bounds[i].len);
+	       if(err)
+	  	   break;
+	    };	  =20
+	}
+    }
+
+    /* Free allocated memory here */
+    kfree(erase_bounds);
+=09
+    return err;
+}
+
+static void
+stripe_sync(struct mtd_info *mtd)
+{
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int i;
+
+    for (i =3D 0; i < stripe->num_subdev; i++)
+    {
+	struct mtd_info *subdev =3D stripe->subdev[i];
+	if (subdev->sync)
+  	   subdev->sync(subdev);
+    }
+}
+
+static int
+stripe_suspend(struct mtd_info *mtd)
+{
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int i, rc =3D 0;
+
+    for (i =3D 0; i < stripe->num_subdev; i++)
+    {
+	struct mtd_info *subdev =3D stripe->subdev[i];
+	if (subdev->suspend)
+	{
+	   if ((rc =3D subdev->suspend(subdev)) < 0)
+	       return rc;
+	};      =20
+    }
+    return rc;
+}
+
+static void
+stripe_resume(struct mtd_info *mtd)
+{
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int i;
+
+    for (i =3D 0; i < stripe->num_subdev; i++)
+    {
+	struct mtd_info *subdev =3D stripe->subdev[i];
+	if (subdev->resume)
+  	   subdev->resume(subdev);
+    }
+}
+
+static int
+stripe_block_isbad(struct mtd_info *mtd, loff_t ofs)
+{
+    u_int32_t from_loc =3D (u_int32_t)ofs;	/* we can do this since
whole MTD size in current implementation has u_int32_t type */
+=09
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int res =3D 0;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to read/write
(bytes). used for "first" probably unaligned with erasesize data block
*/
+    size_t subdev_len;			/* data size to be read/written
from/to subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D mtd->oobblock;	/* total data size to read/write
left (bytes) */
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_block_isbad(): offset =3D =
0x%08x\n",
from_loc);
+
+    from_loc =3D (from_loc / mtd->oobblock) * mtd->oobblock;	/* align
offset here */
+=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(from_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+    	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((from_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((from_loc -
stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (from_loc / stripe->interleave_size) /
dev_count;
+	subdev_number =3D (from_loc / stripe->interleave_size) %
dev_count;
+    }
+
+    subdev_offset_low =3D from_loc % stripe->interleave_size;
+    subdev_len =3D (len_left < (stripe->interleave_size -
subdev_offset_low)) ? len_left : (stripe->interleave_size -
subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+=09
+    /* check block on subdevice is bad here */
+    DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_isbad(): device =3D %d, =
offset
=3D 0x%08x\n", subdev_number, subdev_offset_low);
+    res =3D
stripe->subdev[subdev_number]->block_isbad(stripe->subdev[subdev_number]
, subdev_offset_low);
+    if(!res)
+    {
+	len_left -=3D subdev_len;
+	from_loc +=3D subdev_len;
+	if(from_loc >=3D stripe->subdev_last_offset[stripe->num_subdev -
dev_count])
+    	    dev_count--;
+    }
+	=09
+    while(!res && len_left > 0 && dev_count > 0)
+    {
+    	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < stripe->interleave_size) ? len_left :
stripe->interleave_size;
+
+        /* check block on subdevice is bad here */
+	DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_isbad(): device =3D %d,
offset =3D 0x%08x\n", subdev_number, subdev_offset *
stripe->interleave_size);
+	res =3D
stripe->subdev[subdev_number]->block_isbad(stripe->subdev[subdev_number]
, subdev_offset * stripe->interleave_size);
+	if(res)
+	{
+	    break;
+	}
+	else
+	{
+	    len_left -=3D subdev_len;
+	    from_loc +=3D subdev_len;
+	    if(from_loc >=3D stripe->subdev_last_offset[stripe->num_subdev
- dev_count])
+		dev_count--;
+	}
+    }
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "<=3D=3D stripe_block_isbad()\n");
+    return res;
+}
+
+/* returns 0 - success */
+static int
+stripe_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+    u_int32_t from_loc =3D (u_int32_t)ofs;	/* we can do this since
whole MTD size in current implementation has u_int32_t type */
+=09
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int err =3D -EINVAL;
+    int i;
+
+    u_int32_t subdev_offset;		/* equal size subdevs offset
(interleaved block size count)*/
+    u_int32_t subdev_number;		/* number of current subdev */
+    u_int32_t subdev_offset_low;	/* subdev offset to read/write
(bytes). used for "first" probably unaligned with erasesize data block
*/
+    size_t subdev_len;			/* data size to be read/written
from/to subdev at this turn (bytes) */
+    int dev_count;			/* equal size subdev count */
+    size_t len_left =3D mtd->oobblock;	/* total data size to read/write
left (bytes) */
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "stripe_block_markbad(): offset =3D
0x%08x\n", from_loc);
+
+    from_loc =3D (from_loc / mtd->oobblock) * mtd->oobblock;	/* align
offset here */
+=09
+    /* Locate start position and corresponding subdevice number */
+    subdev_offset =3D 0;
+    subdev_number =3D 0;
+    dev_count =3D stripe->num_subdev;
+    for(i =3D (stripe->num_subdev - 1); i > 0; i--)
+    {
+	if(from_loc >=3D stripe->subdev_last_offset[i-1])
+	{
+    	    dev_count =3D stripe->num_subdev - i; /* get "equal size"
devices count */
+	    subdev_offset =3D stripe->subdev[i - 1]->size /
stripe->interleave_size - 1;
+	    subdev_offset +=3D ((from_loc - stripe->subdev_last_offset[i -
1]) / stripe->interleave_size) / dev_count;
+	    subdev_number =3D i + ((from_loc -
stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
dev_count;
+	    break;
+	}
+    }
+=09
+    if(subdev_offset =3D=3D 0)
+    {
+	subdev_offset =3D (from_loc / stripe->interleave_size) /
dev_count;
+	subdev_number =3D (from_loc / stripe->interleave_size) %
dev_count;
+    }
+
+    subdev_offset_low =3D from_loc % stripe->interleave_size;
+    subdev_len =3D (len_left < (stripe->interleave_size -
subdev_offset_low)) ? len_left : (stripe->interleave_size -
subdev_offset_low);
+    subdev_offset_low +=3D subdev_offset * stripe->interleave_size;
+=09
+    /* check block on subdevice is bad here */
+    DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_markbad(): device =3D %d,
offset =3D 0x%08x\n", subdev_number, subdev_offset_low);
+    err =3D
stripe->subdev[subdev_number]->block_markbad(stripe->subdev[subdev_numbe
r], subdev_offset_low);
+    if(!err)
+    {
+	len_left -=3D subdev_len;
+	from_loc +=3D subdev_len;
+	if(from_loc >=3D stripe->subdev_last_offset[stripe->num_subdev -
dev_count])
+    	    dev_count--;
+    }
+	=09
+    while(!err && len_left > 0 && dev_count > 0)
+    {
+    	subdev_number++;
+	if(subdev_number >=3D stripe->num_subdev)
+	{
+	    subdev_number =3D stripe->num_subdev - dev_count;
+	    subdev_offset++;
+	}
+	subdev_len =3D (len_left < stripe->interleave_size) ? len_left :
stripe->interleave_size;
+
+        /* check block on subdevice is bad here */
+	DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_markbad(): device =3D %d,
offset =3D 0x%08x\n", subdev_number, subdev_offset *
stripe->interleave_size);
+	err =3D
stripe->subdev[subdev_number]->block_markbad(stripe->subdev[subdev_numbe
r], subdev_offset * stripe->interleave_size);
+	if(err)
+	{
+	    break;
+	}
+	else
+	{
+	    len_left -=3D subdev_len;
+	    from_loc +=3D subdev_len;
+	    if(from_loc >=3D stripe->subdev_last_offset[stripe->num_subdev
- dev_count])
+		dev_count--;
+	}
+    }
+=09
+    DEBUG(MTD_DEBUG_LEVEL2, "<=3D=3D stripe_block_markbad()\n");
+    return err;
+}
+
+/*
+ * This function constructs a virtual MTD device by interleaving
(striping)
+ * num_devs MTD devices. A pointer to the new device object is
+ * stored to *new_dev upon success. This function does _not_
+ * register any devices: this is the caller's responsibility.
+ */
+struct mtd_info *mtd_stripe_create(struct mtd_info *subdev[],	/*
subdevices to stripe */
+				   int num_devs,		/*
number of subdevices      */
+				   char *name, 			/* name
for the new device   */
+				   int interleave_size)		/*
interleaving size (sanity check is required) */
+{			=09
+    int i,j;
+    size_t size;
+    struct mtd_stripe *stripe;
+    u_int32_t curr_erasesize;
+    int sort_done =3D 0;
+=09
+    printk(KERN_NOTICE "Striping MTD devices:\n");
+    for (i =3D 0; i < num_devs; i++)
+	    printk(KERN_NOTICE "(%d): \"%s\"\n", i, subdev[i]->name);
+    printk(KERN_NOTICE "into device \"%s\"\n", name);
+=09
+    /* check if trying to stripe same device */
+    for(i =3D 0; i < num_devs; i++)
+    {
+        for(j =3D i; j < num_devs; j++)
+	{
+	    if(i !=3D j && !(strcmp(subdev[i]->name,subdev[j]->name)))
+	    {
+		printk(KERN_ERR "MTD Stripe failed. The same subdevice
names were found.\n");
+		return NULL;
+	    }
+	}
+    }
+
+    /* allocate the device structure */
+    size =3D SIZEOF_STRUCT_MTD_STRIPE(num_devs);
+    stripe =3D kmalloc(size, GFP_KERNEL);
+    if (!stripe)
+    {
+        printk(KERN_ERR "mtd_stripe_create(): memory allocation
error\n");
+        return NULL;
+    }
+    memset(stripe, 0, size);
+    stripe->subdev =3D (struct mtd_info **) (stripe + 1);
+    stripe->subdev_last_offset =3D (u_int32_t *) ((char *)(stripe + 1) =
+
num_devs * sizeof(struct mtd_info *));
+    stripe->sw_threads =3D (struct mtd_sw_thread_info *)((char =
*)(stripe
+ 1) + num_devs * sizeof(struct mtd_info *) + num_devs *
sizeof(u_int32_t));
+=09
+    /*
+     * Set up the new "super" device's MTD object structure, check for
+     * incompatibilites between the subdevices.
+     */
+    stripe->mtd.type =3D subdev[0]->type;
+    stripe->mtd.flags =3D subdev[0]->flags;
+    stripe->mtd.size =3D subdev[0]->size;
+    stripe->mtd.erasesize =3D subdev[0]->erasesize;
+    stripe->mtd.oobblock =3D subdev[0]->oobblock;
+    stripe->mtd.oobsize =3D subdev[0]->oobsize;
+    stripe->mtd.oobavail =3D subdev[0]->oobavail;
+    stripe->mtd.ecctype =3D subdev[0]->ecctype;
+    stripe->mtd.eccsize =3D subdev[0]->eccsize;
+    if (subdev[0]->read_ecc)
+	stripe->mtd.read_ecc =3D stripe_read_ecc;
+    if (subdev[0]->write_ecc)
+    	stripe->mtd.write_ecc =3D stripe_write_ecc;
+    if (subdev[0]->read_oob)
+	stripe->mtd.read_oob =3D stripe_read_oob;
+    if (subdev[0]->write_oob)
+	stripe->mtd.write_oob =3D stripe_write_oob;
+
+    stripe->subdev[0] =3D subdev[0];
+
+    for(i =3D 1; i < num_devs; i++)
+    {
+	/*=20
+	 * Check device compatibility,
+	 */
+	if(stripe->mtd.type !=3D subdev[i]->type)
+	{
+	    kfree(stripe);
+	    printk(KERN_ERR "mtd_stripe_create(): incompatible device
type on \"%s\"\n",
+			    subdev[i]->name);
+	    return NULL;
+	}
+=09
+	/*
+	 * Check MTD flags
+	 */
+	if(stripe->mtd.flags !=3D subdev[i]->flags)
+	{
+	    /*
+	     * Expect all flags to be
+	     * equal on all subdevices.
+	     */
+	    kfree(stripe);
+	    printk(KERN_ERR "mtd_stripe_create(): incompatible device
flags on \"%s\"\n",
+			    subdev[i]->name);
+	    return NULL;
+	}
+=09
+	stripe->mtd.size +=3D subdev[i]->size;
+=09
+	/*
+	 * Check OOB and ECC data
+	 */
+	if (stripe->mtd.oobblock   !=3D  subdev[i]->oobblock ||
+	    stripe->mtd.oobsize    !=3D  subdev[i]->oobsize ||
+	    stripe->mtd.oobavail   !=3D  subdev[i]->oobavail ||
+	    stripe->mtd.ecctype    !=3D  subdev[i]->ecctype ||
+	    stripe->mtd.eccsize    !=3D  subdev[i]->eccsize ||
+	    !stripe->mtd.read_ecc  !=3D !subdev[i]->read_ecc ||
+	    !stripe->mtd.write_ecc !=3D !subdev[i]->write_ecc ||
+	    !stripe->mtd.read_oob  !=3D !subdev[i]->read_oob ||
+	    !stripe->mtd.write_oob !=3D !subdev[i]->write_oob)
+	{
+	    kfree(stripe);
+	    printk(KERN_ERR "mtd_stripe_create(): incompatible OOB or
ECC data on \"%s\"\n",
+			    subdev[i]->name);
+	    return NULL;
+	}
+	stripe->subdev[i] =3D subdev[i];
+    }
+
+    stripe->num_subdev =3D num_devs;
+    stripe->mtd.name =3D name;
+
+    /*
+     * Main MTD routines
+     */
+    stripe->mtd.erase =3D stripe_erase;
+    stripe->mtd.read =3D stripe_read;
+    stripe->mtd.write =3D stripe_write;
+    stripe->mtd.sync =3D stripe_sync;
+    stripe->mtd.lock =3D stripe_lock;
+    stripe->mtd.unlock =3D stripe_unlock;
+    stripe->mtd.suspend =3D stripe_suspend;
+    stripe->mtd.resume =3D stripe_resume;
+
+#ifdef MTD_PROGRAM_REGIONS
+	/* Montavista patch for Sibley support detected     */
+	if((stripe->mtd.flags & MTD_PROGRAM_REGIONS) ||
(stripe->mtd.flags & MTD_ECC))=09
+	    stripe->mtd.writev =3D stripe_writev;
+#else
+	if(stripe->mtd.flags & MTD_ECC)=09
+	    stripe->mtd.writev =3D stripe_writev;
+#endif
+
+    /* not sure about that case. probably should be used not only for
NAND */
+    if(stripe->mtd.type =3D=3D MTD_NANDFLASH)
+	stripe->mtd.writev_ecc =3D stripe_writev_ecc;
+   =20
+    if(subdev[0]->block_isbad)
+	stripe->mtd.block_isbad =3D stripe_block_isbad;
+=09
+    if(subdev[0]->block_markbad)
+	stripe->mtd.block_markbad =3D stripe_block_markbad;
+   =20
+    /* NAND specific */
+    if(stripe->mtd.type =3D=3D MTD_NANDFLASH)
+    {
+        stripe->mtd.oobblock *=3D num_devs;
+	stripe->mtd.oobsize *=3D num_devs;
+        stripe->mtd.oobavail *=3D num_devs; /* oobavail is to be =
changed
later in stripe_merge_oobinfo() */
+	stripe->mtd.eccsize *=3D num_devs;
+    }
+
+#ifdef MTD_PROGRAM_REGIONS
+    /* Montavista patch for Sibley support detected     */
+    if(stripe->mtd.flags & MTD_PROGRAM_REGIONS)
+	stripe->mtd.oobblock *=3D num_devs;
+    else if(stripe->mtd.flags & MTD_ECC)
+	stripe->mtd.eccsize *=3D num_devs;
+#else
+    if(stripe->mtd.flags & MTD_ECC)
+	stripe->mtd.eccsize *=3D num_devs;
+#endif
+=09
+    /* Sort all subdevices by their size (from largest to smallest)*/
+    while(!sort_done)
+    {
+	sort_done =3D 1;
+	for(i=3D0; i < num_devs - 1; i++)
+	{
+	    struct mtd_info *subdev =3D stripe->subdev[i];
+	    if(subdev->size > stripe->subdev[i+1]->size)
+	    {
+		stripe->subdev[i] =3D stripe->subdev[i+1];
+		stripe->subdev[i+1] =3D subdev;
+		sort_done =3D 0;
+	    }
+	}
+    }
+   =20
+    /* Create new device with uniform erase size */
+    curr_erasesize =3D subdev[0]->erasesize;
+    for (i =3D 1; i < num_devs; i++)
+    {
+    	curr_erasesize =3D lcm(curr_erasesize, subdev[i]->erasesize);
+    }
+    curr_erasesize *=3D num_devs;
+
+    /* Check if there are different size devices in the array*/   =20
+    for (i =3D 1; i < num_devs; i++)
+    {
+	/* note: subdevices must be already sorted by their size here */
+	if(subdev[i - 1]->size > subdev[i]->size)
+	{
+	    u_int32_t tmp_erasesize =3D subdev[i]->erasesize;
+	    for(j =3D 0; j < i; j++)
+	    {
+		tmp_erasesize =3D lcm(tmp_erasesize,
subdev[j]->erasesize);
+	    }
+	    tmp_erasesize *=3D i;
+	    curr_erasesize =3D lcm(curr_erasesize, tmp_erasesize);
+	}
+    }
+    =09
+    /* Check if erase size found is valid */
+    if(curr_erasesize <=3D 0)
+    {
+    	kfree(stripe);
+    	printk(KERN_ERR "mtd_stripe_create(): Can't find lcm of
subdevice erase sizes\n");
+    	return NULL;
+    }
+=09
+    /* Check interleave size validity here */
+    if(curr_erasesize % interleave_size)
+    {
+	kfree(stripe);
+	printk(KERN_ERR "mtd_stripe_create(): Wrong interleave size\n");
+	return NULL;
+    }
+    stripe->interleave_size =3D interleave_size;
+=09
+    stripe->mtd.erasesize =3D curr_erasesize;
+    stripe->mtd.numeraseregions =3D 0;
+=09
+    /* update (truncate) super device size in accordance with new
erasesize */
+    stripe->mtd.size =3D (stripe->mtd.size / stripe->mtd.erasesize) *
stripe->mtd.erasesize;
+=09
+    /* Calculate last data offset for each striped device */
+    for (i =3D 0; i < num_devs; i++)
+    	stripe->subdev_last_offset[i] =3D last_offset(stripe, i);
+
+    /* NAND specific */
+    if(stripe->mtd.type =3D=3D MTD_NANDFLASH)
+    {
+	/* Fill oobavail with correct values here */
+	for (i =3D 0; i < num_devs; i++)
+	    stripe->subdev[i]->oobavail =3D
stripe_get_oobavail(stripe->subdev[i]);
+
+        /* Sets new device oobinfo
+	 * NAND flash check is performed inside stripe_merge_oobinfo()
+         * - this should be made after subdevices sorting done for
proper eccpos and oobfree positioning
+	 * NOTE: there are some limitations with different size NAND
devices striping. all devices must have
+         * the same oobfree and eccpos maps */
+	if(stripe_merge_oobinfo(&stripe->mtd, subdev, num_devs))
+        {
+    	    kfree(stripe);
+    	    printk(KERN_ERR "mtd_stripe_create(): oobinfo merge has
failed\n");
+	    return NULL;
+	}
+    }
+	=09
+    /* Create worker threads */
+    for (i =3D 0; i < num_devs; i++)
+    {
+	if(stripe_start_write_thread(&stripe->sw_threads[i],
stripe->subdev[i]) < 0)
+	{
+	    kfree(stripe);
+	    return NULL;
+	}
+    }
+   =20
+    return &stripe->mtd;
+}
+
+/*=20
+ * This function destroys an Striped MTD object
+ */
+void mtd_stripe_destroy(struct mtd_info *mtd)
+{
+    struct mtd_stripe *stripe =3D STRIPE(mtd);
+    int i;
+=09
+    if (stripe->mtd.numeraseregions)
+	/* we should not get here. so just in case. */
+	kfree(stripe->mtd.eraseregions);
+	=09
+    /* destroy writing threads */
+    for (i =3D 0; i < stripe->num_subdev; i++)
+	stripe_stop_write_thread(&stripe->sw_threads[i]);
+
+    kfree(stripe);
+}
+
+
+#ifdef CMDLINE_PARSER_STRIPE
+/*
+ * MTD stripe init and cmdline parsing routines=20
+ */
+
+static int
+parse_cmdline_stripe_part(struct mtd_stripe_info *info, char *s)
+{
+    int ret =3D 0;
+   =20
+    struct mtd_stripe_info *new_stripe =3D NULL;
+    unsigned int name_size;
+    char *subdev_name;
+    char *e;
+    int j;
+   =20
+    DEBUG(MTD_DEBUG_LEVEL1, "parse_cmdline_stripe_part(): arg =3D =
%s\n",
s);
+   =20
+    /* parse new striped device name and allocate stripe info structure
*/
+    if(!(e =3D strchr(s,'(')) || (e =3D=3D s))
+        return -EINVAL;
+	   =20
+    name_size =3D (unsigned int)(e - s);
+    new_stripe =3D kmalloc(sizeof(struct mtd_stripe_info) + name_size +
1, GFP_KERNEL);
+    if(!new_stripe) {
+        printk(KERN_ERR "parse_cmdline_stripe_part(): memory allocation
error!\n");
+	return -ENOMEM;	   =20
+    }
+    memset(new_stripe,0,sizeof(struct mtd_stripe_info) + name_size +
1);
+    new_stripe->name =3D (char *)(new_stripe + 1);
+
+    INIT_LIST_HEAD(&new_stripe->list);
+=09
+    /* Store new device name */
+    strncpy(new_stripe->name, s, name_size);
+    s =3D e;
+	=09
+    while(*s !=3D 0)
+    {
+        switch(*s)
+	{
+    	    case '(':
+		s++;
+	        new_stripe->interleave_size =3D simple_strtoul(s,&s,10);
+	        if(!new_stripe->interleave_size || *s !=3D ')')
+		    ret =3D -EINVAL;
+		else
+		    s++;
+		break;
+	    case ':':
+	    case ',':
+	    case '.':
+#ifdef MODULE
+		if(bynumber)
+		{
+		    s++;
+		    j =3D simple_strtoul(s,&s,10);
+		    if(j < MAX_MTD_DEVICES)
+		    {
+			/* Set up and register striped MTD device */
+			down(&mtd_table_mutex);
+	    		new_stripe->devs[new_stripe->dev_num++] =3D
mtd_table[j];
+			up(&mtd_table_mutex);
+		    }
+		    else
+		    {
+			ret =3D -EINVAL;
+		    }
+		    break;
+		}
+#endif
+	=09
+    		// proceed with subdevice names
+	    	if((e =3D strchr(++s,',')))
+		    name_size =3D (unsigned int)(e - s);
+		else if((e =3D strchr(s,'.')))	/* this delimeter is to
be used for insmod params */
+		    name_size =3D (unsigned int)(e - s);
+		else
+		    name_size =3D strlen(s);
+	           =20
+	    	subdev_name =3D kmalloc(name_size + 1, GFP_KERNEL);
+	    	if(!subdev_name)
+		{
+	    	    printk(KERN_ERR "parse_cmdline_stripe_part(): memory
allocation error!\n");
+		    ret =3D -ENOMEM;
+		    break;
+	    	}
+		strncpy(subdev_name,s,name_size);
+		*(subdev_name + name_size) =3D 0;
+	=09
+		/* Set up and register striped MTD device */
+		down(&mtd_table_mutex);
+		for(j =3D 0; j < MAX_MTD_DEVICES; j++)
+		{
+		    if(mtd_table[j] &&
!strcmp(subdev_name,mtd_table[j]->name))
+		    {
+		        new_stripe->devs[new_stripe->dev_num++] =3D
mtd_table[j];
+		        break;
+		    }
+		}
+		up(&mtd_table_mutex);
+			=09
+		kfree(subdev_name);
+	=09
+		if(j =3D=3D MAX_MTD_DEVICES)
+		    ret =3D -EINVAL;
+		   =20
+		s +=3D name_size;
+	=09
+	        break;
+	    default:
+	        /* should not get here */
+		printk(KERN_ERR "stripe cmdline parse error\n");
+	        ret =3D -EINVAL;
+	        break;
+	};
+	   =20
+	if(ret)
+	    break;
+    }
+   =20
+    /* Check if all data parsed correctly. Sanity check. */
+    if(ret)
+    {
+        kfree(new_stripe);
+    }
+    else
+    {
+        list_add_tail(&new_stripe->list,&info->list);
+	DEBUG(MTD_DEBUG_LEVEL1, "Striped device %s parsed from
cmdline\n", new_stripe->name);
+    }
+   =20
+    return ret;
+}
+
+/* cmdline format:
+ * mtdstripe=3Dstripe1(128):vol3,vol5;stripe2(128):vol8,vol9 */
+static int
+parse_cmdline_stripes(struct mtd_stripe_info *info, char *s)
+{
+    int ret =3D 0;
+    char *part;
+    char *e;
+    int cmdline_part_size;
+   =20
+    struct list_head *pos, *q;
+    struct mtd_stripe_info *stripe_info;
+
+    while(*s)
+    {
+	if(!(e =3D strchr(s,';')))
+	{
+	    ret =3D parse_cmdline_stripe_part(info,s);
+	    break;
+	}
+	else
+	{
+	    cmdline_part_size =3D (int)(e - s);
+	    part =3D kmalloc(cmdline_part_size + 1, GFP_KERNEL);
+	    if(!part)
+	    {
+	        printk(KERN_ERR "parse_cmdline_stripes(): memory
allocation error!\n");
+		ret =3D -ENOMEM;
+		break;
+	    }
+	    strncpy(part,s,cmdline_part_size);
+	    *(part + cmdline_part_size) =3D 0;
+	    ret =3D parse_cmdline_stripe_part(info,part);
+	    kfree(part);
+	    if(ret)
+		break;
+	    s =3D e + 1;
+	}
+    }
+   =20
+    if(ret)
+    {
+        /* free all alocated memory in case of error */
+        list_for_each_safe(pos, q, &info->list)	{
+	    stripe_info =3D list_entry(pos, struct mtd_stripe_info, list);
+	    list_del(&stripe_info->list);
+	    kfree(stripe_info);
+	}
+    }
+
+    return ret;
+}
+
+/* initializes striped MTD devices
+ * to be called from mphysmap.c module or mtdstripe_init()
+ */
+int
+mtd_stripe_init(void)
+{
+    static struct mtd_stripe_info *dev_info;
+    struct list_head *pos, *q;
+   =20
+    struct mtd_info* mtdstripe_info;
+   =20
+    INIT_LIST_HEAD(&info.list);
+   =20
+    /* parse cmdline */
+    if(!cmdline)
+	return 0;
+
+    if(parse_cmdline_stripes(&info,cmdline))
+        return -EINVAL;
+
+    /* go through the list and create new striped devices */
+    list_for_each_safe(pos, q, &info.list) {
+        dev_info =3D list_entry(pos, struct mtd_stripe_info, list);
+=09
+        mtdstripe_info =3D mtd_stripe_create(dev_info->devs,
dev_info->dev_num,
+					dev_info->name,
dev_info->interleave_size);
+	if(!mtdstripe_info)
+	{
+	    printk(KERN_ERR "mtd_stripe_init: mtd_stripe_create() error
creating \"%s\"\n", dev_info->name);
+	   =20
+	    /* remove registered striped device info from the list
+	     * free memory allocated by parse_cmdline_stripes()
+	     */
+	    list_del(&dev_info->list);
+	    kfree(dev_info);
+	   =20
+	    return -EINVAL;
+	}
+	else
+	{
+	    if(add_mtd_device(mtdstripe_info))
+	    {
+    		printk(KERN_ERR "mtd_stripe_init: add_mtd_device() error
creating \"%s\"\n", dev_info->name);
+		mtd_stripe_destroy(mtdstripe_info);
+
+		/* remove registered striped device info from the list
+	         * free memory allocated by parse_cmdline_stripes()
+	         */
+		list_del(&dev_info->list);
+		kfree(dev_info);
+	   =20
+		return -EINVAL;
+	    }
+	    else
+		printk(KERN_ERR "Striped device \"%s\" has been created
(interleave size %d bytes)\n",
+			dev_info->name, dev_info->interleave_size);
+	}
+    }
+   =20
+    return 0;   =20
+}
+
+/* removes striped devices */
+int
+mtd_stripe_exit(void)
+{
+    static struct mtd_stripe_info *dev_info;
+    struct list_head *pos, *q;
+    struct mtd_info *old_mtd_info;
+   =20
+    int j;
+   =20
+    /* go through the list and remove striped devices */
+    list_for_each_safe(pos, q, &info.list) {
+        dev_info =3D list_entry(pos, struct mtd_stripe_info, list);
+=09
+	down(&mtd_table_mutex);
+	for(j =3D 0; j < MAX_MTD_DEVICES; j++)
+	{
+	    if(mtd_table[j] &&
!strcmp(dev_info->name,mtd_table[j]->name))
+	    {
+		old_mtd_info =3D mtd_table[j];
+		up(&mtd_table_mutex); /* up here since del_mtd_device
down it */
+		del_mtd_device(mtd_table[j]);
+		down(&mtd_table_mutex);
+		mtd_stripe_destroy(old_mtd_info);
+	        break;
+	    }
+	}
+	up(&mtd_table_mutex);
+=09
+	/* remove registered striped device info from the list
+	 * free memory allocated by parse_cmdline_stripes()
+	 */
+	list_del(&dev_info->list);
+	kfree(dev_info);
+    }
+   =20
+    return 0;   =20
+}
+
+EXPORT_SYMBOL(mtd_stripe_init);
+EXPORT_SYMBOL(mtd_stripe_exit);
+#endif
+
+#ifdef CONFIG_MTD_CMDLINE_STRIPE
+#ifndef MODULE
+/*=20
+ * This is the handler for our kernel parameter, called from=20
+ * main.c::checksetup(). Note that we can not yet kmalloc() anything,
+ * so we only save the commandline for later processing.
+ *
+ * This function needs to be visible for bootloaders.
+ */
+int mtdstripe_setup(char *s)
+{
+    cmdline =3D s;
+    return 1;
+}
+
+__setup("mtdstripe=3D", mtdstripe_setup);
+#endif
+#endif
+
+EXPORT_SYMBOL(mtd_stripe_create);
+EXPORT_SYMBOL(mtd_stripe_destroy);
+
+#ifdef MODULE
+static int __init init_mtdstripe(void)
+{
+    if(byname)
+	cmdline =3D byname;
+    else if(bynumber)
+	cmdline =3D bynumber;
+   =20
+    if(cmdline)
+	mtd_stripe_init();
+=09
+    return 0;
+}
+
+static void __exit exit_mtdstripe(void)
+{
+    if(cmdline)
+	mtd_stripe_exit();
+}
+
+module_init(init_mtdstripe);
+module_exit(exit_mtdstripe);
+#endif
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alexander Belyakov <alexander.belyakov@intel.com>, Intel
Corporation");
+MODULE_DESCRIPTION("Generic support for striping of MTD devices");
diff -uNr a/include/linux/mtd/stripe.h b/include/linux/mtd/stripe.h
--- a/include/linux/mtd/stripe.h	1970-01-01 03:00:00.000000000
+0300
+++ b/include/linux/mtd/stripe.h	2006-03-28 12:10:48.000000000
+0400
@@ -0,0 +1,39 @@
+/*
+ * MTD device striping layer definitions
+ *
+ * (C) 2005 Intel Corp.
+ *
+ * This code is GPL
+ *
+ *
+ */
+
+#ifndef MTD_STRIPE_H
+#define MTD_STRIPE_H
+
+struct mtd_stripe_info {
+    struct list_head list;
+    char *name;					/* new device
name */
+    int interleave_size;			/* interleave size */
+    int dev_num; 				/* number of devices to
be striped */
+    struct mtd_info* devs[MAX_MTD_DEVICES];	/* MTD device to be
striped */
+};
+
+struct mtd_info *mtd_stripe_create(
+    struct mtd_info *subdev[],  /* subdevices to stripe      */
+    int num_devs,               /* number of subdevices      */
+    char *name,                 /* name for the new device   */
+    int inteleave_size);  	/* interleaving size         */
+
+
+struct mtd_info *mtd_stripe_create(struct mtd_info *subdev[],	/*
subdevices to stripe */
+				   int num_devs,		/*
number of subdevices      */
+				   char *name, 			/* name
for the new device   */
+				   int interleave_size);	/*
interleaving size (sanity check is required) */
+void mtd_stripe_destroy(struct mtd_info *mtd);
+
+int mtd_stripe_init(void);
+int mtd_stripe_exit(void);
+
+#endif
+
