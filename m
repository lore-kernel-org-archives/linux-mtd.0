Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EjZzb-0005yg-CZ
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2005 05:24:20 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <438FF22A.2060203@ru.mvista.com>
References: <438FF22A.2060203@ru.mvista.com>
Content-Type: text/plain
Date: Tue, 06 Dec 2005 11:30:20 +0100
Message-Id: <1133865021.16302.37.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd/utils: sync with MTD ioctl interface rework to get
	rid of MEMGETOOBSEL/MEMSETOOBSEL
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-12-02 at 10:05 +0300, Vitaly Wool wrote:
> Hi,
> this patch reorganizes the MTD utls to
> - not use MEMGETOOBSEL/MEMSETOOBSEL ioctls as they're planned for 
> removal and anyway not needed
> - use MEMGETOOBAVAIL ioctl to get the number of available OOB bytes and 
> read/write OOB accordingly
> 
> Any input is most welcome.

1. Rendering the utils unusable for older kernels is wrong.

Its simple to handle this in the utils depending on the functionality
which is exposed by the kernel.


2. Your current approach prevents me to
- dump the raw flash content including OOB data
- write a nand image with given oob data

This is essential for troubleshooting and must still be possible
somehow.

	tglx
