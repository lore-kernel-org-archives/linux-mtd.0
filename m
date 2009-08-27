Received: from relay.ptn-ipout02.plus.net ([212.159.7.36])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MgapR-00011h-I2
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 08:59:38 +0000
Message-ID: <9f22e03e9efbb90b242869d7652caa97.squirrel@webmail.plus.net>
In-Reply-To: <1251323622.16040.13.camel@dax.rpnet.com>
References: <4A9573CF.8030105@bubblegen.co.uk>
	<1251323622.16040.13.camel@dax.rpnet.com>
Date: Thu, 27 Aug 2009 09:59:31 +0100
Subject: Re: mtdoops and non pre-emptible kernel
From: "Matthew Lear" <matt@bubblegen.co.uk>
To: "Richard Purdie" <rpurdie@openedhand.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: Matthew Lear <matt@bubblegen.co.uk>, linux-mtd@lists.infradead.org
Reply-To: matt@bubblegen.co.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Wed, 2009-08-26 at 18:41 +0100, Matthew Lear wrote:
>> I'm trying to use the mtd oops feature on a non pre-emptible m68k
>> coldfire Linux kernel. Problem is, there is nothing being written to
>> flash upon a kernel panic. I'm passing the correct syntax on the command
>> line and I can see the kernel messages indicating that everything is ok,
>> ie:
>>
>> / # dmesg | grep -i mtd
>> [    0.000000] Kernel command line: console=ttyS0,115200 ip=dhcp
>> root=/dev/nfs nfsroot=192.168.0.2:/home/matt/nfs/evb/rootfs/ rw
>> mtdparts=physmap-flash.0:4M@0x80000(kernel)ro,5M@0x480000(r
>> amdisk),-@0x980000(writeable) console=ttyMTD2
>> [    0.336920] console [ttyMTD2] enabled
>> [    0.933655] 3 cmdlinepart partitions found on MTD device
>> physmap-flash.0
>> [    0.940745] Creating 3 MTD partitions on "physmap-flash.0":
>> [    0.951893] mtd: Giving out device 0 to kernel
>> [    0.965760] mtd: Giving out device 1 to ramdisk
>> [    0.979124] mtd: Giving out device 2 to writeable
>> [    0.993942] mtdoops: Ready 8, 9 (no erase)
>> [    0.993979] mtdoops: Attached to MTD device 2
>>
>> The issue appears to be that the call to schedule_work() in
>> mtdoops_console_sync() does not result in mtdoops_workfunc_write() being
>> invoked to perform the flash write.
>
> If you've looked at that code you'll see there are two ways the code can
> go. It tries to detect if it can still schedule and if so it will use
> the workqueue, else it will call the write function directly.
>
> If the MTD device has support it will then use any panic_write function
> to bypass any other scheduling the driver may do.
>
> Digging through past emails, there was the fragment of code below that I
> think was required to catch certain oops too. This wasn't acceptable to
> mainline at the time, I don't know if its still needed or still not
> acceptable.
>
> Cheers,
>
> Richard
>
> diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
> --- a/lib/bust_spinlocks.c
> +++ b/lib/bust_spinlocks.c
> @@ -12,7 +12,7 @@
>  #include <linux/tty.h>
>  #include <linux/wait.h>
>  #include <linux/vt_kern.h>
> -
> +#include <linux/console.h>
>
>  void __attribute__((weak)) bust_spinlocks(int yes)
>  {
> @@ -22,6 +22,7 @@ void __attribute__((weak)) bust_spinlocks(int yes)
>  #ifdef CONFIG_VT
>                unblank_screen();
>  #endif
> +              console_unblank();
>                oops_in_progress = 0;
>                wake_up_klogd();
>        }
>
Thanks for the reply, Richard. The change above is certainly in the 2.6.29
kernel that I'm running and it's also in the current linux-m68k git, so I
assume it made mainline some time ago.

In any case, yes I saw the two paths the code can go, ie if the mtd
device's panic_write() is available and we're in interrupt context then
use the panic_write function to write to flash, else use the work queue.
The path that my scenario takes is always the latter but the write in
context of the work queue never happens.

If this is because of the small window in which to perform the write and
there are other factors coming into play involving scheduling then
obviously that's not a direct issue for the mtdoops code.

However, the call to mtdoops_console_sync() (which causes the flash write
to be initiated from console_unblank() for the ttyMTD console device) is
eventually followed by the panic routine spinning in a tight loop with an
mdelay(1). There doesn't appear to be anywhere in this path where
schedule() is invoked. Because of running a non pre-emptible kernel, there
is no way, certainly that I can see, that a context can switch can happen
to allow the jobs in the work queue to be run without at least calling
schedule() after calling schedule_work() from within
mtdoops_console_sync().

Maybe I've missed something :-) but calling schedule() after
schedule_work() certainly seems to be the correct approach to at least
allow the code to do what it's trying to do, especially on non
pre-emptible kernels.

Cheers,
--  Matt
