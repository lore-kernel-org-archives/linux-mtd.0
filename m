Received: from relay.ptn-ipout02.plus.net ([212.159.7.36])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MgMVH-0001xr-40
	for linux-mtd@lists.infradead.org; Wed, 26 Aug 2009 17:41:51 +0000
Message-ID: <4A9573CF.8030105@bubblegen.co.uk>
Date: Wed, 26 Aug 2009 18:41:35 +0100
From: Matthew Lear <matt@bubblegen.co.uk>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtdoops and non pre-emptible kernel
Content-Type: multipart/mixed; boundary="------------020501090003020801050104"
Cc: rpurdie@openedhand.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020501090003020801050104
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I'm trying to use the mtd oops feature on a non pre-emptible m68k
coldfire Linux kernel. Problem is, there is nothing being written to
flash upon a kernel panic. I'm passing the correct syntax on the command
line and I can see the kernel messages indicating that everything is ok, ie:

/ # dmesg | grep -i mtd
[    0.000000] Kernel command line: console=ttyS0,115200 ip=dhcp
root=/dev/nfs nfsroot=192.168.0.2:/home/matt/nfs/evb/rootfs/ rw
mtdparts=physmap-flash.0:4M@0x80000(kernel)ro,5M@0x480000(r
amdisk),-@0x980000(writeable) console=ttyMTD2
[    0.336920] console [ttyMTD2] enabled
[    0.933655] 3 cmdlinepart partitions found on MTD device physmap-flash.0
[    0.940745] Creating 3 MTD partitions on "physmap-flash.0":
[    0.951893] mtd: Giving out device 0 to kernel
[    0.965760] mtd: Giving out device 1 to ramdisk
[    0.979124] mtd: Giving out device 2 to writeable
[    0.993942] mtdoops: Ready 8, 9 (no erase)
[    0.993979] mtdoops: Attached to MTD device 2

The issue appears to be that the call to schedule_work() in
mtdoops_console_sync() does not result in mtdoops_workfunc_write() being
invoked to perform the flash write.

I understand that there is only a very small window in which to actually
flush the buffer to flash (involving a spinlock and testing
oops_in_progress). However, from what I can tell, on a non pre-emptible
kernel, after panic() does it's business of calling bust_spinlocks(),
which calls console_unblank(), which calls mtdoops_console_sync(), which
calls schedule_work(), there is no way [certainly that I can see] that
the system can context switch to the worker thread in order to invoke
the routine that actually writes to flash.

The only way I have been able to get the flash to be written to upon
panic is to make the following change:

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1a6b3be..2d734e2 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -335,7 +335,7 @@ static void mtdoops_console_sync(void)
                /* Interrupt context, we're going to panic so try and log */
                mtdoops_write(cxt, 1);
        else
-               schedule_work(&cxt->work_write);
+               mtdoops_write(cxt, 0);
 }

 static void

I can pull out the logs just fine in user space using oopslog, courtesy
of Mr Purdie.

I can replicate the same situation (worker thread not executing the
registered scheduled work routine) on my system with a simple kernel
module (attached). Without the call to schedule, the system does not
panic. In the case of the attached example, this is not surprising since
there is nothing to force a context switch. The kernel sits in the loop
forever and will warn about a soft lock up (if this feature is enabled).

I have tried invoking schedule() immediately after schedule_work() in
mtdoops_console_sync(). However this still results in flash not being
written to when there is a panic. I realise that now there are of course
other factors at play which could explain why the flash never gets
written to, (specifically related to scheduling, eg thread time slices,
quantums etc), but I wanted to point out that there certainly appears to
be a couple of cases in mtdoops.c where there should be calls to
schedule() after calls to schedule_work() - only there aren't.

I don't mean to criticise the code :-) I'm an avid user of open source,
but I'd be interested if the mtd oops feature works reliably on other
non pre-emptive kernels.

Thoughts? Any feedback much appreciated.

Best regards,
--  Matt

--------------020501090003020801050104
Content-Type: text/x-csrc;
 name="work.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="work.c"

#include <linux/init.h>
#include <linux/module.h>
#include <linux/workqueue.h>
#include <linux/delay.h>
#include <linux/sched.h>

MODULE_LICENSE("foo");

static struct work_struct mywork;

static void mywork_func(struct work_struct *work)
{
   panic("Adios muchachos");
}

static int myinit(void)
{
   int i;
   printk(KERN_ALERT "myinit ->\n");

   INIT_WORK(&mywork, mywork_func);

   schedule_work(&mywork);
   schedule();

   /* This loop will hang non-premptible kernels and the worker func above
    * will not be executed without the above call to schedule. */
   for (i = 0;;) {
      mdelay(1);
      i++;
   }

   return 0;
}

static void myexit(void)
{
   printk(KERN_ALERT "<- myinit\n");
   return;
}

module_init(myinit);
module_exit(myexit);

--------------020501090003020801050104--
