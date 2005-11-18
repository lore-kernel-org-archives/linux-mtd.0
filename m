Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ecx5f-0004MT-7G
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 22:39:11 -0500
Date: Fri, 18 Nov 2005 04:37:02 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Dave Jones <davej@redhat.com>, Andrew Morton <akpm@osdl.org>,
	linux-kernel@vger.kernel.org
Message-ID: <20051118033702.GY11494@stusta.de>
References: <20051118014055.GK11494@stusta.de>
	<20051117175015.6aa99fcf.akpm@osdl.org>
	<20051118020640.GM11494@stusta.de>
	<20051117182047.5fe1a5eb.akpm@osdl.org>
	<20051118024433.GN11494@stusta.de>
	<20051117185529.31d33192.akpm@osdl.org>
	<20051118031751.GA2773@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20051118031751.GA2773@redhat.com>
Cc: linux-mtd@lists.infradead.org, rusty@rustcorp.com.au, dwmw2@infradead.org
Subject: [2.6 patch] build kernel/intermodule.c only when required
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 17, 2005 at 10:17:51PM -0500, Dave Jones wrote:
> On Thu, Nov 17, 2005 at 06:55:29PM -0800, Andrew Morton wrote:
> 
>  > > IMHO the warnings are the best solution for getting a vast amount fixed, 
>  > > and then it's time to think about the rest.
>  > 
>  > But the warnings don't *work*.  I'm *still* staring at stupid pm_register
>  > and intermodule_foo warnings.  How long has that been?
> 
> Too long.  I think the mtd stuff won't ever get fixed until after that
> function gets removed.

Let's limit the inclusion of kernel/intermodule.c to the users of these 
drivers.

> 		Dave

cu
Adrian


<--  snip  -->


Let's build kernel/intermodule.c only when required.


Signed-off-by: Adrian Bunk <bunk@stusta.de>

---

 drivers/mtd/chips/Kconfig   |    1 +
 drivers/mtd/devices/Kconfig |    1 +
 init/Kconfig                |    3 +++
 kernel/Makefile             |    3 ++-
 4 files changed, 7 insertions(+), 1 deletion(-)

--- linux-2.6.15-rc1-mm1-full/init/Kconfig.old	2005-11-18 03:22:53.000000000 +0100
+++ linux-2.6.15-rc1-mm1-full/init/Kconfig	2005-11-18 03:23:29.000000000 +0100
@@ -456,6 +456,9 @@
 	default !SLAB
 	bool
 
+config OBSOLETE_INTERMODULE
+	tristate
+
 menu "Loadable module support"
 
 config MODULES
--- linux-2.6.15-rc1-mm1-full/kernel/Makefile.old	2005-11-18 03:21:55.000000000 +0100
+++ linux-2.6.15-rc1-mm1-full/kernel/Makefile	2005-11-18 03:22:35.000000000 +0100
@@ -6,10 +6,11 @@
 	    exit.o itimer.o time.o softirq.o resource.o \
 	    sysctl.o capability.o ptrace.o timer.o user.o \
 	    signal.o sys.o kmod.o workqueue.o pid.o \
-	    rcupdate.o intermodule.o extable.o params.o posix-timers.o \
+	    rcupdate.o extable.o params.o posix-timers.o \
 	    kthread.o wait.o kfifo.o sys_ni.o posix-cpu-timers.o \
 	    ktimers.o
 
+obj-$(CONFIG_OBSOLETE_INTERMODULE) += intermodule.o
 obj-$(CONFIG_FUTEX) += futex.o
 obj-$(CONFIG_GENERIC_ISA_DMA) += dma.o
 obj-$(CONFIG_SMP) += cpu.o spinlock.o
--- linux-2.6.15-rc1-mm1-full/drivers/mtd/chips/Kconfig.old	2005-11-18 03:23:52.000000000 +0100
+++ linux-2.6.15-rc1-mm1-full/drivers/mtd/chips/Kconfig	2005-11-18 03:28:09.000000000 +0100
@@ -31,6 +31,7 @@
 
 config MTD_GEN_PROBE
 	tristate
+	select OBSOLETE_INTERMODULE
 
 config MTD_CFI_ADV_OPTIONS
 	bool "Flash chip driver advanced configuration options"
--- linux-2.6.15-rc1-mm1-full/drivers/mtd/devices/Kconfig.old	2005-11-18 03:25:17.000000000 +0100
+++ linux-2.6.15-rc1-mm1-full/drivers/mtd/devices/Kconfig	2005-11-18 03:27:46.000000000 +0100
@@ -202,6 +202,7 @@
 config MTD_DOCPROBE
 	tristate
 	select MTD_DOCECC
+	select OBSOLETE_INTERMODULE
 
 config MTD_DOCECC
 	tristate
