Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TqKzR-0006Ei-Eg
 for linux-mtd@lists.infradead.org; Wed, 02 Jan 2013 09:52:02 +0000
Message-ID: <50E40336.2080008@parrot.com>
Date: Wed, 2 Jan 2013 10:51:50 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH 1/3] mtd nand : onfi need to be probed in 8 bits mode
References: <1352199105-30215-1-git-send-email-matthieu.castet@parrot.com>
 <1354530053.30168.183.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1212240023100.17282@utopia.booyaka.com>
In-Reply-To: <alpine.DEB.2.00.1212240023100.17282@utopia.booyaka.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Paul,

Paul Walmsley a écrit :
> Hi
> 
> On Mon, 3 Dec 2012, Artem Bityutskiy wrote:
> 
>> On Tue, 2012-11-06 at 11:51 +0100, Matthieu CASTET wrote:
>>> - NAND_CMD_READID want an address that it is not scaled on x16 device (it is always 0x20)
>>> - NAND_CMD_PARAM want 8 bits data
>>>
>>> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
>> Pushed this one to l2-mtd.git, thanks!
> 
> This patch (commit ff3206b2450499203532af2505a7f6f8413e92c0 in mainline) 
> is causing warnings on OMAP3730 Beagle XM, OMAP3530 Beagle, and DM37xx EVM 
> as of v3.8-rc1:
> 
> [    1.349456] ------------[ cut here ]------------
> [    1.351959] WARNING: at drivers/mtd/nand/nand_base.c:2861 nand_scan_ident+0xdb4/0xf90()
> [    1.356292] Modules linked in:
> [    1.357971] [<c001bf50>] (unwind_backtrace+0x0/0xf0) from [<c0045cec>] (warn_slowpath_common+0x4c/0x64)
> [    1.363037] [<c0045cec>] (warn_slowpath_common+0x4c/0x64) from [<c0045d20>] (warn_slowpath_null+0x1c/0x24)
> [    1.368194] [<c0045d20>] (warn_slowpath_null+0x1c/0x24) from [<c039d304>] (nand_scan_ident+0xdb4/0xf90)
> [    1.373229] [<c039d304>] (nand_scan_ident+0xdb4/0xf90) from [<c03a2448>] (omap_nand_probe+0x2e8/0x678)
> [    1.378234] [<c03a2448>] (omap_nand_probe+0x2e8/0x678) from [<c0357f84>] (platform_drv_probe+0x18/0x1c)
> [    1.383239] [<c0357f84>] (platform_drv_probe+0x18/0x1c) from [<c0356b84>] (driver_probe_device+0x84/0x224)
> [    1.388458] [<c0356b84>] (driver_probe_device+0x84/0x224) from [<c0356db8>] (__driver_attach+0x94/0x98)
> [    1.393493] [<c0356db8>] (__driver_attach+0x94/0x98) from [<c0355330>] (bus_for_each_dev+0x50/0x7c)
> [    1.398315] [<c0355330>] (bus_for_each_dev+0x50/0x7c) from [<c0356250>] (bus_add_driver+0xa0/0x2a0)
> [    1.403198] [<c0356250>] (bus_add_driver+0xa0/0x2a0) from [<c03572ec>] (driver_register+0x78/0x18c)
> [    1.408020] [<c03572ec>] (driver_register+0x78/0x18c) from [<c00086a4>] (do_one_initcall+0x34/0x194)
> [    1.412933] [<c00086a4>] (do_one_initcall+0x34/0x194) from [<c0528188>] (kernel_init+0x154/0x2ec)
> [    1.417724] [<c0528188>] (kernel_init+0x154/0x2ec) from [<c0013d50>] (ret_from_fork+0x14/0x24)
> [    1.422454] ---[ end trace 7f5c9fb048cfa61e ]---
> 
> The patch also looks bogus.  The patch states that "ONFI need to be probed 
> in 8 bits mode" (sic).  But if that's so, shouldn't 
> nand_flash_detect_onfi()  just fail immediately, rather than warn?
> 
I put a warning in order we fix drivers instead of a silent failure.

The omap driver was fixed in the same series with
http://article.gmane.org/gmane.linux.ports.arm.omap/88551 and
http://article.gmane.org/gmane.linux.ports.arm.omap/88549

For drivers that can't support ONFI, I don't know what to do.
May we should be replace the WARN_ON by a printk and early return.

Matthieu
