Received: from adsl-67-126-56-187.dsl.pltn13.pacbell.net ([67.126.56.187]
	helo=mail.plexio.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JxKJ-00013T-FB
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 16:22:23 +0100
From: Stephen Lee <splee@plexio.com>
To: Oskar Stolc <stolc@intrak.sk>
In-Reply-To: <20030525092737.GJ13272@intrak.sk>
References: <20030523063820.GH13272@intrak.sk>
	 <20030525092737.GJ13272@intrak.sk>
Message-Id: <1053876166.32193.11.camel@ralph.plexio.private>
Mime-Version: 1.0
Date: 25 May 2003 08:22:47 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: Possible GRUB problem: [Was: DiskOnChip MD2202-D256]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2003-05-25 at 02:27, Oskar Stolc wrote:
<snip>
> Finally I rebooted my computer by turning the power off and on again.
> 
> Now I can see loading grub from flash disk, by it crashes by following
> error:
> 
> 	DoC 2000 E600
> 	E698
> 	Jumping to Grub
> 	Attempting to open /dev/grub/menu.lst on drive 0xe0, partition 0xff
> 	DiskOnChip 2000 found at e0000
> 	floor 0, chip 0; manufacturer: Toshiba
> 	Chip: Toshiba TC58V64AFT/DC, total size: 8 MB
> 		erase unit: 8192 bytes, page: 512 bytes
> 	_DoC_WaitReady timed out
> 	_DoC_WaitReady timed out
> 	_DoC_WaitReady timed out
> 	_DoC_WaitReady timed out
> 	_DoC_WaitReady timed out
> 	_DoC_WaitReady timed out
> 	_DoC_WaitReady timed out
> 	_DoC_WaitReady timed out
> 	_DoC_WaitReady timed out
> 	Total of 1 chips found - total capacity 8 MB
> 	Scanning for NFTL Media Header
> 	NFTL Media Header found in flash sector 176
> 	Sorry, we don't support UnitSizeFactor of != 1 yet
> 	NFTL Media Header found in flash sector 192
> 	Sorry, we don't support UnitSizeFactor of != 1 yet
> 	Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0xff
> 	Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0x0
> 	Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0x1
> 	Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0x2
> 	...
> 	Attempting to open /boot/grub/menu.lst on drive 0x0, partition 0xf
> 	
> 		GRUB version 0.92 (639K lower / 121856K upper memory)
> 
> In this moment a get a grub> promtp. Trying enter
> 	kernel (dc0,0)/boot/bzImage root=/dev/nftla1
> a get a result
> 	Loading kernel image...
> 	Error 21: Selected disk does not exist

Make sure /boot/grub/menu.lst exists or is a link to grub.conf in the
same directory. Try the kernel line with a slightly different path:
kernel (dc0,0)/bzImage root=/dev/nftla1. In any case it looks like a
path problem to me.

Stephen
