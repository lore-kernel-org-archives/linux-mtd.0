Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOGro-0007xo-Pb
	for linux-mtd@lists.infradead.org; Tue, 28 Mar 2006 11:16:39 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWU00IMGIJ1TOD0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 28 Mar 2006 11:16:13 -0500 (EST)
Date: Tue, 28 Mar 2006 11:16:13 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20060328151239.GB16959@xi.wantstofly.org>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Message-id: <Pine.LNX.4.64.0603281104470.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20060328151239.GB16959@xi.wantstofly.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] enable mainstone MTD map driver on LogicPD PXA270
	platform
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Mar 2006, Lennert Buytenhek wrote:

> The LogicPD PXA270 platform is very similar to the Intel Mainstone,
> and can use the same MTD map driver.
> 
> Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
> 
> Index: linux-2.6.16/drivers/mtd/maps/Kconfig
> ===================================================================
> --- linux-2.6.16.orig/drivers/mtd/maps/Kconfig
> +++ linux-2.6.16/drivers/mtd/maps/Kconfig
> @@ -131,7 +131,7 @@ config MTD_LUBBOCK
>  
>  config MTD_MAINSTONE
>  	tristate "CFI Flash device mapped on Intel Mainstone XScale eval board"
> -	depends on MACH_MAINSTONE && MTD_CFI_INTELEXT
> +	depends on (MACH_LOGICPD_PXA270 || MACH_MAINSTONE) && MTD_CFI_INTELEXT

The mainstone-flash.c no longer exists in the MTD repository.

It has been superseded by pxa2xx-flash.c.  I adjusted the dependency in 
the CVS repo already.

Thomas: when will this be sent to Linus?


Nicolas
