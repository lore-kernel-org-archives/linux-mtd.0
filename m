Received: from 64-166-72-137.ayrnetworks.com ([64.166.72.137] helo=ayrnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nOrj-0004AC-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 19:01:47 +0000
Date: Tue, 19 Mar 2002 11:11:55 -0800
From: William Jhun <wjhun@ayrnetworks.com>
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Initialization ordering problem
Message-ID: <20020319111155.N6821@ayrnetworks.com>
References: <20020318221449.L6821@ayrnetworks.com> <1016520612.19504.3.camel@pcjonashg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1016520612.19504.3.camel@pcjonashg>; from jonas.holmberg@axis.com on Tue, Mar 19, 2002 at 07:50:12AM +0100
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, Mar 19, 2002 at 07:50:12AM +0100, Jonas Holmberg wrote:
> On Tue, 2002-03-19 at 07:14, William Jhun wrote:
> > I could work up some kludge to make
> > our platform-specific flash initialization code link in after the mtd
> > code, but this would be ugly.
> 
> Why don't you want to change the link order? Isn't it logical to link in
> the architecture independent parts before the architecture speficic ones
> so that the arch specific code can use the frameworks in the arch
> independent code?

Hm, this isn't immediately logical to me. I would think that the
platform-dependent setup would have to take place to set up any
subsystems that may be used by the different drivers. I'm not clear on
this one.

This would require linking "$(CORE_FILES)" last in the vmlinux link
order (top-level Makefile):

***************
*** 261,268 ****
  vmlinux: include/linux/version.h $(CONFIGURATION) init/main.o init/version.o linuxsubdirs
  	$(LD) $(LINKFLAGS) $(HEAD) init/main.o init/version.o \
  		--start-group \
- 		$(CORE_FILES) \
  		$(DRIVERS) \
  		$(NETWORKS) \
  		$(LIBS) \
  		--end-group \
--- 261,268 ----
  vmlinux: include/linux/version.h $(CONFIGURATION) init/main.o init/version.o linuxsubdirs
  	$(LD) $(LINKFLAGS) $(HEAD) init/main.o init/version.o \
  		--start-group \
  		$(DRIVERS) \
+ 		$(CORE_FILES) \
  		$(NETWORKS) \
  		$(LIBS) \
  		--end-group \

I may try this temporarily, but is this the "correct" way to deal with
the problem? I'm not sure it would even work.

What I don't understand is why the MTD code depends on separate
__initcall functions to execute for complete initialization - isn't it
possible to create, if the MTD code is being linked directly in the
kernel, a static array of subsystems that need to be initialized or a
list of callbacks? A brief glance shows that the Linux IDE code attempts
to do something similar (drivers/ide/ide.c, ide_init_builtin_drivers()):

        /*
         * Attempt to match drivers for the available drives
         */
#ifdef CONFIG_BLK_DEV_IDEDISK
        (void) idedisk_init();
#endif /* CONFIG_BLK_DEV_IDEDISK */
#ifdef CONFIG_BLK_DEV_IDECD
        (void) ide_cdrom_init();
#endif /* CONFIG_BLK_DEV_IDECD */
#ifdef CONFIG_BLK_DEV_IDETAPE
        (void) idetape_init();
#endif /* CONFIG_BLK_DEV_IDETAPE */
#ifdef CONFIG_BLK_DEV_IDEFLOPPY
        (void) idefloppy_init();
#endif /* CONFIG_BLK_DEV_IDEFLOPPY */
#ifdef CONFIG_BLK_DEV_IDESCSI
 #ifdef CONFIG_SCSI
        (void) idescsi_init();
 #else
    #warning ide scsi-emulation selected but no SCSI-subsystem in kernel
 #endif
#endif /* CONFIG_BLK_DEV_IDESCSI */

Would something like this be warranted? It sounds like 2.5.x offers some
neat features, but we're not there yet - we're stuck with 2.4.x kernels
at the moment.

Thanks,
Will
