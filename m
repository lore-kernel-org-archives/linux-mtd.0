Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoLfc-0005xN-Ec
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 01:24:56 +0000
Received: by padhk11 with SMTP id hk11so3501899pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 19 Oct 2015 18:24:35 -0700 (PDT)
Date: Mon, 19 Oct 2015 18:24:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Roland Stigge <stigge@antcom.de>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: lpc32xx_slc: fix warnings caused by enabling
 unprepared clock
Message-ID: <20151020012432.GF13239@google.com>
References: <1445105370-576-1-git-send-email-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445105370-576-1-git-send-email-vz@mleia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 17, 2015 at 09:09:29PM +0300, Vladimir Zapolskiy wrote:
> If common clock framework is configured, the driver generates a warning,
> which is fixed by this change:
> 
>     WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:727 clk_core_enable+0x2c/0xa4()
>     Modules linked in:
>     CPU: 0 PID: 1 Comm: swapper Not tainted 4.3.0-rc2+ #201
>     Hardware name: LPC32XX SoC (Flattened Device Tree)
>     Backtrace:
>     [<>] (dump_backtrace) from [<>] (show_stack+0x18/0x1c)
>     [<>] (show_stack) from [<>] (dump_stack+0x20/0x28)
>     [<>] (dump_stack) from [<>] (warn_slowpath_common+0x90/0xb8)
>     [<>] (warn_slowpath_common) from [<>] (warn_slowpath_null+0x24/0x2c)
>     [<>] (warn_slowpath_null) from [<>] (clk_core_enable+0x2c/0xa4)
>     [<>] (clk_core_enable) from [<>] (clk_enable+0x24/0x38)
>     [<>] (clk_enable) from [<>] (lpc32xx_nand_probe+0x290/0x568)
>     [<>] (lpc32xx_nand_probe) from [<>] (platform_drv_probe+0x50/0xa0)
>     [<>] (platform_drv_probe) from [<>] (driver_probe_device+0x18c/0x408)
>     [<>] (driver_probe_device) from [<>] (__driver_attach+0x70/0x94)
>     [<>] (__driver_attach) from [<>] (bus_for_each_dev+0x74/0x98)
>     [<>] (bus_for_each_dev) from [<>] (driver_attach+0x20/0x28)
>     [<>] (driver_attach) from [<>] (bus_add_driver+0x11c/0x248)
>     [<>] (bus_add_driver) from [<>] (driver_register+0xa4/0xe8)
>     [<>] (driver_register) from [<>] (__platform_driver_register+0x50/0x64)
>     [<>] (__platform_driver_register) from [<>] (lpc32xx_nand_driver_init+0x18/0x20)
>     [<>] (lpc32xx_nand_driver_init) from [<>] (do_one_initcall+0x11c/0x1dc)
>     [<>] (do_one_initcall) from [<>] (kernel_init_freeable+0x10c/0x1d4)
>     [<>] (kernel_init_freeable) from [<>] (kernel_init+0x10/0xec)
>     [<>] (kernel_init) from [<>] (ret_from_fork+0x14/0x24)
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Looks obvious to me. Pushed to l2-mtd.git.
