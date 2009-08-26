Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MgQR7-0002Cl-NQ
	for linux-mtd@lists.infradead.org; Wed, 26 Aug 2009 21:53:50 +0000
Subject: Re: mtdoops and non pre-emptible kernel
From: Richard Purdie <rpurdie@openedhand.com>
To: Matthew Lear <matt@bubblegen.co.uk>
In-Reply-To: <4A9573CF.8030105@bubblegen.co.uk>
References: <4A9573CF.8030105@bubblegen.co.uk>
Content-Type: text/plain
Date: Wed, 26 Aug 2009 22:53:42 +0100
Message-Id: <1251323622.16040.13.camel@dax.rpnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-08-26 at 18:41 +0100, Matthew Lear wrote:
> I'm trying to use the mtd oops feature on a non pre-emptible m68k
> coldfire Linux kernel. Problem is, there is nothing being written to
> flash upon a kernel panic. I'm passing the correct syntax on the command
> line and I can see the kernel messages indicating that everything is ok, ie:
> 
> / # dmesg | grep -i mtd
> [    0.000000] Kernel command line: console=ttyS0,115200 ip=dhcp
> root=/dev/nfs nfsroot=192.168.0.2:/home/matt/nfs/evb/rootfs/ rw
> mtdparts=physmap-flash.0:4M@0x80000(kernel)ro,5M@0x480000(r
> amdisk),-@0x980000(writeable) console=ttyMTD2
> [    0.336920] console [ttyMTD2] enabled
> [    0.933655] 3 cmdlinepart partitions found on MTD device physmap-flash.0
> [    0.940745] Creating 3 MTD partitions on "physmap-flash.0":
> [    0.951893] mtd: Giving out device 0 to kernel
> [    0.965760] mtd: Giving out device 1 to ramdisk
> [    0.979124] mtd: Giving out device 2 to writeable
> [    0.993942] mtdoops: Ready 8, 9 (no erase)
> [    0.993979] mtdoops: Attached to MTD device 2
> 
> The issue appears to be that the call to schedule_work() in
> mtdoops_console_sync() does not result in mtdoops_workfunc_write() being
> invoked to perform the flash write.

If you've looked at that code you'll see there are two ways the code can
go. It tries to detect if it can still schedule and if so it will use
the workqueue, else it will call the write function directly.

If the MTD device has support it will then use any panic_write function
to bypass any other scheduling the driver may do.

Digging through past emails, there was the fragment of code below that I
think was required to catch certain oops too. This wasn't acceptable to
mainline at the time, I don't know if its still needed or still not
acceptable.

Cheers,

Richard

diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
--- a/lib/bust_spinlocks.c
+++ b/lib/bust_spinlocks.c
@@ -12,7 +12,7 @@
 #include <linux/tty.h>
 #include <linux/wait.h>
 #include <linux/vt_kern.h>
-
+#include <linux/console.h>
 
 void __attribute__((weak)) bust_spinlocks(int yes)
 {
@@ -22,6 +22,7 @@ void __attribute__((weak)) bust_spinlocks(int yes)
 #ifdef CONFIG_VT
               unblank_screen();
 #endif
+              console_unblank();
               oops_in_progress = 0;
               wake_up_klogd();
       }
