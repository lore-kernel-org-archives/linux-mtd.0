Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Egpbq-0008UC-I2
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 15:28:25 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Bordug <vbordug@ru.mvista.com>
In-Reply-To: <438B52FE.9040802@ru.mvista.com>
References: <438B52FE.9040802@ru.mvista.com>
Content-Type: text/plain
Date: Mon, 28 Nov 2005 21:33:51 +0100
Message-Id: <1133210031.32542.364.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: Add support for the MPC8xxADS boards
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-11-28 at 21:57 +0300, Vitaly Bordug wrote:
> The following patch adds support for the JEDEC-compatible flashes on
> the MPC8xxADS boards.

Can you please explain how this is supposed to work ?

In any case whether compiled as module or compiled in the init code of
the physmap driver is called before the init code of your board driver.
The physmap_configure() call is just bogus as it overwrites the compiled
in values of the physmap_map structure in physmap.c after the flash was
detected (or not detected) with the compiled in defaults.

Also this code was never compiled and used as a module. 

> Currently verified with MPC885ADS and MPC 866ADS. The patch is against
> MTD git tree.

Currently verified means: it compiles when the config switch is equal
"Y" and the resulting kernel does not oops, right ?


The physmap driver has to be either used with the compiled in address,
size and bankwidth settings or the values have to be set by the early
boot code of the board. Grep through arch/mips to find the two lonely,
but correct, users of physmap_configure().

The same applies for the pq2fads driver. The pq2fads driver is hereby
scheduled for removal.

	tglx
