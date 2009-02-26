Received: from mail-fx0-f174.google.com ([209.85.220.174])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lcjrd-0004uV-NH
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2009 17:17:40 +0000
Received: by fxm22 with SMTP id 22so650168fxm.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2009 09:17:35 -0800 (PST)
Date: Thu, 26 Feb 2009 18:17:26 +0100
From: Marcin Slusarz <marcin.slusarz@gmail.com>
To: Jesper Krogh <jesper@krogh.cc>
Subject: MTD_CK804XROM warning (Was: Linux 2.6.29-rc6)
Message-ID: <20090226171723.GA5941@joi>
References: <alpine.LFD.2.00.0902222023520.3111@localhost.localdomain>
	<49A679E8.1010301@krogh.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49A679E8.1010301@krogh.cc>
Cc: David.Woodhouse@intel.com, Ryan Jackson <rjackson@lnxi.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Dave Olsen <dolsen@lnxi.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 26, 2009 at 12:15:52PM +0100, Jesper Krogh wrote:
>
> Booting up 2.6.29-rc6 gave me this one in dmesg...
>
> [   21.136149] ck804xrom ck804xrom_init_one(): Unable to register resource 
> 0x00000000ff000000-0x00000000ffffffff - kernel bug?
> [   21.136258] resource map sanity check conflict: 0xff000000 0xffffffff 
> 0xff700000 0xffffffff reserved
> [   21.136267] ------------[ cut here ]------------
> [   21.136269] WARNING: at arch/x86/mm/ioremap.c:208 
> __ioremap_caller+0x359/0x390()
> [   21.136271] Hardware name: Sun Fire X2200 M2 with Quad Core Processor
> [   21.136273] Info: mapping multiple BARs. Your kernel is fine.Modules 
> linked in: ck804xrom(+) mtd chipreg pcspkr(+) shpchp button pci_hotplug 
> i2c_nforce2 i2c_core map_funcs evdev ext3 jbd mbcache sg sd_mod usbhid hid 
> amd74xx sata_nv tg3 ata_generic libphy ehci_hcd libata ohci_hcd forcedeth 
> scsi_mod usbcore thermal processor fan thermal_sys fuse
> [   21.136289] Pid: 3843, comm: modprobe Not tainted 2.6.29-rc6 #2
> [   21.136291] Call Trace:
> [   21.136298]  [<ffffffff8023d352>] warn_slowpath+0xf2/0x130
> [   21.136301]  [<ffffffff8023d62a>] __call_console_drivers+0x6a/0x90
> [   21.136304]  [<ffffffff8023e1fe>] printk+0x4e/0x60
> [   21.136306]  [<ffffffff8023e1fe>] printk+0x4e/0x60
> [   21.136309]  [<ffffffff8036b520>] match_pci_dev_by_id+0x0/0x60
> [   21.136313]  [<ffffffff8024360e>] iomem_map_sanity_check+0xbe/0xd0
> [   21.136316]  [<ffffffff80229799>] __ioremap_caller+0x359/0x390
> [   21.136320]  [<ffffffffa01eb1f6>] init_ck804xrom+0x1f6/0x62c [ck804xrom]
> [   21.136322]  [<ffffffffa01eb1f6>] init_ck804xrom+0x1f6/0x62c [ck804xrom]
> [   21.136326]  [<ffffffff80275eac>] 
> tracepoint_update_probe_range+0x1c/0xb0
> [   21.136329]  [<ffffffffa01eb000>] init_ck804xrom+0x0/0x62c [ck804xrom]
> [   21.136332]  [<ffffffff8020903b>] _stext+0x3b/0x160
> [   21.136335]  [<ffffffff80359141>] __up_read+0x21/0xb0
> [   21.136340]  [<ffffffff80256495>] 
> __blocking_notifier_call_chain+0x65/0x90
> [   21.136343]  [<ffffffff80265604>] sys_init_module+0xb4/0x200
> [   21.136346]  [<ffffffff8020c35b>] system_call_fastpath+0x16/0x1b
> [   21.136348] ---[ end trace f807e12658961c2d ]---
>
>
> System is fully operational, but I didnt get it in 2.6.26.8 (most recent 
> kernel tried on this hardware).

This message comes from this code in drivers/mtd/maps/ck804xrom.c:
        /*
         * Try to reserve the window mem region.  If this fails then
         * it is likely due to a fragment of the window being
         * "reserved" by the BIOS.  In the case that the
         * request_mem_region() fails then once the rom size is
         * discovered we will try to reserve the unreserved fragment.
         */
        window->rsrc.name = MOD_NAME;
        window->rsrc.start = window->phys;
        window->rsrc.end   = window->phys + window->size - 1;
        window->rsrc.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
        if (request_resource(&iomem_resource, &window->rsrc)) {
                window->rsrc.parent = NULL;
                printk(KERN_ERR MOD_NAME
                        " %s(): Unable to register resource"
                        " 0x%.016llx-0x%.016llx - kernel bug?\n",
                        __func__,
                        (unsigned long long)window->rsrc.start,
                        (unsigned long long)window->rsrc.end);
        }

So it's probably harmless.
Adding CC's.

Marcin
